{...}: {
  flake.nixosModules.nvim-theme = { ... }: {
    vim.theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };
  };
}
