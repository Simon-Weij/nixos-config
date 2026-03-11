{
  pkgs,
  inputs,
  flakeConfig,
  ...
}: let
in {
  users.users."${flakeConfig.username}".packages = with pkgs; [
    nh
    alejandra
    nixd
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
