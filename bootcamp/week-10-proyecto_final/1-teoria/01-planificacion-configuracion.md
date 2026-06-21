# 📋 Planificación de la Configuración Final

## 🎯 Objetivos

- Planificar la estructura completa de tu configuración de Neovim
- Priorizar funcionalidades según tu flujo de trabajo real
- Definir un plan de implementación por capas
- Establecer criterios de "done" para tu proyecto final

---

## 📋 Contenido

### 1. El Proyecto Final en Contexto

Has pasado 9 semanas aprendiendo herramientas, técnicas y conceptos. Esta semana las consolidas en tu configuración personal definitiva.

```text
Semanas 1-5:   Fundamentos (edición, movimiento, registros, macros)
Semanas 6-7:   Infraestructura (plugins, Lua, modularidad)
Semanas 8-9:   IDE (LSP, cmp, Treesitter, DAP) + Flujos avanzados
Semana 10:     Integración final + publicación
```

---

### 2. Estructura Objetivo

```text
~/.config/nvim/
├── init.lua                     → punto de entrada limpio
├── lazy-lock.json               → versiones bloqueadas
├── lua/
│   ├── config/
│   │   └── lazy.lua             → bootstrap de lazy.nvim
│   ├── core/
│   │   ├── options.lua          → vim.opt.*
│   │   ├── keymaps.lua          → vim.keymap.set
│   │   └── autocmds.lua         → nvim_create_autocmd
│   ├── plugins/
│   │   ├── ui.lua               → tema, lualine, neo-tree, bufferline
│   │   ├── editing.lua          → Comment, surround, autopairs, Leap
│   │   ├── lsp.lua              → mason, lspconfig, cmp, LuaSnip
│   │   ├── dap.lua              → nvim-dap, dap-ui
│   │   ├── git.lua              → gitsigns, fugitive
│   │   └── tools.lua            → telescope, which-key, undotree
│   ├── util/
│   │   └── init.lua             → funciones reutilizables
│   └── snippets/                 → snippets personalizados
│       ├── lua.lua
│       ├── python.lua
│       └── all.lua
└── README.md                     → documentación
```

---

### 3. Plan por Capas

Implementa tu configuración por capas, verificando cada una antes de pasar a la siguiente:

```text
CAPA 1 — Base (30 min)
├── init.lua con require("config.lazy")
├── lua/config/lazy.lua (bootstrap)
├── lua/core/options.lua
└── Verificar: Neovim abre sin errores, lazy listo

CAPA 2 — UI (30 min)
├── lua/plugins/ui.lua (tema + lualine + neo-tree)
├── :Lazy sync
└── Verificar: tema aplicado, statusline visible, file tree funciona

CAPA 3 — Navegación y Keymaps (30 min)
├── lua/core/keymaps.lua
├── lua/plugins/tools.lua (telescope + which-key)
├── :Lazy sync
└── Verificar: <leader>ff busca archivos, which-key muestra menú

CAPA 4 — Edición (30 min)
├── lua/plugins/editing.lua (Comment, surround, autopairs)
├── lua/plugins/git.lua (gitsigns, fugitive)
├── :Lazy sync
└── Verificar: gcc comenta, gitsigns muestra gutter

CAPA 5 — IDE (1h)
├── lua/plugins/lsp.lua (mason + lspconfig + cmp + LuaSnip)
├── :Lazy sync, :MasonInstall servers
└── Verificar: :LspInfo muestra servers, K muestra hover, cmp funciona

CAPA 6 — Avanzado (1h)
├── lua/plugins/dap.lua (si usas debugging)
├── lua/core/autocmds.lua
├── lua/util/init.lua
├── lua/snippets/
└── Verificar: autocmds funcionan, snippets se expanden

CAPA 7 — Documentación (1.5h)
├── README.md en el repo
├── Screenshots
├── Instrucciones de instalación
└── Verificar: alguien más podría instalar tu config
```

---

### 4. Plugins Recomendados (Mínimo 10)

```lua
-- UI (3)
{ "navarasu/onedark.nvim" }           -- o catppuccin/tokyonight
{ "nvim-lualine/lualine.nvim" }
{ "nvim-neo-tree/neo-tree.nvim" }     -- o nvim-tree

-- Edición (3)
{ "numToStr/Comment.nvim" }
{ "kylechui/nvim-surround" }
{ "windwp/nvim-autopairs" }

-- Navegación (2)
{ "nvim-telescope/telescope.nvim" }
{ "folke/which-key.nvim" }

-- Git (2)
{ "lewis6991/gitsigns.nvim" }
{ "tpope/vim-fugitive" }

-- LSP/IDE (4 paquetes)
{ "williamboman/mason.nvim" }
{ "neovim/nvim-lspconfig" }
{ "hrsh7th/nvim-cmp" }
{ "nvim-treesitter/nvim-treesitter" }
```

---

### 5. Checklist de Verificación Final

```text
☐ init.lua carga sin errores
☐ :Lazy muestra todos los plugins instalados
☐ :Lazy profile → tiempo de inicio < 150ms
☐ Tema y statusline aplicados
☐ Neo-tree abre/cierra con <leader>e
☐ Telescope busca archivos (<leader>ff) y texto (<leader>fg)
☐ Which-key muestra menú al presionar <leader>
☐ gcc comenta/descomenta código
☐ gitsigns muestra cambios en gutter (en repo git)
☐ :LspInfo muestra LSP conectado
☐ K muestra documentación (hover)
☐ Autocompletado funciona (Ctrl-Space)
☐ [d / ]d navega errores LSP
☐ Treesitter con text objects (daf, cif)
☐ Todos los keymaps tienen descripción
☐ README.md con instrucciones y screenshots
☐ lazy-lock.json commiteado
```

---

## 💡 Consejos

> **Menos es más.** 12 plugins bien configurados > 40 plugins que no usas. Cada plugin debe resolver un problema real que tienes.

> **No copies configuraciones enteras.** Entiende cada línea. Si no sabes qué hace una opción, búscala con `:help`.

> **Itera.** Tu primera versión no será perfecta. Publícala, úsala una semana, mejórala.

---

## ➡️ Siguiente

[02 - Publicación de Dotfiles en GitHub](02-publicacion-dotfiles.md)
