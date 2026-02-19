{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    veryunstable.url = "github:NixOS/nixpkgs/master";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    wrappers.url = "github:Lassulus/wrappers";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "nixpkgs";
    };
    fluxer.url = "github:Simon-Weij/Fluxer-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions/master";
    helium.url = "github:Simon-Weij/Helium-flake";
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
