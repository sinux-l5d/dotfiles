[ -d "/home/linuxbrew/.linuxbrew/bin" ] && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" || ( [ -d "$HOME/.linuxbrew/bin" ] && PATH="$HOME/.linuxbrew/bin:$PATH" )
export PATH
command -v brew &> /dev/null && export HOMEBREW_NO_ANALYTICS=1 && source <(command brew shellenv zsh)
command -v mise &> /dev/null && source <(command mise activate bash)
command -v carapace &> /dev/null && source <(command carapace _carapace bash)
command -v zoxide &> /dev/null && source <(command zoxide init bash)
alias tmp='cd $(mktemp -d)'
export VISUAL="hx" EDITOR="hx"
