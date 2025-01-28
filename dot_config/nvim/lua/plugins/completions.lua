return{
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
       "L3MON4D3/LuaSnip",
       dependencies = {
           "saadparwaiz1/cmp_luasnip",
           "rafamadriz/friendly-snippets"
       },
       config = function()
           local ls = require("luasnip")

           vim.keymap.set({"i"}, "<C-o>", function() ls.expand() end, {silent = true})
           vim.keymap.set({"i", "s"}, "<C-o>", function() ls.jump( 1) end, {silent = true})
           vim.keymap.set({"i", "s"}, "<C-i>", function() ls.jump(-1) end, {silent = true})

           vim.keymap.set({"i", "s"}, "<C-f>", function()
               if ls.choice_active() then
                   ls.change_choice(1)
               end
           end, {silent = true})
       end,
   },
   {
       "hrsh7th/nvim-cmp",
       config = function()
           -- Set up nvim-cmp.
           local cmp = require'cmp'
           require("luasnip.loaders.from_vscode").lazy_load()

           cmp.setup({
               snippet = {
                   -- REQUIRED - you must specify a snippet engine
                   expand = function(args)
                       require('luasnip').lsp_expand(args.body)
                   end,
               },
               window = {
                   completion = cmp.config.window.bordered(),
                   documentation = cmp.config.window.bordered(),
               },
               mapping = cmp.mapping.preset.insert({
                   --['<Tab>'] = cmp.mapping.scroll_docs(-4),
                   --['<C-f>'] = cmp.mapping.scroll_docs(4),
                   ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
                   ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                   ['<C-Space>'] = cmp.mapping.complete(),
                   ['<C-e>'] = cmp.mapping.abort(),
                   ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
               }),
               sources = cmp.config.sources({
                   { name = 'nvim_lsp' },
                   { name = 'luasnip' },
               }, {
                   { name = 'buffer' },
               })
           })
       end,
   },
}
