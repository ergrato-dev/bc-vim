# ⚙️ Configuración Modular con lazy.nvim

## 🎯 Objetivos

- Organizar plugins en archivos modulares por categoría
- Dominar las opciones de lazy-loading: `event`, `keys`, `cmd`, `ft`
- Configurar dependencias entre plugins
- Usar `opts` como alternativa a `config` para configuraciones declarativas

---

## 📋 Contenido

### 1. Estructura Modular Recomendada

```text
~/.config/nvim/lua/plugins/
├── init.lua          (opcional — plugins que no encajan en categorías)
├── ui.lua            → temas, file tree, statusline, bufferline
├── editing.lua       → surround, comentarios, autopairs, snippets
├── lsp.lua           → LSP, completion, linting, formatting
├── git.lua           → gitsigns, fugitive, gitlinker
├── tools.lua         → fuzzy finder, terminal, sesiones, which-key
└── lang.lua          → plugins específicos de lenguajes
```

**Por qué modular**:
- Archivos pequeños y navegables (~20-50 líneas cada uno)
- Fácil desactivar una categoría completa (renombrar/eliminar el archivo)
- Responsabilidad clara: `ui.lua` = interfaz, `editing.lua` = edición

---

### 2. Anatomía de un Spec Completo

```lua
-- lua/plugins/git.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    -- Nombre corto (repo en GitHub/Nix/Lab)

    event = { "BufReadPre", "BufNewFile" },
    -- Cuándo cargar: al leer/escribir un archivo

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- Dependencias (se instalan automáticamente)

    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
      },
    },
    -- Configuración declarativa (se pasa a .setup())

    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
    -- Configuración imperativa (opcional si usas opts)

    keys = {
      { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview" },
    },
    -- Mappings que activan lazy-loading

    cmd = {
      "Gitsigns",
    },
    -- Comandos que activan lazy-loading

    lazy = false,
    -- false = cargar al inicio (no lazy-load)
    -- true = lazy-load (por defecto)

    cond = function()
      return vim.fn.executable("git") == 1
    end,
    -- Carga condicional (solo si git está instalado)
  },
}
```

---

### 3. Lazy-Loading: Cuándo Cargar

```text
┌─────────────────────────────────────────────────────────┐
│ ESTRATEGIAS DE LAZY-LOADING                               │
│                                                           │
│ event    → cargar en respuesta a un evento               │
│ keys     → cargar al presionar una tecla                 │
│ cmd      → cargar al ejecutar un comando                 │
│ ft       → cargar para tipos de archivo específicos      │
│ module   → cargar cuando se require un módulo Lua        │
│ lazy=true → no cargar hasta que se necesite              │
│ lazy=false → cargar siempre al iniciar                   │
└─────────────────────────────────────────────────────────┘
```

**Ejemplos de eventos**:

```lua
event = "VeryLazy"              -- después de cargar UI inicial
event = { "BufReadPre", "BufNewFile" }  -- al abrir/crear archivo
event = "InsertEnter"           -- al entrar a Insert mode
event = "LspAttach"             -- al conectar un LSP
event = "UIEnter"               -- al mostrar la UI
event = "BufWritePre"           -- antes de guardar
```

**Recomendaciones**:
```lua
-- Cargar al inicio (pocos plugins):
lazy = false                     -- tema, statusline

-- Cargar al abrir archivos (la mayoría):
event = "VeryLazy"               -- file tree, telescope, gitsigns

-- Cargar por tipo de archivo:
ft = { "lua", "python", "javascript" }  -- plugins de lenguaje

-- Cargar por tecla/comando:
keys = { "<leader>gc" }         -- fugitive (solo al usar git)
cmd = { "Fugitive" }
```

---

### 4. `opts` vs `config`

```lua
-- Forma IMPERATIVA (config):
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = { add = { text = "+" } },
    })
  end,
}

-- Forma DECLARATIVA (opts):
{
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = { add = { text = "+" } },
  },
}
-- lazy.nvim llama automáticamente require("gitsigns").setup(opts)
```

