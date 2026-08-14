{
  inputs,
  flakeConfig,
  pkgs,
  ...
}: let
  wrappedNuShell = pkgs.callPackage ./../../programs/nu.nix {inherit inputs flakeConfig;};
in {
  environment.shells = [wrappedNuShell];
  users = {
    mutableUsers = true;
    users."${flakeConfig.username}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "password";
      shell = wrappedNuShell;
    };
    defaultUserShell = wrappedNuShell;
  };
}
