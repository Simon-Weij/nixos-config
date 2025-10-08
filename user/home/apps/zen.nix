{ inputs, pkgs, flakeConfig, ... }:
{
  home.packages = [
    inputs.zen.packages.${pkgs.stdenv.system}.default
  ];
}
