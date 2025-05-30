# fish
set fish_greeting
set fisher_path $XDG_CONFIG_HOME/fisher
source $XDG_CONFIG_HOME/fish/conf.d/fisher.fish
# fish end

# Starship
if type -q starship
	function starship_transient_prompt_func
		starship module character
	end

	starship init fish | source
	enable_transience
end

if status is-interactive
	atuin init --disable-up-arrow fish | source

	# defined in local.fish
	if test $DISABLE_TMUX_INIT -eq 0
		if test "$TERM_PROGRAM" != "vscode"
			# check if tmux exists
			# validate TERM
			# check if tmux is already running
			if type -q tmux && not contains $TERM "sreen" && not contains $TERM "tmux" && not set -q TMUX
				# if a session is already running, attach to it
				exec tmux new-session -A -s main
			end
		end
	end
end
# Starship end

# pnpm
set -gx PNPM_HOME "/home/shane/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# ASDF
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# ASDF end
