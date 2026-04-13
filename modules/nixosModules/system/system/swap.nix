{inputs, ...}: {
  flake.nixosModules.swap = {pkgs, ...}: {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024;
      }
    ];
  };
}
