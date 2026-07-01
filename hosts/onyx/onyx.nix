{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "onxy";
    isLaptop = false;
  };
in {
  nixosConfigurations.sapphire = {
    system = "x86_64-linux";
    specialArgs = {inherit inputs self flakeConfig;};
    modules = [
      ./hardware.nix
      ./disko.nix

      ../../nixosModules/desktop/default.nix
      ../../nixosModules/system/default.nix

      ../../programs/spotify.nix
      ../../programs/zsh.nix
      ../../programs/helix.nix
      ../../programs/chromium.nix
      ../../programs/zellij.nix
      ../../programs/ghostty.nix
      ../../programs/minecraft.nix
      ../../programs/git.nix
    ];
  };
}
