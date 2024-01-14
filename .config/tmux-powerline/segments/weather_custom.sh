run_segment() {
	__process_settings

	local tmp_file="${TMUX_POWERLINE_DIR_TEMPORARY}/temp_weather_file.txt"
	local weather=$(__yrno)

	if [ -n "$weather" ]; then
		echo "$weather"
	fi
}

__process_settings() {
	if shell_is_bsd  && [ -f /user/local/bin/grep  ]; then
		TMUX_POWERLINE_SEG_WEATHER_GREP="/usr/local/bin/grep"
	else
		TMUX_POWERLINE_SEG_WEATHER_GREP="grep"
	fi

	if [ -z "$TMUX_POWERLINE_SEG_WEATHER_LON" ] && [ -z "$TMUX_POWERLINE_SEG_WEATHER_LAT" ]; then
		echo "No location defined.";
		exit 8
	fi
}

__yrno() {
	degree=""

	if [ -f "$tmp_file" ]; then
		if shell_is_osx || shell_is_bsd; then
			last_update=$(stat -f "%m" ${tmp_file})
		elif shell_is_linux; then
			last_update=$(stat -c "%Y" ${tmp_file})
		fi
		time_now=$(date +%s)

		up_to_date=$(echo "(${time_now}-${last_update}) < 600" | bc)
		if [ "$up_to_date" -eq 1 ]; then
			__read_tmp_file
		fi
	fi

	if [ -z "$degree" ]; then
		weather_data=$(curl --max-time 4 -s "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${TMUX_POWERLINE_SEG_WEATHER_LAT}&lon=${TMUX_POWERLINE_SEG_WEATHER_LON}")
		if [ "$?" -eq "0" ]; then
			grep=$TMUX_POWERLINE_SEG_WEATHER_GREP
			error=$(echo "$weather_data" | $grep -i "error");
			if [ -n "$error" ]; then
				echo "error"
				exit 1
			fi

			unit=$(echo "$weather_data" | jq -r .properties.meta.units.air_temperature)
			degree=$(echo "$weather_data" | jq -r .properties.timeseries[0].data.instant.details.air_temperature)
			condition=$(echo "$weather_data" | jq -r .properties.timeseries[0].data.next_1_hours.summary.symbol_code)
		elif [ -f "${tmp_file}" ]; then
			__read_tmp_file
		fi
	fi

	if [ -n "$degree" ]; then
		condition_symbol=$(__get_yrno_condition_symbol "$condition")
	    echo "${condition_symbol} ${degree}°$(echo "c" | tr '[:lower:]' '[:upper:]')" | tee "${tmp_file}"
	fi
}

__get_yrno_condition_symbol() {
	local condition=$1
	case "$condition" in
		"clearsky_day")
			echo "☀ "
			;;
		"clearsky_night")
			echo "🌙"
			;;
		"fair_day")
			echo "🌤 "
			;;
		"fair_night")
			echo "🌜"
			;;
		"fog")
			echo "🌫 "
			;;
		"cloudy")
			echo "☁ "
			;;
		"rain" | "lightrain" | "heavyrain" | "sleet" | "lightsleet" | "heavysleet")
			echo "🌧 "
			;;
		"heavyrainandthunder" | "heavyrainshowersandthunder_day" | "heavyrainshowersandthunder_night" | "heavysleetandthunder" | "heavysleetshowersandthunder_day" | "heavysnowandthunder" | "heavysnowshowersandthunder_day" | "heavysnowshowersandthunder_night" | "lightrainandthunder" | "lightrainshowersandthunder_day" | "lightrainshowersandthunder_night" | "lightsleetandthunder" | "lightsnowandthunder" | "lightssleetshowersandthunder_day" | "lightssleetshowersandthunder_night" | "lightssnowshowersandthunder_day" | "lightssnowshowersandthunder_night" | "rainandthunder" | "rainshowersandthunder_day" | "rainshowersandthunder_night" | "sleetandthunder" | "sleetshowersandthunder_day" | "sleetshowersandthunder_night" | "snowandthunder" | "snowshowersandthunder_day" | "snowshowersandthunder_night")
			echo "⛈ "
			;;
		"heavyrainshowers_day" | "heavysleetshowers_day" | "heavysleetshowersandthunder_night" | "lightrainshowers_day" | "lightsleetshowers_day" | "rainshowers_day" | "sleetshowers_day")
			echo "🌦 "
			;;
    	"heavyrainshowers_night" | "heavysleetshowers_night" | "lightrainshowers_night" | "lightsleetshowers_night" | "rainshowers_night" | "sleetshowers_night")
			echo "☔"
			;;
		"snow" | "lightsnow" | "heavysnow")
			echo "❄ "
			;;
		"lightsnowshowers_day" | "lightsnowshowers_night" | "heavysnowshowers_day" | "heavysnowshowers_night" | "snowshowers_day" | "snowshowers_night")
			echo "🌨 "
			;;
		"partlycloudy_day")
			echo "⛅"
			;;
		"partlycloudy_night")
			echo "🌗"
			;;
		*)
			echo "?"
			;;
	esac
}

__read_tmp_file() {
	if [ ! -f "$tmp_file" ]; then
		return
	fi
	cat "${tmp_file}"
	exit
}
