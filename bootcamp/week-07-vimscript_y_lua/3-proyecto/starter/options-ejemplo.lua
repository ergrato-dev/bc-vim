-- ============================================================
-- Ejemplo: lua/core/options.lua
-- Todas las opciones de Neovim
-- ============================================================

-- Opciones generales
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.wrap = false

-- Tabulación
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Búsqueda
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tiempo
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Undo
vim.opt.undofile = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Variables globales
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
