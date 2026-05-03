{...}: {
  flake.nixosModules.nvim-navigation = { ... }: {
    vim.navigation.harpoon = {
      enable = true;
      mappings = {
        listMarks = "<leader>e";
      };
    };
  };
}
