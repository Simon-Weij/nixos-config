{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.imports = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      inputs.hjem.nixosModules.default
      inputs.flatpaks.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.disko.nixosModules.disko
    ];
  };
}
