{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: let
    modules = self.nixosModules;
    concord = inputs.concord.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = with modules; [
      chromium
      spotify
    ];
    environment.systemPackages = [
      concord.concord-tui
    ];
  };
}
