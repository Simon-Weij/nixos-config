{...}: {
  flake.nixosModules.user = {
    pkgs,
    flakeConfig,
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
        shell = pkgs.zsh;
      };
    };
  };
}
