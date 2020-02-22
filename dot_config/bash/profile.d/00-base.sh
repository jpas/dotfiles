# set up our permissions right...
umask 027

if [ -n "$__PROFILE_DONE" ]; then return; fi
export __PROFILE_DONE=1

if [ -d "$HOME/.nix-profile/etc/profile.d" ]; then
  for f in $HOME/.nix-profile/etc/profile.d/*.sh; do
    if [ -r $f ]; then
      source $f
    fi
  done
fi

# make sure that my bin is first
export PATH=$HOME/.local/bin${PATH:+:}$PATH

# cd shortcuts
export CDPATH=$HOME/school/classes

# no history
export HISTFILE=/dev/null
export LESSHISTFILE=/dev/null

rm -f $HOME/.bash_history
rm -f $HOME/.lesshist
rm -f $HOME/.python_history

# set up our editors
export VISUAL=vim
export EDITOR=vim
export PAGER=less
export LESS=-R
