{
  pkgs,
  inputs,
  flakeConfig,
  ...
}: {
  environment.systemPackages = with pkgs; [
    steelix
    steel

    # Go
    gofumpt
    gopls
    golangci-lint-langserver
    golangci-lint

    # Nix
    nixd
    alejandra

    # Web
    svelte-language-server
    typescript-language-server
    eslint
    vscode-langservers-extracted
    tailwindcss-language-server

    # Config formats
    yaml-language-server
    yamlfmt

    docker-language-server
    dockerfmt
    docker-compose-language-service
  ];

  hjem = {
    extraModules = [inputs.helix-plugins.hjemModules.default];
    users.${flakeConfig.username} = {
      programs.helix = {
        enable = true;
        plugins = with inputs.helix-plugins.legacyPackages.${pkgs.stdenv.hostPlatform.system}.helixPlugins; [
          forest
          smooth-scroll
        ];
      };
      xdg = {
        config.files = {
          "helix/config.toml" = {
            source = ./config.toml;
            type = "copy";
          };
          "helix/languages.toml" = {
            source = ./languages.toml;
            type = "copy";
          };
          "helix/init.scm" = {
            source = ./init.scm;
            type = "copy";
          };
          "helix/helix.scm" = {
            source = ./helix.scm;
            type = "copy";
          };
        };
      };
    };
  };
}
