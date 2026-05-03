{...}: {
  flake.nixosModules.nvim-terminal = { ... }: {
    vim.terminal.toggleterm = {
      enable = true;
      setupOpts = {
        direction = "horizontal";
        size = 15;
      };
    };
  };
}
