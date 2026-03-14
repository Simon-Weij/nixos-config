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
    hashedPassword = "$y$j9T$Lh5xfMWjdQPXq1SY5h1if.$H04U9/Kfl1YHR7shomYVpltWWjx/oNR4PCtuLQ8IxRA";
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
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.spicetify-nix.nixosModules.default

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
