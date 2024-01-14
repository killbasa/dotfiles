# Text theme

## Colors ##
color_1="235"
color_2="255"

## Options ##

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${color_1}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${color_2}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

## Windows ##

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format inverse)]" \
		"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR" \
		" #I#F " \
		"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
		" #W " \
		"#[$(format regular)]" \
		"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[$(format regular)]" \
		"  #I#{?window_flags,#F, } " \
		"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
		" #W "
	)
fi

## Segments ##
# segment bg fg separator

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info 148 234" \
		"hostname 33 0" \
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		#"lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		#"wan_ip 24 255" \
		#"vcs_branch 29 88" \
		#"vcs_compare 60 255" \
		#"vcs_staged 64 255" \
		#"vcs_modified 9 255" \
		#"vcs_others 245 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
		#"pwd 89 211" \
		#"macos_notification_count 29 255" \
		#"mailcount 9 255" \
		#"now_playing 234 37" \
		#"cpu 240 136" \
		#"load 237 167" \
		#"tmux_mem_cpu_load 234 136" \
		#"battery 137 127" \
		"weather_custom 37 255" \
		#"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
		#"xkb_layout 125 117" \
		"date_day 235 136" \
		"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
