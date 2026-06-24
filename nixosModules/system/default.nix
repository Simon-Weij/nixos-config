{...}: {
  imports = [
    ./bootloader.nix
    ./nix.nix
    ./timezone.nix
    ./user.nix
    {
      nixpkgs.config.allowUnfree = true;
      systemd.services."NetworkManager-wait-online".enable = false;
      hardware.bluetooth.enable = true;
    }
  ];
}
