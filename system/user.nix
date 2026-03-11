{flakeConfig, ...}: {
  users.users."${flakeConfig.username}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPassword = flakeConfig.hashedPassword;
  };
}
