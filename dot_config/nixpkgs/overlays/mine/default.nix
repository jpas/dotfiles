self: super:
let
  callPackage = super.lib.callPackageWith super;
  pkgs = with self; {
    cli = [
      _1password
      aspell
      aspellDicts.en
      bat
      chezmoi
      coreutils
      direnv
      exa
      fd
      fzf
      git
      glances
      gnumake
      htop
      jq
      lorri
      modd
      neovim
      python39
      ripgrep
      scholar
      tmux
    ];

    gui = [
      alacritty
      discord
      emacs
      firefox
      keybase-gui
      signal-desktop
      gnome3.gnome-tweaks
    ];
  };
in {
  wireshark = super.wireshark.override {
    libpcap = super.libpcap.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs
        ++ [ super.bluez.dev super.pkgconfig ];
    });
  };

  rmapi = callPackage ./pkgs/rmapi { };
  scholar = callPackage ./pkgs/scholar { };
  srvfb = callPackage ./pkgs/srvfb { };

  core-cli = with self;
    buildEnv {
      name = "core-cli";
      paths = pkgs.cli;
    };

  core-gui = with self;
    buildEnv {
      name = "core-gui";
      paths = pkgs.cli ++ pkgs.gui;
    };

  core-tex = with self;
    buildEnv {
      name = "core-tex";
      paths = [
        (texlive.combine {
          inherit (texlive)
            scheme-medium collection-bibtexextra collection-fontsextra
            collection-latexextra;
        })
      ];
    };
}
