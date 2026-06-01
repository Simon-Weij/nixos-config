{pkgs, ...}: {
  vim = {
    utility = {
      oil-nvim = {
        enable = true;
        setupOpts = {
          view_options = {
            show_hidden = true;
          };
        };
      };
    };
    extraPlugins = {
      "leap.nvim" = {
        package = pkgs.vimPlugins.leap-nvim;
        setup = ''
          vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
          vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
          vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
        '';
      };
      "go.nvim" = {
        package = pkgs.vimPlugins.go-nvim;
        setup = ''
          require("go").setup({})
        '';
      };
      "ufo.nvim" = {
        package = pkgs.vimPlugins.nvim-ufo;
        setup = ''
          require("ufo").setup({})
        '';
      };
    };
    opts = {
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
    keymaps = [
      {
        key = "<leader>w";
        mode = ["n"];
        action = "za";
        desc = "Toggle fold";
      }
    ];

    autopairs.nvim-autopairs.enable = true;
    visuals.indent-blankline.enable = true;
    telescope.enable = true;
    autocmds = [
      {
        event = ["FileType"];
        pattern = ["TelescopeResults"];
        command = "setlocal number relativenumber";
      }
    ];
  };
  vim.autocomplete = {
    blink-cmp = {
      enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<C-n>";
        previous = "<C-p>";
      };
      setupOpts.cmdline.completion.menu.auto_show = true;
    };
  };
}
