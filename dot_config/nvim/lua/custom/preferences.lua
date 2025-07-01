vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true --Wrap text if it overflow

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.clipboard = "unnamedplus" --Allow nvim to paste from clipboard

vim.opt.scrolloff = 5

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

--vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>tt', ':Telescope<cr>')
vim.keymap.set('n', '<Leader>tg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<Leader>tf', ':Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>tc', ':Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<Leader>tb', ':Telescope buffers<cr>')

vim.keymap.set({'n', "v", "i"}, '<A-p>', '<Esc>:b#<cr>', {noremap = true})
vim.keymap.set({'n', "v", "i"}, '<A-m>', '<Esc>:bp<cr>', {noremap = true})
vim.keymap.set({'n', "v", "i"}, '<A-n>', '<Esc>:bn<cr>', {noremap = true})

vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap = true})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap = true})

vim.keymap.set('n', '<Leader>op', ':ObsidianPasteImg<cr>')
vim.keymap.set('n', '<Leader>ot', ':ObsidianTags<cr>')
vim.keymap.set('n', '<Leader>ob', ':ObsidianBacklinks<cr>')

vim.keymap.set('n', '<Leader>\\', ':set hlsearch!<cr>')

vim.opt.spelllang = { 'en_us', 'en_au' }
vim.keymap.set('n', '<Leader>S', ':set spell!<cr>')

vim.keymap.set('n', '<Leader>ut', ':UndotreeToggle<cr><C-w>h<C-w>k')

-- Remap Ctrl + Backspace to delete a word in insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })
-- Remap Ctrl + Delete to delete the next word in insert mode
vim.api.nvim_set_keymap('i', '<C-Delete>', '<C-o>dw', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Refactoring
vim.keymap.set("v", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
vim.keymap.set({ "n", "v" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
vim.keymap.set("v", "<leader>re", function() require('refactoring').refactor('Extract Function') end)

-- vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>p', ':Oil --float<cr>')

vim.keymap.set('n', '<C-y>', '"ay')
vim.keymap.set('n', '<C-p>', '"ap')
vim.keymap.set('n', '<C-P>', '"aP')

vim.keymap.set("n", "<F5>", function()
---@diagnostic disable-next-line: undefined-field
    local current = vim.opt.colorcolumn:get()
    if #current == 0 then
        vim.opt.colorcolumn = "80"
    elseif current[1] == "80" then
        vim.opt.colorcolumn = "120"
    else
        vim.opt.colorcolumn = ""
    end
end, { noremap = true, silent = true })

-- Function to toggle LSP client
local function toggle_intellisense()
    local clients = vim.lsp.get_active_clients()
    local cmp = require("cmp")
    if next(clients) == nil then
        vim.cmd("LspStart")  -- Start LSP if not active
        cmp.setup({enabled = true})
        print("IntelliSense Started")
    else
        vim.cmd("LspStop")   -- Stop LSP if active
        cmp.setup({enabled = false})
        print("IntelliSense Stopped")
    end
end

-- Set key mapping to toggle LSP
vim.keymap.set('n', '<F6>', toggle_intellisense, { noremap = true, silent = true, desc = "Toggle LSP" })


local function tabstop2()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
end

vim.api.nvim_create_autocmd("FileType", {pattern = "html", callback = tabstop2})
vim.api.nvim_create_autocmd("FileType", {pattern = "css",callback = tabstop2})
vim.api.nvim_create_autocmd("FileType", {pattern = "javascript",callback = tabstop2})
vim.api.nvim_create_autocmd("FileType", {pattern = "typescript",callback = tabstop2})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "asm",
    callback = function()
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
    end
})

vim.g.copilot_enabled = false

vim.api.nvim_create_user_command("ToggleCopilot", function()
  if vim.g.copilot_enabled then
    vim.cmd("Copilot disable")
    vim.g.copilot_enabled = false
    print("Copilot disabled")
  else
    vim.cmd("Copilot enable")
    vim.g.copilot_enabled = true
    print("Copilot enabled")
  end
end, {})

vim.api.nvim_set_keymap("n", "<leader>P", ":TypstPreview<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("OpenPdf", function()
    if vim.bo.filetype ~= "typst" then
        print("Not a typst file")
        return
    end

    local typ_filepath = vim.api.nvim_buf_get_name(0)
    local pdf_filepath = string.sub(typ_filepath, 1, -4) .. "pdf"

    if vim.loop.fs_stat(pdf_filepath) == nil then
        vim.fn.system("which typst")
        if vim.v.shell_error ~= 0 then print("Typst not found") return end
        vim.fn.system("typst compile " .. typ_filepath)
    end

    vim.fn.system("nohup xdg-open " .. pdf_filepath .. " & disown")
end, {})
