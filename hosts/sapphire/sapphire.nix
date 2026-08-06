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
    isLaptop = false;
  };
in {
  nixosConfigurations.sapphire = {
    system = "x86_64-linux";
    specialArgs = {inherit inputs self flakeConfig;};
    modules = [
      ./hardware.nix

      ../../nixosModules/desktop/default.nix
      ../../nixosModules/system/default.nix
      ../../nixosModules/docker.nix
      ../../nixosModules/development.nix
      ../../nixosModules/system/btrfs.nix

      ../../helix/default.nix
      ../../programs/chromium.nix
      ../../programs/steam.nix
      ../../programs/kitty.nix
      ../../programs/minecraft.nix
      ../../programs/git.nix
      ../../programs/yazi.nix
      ../../programs/concord.nix
      ../../programs/tailscale.nix
      ../../programs/spotify.nix
      ../../programs/starship.nix
    ];
  };
}
