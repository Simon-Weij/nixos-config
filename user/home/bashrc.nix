{ flakeConfig, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "nix run nixpkgs#fastfetch";
      tree = "nix run nixpkgs#tree";
      tokei = "nix run nixpkgs#tokei";
      please = "sudo";
    };

    sessionVariables = {
      NH_FLAKE = "${flakeConfig.flakePath}#sapphire";
    };
  };
}
