let
  flakeConfig = import ../../flake-config.nix;
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "nix-shell -p fastfetch --run fastfetch";
      tree = "nix-shell -p tree --run tree";
      tokei = "nix-shell -p tokei --run tokei";
      please = "sudo";
    };

    sessionVariables = {
      NH_FLAKE = flakeConfig.flakePath;
    };
  };
}