{...}: {
  flake.nixosModules.nvim-extras = { ... }: {
    vim = {
      diagnostics = {
        enable = true;
        config = {
          virtual_text = {
            prefix = "●";
            spacing = 2;
            source = "if_many";
          };
        };
      };

      debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };

      ui.nvim-ufo.enable = true;
      utility.motion.leap.enable = true;
      statusline.lualine.enable = true;
      telescope.enable = true;
      autopairs.nvim-autopairs.enable = true;

      git = {
        enable = true;
        neogit.enable = true;
      };

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
        registers = "unnamedplus";
      };
    };
  };
}
