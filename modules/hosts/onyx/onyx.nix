{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "onyx";
    hashedPassword = "$y$j9T$Lh5xfMWjdQPXq1SY5h1if.$H04U9/Kfl1YHR7shomYVpltWWjx/oNR4PCtuLQ8IxRA";
    isLaptop = true;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.onyx = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      inputs.hjem.nixosModules.default
      inputs.nix-flatpak.nixosModules.nix-flatpak
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
