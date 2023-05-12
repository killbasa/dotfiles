#!/usr/bin/env bash

dotfiles_dir=~/dotfiles

function link_file {
  sudo rm -rf $HOME/$1 > /dev/null 2>&1
  ln -sf $dotfiles_dir/$1 $HOME/$1
}

if ! command -v brew > /dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a $HOME/.profile $HOME/.bashrc >/dev/null
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew bundle --verbose --file="$HOME/dotfiles/Brewfile"

echo /usr/local/bin/fish | sudo tee -a /etc/shells

link_file .editorconfig
link_file .gitconfig
link_file .config

echo "✓ Installation complete" >&2
echo >&2
echo "Run the following to change the shell to Fish:" >&2
echo "  chsh -s /usr/bin/fish"
