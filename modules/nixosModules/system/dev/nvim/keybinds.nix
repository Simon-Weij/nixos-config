{...}: {
  vim.keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Oil<CR>";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd>write<CR>";
    }
    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
    }
    {
      mode = "n";
      key = "<leader>f";
      action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
    }
    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>Telescope find_files<CR>";
    }
  ];
}
