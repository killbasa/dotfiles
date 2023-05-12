#!/usr/bin/env bash

dotfiles_dir=~/dotfiles

export DEBIAN_FRONTEND=noninteractive

function install_linuxbrew {
  BREW_PREFIX=${BREW_PREFIX:-"/home/linuxbrew/.linuxbrew"}
  USERNAME=${USERNAME:-"automatic"}

  git clone https://github.com/Homebrew/brew "${BREW_PREFIX}/Homebrew"
  mkdir -p "${BREW_PREFIX}/Homebrew/Library/Taps/homebrew"
  git clone https://github.com/Homebrew/homebrew-core "${BREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-core"

  "${BREW_PREFIX}/Homebrew/bin/brew" config
  mkdir "${BREW_PREFIX}/bin"
  ln -s "${BREW_PREFIX}/Homebrew/bin/brew" "${BREW_PREFIX}/bin"
  chown -R ${USERNAME} "${BREW_PREFIX}"
}

function rm_file {
  sudo rm -rf $HOME/$1 > /dev/null 2>&1
}

function link_dotfile {
  ln -sf $dotfiles_dir/$1 $HOME/$1
}

if !(command -v brew > /dev/null); then
  install_linuxbrew
fi

brew bundle --verbose --file="$HOME/dotfiles/Brewfile"

echo /usr/local/bin/fish | sudo tee -a /etc/shells

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
