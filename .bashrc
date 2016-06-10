# .bashrc - Alan Christopher Thomas
# http://alanct.com/

# Disallow history duplicates and forget commands prefixed by spaces
HISTCONTROL=ignoredups:ignorespace

# Individually append lines to history and set window title
shopt -s histappend

# Include shell environment
if [ -f ~/.shenv ]; then
    . ~/.shenv
fi

# Enable programmable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable git bash completion
if [ -f ~/.bash_scripts/git-completion.bash ]; then
    . ~/.bash_scripts/git-completion.bash
fi

# Enable git prompt
if [ -f ~/.bash_scripts/git-prompt.bash ]; then
    . ~/.bash_scripts/git-prompt.bash
fi

# Enable ta bash completion
if [ -f ~/.bash_scripts/ta-completion.bash ]; then
    . ~/.bash_scripts/ta-completion.bash
fi

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable prompt
if [ -f ~/.bash_scripts/prompt.bash ]; then
    . ~/.bash_scripts/prompt.bash
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
source /etc/bash_completion.d/password-store

[[ -s "/home/rachid/.gvm/scripts/gvm" ]] && source "/home/rachid/.gvm/scripts/gvm"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
