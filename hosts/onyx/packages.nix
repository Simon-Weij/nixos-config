{
  pkgs,
  unstable,
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
in
{
  users.users."${username}".packages = [
    unstable.nix-output-monitor
  ];
}
