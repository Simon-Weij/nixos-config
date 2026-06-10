{
  pkgs,
  lib,
  ...
}: let
  oil-git-nvim-async = pkgs.vimUtils.buildVimPlugin rec {
    pname = "oil-git-async.nvim";
    version = "1.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "malewicz1337";
      repo = "oil-git.nvim";
      rev = "v${version}";
      hash = "sha256-OsQLV+6+sI2YaSSSVz7TRNHaqUCGfRCyfCTZQyaRCAE=";
    };
  };
in {
  vim = {
    utility = {
      oil-nvim = {
        enable = true;
        setupOpts = {
          view_options = {
            is_hidden_file = lib.generators.mkLuaInline ''
              function(name, bufnr)
                return name == ".git"
              end
            '';
          };
        };
      };
    };
    visuals.nvim-web-devicons.enable = true;
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
      "oil-git.nvim" = {
        package = oil-git-nvim-async;
        setup = ''
          require("oil-git").setup({
            show_ignored_files = true,
            show_ignored_directories = true,
            show_directory_highlights = true,
          })
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
