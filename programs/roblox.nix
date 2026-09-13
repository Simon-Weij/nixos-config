{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.mocktail.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
