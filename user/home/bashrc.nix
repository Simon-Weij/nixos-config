{ lib, flakeConfig, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "nix run nixpkgs#fastfetch";
      tree = "nix run nixpkgs#tree";
      tokei = "nix run nixpkgs#tokei";
      please = "sudo";
    } // lib.optionalAttrs (flakeConfig.networking.hostName == "onyx") {
      config-rebuild = "sudo nixos-rebuild switch --flake ${flakeConfig.flakePath}#onyx | nom";
    };

    sessionVariables = {
      NH_FLAKE = "${flakeConfig.flakePath}#sapphire";
    };
  };
}
