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
    hashedPassword = "$y$j9T$Lh5xfMWjdQPXq1SY5h1if.$H04U9/Kfl1YHR7shomYVpltWWjx/oNR4PCtuLQ8IxRA";
    isLaptop = false;
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
      zsh
      chromium
      development
      docker
      essentials
      fonts
      matrix
      niri
      mako
      rofi
      swaylock
      pipewire
      spotify
      theme
      user-dirs
      gamedev
    ];
  };
}
