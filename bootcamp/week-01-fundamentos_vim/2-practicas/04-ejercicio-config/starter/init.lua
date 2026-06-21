-- ============================================================
-- Bootcamp Vim Zero to Hero — Semana 1
-- Configuración base para Neovim
-- ============================================================

-- Opciones generales
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.undofile = true

-- Tabulación: 4 espacios
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mappings básicos
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir" })
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Guardar y salir" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Limpiar highlight" })

-- Escape de Insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Salir de Insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de Insert mode" })

-- Navegación entre splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir a split izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir a split inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir a split superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir a split derecho" })

-- Mantener selección al indentar
vim.keymap.set("v", "<", "<gv", { desc = "Indentar izquierda" })
vim.keymap.set("v", ">", ">gv", { desc = "Indentar derecha" })
