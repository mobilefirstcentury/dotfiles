#script ~/screen.log
# alias startx='startx &> ~/.xlog'

echo $(date +%Y.%m.%d-%H:%M:%S) ": Lauching Zlogin ..." >> ~/.logs/.xlog


function launch_i3
{
# Don't launch i3 only if we're not in tmux or screen session
  if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    echo "\n"
    echo "Lancement I3 sur display " $1 ": " $(date +%Y.%m.%d-%H:%M:%S) >> ~/.logs/.xlog
    export I3VT=$1
    (exec startx  &>> ~/.logs/.xlog &)
  fi
}

# S'il n'y a pas de server X et qu'on est sur le VT 1, c'est qu'on a booté directement sur I3 depuis Lightdm
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
then
  if [[ -z $I3VT ]]
  then
    launch_i3 1
  fi
else
  if [[ -z $I3VT ]]
  then
    launch_i3 7
  fi
fi
