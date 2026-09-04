{
  inputs,
  pkgs,
  flakeConfig,
  ...
}: {
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  hjem = {
    clobberByDefault = true;
    users."${flakeConfig.username}" = {
      user = "${flakeConfig.username}";
      directory = "/home/${flakeConfig.username}";
      files = {
        ".local/state/noctalia/settings.toml" = {
          source = ./settings.toml;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
  environment.etc."wallpaper.png" = {
    source = ./stones.jpg;
  };
}
