{pkgs, ...}: {
  vim = {
    utility = {
      oil-nvim = {
        enable = true;
        setupOpts = {};
      };
    };
    extraPlugins."leap.nvim" = {
      package = pkgs.vimPlugins.leap-nvim;
      setup = ''
        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
        vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
      '';
    };
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
}
