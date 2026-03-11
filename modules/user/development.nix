{...}: {
  imports = [
    ../../user/packages/development/nix.nix
    ../../user/packages/development/development.nix
    ../../user/config/home/vscode.nix
    ./docker.nix
  ];
}
