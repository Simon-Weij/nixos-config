{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    fluxer.url = "github:Simon-Weij/Fluxer-nix";
    hjem.url = "github:feel-co/hjem";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    wrappers.url = "github:Lassulus/wrappers";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [((inputs.import-tree.matchNot ".*/hardware\\.nix") ./modules)];
    };
}
