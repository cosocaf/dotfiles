vim.g.mapleader = " "

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.api.nvim_create_augroup("term", {})
vim.api.nvim_create_autocmd("TermOpen", {
  group = "term",
  command = "startinsert",
})

