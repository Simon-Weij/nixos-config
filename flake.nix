{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flatpaks.url = "github:gmodena/nix-flatpak/?ref=latest";

    hjem.url = "github:feel-co/hjem";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nix-casks.url = "github:atahanyorganci/nix-casks/archive";

    helium.url = "github:vikingnope/helium-browser-nix-flake";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flatpaks,
      spicetify-nix,
      ...
    }:
    let
      system = "x86_64-linux";

      mkSystem =
        hostModule:
        let
          hostConfig = import hostModule;
          hardwareModule = builtins.replaceStrings [ "hosts/" ] [ "hardware/" ] (toString hostModule);
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
            ./user/hjem.nix
            ./user/config/gnome/dconf.nix
            ./user/config/gnome/extensions.nix
            ./user/packages/spicetify.nix
            ./user/packages/steam.nix
            ./user/packages/flatpak.nix
            ./system/systemd.nix
            hardwareModule
            spicetify-nix.nixosModules.spicetify
            flatpaks.nixosModules.nix-flatpak
            inputs.hjem.nixosModules.default
          ];
        };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      nixosConfigurations = {
        sapphire = mkSystem ./hosts/sapphire.nix;
        onyx = mkSystem ./hosts/onyx.nix;
        opal = mkSystem ./hosts/opal.nix;
      };

      sapphire = self.nixosConfigurations.sapphire;
      onyx = self.nixosConfigurations.onyx;
      opal = self.nixosConfigurations.opal;
    };
}
