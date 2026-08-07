#!/bin/bash

# Stop if brew installed
(command -v brew &> /dev/null || test -x /home/linuxbrew/.linuxbrew/bin/brew) && exit 0

echo "dotfiles: installing Homebrew"
echo "#############################"

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ $? -ne 0 ]; then
  echo "HOMEBREW CLASSIC INSTALL FAILED"
  echo "Fallback to untar archive to $HOME/.linuxbrew"

  mkdir "$HOME/.linuxbrew" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME/.linuxbrew" && "$HOME/.linuxbrew/bin/brew" update
fi

