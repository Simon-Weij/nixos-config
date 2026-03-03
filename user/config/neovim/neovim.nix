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
      enableFormat = true;
      enableExtraDiagnostics = true;
      nix = {
        enable = true;
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };
      go.enable = true;
      ts.enable = true;
      svelte = {
        enable = true;
        lsp.enable = true;
      };
      dart.enable = true;
    };

    statusline.lualine.enable = true;
    telescope.enable = true;

    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<C-j>";
        previous = "<C-k>";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      indent-blankline.enable = true;
    };

    git.gitsigns.enable = true;

    filetree.nvimTree = {
      enable = true;
      setupOpts = {
        filters.dotfiles = false;
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

    luaConfigRC = {
      nvimtree-git = ''
        require("nvim-tree").setup({
          git = {
            enable = true,
            ignore = false,
          },
          filters = {
            dotfiles = false,
            custom = { "^.git$" },
          },
          renderer = {
            highlight_git = true,
            icons = {
              show = {
                git = false,
              },
            },
          },
        })
      '';

      nix-indent = ''
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "nix",
          callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.expandtab = true
          end,
        })
      '';
    };

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
