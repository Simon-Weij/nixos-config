{...}: {
  flake.nixosModules.nvim-keybinds = { ... }: {
    vim.keymaps = [
      {
        mode = "i";
        key = "<CR>";
        action = "<CR>";
      }
      {
        mode = "n";
        key = "<F13>";
        action = "<cmd>Neotree toggle<CR>";
        desc = "Toggle file tree";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>l";
        action = "<cmd>wincmd p<CR>";
        desc = "Go back to editor";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>h";
        action = "<cmd>Neotree focus<CR>";
        desc = "Focus file tree";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>1ToggleTerm direction=horizontal<CR>";
        desc = "Toggle terminal";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
        desc = "Move left in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
        desc = "Move right in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
        desc = "Move down in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
        desc = "Move up in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-e>";
        action = "<C-o>e";
        desc = "Move to end of word in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-w>";
        action = "<C-o>w";
        desc = "Move forward a word in insert mode";
        silent = true;
      }
      {
        mode = "i";
        key = "<C-b>";
        action = "<C-o>b";
        desc = "Move back a word in insert mode";
        silent = true;
      }
      {
        mode = "n";
        key = "<A-h>";
        action = "<cmd>vertical resize -2<CR>";
        desc = "Decrease window width";
        silent = true;
      }
      {
        mode = "n";
        key = "<A-l>";
        action = "<cmd>vertical resize +2<CR>";
        desc = "Increase window width";
        silent = true;
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>resize +2<CR>";
        desc = "Increase window height";
        silent = true;
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>resize -2<CR>";
        desc = "Decrease window height";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>w";
        action = "za";
        desc = "Toggle fold";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>W";
        action = "zo";
        desc = "Unfold/expand block";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>o";
        action = "lua require('ufo').openAllFolds()";
        desc = "Open all folds";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>p";
        action = "lua require('ufo').closeAllFolds()";
        desc = "Close all folds";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        desc = "Search in current file";
        silent = true;
      }
      {
        mode = "n";
        key = "<leader>s";
        action = "<cmd>write<CR>";
        desc = "Save file";
        silent = true;
      }
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        silent = true;
      }
    ];
  };
}
