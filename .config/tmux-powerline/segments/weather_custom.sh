run_segment() {
	__process_settings

	local tmp_file="${TMUX_POWERLINE_DIR_TEMPORARY}/temp_weather_file.txt"
	local weather=$(__metno)

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

__metno() {
	# 1 = true, 0 = false
	local debug_segment=0
	local degree=""

	if [ -f "$tmp_file" ] && [ $debug_segment -eq 0 ]; then
		if shell_is_osx || shell_is_bsd; then
			last_update=$(stat -f "%m" ${tmp_file})
		elif shell_is_linux; then
			last_update=$(stat -c "%Y" ${tmp_file})
		fi

		up_to_date=$(echo "($(date +%s)-${last_update}) < 600" | bc)
		if [ "$up_to_date" -eq 1 ]; then
			__read_tmp_file
		fi
	fi

	if [ -z "$degree" ]; then
		weather_data=$(curl \
			--max-time 4 \
			-s \
			"https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${TMUX_POWERLINE_SEG_WEATHER_LAT}&lon=${TMUX_POWERLINE_SEG_WEATHER_LON}" \
		)
		if [ "$?" -eq "0" ]; then
			error=$(echo "$weather_data" | $TMUX_POWERLINE_SEG_WEATHER_GREP -i "error");
			if [ -n "$error" ]; then
				echo "error"
				exit 1
			fi

			degree=$(echo "$weather_data" | jq -r .properties.timeseries[0].data.instant.details.air_temperature)
			condition=$(echo "$weather_data" | jq -r .properties.timeseries[0].data.next_1_hours.summary.symbol_code)
		elif [ -f "${tmp_file}" ]; then
			__read_tmp_file
		fi
	fi

	if [ -n "$degree" ]; then
		symbol=$(__get_metno_condition_symbol "$condition")
	    echo "$symbol ${degree}°C" | tee "${tmp_file}"
	fi
}

__get_metno_condition_symbol() {
	local condition=$1
	case "$condition" in
		"fog")
			echo "Foggy"
			;;
		"clearsky_day" | "clearsky_night")
			echo "Clear"
			;;
		"fair_day" | "fair_night")
			echo "Fair"
			;;
		"cloudy" | "partlycloudy_day" | "partlycloudy_night")
			echo "Cloudy"
			;;
		"snow" | "lightsnow" | "heavysnow" | "lightsnowshowers_day" | "lightsnowshowers_night" | "heavysnowshowers_day" | "heavysnowshowers_night" | "snowshowers_day" | "snowshowers_night")
			echo "Snowy"
			;;
		"rain" | "lightrain" | "heavyrain" | "sleet" | "lightsleet" | "heavysleet" | "heavyrainshowers_night" | "heavysleetshowers_night" | "lightrainshowers_night" | "lightsleetshowers_night" | "rainshowers_night" | "sleetshowers_night" | "heavyrainshowers_day" | "heavysleetshowers_day" | "heavysleetshowersandthunder_night" | "lightrainshowers_day" | "lightsleetshowers_day" | "rainshowers_day" | "sleetshowers_day")
			echo "Rainy"
			;;
		"heavyrainandthunder" | "heavyrainshowersandthunder_day" | "heavyrainshowersandthunder_night" | "heavysleetandthunder" | "heavysleetshowersandthunder_day" | "heavysnowandthunder" | "heavysnowshowersandthunder_day" | "heavysnowshowersandthunder_night" | "lightrainandthunder" | "lightrainshowersandthunder_day" | "lightrainshowersandthunder_night" | "lightsleetandthunder" | "lightsnowandthunder" | "lightssleetshowersandthunder_day" | "lightssleetshowersandthunder_night" | "lightssnowshowersandthunder_day" | "lightssnowshowersandthunder_night" | "rainandthunder" | "rainshowersandthunder_day" | "rainshowersandthunder_night" | "sleetandthunder" | "sleetshowersandthunder_day" | "sleetshowersandthunder_night" | "snowandthunder" | "snowshowersandthunder_day" | "snowshowersandthunder_night")
			echo "Thunder"
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
