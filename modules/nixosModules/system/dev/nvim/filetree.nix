{...}: {
  flake.nixosModules.nvim-filetree = {lib, ...}: {
    vim.filetree.neo-tree = {
      enable = true;
      setupOpts = {
        close_if_last_window = true;
        filesystem.filtered_items = {
          hide_dotfiles = false;
          hide_by_name = [".git"];
        };
        event_handlers = [
          {
            event = "file_opened";
            handler = lib.generators.mkLuaInline ''
              function(file_path)
                require("neo-tree.command").execute({ action = "close" })
              end
            '';
          }
          {
            event = "neo_tree_buffer_enter";
            handler = lib.generators.mkLuaInline ''
              function(arg)
                vim.cmd("setlocal number relativenumber")
              end
            '';
          }
        ];
      };
    };
  };
}
