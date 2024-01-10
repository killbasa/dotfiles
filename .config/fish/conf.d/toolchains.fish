# volta - https://volta.sh/
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin

# bun - https://bun.sh/
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# rust - https://www.rust-lang.org/
set -gx CARGO_HOME "$HOME/.cargo"
fish_add_path $CARGO_HOME/bin

# go - https://go.dev/
set -gx GOROOT "/usr/local/go"
set -gx GOPATH "$HOME/go"
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin
