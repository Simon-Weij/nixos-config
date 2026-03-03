{...}: {
  config.vim = {
    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };
    lsp.enable = true;
    languages = {
      enableTreesitter = true;
      nix = {
        enable = true;
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };
      ts.enable = true;
      go.enable = true;
      svelte = {
        enable = true;
        lsp.enable = true;
      };
      dart.enable = true;
    };
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    visuals.nvim-web-devicons.enable = true;

    git.gitsigns.enable = true;

    filetree.nvimTree = {
      enable = true;
      setupOpts = {
        filters.dotfiles = true;
        renderer.icons.show.git = false;
      };
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts.format_on_save = {
        lsp_fallback = true;
        timeout_ms = 500;
      };
    };

    globals.mapleader = " ";

    luaConfigRC.nvimtree-git = ''
      require("nvim-tree").setup({
        git = {
          enable = true,
          ignore = false,
        },
        renderer = {
          highlight_git = "name",
          icons = {
            show = {
              git = false,
            },
          },
        },
      })
    '';

    keymaps = [
      {
        key = "<leader>e";
        mode = ["n"];
        action = ":NvimTreeToggle<CR>";
        silent = true;
        desc = "Toggle file tree";
      }
      {
        key = "<C-h>";
        mode = ["n"];
        action = "<C-w>h";
        silent = true;
        desc = "Move to left window";
      }
      {
        key = "<C-j>";
        mode = ["n"];
        action = "<C-w>j";
        silent = true;
        desc = "Move to bottom window";
      }
      {
        key = "<C-k>";
        mode = ["n"];
        action = "<C-w>k";
        silent = true;
        desc = "Move to top window";
      }
      {
        key = "<C-l>";
        mode = ["n"];
        action = "<C-w>l";
        silent = true;
        desc = "Move to right window";
      }
      {
        key = "<leader>s";
        mode = ["n"];
        action = "<cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>";
        silent = true;
        desc = "Format and save";
      }
    ];
  };
}
