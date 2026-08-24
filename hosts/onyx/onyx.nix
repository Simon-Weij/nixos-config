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
    isLaptop = true;
  };
in {
  nixosConfigurations.onyx = {
    system = "x86_64-linux";
    specialArgs = {inherit inputs self flakeConfig;};
    modules = [
      ./hardware.nix

      ../../nixosModules/system/default.nix
      ../../nixosModules/docker.nix
      ../../nixosModules/development.nix
      ../../nixosModules/desktop/umbriel.nix
      ../../nixosModules/system/btrfs.nix

      ../../helix/default.nix
      ../../programs/chromium.nix
      ../../programs/kitty.nix
      ../../programs/git.nix
      ../../programs/tailscale.nix
      ../../programs/spotify.nix
      ../../programs/starship.nix
    ];
  };
}
