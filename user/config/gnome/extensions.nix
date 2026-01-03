{ pkgs, ... }:
{
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/shell" = {
          enabled-extensions = [ "middleclickclose@paolo.tranquilli.gmail.com" ];
        };
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.middle-click-to-close-in-overview
  ];
}