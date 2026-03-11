{
  flakeConfig,
  inputs,
  pkgs,
  ...
}: let
  username = flakeConfig.username;
in {
  hjem = {
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
  };
}
