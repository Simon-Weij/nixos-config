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
      url = "github:nix-community/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix-plugins = {
      url = "github:maxschipper/helix-plugins-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mocktail = {
      url = "git+https://github.com/coderdayton/nightcap";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zsh-helix-mode = {
      url = "github:multirious/zsh-helix-mode/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:Simon-Weij/helix/steel-event-system";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nord-tmux = {
      url = "github:nordtheme/tmux";
      flake = false;
    };
    kitty-nord = {
      url = "https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf";
      flake = false;
    };
  };

  outputs = inputs @ {self, ...}: let
    defaultModules = with inputs; [
      hjem.nixosModules.default
      helix-plugins.nixosModules.default
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
      // mkHost ./hosts/sapphire/sapphire.nix;
  };
}
