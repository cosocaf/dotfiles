-- Appearance
vim.opt.termguicolors  = true
vim.opt.title          = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wrap           = false
vim.opt.showmatch      = true
vim.opt.matchtime      = 1
vim.opt.list           = true
vim.opt.listchars      = { space = "·", tab = "»-", trail = "-", extends = "»", precedes = "«", nbsp = "%", eol = "↲" }
vim.opt.laststatus     = 3

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.wrapscan   = true
vim.opt.hlsearch   = true
vim.opt.inccommand = "split"

-- Indent
vim.opt.smartindent = true
vim.opt.expandtab   = true
vim.opt.tabstop     = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth  = 2

-- Complement
vim.opt.wildmode  = { list = "longest" }
vim.opt.infercase = true
vim.opt.wildmenu  = true

-- Method
vim.opt.swapfile    = false
vim.opt.undofile    = false
vim.opt.backup      = false
vim.opt.writebackup = false
vim.opt.viminfo     = ""

-- Clipboard
vim.opt.clipboard:append { "unnamed" }

-- Terminal
if vim.fn.has("win64") then
  -- vim.opt.shell = "pwsh"
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, { mark[1], mark[2] })
    end
  end,
})

