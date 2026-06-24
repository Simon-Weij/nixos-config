{pkgs, ...}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };
    kernelPackages = pkgs.linuxPackages_6_12;
  };
}
