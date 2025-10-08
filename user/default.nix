{ inputs, flakeConfig, ... }:
let
  username = flakeConfig.username;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs flakeConfig; };
    users."${username}" = import ./home/home.nix;
  };

  imports = [
    ./packages.nix
  ];
}