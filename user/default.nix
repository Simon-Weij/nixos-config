{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.simon = import ./home/home.nix;

  imports = [
    ./packages.nix
  ];
}