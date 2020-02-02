{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    _1password
    bat
    exa
    fd
    gnumake
    htop
    ispell
    modd
    neovim
    ripgrep
    tectonic
    tmux
  ];

  # TODO: enable programs from packages

  # emacs? emacs!
  programs.emacs.enable = true;
  services.emacs.enable = true;

  # fuzzy finder
  programs.fzf.enable = true;

  # automatic environment set up for cd
  programs.direnv.enable = true;
  services.lorri.enable = true;

  # zathura pdf viewer
  programs.zathura.enable = true;

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
