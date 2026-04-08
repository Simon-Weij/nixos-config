{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "sapphire";
    hashedPassword = "REMOVED";
    isLaptop = false;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.sapphire = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      inputs.hjem.nixosModules.default
      inputs.flatpaks.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote

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

      vscodium
      zsh
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
