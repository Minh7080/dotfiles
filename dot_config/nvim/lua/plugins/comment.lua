return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        ---Line-comment toggle keymap
        line = '<c-/>',
        ---Block-comment toggle keymap
        block = '<c-\\>',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<c-/>',
        ---Block-comment keymap
        block = '<c-\\>',
      },
      ---LHS of extra mappings
      --[[ extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      }, ]]
    }
  }
}
