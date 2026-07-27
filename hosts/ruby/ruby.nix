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
in {
  nixosConfigurations.ruby = {
    system = "x86_64-linux";
    specialArgs = {inherit flakeConfig inputs self;};
    modules = [
      ./hardware.nix
      ./disko.nix
      {
        networking = {
          hostName = "${flakeConfig.networking.hostName}";
          networkmanager.enable = true;
        };
      }
      ../../nixosModules/system/default.nix
      ../../nixosModules/docker.nix
      ../../nixosModules/server.nix

      ../../programs/tailscale.nix
      ../../programs/kitty.nix
    ];
  };
}
