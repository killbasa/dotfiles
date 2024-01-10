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

# docker
set -gx DOCKER_SCAN_SUGGEST false
set -gx DOCKER_HIDE_LEGACY_COMMANDS 1

# starship - https://starship.rs/
set -gx STARSHIP_CONFIG "$DOTFILES_HOME/.config/starship.toml"

# ripgrep - https://github.com/BurntSushi/ripgrep
set -gx RIPGREP_CONFIG_PATH "$DOTFILES_HOME/.config/ripgrep/.ripgreprc"

# linuxbrew
if not contains /home/linuxbrew/.linuxbrew/bin $PATH
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
