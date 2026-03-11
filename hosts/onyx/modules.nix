{flakeConfig, ...}: {
  imports = [
    ../../modules/user/chromium.nix
    ../../modules/user/niri.nix
    ../../modules/user/development.nix
    ../../modules/user/essentials.nix
    ../../modules/user/messaging.nix
    ../../modules/user/gaming.nix
    ../../modules/user/music.nix
    ../../modules/user/nix.nix
    ../../modules/user/bash.nix
    ../../modules/user/user-dirs.nix

    ../../modules/system/desktop-essentials.nix
    ../../system/timezone-netherlands.nix
  ];
}
