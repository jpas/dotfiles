{ config, pkgs, lib, ... }:

let
  font = {
    family = "Hack";
    size = 9;
  };
  # gruvbox colors
  gb = {
    dark0_hard  = "1d2021";
    dark0       = "282828";
    dark0_soft  = "32302f";
    dark1       = "3c3836";
    dark2       = "504945";
    dark3       = "665c54";
    dark4       = "7c6f64";
    dark4_256   = "7c6f64";

    gray_245    = "928374";
    gray_244    = "928374";

    light0_hard = "f9f5d7";
    light0      = "fbf1c7";
    light0_soft = "f2e5bc";
    light1      = "ebdbb2";
    light2      = "d5c4a1";
    light3      = "bdae93";
    light4      = "a89984";
    light4_256  = "a89984";

    bright_red     = "fb4934";
    bright_green   = "b8bb26";
    bright_yellow  = "fabd2f";
    bright_blue    = "83a598";
    bright_purple  = "d3869b";
    bright_aqua    = "8ec07c";
    bright_orange  = "fe8019";

    neutral_red    = "cc241d";
    neutral_green  = "98971a";
    neutral_yellow = "d79921";
    neutral_blue   = "458588";
    neutral_purple = "b16286";
    neutral_aqua   = "689d6a";
    neutral_orange = "d65d0e";

    faded_red      = "9d0006";
    faded_green    = "79740e";
    faded_yellow   = "b57614";
    faded_blue     = "076678";
    faded_purple   = "8f3f71";
    faded_aqua     = "427b58";
    faded_orange   = "af3a03";
  };
in
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
    (texlive.combine { inherit (texlive)
      scheme-medium
      collection-fontsextra
      collection-bibtexextra
      ;
    })
    tmux
  ];

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = let
      modifier = "Mod4"; # meta key
    in {
      modifier = modifier;
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec alacritty";
      };

      colors = let
        base = {
          background  = "#"+gb.dark1;
          text        = "#"+gb.light1;
          indicator   = "#"+gb.light4;
          border      = "#"+gb.dark1;
          childBorder = "#"+gb.dark1;
        };
      in {
        background = base.background;
        focused = base // {
          background  = "#"+gb.dark2;
          border      = "#"+gb.dark2;
          childBorder = "#"+gb.dark2;
        };
        urgent = base // {
          background  = "#"+gb.neutral_red;
          border      = "#"+gb.neutral_red;
          childBorder = "#"+gb.neutral_red;
        };
        focusedInactive = base;
        unfocused       = base;
        placeholder     = base;
      };

      fonts = [ "${font.family} ${toString font.size}" ];
    };
  };

  # TODO: enable programs from packages

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = font.family;
        size = font.size;
      };

      window.padding = { x = 2; y = 2; };

      colors = {
        primary = {
          background = "0x"+gb.dark0;
          foreground = "0x"+gb.light1;
        };
        normal = {
          black   = "0x"+gb.dark0;
          red     = "0x"+gb.neutral_red;
          green   = "0x"+gb.neutral_green;
          yellow  = "0x"+gb.neutral_yellow;
          blue    = "0x"+gb.neutral_blue;
          magenta = "0x"+gb.neutral_purple;
          cyan    = "0x"+gb.neutral_aqua;
          white   = "0x"+gb.light4;
        };
        bright = {
          black   = "0x"+gb.gray_245;
          red     = "0x"+gb.bright_red;
          green   = "0x"+gb.bright_green;
          yellow  = "0x"+gb.bright_yellow;
          blue    = "0x"+gb.bright_blue;
          magenta = "0x"+gb.bright_purple;
          cyan    = "0x"+gb.bright_aqua;
          white   = "0x"+gb.light1;
        };
      };
      live_config_reload = true;
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