**Cuándo usar cada una**:
- `opts`: plugin simple que solo necesita `.setup({...})`
- `config`: necesitas lógica personalizada (keymaps adicionales, hooks, etc.)

---

### 5. Dependencias

```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",          -- dependencia requerida
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",                  -- compilar después de instalar
    },
  },
}
```

```lua
-- Dependencia con configuración separada:
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",           -- source de LSP
    "hrsh7th/cmp-buffer",             -- source de buffer
    "hrsh7th/cmp-path",               -- source de path
  },
}
```

**`build` y `run`**:
```lua
build = "make"                        -- compilar al instalar
build = ":TSUpdate"                   -- comando Vim después de instalar
run = "pip install -r requirements.txt"  -- script post-instalación
```

---

### 6. Plugins con Configuración Extensa

Cuando un plugin necesita mucha configuración, extracta la lógica a un archivo separado:

```lua
-- lua/plugins/lsp.lua (spec del plugin)
{
  "neovim/nvim-lspconfig",
  config = function()
    require("config.lsp").setup()  -- delega a archivo de configuración
  end,
}
```

```lua
-- lua/config/lsp.lua (configuración detallada)
local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  lspconfig.lua_ls.setup({ settings = { Lua = { ... } } })
  lspconfig.pyright.setup({})
  lspconfig.ts_ls.setup({})
  -- ...
end

return M
```

---

### 7. Desactivar Plugins

```lua
-- Desactivar un plugin específico:
{ "tpope/vim-surround", enabled = false }

-- Desactivar una categoría entera:
-- Renombrar lua/plugins/git.lua → lua/plugins/git.lua.disabled
```

---

### 8. Compartir Configuración entre Plugins

```lua
-- lua/config/icons.lua
return {
  diagnostics = {
    Error = "",
    Warn  = "",
    Info  = "",
    Hint  = "",
  },
}
```

```lua
-- En cualquier plugin:
local icons = require("config.icons")
opts = {
  signs = {
    error = icons.diagnostics.Error,
  },
}
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ ESTRUCTURA MODULAR                                       │
│                                                          │
│ lua/plugins/                                             │
│ ├── ui.lua         → tema, file tree, statusline        │
│ ├── editing.lua    → surround, comentarios, autopairs   │
│ ├── lsp.lua        → LSP, completion, linting           │
│ ├── git.lua        → gitsigns, fugitive                 │
│ └── tools.lua      → telescope, terminal, which-key     │
│                                                          │
│ OPCIONES DE SPEC:                                        │
│ event = "VeryLazy"   → carga diferida estándar          │
│ keys = { ... }       → carga al presionar teclas        │
│ cmd = { ... }        → carga al ejecutar comando        │
│ ft = { ... }         → carga por tipo de archivo        │
│ opts = { ... }       → configuración declarativa        │
│ config = function()  → configuración imperativa         │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Tengo plugins organizados en archivos por categoría
- [ ] Uso `event = "VeryLazy"` para la mayoría de plugins
- [ ] Uso `opts` para configuraciones declarativas
- [ ] Declaro dependencias con `dependencies`
- [ ] Uso `keys` para mapeos que activan lazy-loading
- [ ] Tengo `lazy = false` solo para plugins esenciales (tema, statusline)

---

## 🎮 Ejercicio Rápido

```text
1. Crea la estructura modular:
   mkdir -p ~/.config/nvim/lua/{config,plugins}

2. Crea los archivos vacíos:
   touch lua/plugins/{ui,editing,lsp,git,tools}.lua

3. Agrega un plugin simple a ui.lua:
   return { { "navarasu/onedark.nvim", lazy = false,
     config = function() vim.cmd.colorscheme("onedark") end
   }}

4. :Lazy sync → instala
5. Verifica que el tema se aplica
6. Agrega otro plugin a tools.lua usando event = "VeryLazy"
```

---

## ➡️ Siguiente

[03 - Fuzzy Finder y File Tree](03-fuzzy-finder-y-file-tree.md)
