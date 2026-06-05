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
      ts.enable = true;
    };

    lsp.servers.qmlls.cmd = lib.mkForce ["qmlls" "-E"];
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
        pattern = [
          "nix"
        ];
        command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];
  };
}
