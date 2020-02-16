# set up our permissions right...
umask 027

if [ -d "$HOME/.nix-profile/etc/profile.d" ]; then
  for f in $HOME/nix-profile/etc/profile.d/*.sh; do
    if [ -r $f ]; then
      source $f
    fi
  done
fi

export PATH=$HOME/.local/bin:$PATH

export CDPATH=$HOME/school/classes

# no history
export HISTFILE=/dev/null
export LESSHISTFILE=/dev/null

# set up out editors
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export LESS=-R
