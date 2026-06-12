{inputs, ...}: {
  flake.nixosModules.vscodium = {
    pkgs,
    flakeConfig,
    ...
  }: let
    username = flakeConfig.username;
    extensions = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
    vscodium = pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with extensions; [
        # Nix
        bbenoist.nix
        kamadorueda.alejandra

        # Angular
        angular.ng-template

        # Flutter
        dart-code.dart-code
        dart-code.flutter
        alexisvt.flutter-snippets

        # Go
        golang.go

        # Rust
        rust-lang.rust-analyzer
        tauri-apps.tauri-vscode

        # Svelte
        svelte.svelte-vscode
        pivaszbs.svelte-autoimport

        # Ts/Js
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        yoavbls.pretty-ts-errors
        christian-kohler.npm-intellisense
        orta.vscode-jest

        # Web
        ecmel.vscode-html-css
        bradlc.vscode-tailwindcss
        formulahendry.auto-rename-tag
        formulahendry.auto-close-tag
        heybourn.headwind
        pranaygp.vscode-css-peek

        # Python
        ms-python.python
        ms-python.debugpy
        detachhead.basedpyright
        ms-python.isort
        ms-python.black-formatter
        njpwerner.autodocstring
        kevinrose.vsc-python-indent

        # Docker
        ms-azuretools.vscode-docker
        ms-azuretools.vscode-containers
        docker.docker

        # Tools
        donjayamanne.githistory
        tamasfe.even-better-toml
        skellock.just
        editorconfig.editorconfig
        usernamehw.errorlens
        pkief.material-icon-theme
        christian-kohler.path-intellisense
        kdl-org.kdl
        mkhl.direnv
        vscodevim.vim
      ];
    };
  in {
    users.users.${username}.packages = [
      (pkgs.symlinkJoin {
        name = "codium-icons";
        paths = [vscodium];
        pathsToLink = ["/share/icons"];
      })
    ];

    programs.firejail.wrappedBinaries.codium = {
      executable = "${vscodium}/bin/codium";
      profile = "${pkgs.firejail}/etc/firejail/codium.profile";
      desktop = "${vscodium}/share/applications/codium.desktop";
    };

    hjem.users.${username} = {
      user = username;
      directory = "/home/${username}";
      files = {
        ".config/VSCodium/User/settings.json" = {
          source = ./settings.json;
          type = "copy";
          permissions = "0644";
        };
        ".config/VSCodium/User/keybindings.json" = {
          source = ./keybindings.json;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
