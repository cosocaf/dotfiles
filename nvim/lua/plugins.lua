return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "night",
        transparent = true,
      }
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "myusuf3/numbers.vim",
    event = "BufEnter",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "echasnovski/mini.icons",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>f", group = "Find Files (Telescope)" },
        { "<leader>g", group = "Oil" },
        { "<leader>l", group = "LSP" },
      })
    end
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup {
        theme = "hyper",
        hide = {
          statusline = true,
          tabline = true,
          winbar = true,
        },
        config = {
          week_header = {
            enable = true,
          },
          packages = {
            enable = true,
          },
          project = {
            enable = false,
          },
        },
      }

      vim.keymap.set("n", "<leader>go", ":Oil --float<CR>", { desc = "Oil" })
      vim.keymap.set("n", "<leader>gr", ":Oil --float .<CR>", { desc = "Oil ." })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
          globalStatus = true,
          colored = true,
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      termguicolors = true,
    },
    config = function()
      require("bufferline").setup()
    end
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufEnter",
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
    lazy = false,
    config = function()
      require("oil").setup {
        default_file_explorer = true,
        columns = { "icon", "permissions", "size", "mtime" },
        delete_to_trash = true,
      }

      vim.api.nvim_create_augroup("OilRelPathFix", {})
      vim.api.nvim_create_autocmd("BufLeave", {
        group = "OilRelPathFix",
        pattern = "oil:///*",
        callback = function()
          vim.cmd("cd .")
        end,
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    event = "VimEnter",
    keys = {
      { 'gc', mode = { 'n', 'x' } },
      { 'gb', mode = { 'n', 'x' } },
      { 'gcc', mode = 'n' },
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%Y-%m-%d %H:%M:%S",
      virtual_text_column = 1,
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    event = "VeryLazy",
    config = function ()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan"
      }

      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#44110A" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#453A02" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#133a75" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#462206" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#0f5231" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#3d1c70" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4C709A" })
      end)

      require("ibl").setup {
        indent = {
          char = "▏",
          highlight = highlight,
        },
        exclude = {
          filetypes = {
            "dashboard",
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
        { virtual_text = false })
    end
  },
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("nvim-navic").setup {
        lsp = {
          auto_attach = true,
        },
      }
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
    event = "BufEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-l>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"]  = cmp.mapping.confirm { select = true },
        },
        experimental = {
          ghost_text = true,
        },
      }
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers {
        function(server)
          local setup_opts = {
            on_attach = function(_, bufnr)
              local opts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP Hover", unpack(opts) })
              vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP Definition", unpack(opts) })
              vim.keymap.set("n", "<leader>lc", vim.lsp.buf.declaration, { desc = "LSP Declaration", unpack(opts) })
              vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP References", unpack(opts) })
              vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP Implementation", unpack(opts) })
              vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "LSP Signature Help", unpack(opts) })
              vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "LSP Format", unpack(opts) })
              vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Diagnostic Open Float", unpack(opts) })
              vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Diagnostic Goto Prev", unpack(opts) })
              vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Diagnostic Goto Next", unpack(opts) })
            end,
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
          }
          if server == "sumneko_lua" then
            setup_opts["settings"] = {
              Lua = {
                diagnostic = {
                  globals = { "vim" },
                },
              },
            }
          elseif server == "powershell_es" then
            setup_opts["bundle_path"] = vim.fn.stdpath("config") .. "/vendor/PowerShellEditorServices/"
          end
          print("setup")
          print(setup_opts.on_attach)
          require("lspconfig")[server].setup(setup_opts)
        end,
      }

      mason_lspconfig.setup {
        ensure_installed = {
          "lua_ls",
          "intelephense",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
      vim.cmd("TSUpdate")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup {
        enable = true,
        multiwindow = false,
      }
    end
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files by Path" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Files by Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
          },
        }
      }
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "frecency"

      vim.keymap.set("n", "<leader>fr", ":Telescope frecency workspace=CWD<CR>", { desc = "Telescope Frecency" })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    'wakatime/vim-wakatime',
    lazy = false,
  }
}
