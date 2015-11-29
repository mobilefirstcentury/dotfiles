#script ~/screen.log
# alias startx='startx &> ~/.xlog'

echo $(date +%Y.%m.%d-%H:%M:%S) ": Lauching Zlogin ..." >> ~/.xlog


function launch_i3
{
  echo "\n"
  echo "Lancement I3:" $(date +%Y.%m.%d-%H:%M:%S) >> ~/.xlog
  (exec startx  &>> ~/.xlog &)
}

# S'il n'y a pas de server X et qu'on est sur le VT 1, c'est qu'on a booté directement sur I3 depuis Lightdm
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
then
  launch_i3
else
  if [[ -z $I3VT ]]
  then
    launch_i3
    export I3VT=7
  fi
fi
