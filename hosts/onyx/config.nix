{
  config,
  lib,
  pkgs,
  flakeConfig,
  ...
}: {
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/mutter" = {
          experimental-features = ["scale-monitor-framebuffer"];
        };
      };
    }
  ];
}
