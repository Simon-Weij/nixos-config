{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.system = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      bootloader
      nix
      unfree
      timezone
      user
      wait-online
      zsh
    ];
  };
}
