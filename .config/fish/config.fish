# Setup fish
set fish_greeting
set fisher_path $XDG_CONFIG_HOME/fisher
source $XDG_CONFIG_HOME/fish/conf.d/fisher.fish

# Setup starship
if type -q starship
	starship init fish | source
end

if status is-interactive
	# defined in local.fish
	if test $DISABLE_TMUX_INIT -eq 0 && test "$TERM_PROGRAM" != "vscode"

		# check if tmux exists
		# validate TERM
		# check if tmux is already running
		if type -q tmux && not contains $TERM "sreen" && not contains $TERM "tmux" && not set -q TMUX
			# if a session is already running, attach to it
			exec tmux new-session -A -s main
		end
	end
end
