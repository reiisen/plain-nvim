local M = {}

function M.setup()
    local opt = vim.opt

    -- leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- UI
    opt.number = true
    opt.relativenumber = true
    opt.signcolumn = "yes"
    opt.cursorline = true
    opt.termguicolors = true
    opt.pumheight = 4

    -- Editing
    opt.expandtab = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.smartindent = true
    opt.breakindent = true

    -- Search opt.ignorecase = true
    opt.smartcase = true
    opt.incsearch = true

    -- Splits
    opt.splitright = true
    opt.splitbelow = true

    -- Undo
    opt.undofile = true

    -- Interaction
    opt.mouse = "a"
    opt.clipboard = "unnamedplus"
    opt.scrolloff = 8
    opt.sidescrolloff = 8

    -- Completion menu
    opt.completeopt = { "menu", "menuone", "noselect", "popup" }

    -- misc
    opt.guicursor = ""
    vim.cmd("filetype plugin indent on")
    vim.cmd[[colorscheme lunaperche]]
end

return M
