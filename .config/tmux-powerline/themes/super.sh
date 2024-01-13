# Super Theme

## Colors ##
color_1="#252a36"
color_2="#34444f"
color_3="#425563"
color_brand="#80e0a7"

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
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${color_brand}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

## Windows ##

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format inverse)]" \
		" #I#F " \
		"|" \
		" #W " \
		"#[$(format regular)]" \
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[fg=$color_brand,bg=$color_2,nobold,noitalics,nounderscore]" \
		"  #I#{?window_flags,#F, } " \
		"|" \
		" #W " \
		"#[$(format regular)]" \
	)
fi

## Segments ##
# segment bg fg separator

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info ${color_2} ${color_brand} ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		"hostname ${color_2} ${color_brand}" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		"weather ${color_2} ${color_brand}" \
		"date_day_full ${color_2} ${color_brand} ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"date ${color_2} ${color_brand} ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"time ${color_2} ${color_brand} ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
