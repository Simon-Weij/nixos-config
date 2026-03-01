{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    veryunstable.url = "github:NixOS/nixpkgs/master";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    wrappers.url = "github:Lassulus/wrappers";
    fluxer.url = "github:Simon-Weij/Fluxer-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions/master";
    hjem.url = "github:feel-co/hjem";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flatpaks,
    spicetify-nix,
    wrappers,
    hjem,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

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
          ./system/systemd.nix
          ./user/config/fonts/fonts.nix
          ./user/config/bash/bash.nix
          ./user/config/home/home.nix
          ./user/config/chromium/chromium.nix
          ./user/config/niri/niri.nix
          ./user/config/niri/wrappers.nix
          ./user/config/niri/swww/swww.nix
          (./hosts + "/${hostName}/hardware.nix")
          (./hosts + "/${hostName}/config.nix")
          spicetify-nix.nixosModules.spicetify
          flatpaks.nixosModules.nix-flatpak
          inputs.hjem.nixosModules.default
        ];
      };
  in {
    nixosConfigurations = {
      sapphire = mkSystem "sapphire";
      onyx = mkSystem "onyx";
    };

    packages.${system}.vscode = import ./user/config/vscode/vscode.nix {
      inherit pkgs;
    };

    sapphire = self.nixosConfigurations.sapphire;
    onyx = self.nixosConfigurations.onyx;
  };
}
