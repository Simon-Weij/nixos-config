{
  pkgs,
}:
pkgs.vscode-with-extensions.override {
  vscode = pkgs.vscodium;
  vscodeExtensions = with pkgs.vscode-extensions;
    [
      # Nix
      bbenoist.nix

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
      #ms-python.vscode-pylance
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
      serayuzgur.crates
      vadimcn.vscode-lldb
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "svelte-autoimport";
        publisher = "pivaszbs";
        version = "1.0.4";
        sha256 = "sha256-MqxZYKxmbuXKQkgSZFhPVts1h6l7/sxYo/cqMirRKpE=";
      }
      {
        publisher = "pmneo";
        name = "tsimporter";
        version = "2.0.1";
        sha256 = "sha256-JQ7dAliryvVXH0Rg1uheSznOHqbp/BMwwlePH9P0kog=";
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
    ];
}
