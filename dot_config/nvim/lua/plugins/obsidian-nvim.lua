return {
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
            --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            --   -- refer to `:h file-pattern` for more examples
            --   "BufReadPre path/to/my-vault/*.md",
            --   "BufNewFile path/to/my-vault/*.md",
            -- },
            dependencies = {
                -- Required.
                "nvim-lua/plenary.nvim",
                "hrsh7th/nvim-cmp",
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim",

                -- see below for full list of optional dependencies 👇
            },
            opts = {
                workspaces = {
                    {
                        name = "UTS",
                        path = "~/Vaults/UTS",
                    },
                },
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                },
                ui = {
                    enable = false,
                },
                attachments = {
                    -- The default folder to place images in via `:ObsidianPasteImg`.
                    -- If this is a relative path it will be interpreted as relative to the vault root.
                    -- You can always override this per image by passing a full path to the command instead of just a filename.
                    img_folder = "assets/imgs", -- This is the default

                    -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
                    ---@return string
                    img_name_func = function()
                        -- Prefix image names with timestamp.
                        return string.format("%s-", os.time())
                    end,

                    -- A function that determines the text to insert in the note when pasting an image.
                    -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
                    -- This is the default implementation.
                    ---@param client obsidian.Client
                    ---@param path obsidian.Path the absolute path to the image file
                    ---@return string
                    img_text_func = function(client, path)
                        path = client:vault_relative_path(path) or path
                        return string.format("![%s](%s)", path.name, path)
                    end,
                },
            },
        },
        {
            "gaoDean/autolist.nvim",
            ft = {
                "markdown",
                "text",
                "tex",
                "plaintex",
                "norg",
            },
            config = function()
                require("autolist").setup()

                vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
                vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
                -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
                vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
                vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
                vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
                vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
                vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

                -- cycle list types with dot-repeat
                vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
                vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

                -- if you don't want dot-repeat
                -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
                -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

                -- functions to recalculate list on edit
                vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
                vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
                vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
                vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
            end,
        }
    }
