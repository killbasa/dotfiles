# Setup fish
set fish_greeting

# Setup starship
if type -q starship
	starship init fish | source
end
