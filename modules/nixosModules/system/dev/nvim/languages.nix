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

      php.enable = true;

      json.enable = true;

      svelte.enable = true;
      css.enable = true;
      html.enable = true;
      typescript.enable = true;
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
    treesitter = {
      enable = true;
      indent.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        dockerfile
      ];
    };
    autocmds = [
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
      }
      {
        event = ["FileType"];
        pattern = ["html" "svelte"];
        command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 indentexpr=";
      }
    ];
  };
}
