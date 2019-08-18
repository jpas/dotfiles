nix=$HOME/.local/nix
chroot="$nix/nix-user-chroot-$(uname -m)"

if [[ -x "$chroot" ]]; then
  # fix ldap name resolution
  export LD_PRELOAD="/lib64/libnss_ldap.so.2"
  # if we are not in the chroot this will be a broken symlink
  if ! [[ -d "$HOME/.nix-profile" ]]; then
    exec "$chroot" "$nix" "$SHELL"
  fi
fi

unset chroot
unset nix
