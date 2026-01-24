{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    wrappers.url = "github:Lassulus/wrappers";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flatpaks,
    spicetify-nix,
    wrappers,
    ...
  }: let
    system = "x86_64-linux";

    mkSystem = hostName: let
      hostConfig = import (./hosts + "/${hostName}/meta.nix");
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          flakeConfig = hostConfig.flakeConfig;
        };
        modules = [
          ./system/system.nix
          ./packages.nix
          ./user/config/gnome/dconf.nix
          ./user/config/gnome/extensions.nix
          ./user/packages/spicetify.nix
          ./user/packages/steam.nix
          ./system/systemd.nix
          ./user/config/fonts/fonts.nix
          ./user/config/bash/bash.nix
          (./hosts + "/${hostName}/hardware.nix")
          (./hosts + "/${hostName}/config.nix")
          spicetify-nix.nixosModules.spicetify
          flatpaks.nixosModules.nix-flatpak
        ];
      };
  in {
    nixosConfigurations = {
      sapphire = mkSystem "sapphire";
      onyx = mkSystem "onyx";
      opal = mkSystem "opal";
    };

    sapphire = self.nixosConfigurations.sapphire;
    onyx = self.nixosConfigurations.onyx;
    opal = self.nixosConfigurations.opal;
  };
}
