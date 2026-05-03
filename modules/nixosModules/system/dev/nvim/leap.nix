{...}: {
  flake.nixosModules.nvim-leap = {pkgs, ...}: {
    vim.extraPlugins."leap.nvim" = {
      package = pkgs.vimPlugins.leap-nvim;
      setup = ''
        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
        vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
      '';
    };
  };
}
