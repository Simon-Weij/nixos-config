{pkgs, ...}: {
  config.vim = {
    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };

    terminal.toggleterm = {
      enable = true;
      setupOpts = {
        direction = "horizontal";
        size = 15;
      };
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    extraPlugins = {
      markdown-preview = {
        package = pkgs.vimPlugins.markdown-preview-nvim;
      };
      tiny-inline-diagnostic = {
        package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
      };
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
      rust.enable = true;
      markdown = {
        enable = true;
        extensions.markview-nvim.enable = true;
      };
      go.enable = true;
      ts.enable = true;
      html.enable = true;
      yaml.enable = true;
      qml.enable = true;
      css.enable = true;
      svelte = {
        enable = true;
        lsp.enable = true;
        format = {
          enable = true;
          type = ["prettier"];
        };
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

      html-indent = ''
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "html",
          callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.expandtab = true
          end,
        })
      '';

      terminal-esc = ''
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Exit terminal mode" })
      '';

      tiny-inline-diagnostic = ''
        vim.diagnostic.config({ virtual_text = false })
        require("tiny-inline-diagnostic").setup({
          options = {
            multilines = {
              enabled = true,
              always_show = true,
            },
          },
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
        action = "<cmd>w<CR>";
        silent = true;
        desc = "Save";
      }
      {
        key = "<leader>mp";
        mode = ["n"];
        action = ":MarkdownPreview<CR>";
        silent = true;
        desc = "Markdown preview in browser";
      }
      {
        key = "<leader>t";
        mode = ["n"];
        action = ":ToggleTerm<CR>";
        silent = true;
        desc = "Toggle terminal";
      }
    ];
  };
}
