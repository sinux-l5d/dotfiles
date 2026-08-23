#!/bin/bash

# Used only for cli application. Helm and Zed don't belong here, for exemple.


export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

brew bundle --file=/dev/stdin << EOF
brew "age"
brew "atuin"
brew "nushell"
brew "helix"
brew "ykman"
brew "ripgrep"
brew "fd"
brew "usage"
brew "mise"
brew "carapace"
brew "fzf"
brew "starship"
brew "antidote"
brew "zellij"
brew "k9s"
brew "dive"
brew "nuclei"
brew "bat"
brew "zoxide"
brew "difftastic"
brew "gopls"

cask "font-0xproto-nerd-font"
EOF
