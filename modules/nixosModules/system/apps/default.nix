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
      spotify
      vesktop
    ];
  };
}
