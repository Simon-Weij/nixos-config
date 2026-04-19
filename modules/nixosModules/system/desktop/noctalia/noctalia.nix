{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    packages.noctaliaWrapped = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      package = unstablePkgs.noctalia-shell;
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json)).settings;
    };
  };
}
