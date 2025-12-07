{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    hjem.url = "github:feel-co/hjem";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flatpaks,
      hjem,
      spicetify-nix,
      home-manager,
      chaotic,
    }:
    let
      system = "x86_64-linux";
      
      mkSystem = hostName: hardwareModule:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            flakeConfig = {
              flakePath = "/home/simon/Documents/nixos-config";
              stateVersion = "25.05";
              username = "simon";
              networking.hostName = hostName;
            };
          };
          modules = [
            ./system/system.nix
            ./packages.nix
            ./user/hjem.nix
            ./user/config/gnome/dconf.nix
            ./user/config/gnome/extensions.nix
            hardwareModule
            home-manager.nixosModules.home-manager
            spicetify-nix.nixosModules.spicetify
            flatpaks.nixosModules.nix-flatpak
            chaotic.nixosModules.default
            inputs.hjem.nixosModules.default
          ];
        };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      nixosConfigurations = {
        sapphire = mkSystem "sapphire" ./hardware/sapphire.nix;
        onyx = mkSystem "onyx" ./hardware/onyx.nix;
        opal = mkSystem "opal" ./hardware/opal.nix;
      };

      sapphire = self.nixosConfigurations.sapphire;
      onyx = self.nixosConfigurations.onyx;
      opal = self.nixosConfigurations.opal;
    };
}
