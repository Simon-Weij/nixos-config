{
  inputs,
  flakeConfig,
  pkgs,
  ...
}: {
  users = {
    mutableUsers = true;
    users."${flakeConfig.username}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "password";
      shell = pkgs.callPackage ./../../programs/nu.nix {inherit inputs flakeConfig;};
    };
  };
}
