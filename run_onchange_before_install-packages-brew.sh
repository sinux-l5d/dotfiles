#!/bin/bash

# Used only for cli application. Helm and Zed don't belong here, for exemple.

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
EOF
