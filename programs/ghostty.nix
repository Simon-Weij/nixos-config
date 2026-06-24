{
  inputs,
  pkgs,
  ...
}: let
  ghostty-wrapped = inputs.wrapper-modules.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.ghostty;

    flags = {
      "--confirm-close-surface" = "false";
      "--theme" = "Nord";
    };
    flagSeparator = "=";
  };
in {
  environment.systemPackages = [
    ghostty-wrapped
  ];
}
