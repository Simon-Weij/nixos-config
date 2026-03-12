{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users."${flakeConfig.username}".packages = with pkgs; [
    vlc
    teams-for-linux
    nautilus
    ghostty
    lf
  ];
}
