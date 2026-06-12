{self, ...}: {
  flake.nixosModules.dev = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      development
      docker
      vscodium
      {
        environment.systemPackages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.nvimWrapped
        ];
      }
    ];
  };
}
