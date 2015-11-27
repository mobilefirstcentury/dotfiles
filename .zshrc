#!/bin/env zsh

# helps to detect current OS
TRUE=1; FALSE=0
linux=$FALSE; windows=$FALSE; mac=$FALSE
if [[ "$OSTYPE" == "linux-gnu" ]]  ||  [[ "$OSTYPE" == "freebsd"* ]]; then
  linux=$TRUE
elif [[ "$OSTYPE" == "darwin"* ]]; then
  mac=$TRUE
elif [[ "$OSTYPE" == "win32" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]]; then
  windows=$TRUE
fi
#----------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="babun"
ZSH_THEME="babun"

((windows)) && source $ZSH/dir_colors/sol.dark



# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# SSH config

# il y a un problème d'initialisation du ssh-agent dans cygwin. Les lignes suivantes forcent la reconaissance des clés ssH
((windows)) && {
  eval `ssh-agent -s`
  find ~/.ssh/ maxdepth 1 -type f -not name "*.pub" -print0 | xargs -0 ssh-add 
}



# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# 

# Activate plugins

# autojump // normalement la déclaration du plugin dans oh-my-zsh devrait suffire !
#[[ -s /home/Rachid/.autojump/etc/profile.d/autojump.sh ]] && source /home/Rachid/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u


# Some zsh configs
# Set extended globing in zsh
setopt extendedglob

set ignorecase
set smartcase
set incsearch
set hlsearch
set cindent


setopt cdablevars
setopt correct
setopt globdots
setopt interactivecomments
setopt noclobber

export LESS="-mN"  # where are we in the file read. In percentage and absolute.

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# no duplicates in history
setopt hist_ignore_all_dups
#commands with leading space are not historized
setopt hist_ignore_space

HISTFILESIZE=10000
stty -ixon #CTRL-s doesn't freeze the terminal anymore
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # save command to HISTFILE in real time 


bindkey -M viins ‘jj’ vi-cmd-mode # jj pour escaper

# Get console in Vi mode and persists state from last command line.
set editing-mode vi
set blink-matching-paren on
set -o vi
bindkey -v
accept-line() { prev_mode=$KEYMAP; zle .accept-line }
zle-line-init() { zle -K ${prev_mode:-viins} }
zle -N accept-line
zle -N zle-line-init
 
# Corrects the werd behaviour of delete and backspace keys on zsh prompt in vi insert mode.
# I still don't know how to prevent the behaviour of delete on zsh prompt in command mode.
bindkey "^[[3~" delete-char 
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# history completion with up key
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

# eliminates delay when escaping insert mode
export KEYTIMEOUT=1

# my alias 
((linux)) && {
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
}

alias h='history | less +G'
hg() { history | grep -e  "^ *[0-9]* *$1" | less +G }
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fhere="find . -name "
alias ll="ls -lhAF"
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias myip="curl http://ipecho.net/plain; echo"
alias trm='trash-put'
alias tls='trash-ls'
alias tempty='trash-empty'
alias trestore='trash-restore'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
