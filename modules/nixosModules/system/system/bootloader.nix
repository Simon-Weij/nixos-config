{inputs, ...}: {
  flake.nixosModules.bootloader = {
    pkgs,
    lib,
    ...
  }: {
    boot = {
      bootspec.enable = true;
      lanzaboote = {
        enable = true;
        autoGenerateKeys.enable = true;
        autoEnrollKeys = {
          enable = true;
          autoReboot = true;
        };
        pkiBundle = "/etc/secureboot";
      };
      loader.systemd-boot.enable = lib.mkForce false;
      loader.grub.enable = lib.mkForce false;
    };
    environment.systemPackages = [
      pkgs.sbctl
    ];

    boot.kernelPackages = pkgs.linuxPackages_6_12;
  };
}
