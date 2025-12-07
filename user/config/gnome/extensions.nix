{ pkgs, ... }:
{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/shell" = {
          enabled-extensions = [ "blur-my-shell@aunetx" "middleclickclose@paolo.tranquilli.gmail.com" ];
        };

        "org/gnome/shell/extensions/blur-my-shell/panel" = {
          blur = false;
        };
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.middle-click-to-close-in-overview
  ];
}