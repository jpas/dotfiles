# fix ldap name resolution
export LD_PRELOAD="/lib64/libnss_ldap.so.2"

if ! [[ -d "$HOME/.nix-profile" ]]; then
  if [[ -x $HOME/.local/bin/nix-user-chroot ]]; then
    login=$(shopt | grep -q 'login_shell.*on' && echo --login)
    exec nix-user-chroot "$HOME/.nix" "$SHELL" "$login"
  fi
fi

if [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && [[ -z "$NIX_PATH" ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
