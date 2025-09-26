{ pkgs, inputs, ... }:
{
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        "blur-my-shell@aunetx"
        "hide-minimized@danigm.net"
        "middleclickclose@paolo.tranquilli.gmail.com"
      ]; 
    };
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}