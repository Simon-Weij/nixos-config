{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "25.11";
    username = "simon";
    networking.hostName = "sapphire";
    hashedPassword = "password";
    isLaptop = false;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.sapphire = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      ./disko.nix

      imports
      apps
      desktop
      dev
      system
      gaming
      gamedev
    ];
  };
}
