{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      chromium
      matrix
      spotify
      vesktop
    ];
  };
}
