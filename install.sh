#!/usr/bin/env bash

dotfiles_dir=~/dotfiles

function rm_file {
  sudo rm -rf $HOME/$1 > /dev/null 2>&1
}

function link_dotfile {
  ln -sf $dotfiles_dir/$1 $HOME/$1
}

if !(command -v brew > /dev/null); then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/sammy/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew bundle --verbose --file="$HOME/dotfiles/Brewfile"

rm_file .editorconfig
rm_file .gitconfig
rm_file .config

link_dotfile .editorconfig
link_dotfile .gitconfig
link_dotfile .config

echo >&2
echo "✓ Installation complete" >&2
echo >&2
echo "Run the following to change the shell to Fish:" >&2
echo "  chsh -s /usr/bin/fish"
