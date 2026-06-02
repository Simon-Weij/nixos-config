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
      html.enable = true;
      svelte.enable = true;
      typescript.enable = true;
      css.enable = true;
      tailwind.enable = true;

      php.enable = true;
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
  };
}
