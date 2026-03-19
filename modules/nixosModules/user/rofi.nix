{inputs, ...}: {
  flake.nixosModules.rofi = {
    pkgs,
    inputs,
    ...
  }: let
    lit = value: {
      _type = "literal";
      inherit value;
    };
    rofiWrapped =
      (inputs.wrappers.wrapperModules.rofi.apply {
        inherit pkgs;
        settings = {
          modi = "drun";
          show-icons = true;
          display-drun = "";
          drun-display-format = "{name}";
        };
        theme = {
          "*" = {
            font = "JetBrainsMono Nerd Font 12";
            background-color = lit "transparent";
            text-color = lit "#cdd6f4";
            foreground = lit "#cdd6f4";
          };
          window = {
            transparency = "real";
            background-color = lit "#1e1e2eee";
            border = 1;
            border-color = lit "#0262ac";
            border-radius = 12;
            width = 600;
            padding = 20;
          };
          mainbox = {
            spacing = 15;
            children = ["inputbar" "listview"];
          };
          inputbar = {
            spacing = 10;
            padding = 8;
            background-color = lit "#313244";
            border-radius = 8;
            children = ["prompt" "entry"];
          };
          prompt = {
            text-color = lit "#89b4fa";
          };
          entry = {
            placeholder = "Search apps...";
            placeholder-color = lit "#6c7086";
            text-color = lit "#cdd6f4";
          };
          listview = {
            lines = 3;
            columns = 1;
            spacing = 8;
            scrollbar = false;
          };
          element = {
            padding = 12;
            border-radius = 8;
            spacing = 12;
            orientation = "horizontal";
            background-color = lit "#313244";
            text-color = lit "#cdd6f4";
          };
          "element normal.normal, element normal.active, element alternate.normal, element alternate.active" = {
            background-color = lit "#313244";
            text-color = lit "#cdd6f4";
          };
          "element selected.normal, element selected.active" = {
            background-color = lit "#0262ac";
            text-color = lit "#ffffff";
            border = 1;
            border-color = lit "#89b4fa";
          };
          element-icon = {
            size = 32;
            background-color = lit "transparent";
          };
          element-text = {
            vertical-align = lit "0.5";
            background-color = lit "transparent";
            text-color = lit "inherit";
          };
        };
      }).wrapper;
  in {
    environment.systemPackages = [rofiWrapped];
  };
}
