{pkgs, ...}: {
  vim = {
    lsp.servers.omnisharp.enable = true;
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
      csharp = {
        enable = true;
      };
    };
    treesitter = {
      enable = true;
      indent.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        dockerfile
        c_sharp
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
