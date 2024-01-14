function theme
	set THEMES "super" "text"
	set TARGET_THEME $argv[1]

	if not contains $TARGET_THEME $THEMES
		echo "invalid theme name, available themes: $THEMES"
		return
	end

	set STARSHIP_THEME "$DOTFILES_HOME/.config/starship/$TARGET_THEME.toml"
	if test -e "$STARSHIP_THEME"
		cat "$STARSHIP_THEME" | tee "$DOTFILES_HOME/.config/starship.toml" >/dev/null
	else
		echo "starship theme \"$TARGET_THEME\" not found"
	end

	set TMUX_THEME "$DOTFILES_HOME/.config/tmux-powerline/themes/$TARGET_THEME.sh"
	if test -e "$TMUX_THEME"
		echo "$TARGET_THEME" | tee "$DOTFILES_HOME/.config/tmux-powerline/.theme" >/dev/null

		if set -q TMUX
			bash "$DOTFILES_HOME/scripts/reload-theme.sh" "$TARGET_THEME"
		end
	else
		echo "tmux theme \"$TARGET_THEME\" not found"
	end
end
