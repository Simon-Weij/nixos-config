{
  inputs,
  pkgs,
  ...
}: let
in {
  environment.systemPackages = [
    (inputs.wrapper-modules.wrappers.foot.wrap {
      inherit pkgs;
      settings = {
        initial-color-theme = "dark";
      };
    })
  ];
}
