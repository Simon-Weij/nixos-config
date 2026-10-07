{
  inputs,
  pkgs,
  ...
}: let
  kittyWrapped = inputs.wrapper-modules.wrappers.kitty.wrap {
    inherit pkgs;
    settings = {
      include = "${inputs.kitty-nord}";
      cursor_shape = "beam";

      confirm_os_window_close = "0";

      active_tab_foreground = "#2e3440";
      active_tab_background = "#88c0d0";
      inactive_tab_foreground = "#4c566a";
      inactive_tab_background = "#3b4252";
      active_border_color = "#3b4252";
      inactive_border_color = "#2e3440";
      enabled_layouts = "splits";
    };
    keybindings = {
      "ctrl+shift+enter" = "no_op";

      "ctrl+shift+h" = "no_op";
      "ctrl+shift+l" = "no_op";

      "ctrl+shift+t" = "no_op";
    };
  };
in {
  environment.systemPackages = [
    kittyWrapped
  ];
}
