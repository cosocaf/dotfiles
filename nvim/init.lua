require("boot")
require("settings")
require("keymaps")
if not vim.g.vscode then
  require("lazy").setup("plugins", {
    defaults = {
      lazy = true,
    },
  })
end
