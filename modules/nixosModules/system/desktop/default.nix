{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      niri
      bluetooth
      desktop-hardening
      fonts
      networking
      pipewire
      user-dirs
      desktop-essentials
    ];
  };
}
