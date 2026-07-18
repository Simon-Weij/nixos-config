{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.yamp.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
