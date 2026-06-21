-- ============================================================
-- Ejemplo: lua/core/keymaps.lua
-- Todos los keymaps con descripciones
-- ============================================================

local map = vim.keymap.set

-- Archivo
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir" })
map("n", "<leader>x", "<cmd>x<CR>", { desc = "Guardar y salir" })

-- Insert mode
map("i", "jj", "<Esc>", { desc = "Salir de Insert" })

-- Navegación entre splits
map("n", "<C-h>", "<C-w>h", { desc = "Split izquierdo" })
map("n", "<C-j>", "<C-w>j", { desc = "Split inferior" })
map("n", "<C-k>", "<C-w>k", { desc = "Split superior" })
map("n", "<C-l>", "<C-w>l", { desc = "Split derecho" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Buffer siguiente" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Eliminar buffer" })

-- Redimensión
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Más alto" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Más bajo" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Más ancho" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Más estrecho" })
map("n", "<leader>=", "<C-w>=", { desc = "Igualar ventanas" })

-- Búsqueda
map("n", "<leader>h", "<cmd>noh<CR>", { desc = "Limpiar búsqueda" })
