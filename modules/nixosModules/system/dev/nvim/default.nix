{
  inputs,
  self,
  ...
}: let
  modules = self.nixosModules;
in {
  perSystem = {
    pkgs,
    ...
  }: {
    packages.nvimWrapped =
      (inputs.nvf.lib.neovimConfiguration {
        pkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        modules = with modules; [
          nvim-theme
          nvim-languages
          nvim-treesitter
          nvim-lsp
          nvim-extras
          nvim-visuals
          nvim-filetree
          nvim-autocomplete
          nvim-leap
          nvim-terminal
          nvim-config
          nvim-keybinds
          nvim-navigation
        ];
      }).neovim;
  };

  flake.nixosModules.nvim = {pkgs, ...}: let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvimWrapped
      unstable.zellij
    ];
  };
}
