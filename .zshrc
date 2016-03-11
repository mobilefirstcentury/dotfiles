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

# colors 
# J'ai été obligé de modifier à la main les couleurs des terminaux et de les appliquer ici :
# Les repertoires NTFS (sur HDD par example etaient illisibles)
# en faisant un dircolors --print-database > $ZSH/dir_colors/base_colors puis de changer les couleurs de sticky files. 
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b $ZSH/dir_colors/base_colors`"
#    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

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
plugins=(git autojump history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=.:$HOME/bin:/usr/local/bin:$PATH:$HOME/.scripts:$HOME/scripts
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
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
alias vim=nvim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# [TODO] Pourquoi on ne décommente pas la ligne suivante
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
#setopt correct
setopt globdots
setopt interactivecomments
setopt noclobber
unsetopt correct

# export LESS="-mN"  # where are we in the file read. In percentage and absolute.
export LESS='-g -i -M -R -S -w  -z-4'
# export PAGER=/usr/local/bin/vimpager
# alias less=$PAGER
alias zless=$PAGER

# I want zmv !
autoload -U zmv
alias mmv='noglob zmv -W'

# HISTORY

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HISTTIMEFORMAT="%F %T "
HIST_STAMPS="dd/mm/yyyy"
HISTFILESIZE=100000000
#
# no duplicates in history
setopt hist_ignore_all_dups
#commands with leading space are not historized
setopt hist_ignore_space
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # save command to HISTFILE in real time 

# Bindings liés à history-substring-search (plugin oh-my-zsh)
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down



stty -ixon #CTRL-s doesn't freeze the terminal anymore

# [TODO] La ligne suivante ne semble pas prise en compte
#bindkey -M viins ‘jj’ vi-cmd-mode # jj pour escaper

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


# On utilise Ctrl-C pour la copy, On doit donc remmaper le Break pour killer une ligne de commande ou envoyer un sigkill au process courant
bindkey '^G' send-break 

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
alias ack=ack-grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# alias fhere="find . -name "
alias fhere="ag -S -g "
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
alias fu="python ~/scripts/fu/fu"
alias dropbox='~/.dropbox-dist/dropbox.py'

# Folder Alias 
hash -d help=~/Help
hash -d notes=~/Documents/_NOTES
hash -d downloads=~/Downloads
hash -d music=~/Music
hash -d images=~/Pictures
hash -d dev=~/Dev
hash -d documents=~/Documents
hash -d inbox=~/Documents/_INBOX
hash -d trash=~/Documents/_TRASH
hash -d temp=~/Documents/_TEMP
hash -d todo=~/Documents/_TODO
hash -d play=~/Documents/_PLAY
hash -d admin=~/Documents/_ADMIN


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# custom functions

function mdread {
    pandoc "$1" -f markdown -t html | lynx -stdin
}

PATH="/home/rachid/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/rachid/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rachid/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rachid/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rachid/perl5"; export PERL_MM_OPT;

# Quand on quitte ranger on se retrouve dans le repertoire à partir duquel on a lancé rcd
# Quand on quitte ranger-cd on se retrouve dans le dernier repertoire exploré sous ranger
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# Creating a dir and jumping in it. Doing il all the time. Quite boring.
function mkcd()
{
mkdir $1 && eval cd $1
}


# On définit l'opérateur '=' pour effectuer des calculs en ligne de commande grâce à l'utilitaire wcacl
= () {                                                                                                                                                                               ~  
#    calc="$@"
#    echo -ne "$calc\n" | wcalc | sed 's:^> ::g'  
#    echo -ne "$calc\n" | wcalc 
     # remember current working directory
     cd .        

     if [ $# -lt 1 ] || [ "$@" = "-h" ]; then
       echo " = is based on wcalc.\n Type 'man wcalc' or 'wcalc' then 'help' for help."
     else
       wcalc $@
     fi

# for unknown reasons, wcalc change current directory to home dir ...
     popd > /dev/null
}            


# load gpg-agent 
if which gpg-agent >/dev/null; then
  GPG_ENV_FILE="${HOME}/.gnupg/gpg-agent.env"
  if ! pgrep gpg-agent >/dev/null; then
    gpg-agent --daemon --write-env-file "${GPG_ENV_FILE}" >/dev/null
  fi
  if [ -f "${GPG_ENV_FILE}" ]; then
    source "${GPG_ENV_FILE}"
    export GPG_AGENT_INFO
  fi
fi

# The next line updates PATH for the Google Cloud SDK.
source '/home/rachid/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/rachid/google-cloud-sdk/completion.zsh.inc'
