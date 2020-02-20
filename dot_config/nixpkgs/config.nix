{
  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in {
    core = with self; buildEnv {
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
        # neovim
        ripgrep
        tmux
      ];
    };

    core-x = with self; buildEnv {
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

    core-tex = with self; buildEnv {
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

    base = with self; buildEnv {
      # a more featureful environment
      name = "base";
      paths = [
        core

        _1password
        gnumake
        modd
      ];
    };

    base-x = with self; buildEnv {
      # are more featureful X session
      name = "base-x";
      paths = [
        base
        core-x
      ];
    };
  };
}
