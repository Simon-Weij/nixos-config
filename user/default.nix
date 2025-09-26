{ inputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.simon = import ./home/home.nix;

  imports = [
    ./packages.nix
  ];
}