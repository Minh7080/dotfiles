return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp'
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config('tinymist', {
        capabilities = capabilities,
        settings = {
          exportPdf = "onType"
        }
      })
      vim.lsp.enable('tinymist')

      --[[ require('lspconfig').tinymist.setup ({
        capabilities = capabilities,
        settings = {
          exportPdf = "onType"
        }
      }) ]]

      --[[ vim.keymap.set('n', '<Leader>j', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<Leader>k', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, {})
      vim.keymap.set({'n', 'v'}, '<Leader>ca', vim.lsp.buf.code_action, {}) ]]

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set({'n', 'v'}, 'ga', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'gD', vim.diagnostic.open_float)

      local telescope = require('telescope.builtin')
      vim.keymap.set('n', 'grr', function()
        telescope.lsp_references({
          -- Optional: show preview window on the right
          previewer = true,
        })
      end, { noremap = true, silent = true })

      vim.diagnostic.config({
        virtual_text = { prefix = "■", spacing = 4},
        -- virtual_lines = { spacing = 4 },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })
    end
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.google_java_format,
        },
      })

      vim.keymap.set("n", "<Leader>F", vim.lsp.buf.format, {})
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup()
    end,
  },
}
