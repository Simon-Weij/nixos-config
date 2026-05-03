{...}: {
  flake.nixosModules.nvim-treesitter = {pkgs, ...}: {
    vim.treesitter = {
      enable = true;
      indent.enable = false;
      grammars = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        dockerfile
      ];
      context.enable = true;
    };
  };
}
