{pkgs, ...}: {
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
        pattern = [
          "nix"
        ];
        command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];
  };
}
