{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    packages.nvimWrapped =
      (inputs.nvf.lib.neovimConfiguration {
        pkgs = unstable;
        modules = [
          ./theme.nix
          ./languages.nix
          ./plugins.nix
          ./keybinds.nix
          ./config.nix
        ];
      }).neovim;
  };
}
