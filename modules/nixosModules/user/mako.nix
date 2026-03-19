{inputs, ...}: {
  flake.nixosModules.mako = {
    pkgs,
    self,
    ...
  }: let
    makoWrapped =
      (inputs.wrappers.wrapperModules.mako.apply {
        inherit pkgs;
        settings = {
          font = "JetBrainsMono Nerd Font 10";
          width = 400;
          height = 100;
          margin = 10;
          padding = 15;
          border-size = 2;
          border-radius = 8;
          icons = 1;
          max-icon-size = 32;
          default-timeout = 5000;
          ignore-timeout = 1;
          background-color = "#1e1e2e";
          text-color = "#cdd6f4";
          border-color = "#89b4fa";

          "urgency=low" = {
            background-color = "#181825";
            border-color = "#6c7086";
          };
          "urgency=normal" = {
            background-color = "#1e1e2e";
            border-color = "#89b4fa";
          };
          "urgency=critical" = {
            background-color = "#1e1e2e";
            border-color = "#f38ba8";
            text-color = "#f38ba8";
          };
        };
      }).wrapper;
  in {
    environment.systemPackages = [makoWrapped];
  };
}
