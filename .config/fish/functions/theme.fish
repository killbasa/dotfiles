function theme
	set THEMES "super" "text"

	if not contains $argv $THEMES
		echo "Invalid theme name, available themes: $THEMES"
		return
	end

	set TARGET_THEME "$DOTFILES_HOME/.config/starship/$argv.toml"

	if test -e "$TARGET_THEME"
		cat "$TARGET_THEME" | tee "$DOTFILES_HOME/.config/starship.toml" >/dev/null
	else
		echo "Theme $argv not found"
	end
end
