return
{
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {
        dependencies_bin = { ['tinymist'] = 'tinymist' }
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    }
}
