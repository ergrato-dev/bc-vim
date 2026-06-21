# 📦 Ejercicio 01: Instalar lazy.nvim

## 🎯 Objetivo

Instalar lazy.nvim como gestor de plugins, crear estructura modular y agregar el primer plugin.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Backup de Configuración Existente

```bash
# Si tienes configuración previa, haz backup
cp -r ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d)
```

### Paso 2: Crear Estructura de Directorios

```bash
mkdir -p ~/.config/nvim/lua/{config,plugins}
```

### Paso 3: Crear Bootstrap de lazy.nvim

```bash
nvim ~/.config/nvim/lua/config/lazy.lua
```

Copiar:

```lua
-- ~/.config/nvim/lua/config/lazy.lua
-- Bootstrap de lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
```

### Paso 4: Crear init.lua

```bash
nvim ~/.config/nvim/init.lua
```

```lua
-- ~/.config/nvim/init.lua
-- Punto de entrada de la configuración

-- Cargar bootstrap de lazy.nvim
require("config.lazy")

-- Opciones básicas (de semanas anteriores)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps básicos (de semanas anteriores)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Split izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Split inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Split superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Split derecho" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de Insert mode" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Limpiar búsqueda" })

-- Cargar plugins
require("lazy").setup("plugins")
```

### Paso 5: Primer Plugin — Tema

```bash
nvim ~/.config/nvim/lua/plugins/ui.lua
```

```lua
-- ~/.config/nvim/lua/plugins/ui.lua
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "darker" })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
```

### Paso 6: Instalar

```bash
# Abre Neovim (el bootstrap clona lazy.nvim automáticamente)
nvim

# Dentro de Neovim:
:Lazy sync
```

---

## 🎮 Ejercicios

### Ejercicio A: Verificar Instalación

```text
1. :Lazy           → abre UI de lazy.nvim
2. Deberías ver "onedark.nvim" instalado
3. Navega con j/k
4. q → cierra la UI
```

### Ejercicio B: Agregar Estructura Modular

```bash
touch ~/.config/nvim/lua/plugins/{editing,lsp,git,tools}.lua
```

### Ejercicio C: Segundo Plugin sin Configuración

En `lua/plugins/editing.lua`:

```lua
return {
  -- Comentar código
  { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
}
```

```text
:Lazy sync

Prueba:
gcc → comenta/descomenta línea actual
gc2j → comenta 2 líneas abajo
```

### Ejercicio D: Tercer Plugin con Keys

En `lua/plugins/tools.lua`:

```lua
return {
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" } },
  },
}
```

```text
:Lazy sync
<leader>u → abre el árbol de undo
```

### Ejercicio E: Verificar Estructura

```text
:edit ~/.config/nvim/lua/plugins/ui.lua
:edit ~/.config/nvim/lua/plugins/editing.lua
:edit ~/.config/nvim/lua/plugins/tools.lua

Verifica que cada archivo tiene plugins, lazy.nvim los carga,
y :Lazy los muestra todos.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿lazy.nvim se clonó correctamente? | | |
| ¿:Lazy abre la UI de gestión? | | |
| ¿Plugins en archivos modulares (ui.lua, editing.lua, etc.)? | | |
| ¿El tema se aplica al abrir Neovim? | | |
| ¿gcc comenta/descomenta líneas? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Fuzzy Finder y File Tree →](../02-ejercicio-telescope-tree/README.md)
