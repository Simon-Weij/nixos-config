{
  pkgs,
  flakeConfig,
  inputs,
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

    # Rust
    clippy
    rust-analyzer
    rustc

    # Python
    ruff
  ];

  hjem = {
    clobberByDefault = true;
    users.${flakeConfig.username}.xdg = {
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
      data.files = {
        "steel/cogs/notify" = {
          source = inputs.notify;
          type = "symlink";
        };
        "steel/cogs/glyph" = {
          source = inputs.glyph;
          type = "symlink";
        };
        "steel/cogs/smooth-scroll" = {
          source = inputs.smooth-scroll;
          type = "symlink";
        };
        "steel/cogs/forest" = {
          source = inputs.forest;
          type = "symlink";
        };
      };
    };
  };
}
