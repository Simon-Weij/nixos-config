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
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flatpaks,
    spicetify-nix,
    wrappers,
    hjem,
    nvf,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    unstablePkgs = import inputs.unstable {
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
          (./hosts + "/${hostName}/hardware.nix")
          (./hosts + "/${hostName}/modules.nix")
          spicetify-nix.nixosModules.spicetify
          flatpaks.nixosModules.nix-flatpak
          inputs.hjem.nixosModules.default
          nvf.nixosModules.default
        ];
      };
  in {
    nixosConfigurations = {
      sapphire = mkSystem "sapphire";
      onyx = mkSystem "onyx";
      topaz = mkSystem "topaz";
    };

    sapphire = self.nixosConfigurations.sapphire;
    onyx = self.nixosConfigurations.onyx;
    topaz = self.nixosConfigurations.topaz;
  };
}
