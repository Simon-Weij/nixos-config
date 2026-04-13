{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.dev = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      vscodium
      development
      docker
    ];
  };
}
