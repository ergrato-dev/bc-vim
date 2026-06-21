-- ============================================================
-- Ejemplo: init.lua limpio (punto de entrada)
-- ============================================================

-- Bootstrap de lazy.nvim
require("config.lazy")

-- Core modules
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Setup de plugins
require("lazy").setup("plugins", {
  -- Opciones de lazy.nvim (opcional)
  install = { colorscheme = { "onedark" } },
  checker = { enabled = false },
  change_detection = { notify = false },
})

-- Comandos de usuario (ejemplos)
vim.api.nvim_create_user_command("Reload", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Configuración recargada")
end, { desc = "Recargar configuración" })

vim.api.nvim_create_user_command("Info", function()
  local util = require("util")
  vim.notify(util.info())
end, { desc = "Información del editor" })
