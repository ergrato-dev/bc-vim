-- ============================================================
-- Ejemplo de mappings para workspace — Semana 4
-- Agrega estas líneas a tu ~/.config/nvim/init.lua
-- ============================================================

-- Navegación entre splits (Ctrl-hjkl sin Ctrl-w)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Split izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Split inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Split superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Split derecho" })

-- Navegación de buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Buffer siguiente" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Eliminar buffer" })

-- Redimensionar ventanas
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Más alto" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Más bajo" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Más ancho" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Más estrecho" })

-- Igualar ventanas
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Igualar ventanas" })

-- Configuración de splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Buffers
vim.opt.hidden = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3   -- estilo árbol
vim.g.netrw_winsize = 25
