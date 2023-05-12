#!/usr/bin/env bash

function linkdotfile {
  file="$1"
  ln -sfn ~/.dotfiles/$file ~/$file
}

[[ $(basename $(pwd)) == ".dotfiles" ]] ||
  recho "Make sure you're in the ~/.dotfiles/ directory before running this"

if !(command -v brew > /dev/null); then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
fi

brew install argocd
brew install bat
brew install fd
brew install fish
brew install fzf
brew install hadolint
brew install protobuf@3
brew install bufbuild/buf/buf
brew install derailed/k9s/k9s

linkdotfile .editorconfig
linkdotfile .gitconfig
linkdotfile .config

echo "✓ Installation complete" >&2
echo >&2
echo "Run the following to change the shell to Fish:" >&2
echo "  chsh -s /usr/bin/fish"
