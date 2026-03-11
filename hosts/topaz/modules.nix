{
  flakeConfig,
  inputs,
  ...
}: {
  imports = [
    ../../modules/system/essentials.nix
    ../../system/timezone-netherlands.nix
    ../../modules/user/docker.nix
    ../../system/ssh.nix
  ];
}
