{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.vscodium = {
    pkgs,
    flakeConfig,
    ...
  }: let
    username = flakeConfig.username;
    vscodium = pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions =
        (with pkgs.vscode-extensions; [
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

          # Ts/Js
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          yoavbls.pretty-ts-errors
          christian-kohler.npm-intellisense

          # Web
          ecmel.vscode-html-css
          bradlc.vscode-tailwindcss
          formulahendry.auto-rename-tag
          formulahendry.auto-close-tag

          # Python
          ms-python.python
          ms-python.debugpy

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
          vadimcn.vscode-lldb
        ])
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "svelte-autoimport";
            publisher = "pivaszbs";
            version = "1.0.4";
            sha256 = "sha256-MqxZYKxmbuXKQkgSZFhPVts1h6l7/sxYo/cqMirRKpE=";
          }
          {
            publisher = "orta";
            name = "vscode-jest";
            version = "6.4.4";
            sha256 = "sha256-aAS52nwAtoMxrFoWD2Ow4LSKgCiBEZvAP6H2xYXMUzY=";
          }
          {
            publisher = "heybourn";
            name = "headwind";
            version = "1.7.0";
            sha256 = "sha256-yXsZoSuJQTdbHLjEERXX2zVheqNYmcPXs97/uQYa7og=";
          }
          {
            publisher = "pranaygp";
            name = "vscode-css-peek";
            version = "4.4.3";
            sha256 = "sha256-oY+mpDv2OTy5hFEk2DMNHi9epFm4Ay4qi0drCXPuYhU=";
          }
          {
            publisher = "kdl-org";
            name = "kdl";
            version = "2.1.3";
            sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
          }
        ];
    };
  in {
    users.users.${username}.packages = [vscodium];

    hjem.users.${username} = {
      user = username;
      directory = "/home/${username}";
      files.".config/VSCodium/User/settings.json" = {
        source = ./settings.json;
        type = "copy";
        permissions = "0644";
      };
    };
  };
}
