{
  inputs = {
    # repos
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    # configuration
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    niri-flake.url = "github:sodiboo/niri-flake";
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # apps
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen.url = "github:0xc000022070/zen-browser-flake";
    nvim.url = "github:Simon-Weij/neovim";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      unstable,
      flatpaks,
      spicetify-nix,
      home-manager,
      zen,
      nvim,
      niri-flake,
      stylix,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablepkgs = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
      sapphireConfig = import ./hosts/sapphire/sapphire.nix {
        inherit pkgs;
        unstable = unstablepkgs;
      };
      onyxConfig = import ./hosts/onyx/onyx.nix {
        inherit pkgs;
        unstable = unstablepkgs;
      };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations = {
        sapphire = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            unstable = unstablepkgs;
            inherit inputs;
            flakeConfig = sapphireConfig;
          };
          modules = [
            ./hosts/sapphire/default.nix
            ./user/default.nix
            home-manager.nixosModules.home-manager
            niri-flake.nixosModules.niri
            stylix.nixosModules.stylix
            spicetify-nix.nixosModules.spicetify
            flatpaks.nixosModules.nix-flatpak
          ];
        };
        onyx = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            unstable = unstablepkgs;
            inherit inputs;
            flakeConfig = onyxConfig;
          };
          modules = [
            ./hosts/onyx/default.nix
            ./user/default.nix
            home-manager.nixosModules.home-manager
            niri-flake.nixosModules.niri
            stylix.nixosModules.stylix
            spicetify-nix.nixosModules.spicetify
            flatpaks.nixosModules.nix-flatpak
          ];
        };
      };

      sapphire = self.nixosConfigurations.sapphire;
      onyx = self.nixosConfigurations.onyx;
    };
}
