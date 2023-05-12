#!/usr/bin/env bash

function linkdotfile {
  file="$1"
  if [ ! -e ~/$file -a ! -L ~/$file ]; then
      ln -sf ~/.dotfiles/$file ~/$file
  fi
}

[[ $(basename $(pwd)) == ".dotfiles" ]] ||
  recho "Make sure you're in the ~/.dotfiles/ directory before running this"

if !(command -v brew > /dev/null); then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
fi

brew bundle --verbose

linkdotfile .editorconfig
linkdotfile .gitconfig
linkdotfile .config

echo "✓ Installation complete" >&2
echo >&2
echo "Run the following to change the shell to Fish:" >&2
echo "  chsh -s /usr/bin/fish"
