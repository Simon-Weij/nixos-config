{
  inputs = {
    # repos
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    # configuration
    home-manager.url = "github:nix-community/home-manager/release-25.05";

    # apps
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen.url = "github:0xc000022070/zen-browser-flake";
    nvim.url = "git+file:///home/simon/Documents/neovim";
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
    }:
    let
      system = "x86_64-linux";
      flakeConfig = import ./flake-config.nix;
      pkgs = nixpkgs.legacyPackages.${system};
      unstablepkgs = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          unstable = unstablepkgs;
          inherit inputs flakeConfig;
        };
        modules = [
          ./system/default.nix
          ./user/default.nix

          spicetify-nix.nixosModules.spicetify
          flatpaks.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
