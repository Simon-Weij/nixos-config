{ pkgs, inputs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    hide-minimized
    middle-click-to-close-in-overview
  ];
  
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "middleclickclose@paolo.tranquilli.gmail.com"
        ];
      };
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      /*
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
        name = "terminal";
        command = "gnome-terminal";
        binding = "ctrl+alt+t";
      };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = ['<Shift>Escape'];
      };
      */
    };
  };


}