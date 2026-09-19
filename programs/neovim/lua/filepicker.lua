require('mini.icons').setup()
require('mini.files').setup({
   mappings = {
      close = "<Esc>",
   },
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 45,
  },
})

vim.keymap.set('n', '<leader>o', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, {
  desc = 'Open file explorer',
})
