#!/bin/zsh

bindkey -e
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"
export GPG_TTY=$(tty)

#############
## PLUGINS ##
#############
source ~/.zplug/init.zsh

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "amyreese/zsh-titles"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

###############
## BEHAVIOUR ##
###############

# >>>> Vagrant command completion
fpath=(/opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/zsh $fpath)

# Prompt & completion
autoload -Uz compinit promptinit bashcompinit select-word-style edit-command-line
compinit
promptinit
bashcompinit
select-word-style bash
zle -N edit-command-line
ZSH_HIGHLIGHT_STYLES[comment]="fg=#71655a"

################
## KEYBINDING ##
################
bindkey '^[[3~' delete-char
bindkey '^[[Z'  reverse-menu-complete
bindkey '^V'    push-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# bindkey '^[^?' backward-kill-word # previously ^H
bindkey '^X^E' edit-command-line


#############
## HISTORY ##
#############
HISTFILE=~/.zhistory
HISTSIZE=6000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt INTERACTIVE_COMMENTS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first

#############
## ALIASES ##
#############
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias diff='diff --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias vim='nvim'
alias v='nvim'
alias ssh='TERM=xterm-color; ssh'
alias copy='xclip -selection c'
alias l="exa"
alias nnn="nnn -e"

#############
## SCRIPTS ##
#############
[ -d "$HOME/scripts" ] && PATH=$PATH:$HOME/scripts
[ -d "$HOME/go/bin" ] && PATH=$PATH:$HOME/go/bin
[ -d "$HOME/.dotnet" ] && PATH=$PATH:$HOME/.dotnet
[ -d "$HOME/.local/bin" ] && PATH=$PATH:$HOME/.local/bin
[ -d "$HOME/.gem/ruby/3.0.0/bin" ] && PATH=$PATH:$HOME/.gem/ruby/3.0.0/bin
[ -d "$HOME/.cargo/bin" ] && PATH=$PATH:$HOME/.cargo/bin

#############
## OPTIONS ##
#############
## Unset
unsetopt beep
## Set
setopt autocd
setopt interactivecomments


################
## COMPLETION ##
################
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
setopt COMPLETE_ALIASES

# Broot
[ -f "$HOME/.config/broot/launcher/bash/br" ] && source $HOME/.config/broot/launcher/bash/br

# AWS
#complete -C '/usr/bin/aws_completer' aws

# NVM (Really slow)
#source /usr/share/nvm/init-nvm.sh

###########
## FINAL ##
###########
#source $HOME/src/dotgit/bin/bash_completion
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export SAM_CLI_TELEMETRY=0
export SPACESHIP_AZURE_SHOW=false
export MANPAGER="sh -c 'col -bx | bat -l man -p'"  
export PATH

if command -v gum &> /dev/null && command -v zellij &> /dev/null && [[ -z "$ZELLIJ" ]] \
    && [[ "$TERM_PROGRAM" != "vscode" ]] \
    && [[ "$TERM_PROGRAM" != "OpenLens" ]] \
    && [[ "$TERM_PROGRAM" != "idea" ]]; then
    # replace newline with space with awk
    sessions=($(zellij list-sessions | grep -v EXITED | cut -d" " -f1 ))
    if [[ -z $sessions ]]; then
        zellij
    else
        echo "Choose a session or create a new one:"
        session=$(gum choose "New session" "$sessions[@]" | xargs)
        # If last command fail (ESC), exit
        if [[ $? -ne 0 ]]; then
            exit
        fi
        if [[ $session == "New session" ]]; then
            zellij
        else
            zellij attach $session
        fi
    fi
    exit # automatically exit the shell when ellij exits
fi

# Created by `pipx` on 2024-01-15 09:24:52
export PATH="$PATH:/home/sinux/.local/bin"
