-- ============================================================
-- Plantilla: init.lua (punto de entrada)
-- ============================================================

-- Bootstrap de lazy.nvim
require("config.lazy")

-- Core
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Cargar plugins
require("lazy").setup("plugins", {
  install = { colorscheme = { "onedark" } },
  checker = { enabled = false },
})
