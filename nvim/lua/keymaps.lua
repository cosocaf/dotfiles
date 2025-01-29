vim.g.mapleader = " "

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-h>", ":bprev<CR>")
vim.keymap.set("n", "<C-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-x>", ":bw<CR>")

vim.api.nvim_create_augroup("term", {})
vim.api.nvim_create_autocmd("TermOpen", {
  group = "term",
  command = "startinsert",
})

