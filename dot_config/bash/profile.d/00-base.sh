# set up our permissions right...
umask 027

# no history
export HISTFILE=/dev/null
export LESSHISTFILE=/dev/null

export VISUAL=vim
export EDITOR=vim
export PAGER=less
export LESS=-R

export CDPATH=$HOME/school/classes

if [ -d "$HOME/.nix-profile/etc/profile.d" ]; then
  for f in $HOME/nix-profile/etc/profile.d/*.sh; do
    if [ -r $f ]; then
      source $f
    fi
  done
fi

export PATH=$HOME/.local/bin:$PATH
