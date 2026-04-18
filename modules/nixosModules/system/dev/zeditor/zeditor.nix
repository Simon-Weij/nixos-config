{inputs, ...}: {
  flake.nixosModules.zeditor = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users.${flakeConfig.username}.packages = with pkgs; [
      zed-editor
    ];

    hjem.users.${flakeConfig.username} = {
      user = flakeConfig.username;
      directory = "/home/${flakeConfig.username}";
      files = {
        ".config/zed/settings.json" = {
          source = ./settings.json;
          type = "copy";
          permissions = "0644";
        };
        ".local/share/zed/extensions/index.json" = {
          source = ./extensions.json;
          type = "copy";
          permissions = "0644";
        };
        ".config/zed/keymap.json" = {
          source = ./keymap.json;
          type = "copy";
          permissions = "0644";
        };
      };
    };
  };
}
