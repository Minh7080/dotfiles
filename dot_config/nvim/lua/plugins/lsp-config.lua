return{
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
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.jdtls.setup({capabilities = capabilities})
            lspconfig.pylsp.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})
            lspconfig.marksman.setup({capabilities = capabilities})
            lspconfig.ts_ls.setup({capabilities = capabilities})
            lspconfig.emmet_language_server.setup({capabilities = capabilities})
            lspconfig.cssls.setup({capabilities = capabilities})
            lspconfig.html.setup({capabilities = capabilities})

            vim.keymap.set('n', '<Leader>j', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<Leader>k', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set({'n', 'v'}, '<Leader>ca', vim.lsp.buf.code_action, {})
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
