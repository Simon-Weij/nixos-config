{ pkgs, unstable, ... }:
let
  username = flakeConfig.username;
in
{
  users.users."${username}".packages = [
  ];
}
