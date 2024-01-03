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
set -gx DOCKER_SCAN_SUGGEST "false"
set -gx DOTNET_CLI_TELEMETRY_OPTOUT "true"

# starship
set -gx STARSHIP_CONFIG "$DOTFILES_HOME/.config/starship.toml"

# linuxbrew
if not contains /home/linuxbrew/.linuxbrew/bin $PATH
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

# volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# rust
set -gx CARGO_HOME "$HOME/.cargo"
fish_add_path $CARGO_HOME/bin

# go
set -gx GOPATH "$HOME/go"
fish_add_path $GOPATH/bin
