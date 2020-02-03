{ config, pkgs, lib, ... }:

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

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = let
      modifier = "Mod4"; # meta key
    in {
      modifier = modifier;
      fonts = [ "Jetbrains Mono 8" ];
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec alacritty";
      };
    };
  };

  # TODO: enable programs from packages

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrains Mono";
        size = 8;
      };
      colors = {
        # Gruvbox dark
        primary = {
          # hard contrast: background = "0x1d2021"
          background = "0x282828";
          # soft contrast: background = "0x32302f"
          foreground = "0xebdbb2";
        };

        # Normal colors
        normal = {
          black   = "0x282828";
          red     = "0xcc241d";
          green   = "0x98971a";
          yellow  = "0xd79921";
          blue    = "0x458588";
          magenta = "0xb16286";
          cyan    = "0x689d6a";
          white   = "0xa89984";
        };

        # Bright colors
        bright = {
          black   = "0x928374";
          red     = "0xfb4934";
          green   = "0xb8bb26";
          yellow  = "0xfabd2f";
          blue    = "0x83a598";
          magenta = "0xd3869b";
          cyan    = "0x8ec07c";
          white   = "0xebdbb2";
        };
      };
    };
  };

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
