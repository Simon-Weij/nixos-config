{
  inputs,
  self,
  ...
}: let
  flakeConfig = {
    flakePath = "/home/simon/Documents/nixos-config";
    stateVersion = "26.05";
    username = "simon";
    networking.hostName = "ruby";
    isLaptop = true;
  };
  modules = self.nixosModules;
in {
  flake.nixosConfigurations.ruby = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit flakeConfig inputs self;};
    modules = with modules; [
      ./hardware.nix
      ./disko.nix
      imports
      {
        networking.networkmanager.enable = true;
      }
      system
      server
    ];
  };
}
