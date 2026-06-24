{
  wrapper-modules,
  pkgs,
  ...
}: wrapper-modules.wrappers.noctalia-shell.wrap {
  inherit pkgs;
  package = pkgs.noctalia-shell;
  settings =
    (builtins.fromJSON
      (builtins.readFile ./noctalia.json)).settings;
}
