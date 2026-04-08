{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "topaz";
    hashedPassword = "REMOVED";
    isLaptop = true;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.topaz = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      {
        services.keyd = {
          enable = true;
          keyboards.default = {
            ids = ["*"];
            settings = {
              main = {
                leftalt = "leftmeta";
                leftmeta = "leftalt";
              };
            };
          };
        };
      }
      ./hardware.nix
      inputs.hjem.nixosModules.default
      inputs.flatpaks.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote

      bluetooth
      bootloader
      desktop-hardening
      networking
      nix
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
