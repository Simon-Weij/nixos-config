{...}: {
  flake.nixosModules.nvim-autocomplete = { ... }: {
    vim.autocomplete = {
      nvim-cmp.enable = false;
      blink-cmp = {
        enable = true;
        mappings = {
          confirm = "<Tab>";
          next = "<C-n>";
          previous = "<C-p>";
        };
      };
    };
  };
}
