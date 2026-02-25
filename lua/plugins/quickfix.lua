-- Quickfix list keybindings: open entries in splits/tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local opts = { buffer = true, noremap = true, silent = true }
    vim.keymap.set("n", "<C-t>", "<C-W><CR><C-W>T", opts)
    vim.keymap.set("n", "<C-v>", "<C-W><CR><C-W>L", opts)
    vim.keymap.set("n", "<C-x>", "<C-W><CR>", opts)
  end,
})

return {}
