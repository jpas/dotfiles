{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    _1password
    bat
    direnv
    exa
    fd
    fzf
    htop
    neovim
    ripgrep
    tmux
    tectonic
  ];

  # TODO: enable programs from packages

  programs.emacs.enable = true;
  services.emacs.enable = true;

  services.lorri.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "19.09";
}
