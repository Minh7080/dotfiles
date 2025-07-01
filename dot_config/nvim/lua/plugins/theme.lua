return{
    {
        "catppuccin/nvim", name = "catppuccin",
        dependencies = {"nvim-lualine/lualine.nvim"},
        config = function()
            require("catppuccin").setup {
                 transparent_background = false,
                 term_colors = true,
                 integrations = {
                     cmp = true,
                     harpoon = false,
                     mason = true,
                     treesitter = true,
                 }
            }
            vim.cmd(":Catppuccin mocha")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons'},
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = "catppuccin-mocha",
                    component_separators = { left = '|', right = '|'},
                    section_separators = { left = ' ', right = ' '},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {{'filename', path = 1}},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {{'filename', path = 1}},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
