{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpaks = {
      url = "github:in-a-dil-emma/declarative-flatpak/latest";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hytale-launcher = {
      url = "github:JPyke3/hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pandora = {
      url = "github:dtomvan/nixpkgs/dtomvan/push-rlsrwrnvmnsp";
    };
    crush = {
      url = "github:numtide/nix-ai-tools";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        ((inputs.import-tree.matchNot ".*/(hardware|disko)\.nix|.*/nvim/.*") ./modules)
        ./modules/nixosModules/system/dev/nvim/nvim.nix
      ];
    };
}
