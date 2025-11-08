{ inputs, flakeConfig, unstable, ... }:
let
  username = flakeConfig.username;
in
{
  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs flakeConfig unstable; };
    users."${username}" = import ./home/home.nix;
    sharedModules = [
      inputs.stylix.homeModules.stylix
      {
        nixpkgs.config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "libsoup-2.74.3" ];
        };
      }
    ];
  };

  imports = [
    ./packages.nix
    ./user.nix
  ];
}
