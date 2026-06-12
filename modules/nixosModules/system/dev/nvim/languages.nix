{
  pkgs,
  lib,
  ...
}: {
  vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      go.enable = true;
      nix = {
        enable = true;
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };
      svelte = {
        enable = true;
        extraDiagnostics.enable = false;
        format = {
          enable = true;
          type = ["prettier"];
        };
        lsp.enable = true;
        treesitter.enable = true;
      };
      html.enable = true;
      typescript.enable = true;
      css.enable = true;
      tailwind.enable = true;
      php.enable = true;
    };

    formatter = {
      conform-nvim = {
        enable = true;
        setupOpts = {
          format_on_save = {
            lsp_format = "fallback";
          };
          formatters = {
            prettier = {
              command = lib.mkForce "node_modules/.bin/prettier";
              indent_width = 4;
            };
            alejandra = {
              indent_width = 2;
            };
          };
        };
      };
    };

    extraPlugins = {
      nvim-eslint = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-eslint";
          src = pkgs.fetchFromGitHub {
            owner = "esmuellert";
            repo = "nvim-eslint";
            rev = "main";
            hash = "sha256-e6uUyMKlY8o+xqcvISpT+TRX6MqOtCK4ShMs4qY1XFY=";
          };
        };
        setup = "require('nvim-eslint').setup({})";
      };
    };

    autocmds = [
      {
        event = ["FileType"];
        pattern = [
          "nix"
          "html"
          "css"
          "scss"
          "sass"
          "less"
          "svelte"
        ];
        command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];

    treesitter = {
      enable = true;
      indent.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        dockerfile
      ];
    };
  };
}
