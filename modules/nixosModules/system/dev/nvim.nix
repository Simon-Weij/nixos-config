{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.nvimWrapped =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          {
            vim = {
              theme = {
                enable = true;
                name = "nord";
                style = "dark";
              };

              languages = {
                enableFormat = true;
                enableTreesitter = true;
                enableExtraDiagnostics = true;

                bash.enable = true;
                css.enable = true;
                dart.enable = true;
                qml = {
                  enable = true;
                  format.enable = true;
                  treesitter.enable = true;
                  lsp.enable = true;
                };
                go.enable = true;
                html.enable = true;
                json.enable = true;
                just.enable = true;
                markdown.enable = true;
                nix = {
                  enable = true;
                  format = {
                    enable = true;
                    type = ["alejandra"];
                  };
                };
                php.enable = true;
                python.enable = true;
                rust.enable = true;
                sql.enable = true;
                svelte.enable = true;
                toml.enable = true;
                typescript.enable = true;
                yaml.enable = true;
              };

              treesitter = {
                enable = true;
                indent.enable = true;
                grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
                  dockerfile
                ];
                context.enable = true;
              };

              lsp = {
                enable = true;
                formatOnSave = true;
                lspkind.enable = false;
                lspsaga.enable = true;
                trouble.enable = true;
                otter-nvim.enable = true;
                nvim-docs-view.enable = true;
                presets.harper.enable = true;
                servers.qmlls.cmd = lib.mkForce ["qmlls" "-E"];
              };

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

              debugger = {
                nvim-dap = {
                  enable = true;
                  ui.enable = true;
                };
              };

              visuals = {
                nvim-scrollbar.enable = true;
                nvim-web-devicons.enable = true;
                nvim-cursorline.enable = true;
                cinnamon-nvim.enable = true;
                fidget-nvim.enable = true;
                highlight-undo.enable = true;
                indent-blankline.enable = true;
              };

              ui.nvim-ufo = {
                enable = true;
              };

              autopairs.nvim-autopairs.enable = true;

              autocomplete = {
                nvim-cmp.enable = false;
                blink-cmp = {
                  enable = true;
                  mappings = {
                    confirm = "<Tab>";
                    next = "<C-n>";
                    previous = "<C-p>";
                  };
                };
              };

              git = {
                enable = true;
                neogit.enable = true;
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
                providers.wl-copy.enable = true;
                registers = "unnamedplus";
              };

              options = {
                autoindent = true;
                smartindent = true;
                expandtab = true;
                number = true;
                relativenumber = true;
                cursorline = true;
                tabstop = 2;
                shiftwidth = 2;
                softtabstop = 2;

                foldcolumn = "1";
                foldlevel = 0;
                foldlevelstart = 0;
                foldenable = true;
                foldminlines = 0;
              };

              autocmds = [
                {
                  event = ["FileType"];
                  pattern = ["go" "make"];
                  command = "setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4";
                }
                {
                  event = ["FileType"];
                  pattern = ["python" "rust" "php" "sql" "qml"];
                  command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4";
                }
                {
                  event = ["FileType"];
                  pattern = ["nix" "json" "yaml" "toml" "typescript" "javascript" "typescriptreact" "javascriptreact" "css" "html" "svelte" "dart" "markdown" "bash" "sh" "zsh"];
                  command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
                }
                {
                  event = ["FileType" "BufWinEnter"];
                  pattern = ["neo-tree"];
                  command = "setlocal nofoldenable foldlevel=99 foldcolumn=0 | silent! UfoDetach";
                }
              ];

              globals = {
                mapleader = " ";
              };

              keymaps = [
                {
                  mode = "n";
                  key = "<leader><F13>";
                  action = "<cmd>Neotree toggle<CR>";
                  desc = "Toggle file tree";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>l";
                  action = "<cmd>wincmd p<CR>";
                  desc = "Go back to editor";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>h";
                  action = "<cmd>Neotree focus<CR>";
                  desc = "Focus file tree";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>t";
                  action = "<cmd>1ToggleTerm direction=horizontal<CR>";
                  desc = "Toggle terminal";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-h>";
                  action = "<Left>";
                  desc = "Move left in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-l>";
                  action = "<Right>";
                  desc = "Move right in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-j>";
                  action = "<Down>";
                  desc = "Move down in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-k>";
                  action = "<Up>";
                  desc = "Move up in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-e>";
                  action = "<C-o>e";
                  desc = "Move to end of word in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-w>";
                  action = "<C-o>w";
                  desc = "Move forward a word in insert mode";
                  silent = true;
                }
                {
                  mode = "i";
                  key = "<C-b>";
                  action = "<C-o>b";
                  desc = "Move back a word in insert mode";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<A-h>";
                  action = "<cmd>vertical resize -2<CR>";
                  desc = "Decrease window width";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<A-l>";
                  action = "<cmd>vertical resize +2<CR>";
                  desc = "Increase window width";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<A-k>";
                  action = "<cmd>resize +2<CR>";
                  desc = "Increase window height";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<A-j>";
                  action = "<cmd>resize -2<CR>";
                  desc = "Decrease window height";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>w";
                  action = "za";
                  desc = "Toggle fold";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>W";
                  action = "zo";
                  desc = "Unfold/expand block";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>o";
                  action = "lua require('ufo').openAllFolds()";
                  desc = "Open all folds";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>p";
                  action = "lua require('ufo').closeAllFolds()";
                  desc = "Close all folds";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>f";
                  action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
                  desc = "Search in current file";
                  silent = true;
                }
                {
                  mode = "n";
                  key = "<leader>s";
                  action = "<cmd>write<CR>";
                  desc = "Save file";
                  silent = true;
                }
                {
                  mode = "t";
                  key = "<Esc>";
                  action = "<C-\\><C-n>";
                  silent = true;
                }
              ];

              viAlias = true;
              vimAlias = true;
              navigation.harpoon = {
                enable = true;
                mappings.listMarks = "<leader>e";
              };
              statusline.lualine.enable = true;
              telescope.enable = true;

              filetree.neo-tree.enable = true;
            };
          }
        ];
      }).neovim;
  };

  flake.nixosModules.nvim = {pkgs, ...}: let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.systemPackages = [
      inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.nvimWrapped
      unstable.zellij
    ];
  };
}
