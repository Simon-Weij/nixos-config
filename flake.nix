{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, unstable, flatpaks, spicetify-nix, hjem }:
  let 
    system = "x86_64-linux";
    unstable-pkgs = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { unstable = unstable-pkgs; inherit inputs; };
      modules = [
        ./system/default.nix
        ./user/default.nix

        spicetify-nix.nixosModules.spicetify
        flatpaks.nixosModules.nix-flatpak
        hjem.nixosModules.default
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
