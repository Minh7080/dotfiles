function ColorMyPencils(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", {bg='none'})
    --vim.api.nvim_set_hl(0, "NormalFloat", {bg='none'})
    --vim.api.nvim_set_hl(0, "FloatShadow", {bg='none', fg='none'})
    --vim.api.nvim_set_hl(0, "FloatShadowThrough", {bg='none', fg='none'})
end

ColorMyPencils()
