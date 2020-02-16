{
  allowUnfree = true;

  packageOverrides = defPkgs: with defPkgs; {
    core = with pkgs; buildEnv {
      # set of packages that are absolutely needed
      name = "core";
      paths = [
        aspell
        bat
        chezmoi
        coreutils
        direnv
        emacs
        exa
        fd
        fzf
        git
        htop
        jq
        lorri
        neovim
        ripgrep
        tmux
      ];
    };

    core-x = with pkgs; buildEnv {
      # set of packages that are absolutely needed an X session
      name = "core-x";
      paths = [
        core

        alacritty
        dmenu
        firefox
        i3
        i3lock
        rofi
        zathura
      ];
    };

    core-tex = with pkgs; buildEnv {
      name = "core-tex";
      paths = [
        (texlive.combine {
          inherit (texlive)
          scheme-medium
          collection-bibtexextra
          collection-fontsextra
          collection-latexextra
          ;
        })
      ];
    };

    base = with pkgs; buildEnv {
      # a more featureful environment
      name = "base";
      paths = [
        core

        _1password
        gnumake
        modd
      ];
    };

    base-x = with pkgs; buildEnv {
      # are more featureful X session
      name = "base-x";
      paths = [
        base
        core-x
      ];
    };
  };
}
