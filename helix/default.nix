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

  systemd.tmpfiles.rules = [ 
    "C+ /home/${flakeConfig.username}/.config/helix - - - - ${./.}" 
    "C+ /home/${flakeConfig.username}/.config/helix/cogs/oil - - - - ${inputs.oil}" 
    "C+ /home/${flakeConfig.username}/.config/helix/cogs/notify - - - - ${inputs.notify}" 
    "Z /home/${flakeConfig.username}/.config/helix - ${flakeConfig.username} users - -"
  ];
}
