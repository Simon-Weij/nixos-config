{...}: {
  flake.nixosModules.hjem = {pkgs, ...}: {
    hjem.clobberByDefault = true;
  };
}
