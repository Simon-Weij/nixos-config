{
  pkgs,
  flakeConfig,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    steelix
    steel

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

  hjem.clobberByDefault = true;
  hjem.users.${flakeConfig.username}.xdg.config.files = {
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
    "helix/cogs/oil" = {
      source = inputs.oil;
      type = "symlink";
    };
    "helix/cogs/notify" = {
      source = inputs.notify;
      type = "symlink";
    };
    "helix/cogs/smooth-scroll" = {
      source = inputs.smooth-scroll;
      type = "symlink";
    };
  };
}
