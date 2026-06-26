{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    plugins = {
      git = pkgs.yaziPlugins.git;
    };
    initLua = pkgs.writeText "yazi-init.lua" ''
      require("git"):setup {
        order = 1500,
      }
    '';
    settings.yazi = {
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
            group = "git";
          }
          {
            id = "git";
            url = "*/";
            run = "git";
            group = "git";
          }
        ];
      };
    };
    settings.theme = {
      git = {
        modified = {fg = "blue";};
        deleted = {
          fg = "red";
          bold = true;
        };
        added = {fg = "green";};
        untracked = {fg = "yellow";};
        ignored = {fg = "gray";};
        updated = {fg = "cyan";};
        clean = {fg = "green";};
      };
    };
  };
}
