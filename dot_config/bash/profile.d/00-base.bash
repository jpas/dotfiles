[[ -z "$__PROFILE_SOURCED" ]] || return
export __PROFILE_SOURCED=1

if [ -d "$HOME/.nix-profile/etc/profile.d" ]; then
  for f in $HOME/nix-profile/etc/profile.d/*.sh; do
    if [ -r $f ]; then
      source $f
    fi
  done
fi

export PATH=$HOME/.local/bin:$PATH
