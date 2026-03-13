{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.05";
    username = "simon";
    networking.hostName = "sapphire";
    hashedPassword = "REMOVED";
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.sapphire = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      inputs.hjem.nixosModules.default
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.spicetify-nix.nixosModules.default

      bluetooth
      bootloader
      desktop-hardening
      gaming
      networking
      nix
      swap
      timezone
      unfree
      user
      wait-online
      vesktop

      swww
      vscodium
      waybar
      wrappers
      bash
      chromium
      development
      docker
      essentials
      fonts
      matrix
      niri
      pipewire
      spotify
      theme
      user-dirs
    ];
  };
}
