# dotfiles
set -gx DOTFILES_REPO "https://github.com/killbasa/dotfiles"
set -gx DOTFILES_HOME "$HOME/dotfiles"

set -gx INFRA_REPO "https://github.com/killbasa/homelab"
set -gx INFRA_HOME "$HOME/infra"

# env
set -gx TERM "xterm-256color"
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx EDITOR (type -p nano)
set -gx GPG_TTY (tty)

## https://wiki.archlinux.org/title/XDG_Base_Directory
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# docker
set -gx DOCKER_SCAN_SUGGEST false
set -gx DOCKER_HIDE_LEGACY_COMMANDS 1

# starship
set -gx STARSHIP_CONFIG "$DOTFILES_HOME/.config/starship.toml"

# bat
set -gx BAT_CONFIG_PATH "$DOTFILES_HOME/.config/bat.conf"

# ripgrep
set -gx RIPGREP_CONFIG_PATH "$DOTFILES_HOME/.config/ripgrep.conf"

# linuxbrew
if not contains /home/linuxbrew/.linuxbrew/bin $PATH
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
