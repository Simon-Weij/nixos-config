{...}: {
  flake.nixosModules.wallpaper = {flakeConfig, ...}: {
    hjem.users.${flakeConfig.username} = {
      user = flakeConfig.username;
      directory = "/home/${flakeConfig.username}";
      files = {
        ".cache/noctalia/wallpapers.json" = {
          text = builtins.toJSON {
            defaultWallpaper = ./astronaut.png;
          };
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
