{ pkgs, inputs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    hide-minimized
    middle-click-to-close-in-overview
  ];
  
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "hide-minimized@danigm.net"
        "middleclickclose@paolo.tranquilli.gmail.com"
      ]; 
    };
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}