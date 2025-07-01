return
{
    {
        --"hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            --"saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
        config = function()
            local ls = require("luasnip")

            vim.keymap.set({"i"}, "<C-o>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-h>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-f>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})
        end,
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<CR>'] = { 'accept', 'fallback' }
            },

            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = {
                    auto_show = true,
                    window = { border = 'single' }
                },
                menu = {
                    border = 'single',
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 }, { "kind_icon" }
                        }
                    }
                }
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer'},
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }

    -- {
        --     "hrsh7th/nvim-cmp",
        --     config = function()
            --         -- Set up nvim-cmp.
            --         local cmp = require'cmp'
            --         require("luasnip.loaders.from_vscode").lazy_load()

            --         cmp.setup({
                --             snippet = {
                    --                 -- REQUIRED - you must specify a snippet engine
                    --                 expand = function(args)
                        --                     require('luasnip').lsp_expand(args.body)
                        --                 end,
                        --             },
                        --             window = {
                            --                 completion = cmp.config.window.bordered(),
                            --                 documentation = cmp.config.window.bordered(),
                            --             },
                            --             mapping = cmp.mapping.preset.insert({
                                --                 ['<C-J>'] = cmp.mapping(cmp.mapping.select_next_item()),
                                --                 ['<C-K>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                                --                 ['<C-SPACE>'] = cmp.mapping.complete(),
                                --                 ['<C-E>'] = cmp.mapping.abort(),
                                --                 ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                                --             }),
                                --             sources = cmp.config.sources({
                                    --                 { name = 'nvim_lsp' },
                                    --                 { name = 'luasnip' },
                                    --                 { name = 'copilot' },
                                    --             }, {
                                        --                 { name = 'buffer' },
                                        --             })
                                        --         })
                                        --     end,
                                        -- },
                                    }
