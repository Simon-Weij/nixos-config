{
  inputs = {
    nixpkgs = {
      url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kitty-nord = {
      url = "https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf";
      flake = false;
    };
    notify = {
      url = "github:chuwy/notify.hx";
      flake = false;
    };
    smooth-scroll = {
      url = "github:thomasschafer/smooth-scroll.hx";
      flake = false;
    };
    forest = {
      url = "github:Ra77a3l3-jar/forest.hx";
      flake = false;
    };
    glyph = {
      url = "github:Ra77a3l3-jar/glyph.hx";
      flake = false;
    };
  };

  outputs = inputs @ {self, ...}: let
    defaultModules = with inputs; [
      hjem.nixosModules.default
      spicetify-nix.nixosModules.spicetify
    ];
    mkHost = path: let
      hostConfigs = (import path {inherit inputs self;}).nixosConfigurations;
    in
      builtins.mapAttrs (
        name: cfg:
          inputs.nixpkgs.lib.nixosSystem {
            inherit (cfg) system specialArgs;
            modules = defaultModules ++ cfg.modules;
          }
      )
      hostConfigs;
  in {
    nixosConfigurations =
      mkHost ./hosts/onyx/onyx.nix
      // mkHost ./hosts/ruby/ruby.nix
      // mkHost ./hosts/sapphire/sapphire.nix;
  };
}
