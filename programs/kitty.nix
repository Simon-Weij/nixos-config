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
      inherit_current_tab_environment = "yes";
      confirm_os_window_close = "0";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      tab_title_template = "{index}: {title}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      active_tab_foreground = "#2e3440";
      active_tab_background = "#88c0d0";
      inactive_tab_foreground = "#4c566a";
      inactive_tab_background = "#3b4252";
      active_border_color = "#3b4252";
      inactive_border_color = "#2e3440";
      enabled_layouts = "splits";
    };

    keybindings = {
      "ctrl+shift+t" = "launch --cwd=current --type=tab";
      "ctrl+shift+enter" = "launch --cwd=current --location=vsplit";

      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+l" = "neighboring_window right";

      "f12" = "next_tab";
      "shift+f12" = "previous_tab";
    };
  };
in {
  environment.systemPackages = [
    kittyWrapped
  ];
}
