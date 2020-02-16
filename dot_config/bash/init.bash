if [[ -d $HOME/.config/bash/profile.d ]]; then
  for f in $HOME/.config/bash/profile.d/*.bash; do
    [[ -r $f ]] && source $f
  done
fi

# stop if we are not interactive
[[ $- == *i* ]] || return

if [[ -d $HOME/.config/bash/rc.d ]]; then
  for f in $HOME/.config/bash/rc.d/*.bash; do
    [[ -r $f ]] && source $f
  done
fi
