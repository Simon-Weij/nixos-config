{...}: {
  imports = [
    ./essentials.nix
    ../../system/wait-online.nix
    ../../system/bluetooth.nix
    ../../system/desktop-hardening.nix
  ];
}
