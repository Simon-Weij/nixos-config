{
  pkgs,
  inputs,
  lib,
  ...
}: let
  footWrapped = inputs.wrapper-modules.wrappers.foot.wrap {
    inherit pkgs;
    settings = {
      main = {
        initial-color-theme = "dark";
        include = "${pkgs.foot.themes}/share/foot/themes/nord";

        font = "monospace:size=10";
      };
    };
  };
in {
  environment.systemPackages = [
    footWrapped
  ];

  systemd.user.services.foot-server = {
    description = "Foot terminal server";
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig.ExecStart = "${lib.getExe footWrapped} --server";
  };
}
