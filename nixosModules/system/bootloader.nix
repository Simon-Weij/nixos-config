{
  pkgs,
  flakeConfig,
  ...
}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };

    kernelPackages =
      if flakeConfig.networking.hostName == "onyx"
      then pkgs.linuxPackages_6_12
      else pkgs.linuxPackages_latest;
  };
}
