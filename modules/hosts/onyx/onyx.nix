{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "onyx";
    hashedPassword = "REMOVED";
    isLaptop = true;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.onyx = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      imports
      apps
      desktop
      dev
      system
    ];
  };
}
