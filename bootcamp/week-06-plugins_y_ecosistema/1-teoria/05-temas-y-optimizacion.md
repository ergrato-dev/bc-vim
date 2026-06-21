# 🎨 Temas, which-key y Optimización

## 🎯 Objetivos

- Instalar y configurar temas de color (colorschemes)
- Configurar which-key.nvim para descubrir mappings
- Medir y optimizar el tiempo de inicio de Neovim
- Mantener plugins actualizados y bloqueados

---

## 📋 Contenido

### 1. Colorschemes: Temas de Color

**Temas populares para Neovim**:

| Tema | Estilo | Árbol sintaxis | Plugins |
|------|--------|---------------|---------|
| catppuccin | Pastel, suave | ✅ Treesitter | ✅ |
| tokyonight | Nocturno, azulado | ✅ Treesitter | ✅ |
| rose-pine | Rosado, cálido | ✅ Treesitter | ✅ |
| onedark | Clásico (Atom) | ✅ Treesitter | ✅ |
| gruvbox | Retro, cálido | ✅ Treesitter | ✅ |
| nord | Frío, nórdico | ✅ Treesitter | ✅ |
| kanagawa | Japonés, zen | ✅ Treesitter | ✅ |
| github | Claro/oscuro | ✅ Treesitter | ✅ |

**Instalación** (ejemplo con catppuccin):

```lua
-- lua/plugins/ui.lua
{
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,          -- cargar antes que otros plugins
  opts = {
    flavour = "mocha",      -- latte, frappe, macchiato, mocha
    transparent_background = false,
    integrations = {
      telescope = true,
      lualine = true,
      neo_tree = true,
      gitsigns = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

**Cambiar tema en caliente**:
```text
:colorscheme tokyonight
:colorscheme catppuccin
:colorscheme rose-pine

Telescope: <leader>fh → buscar "colorscheme"
```

---

### 2. which-key.nvim — Descubrir Mappings

Muestra una ventana emergente con los mappings disponibles cuando presionas una tecla prefijo.

**Instalación**:

```lua
-- lua/plugins/tools.lua
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",       -- helix, classic, modern
    delay = 500,             -- ms de espera antes de mostrar
    triggers = {
      { "<auto>", mode = "nxsot" },
    },
    spec = {
      -- Agrupar mappings para que which-key los muestre organizados
      { "<leader>f", group = "Find / Telescope" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffers" },
      { "<leader>w", group = "Window" },
      { "<leader>t", group = "Tabs" },
      { "<leader>l", group = "LSP" },
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Search" },
    },
  },
}
```

**Uso**:
```text
Presiona <leader> → espera 500ms → which-key muestra:
┌──────────────────────────────┐
│ f → Find / Telescope         │
│ g → Git                      │
│ b → Buffers                  │
│ w → Window                   │
│ ...                          │
└──────────────────────────────┘

Presiona <leader>f → which-key muestra sub-mappings:
┌──────────────────────────────┐
│ f → Buscar archivos          │
│ g → Buscar texto             │
│ b → Buscar buffers           │
│ h → Buscar ayuda             │
│ ...                          │
└──────────────────────────────┘
```

---

### 3. Optimizar el Tiempo de Inicio

**Medir el tiempo de inicio**:

```bash
# Medir tiempo de inicio
nvim --startuptime /tmp/nvim-startup.log +q
# Abrir el log y ver qué plugins tardan más
nvim /tmp/nvim-startup.log
```

**Perfilado con lazy.nvim**:
```text
:Lazy profile
→ muestra qué plugins consumen más tiempo de carga
→ ordena por tiempo de inicio
```

**Estrategias de optimización**:

```lua
-- 1. Usar lazy = true para plugins no esenciales
--    (es el default, NO necesitas especificarlo)
{ "plugin/package" }           -- lazy = true por defecto

-- 2. Especificar evento de carga preciso
event = "VeryLazy"             -- en lugar de cargar siempre
event = { "BufReadPre", "BufNewFile" }  -- solo con archivos

-- 3. Usar cmd/keys para carga por demanda
cmd = { "Fugitive", "Git" }    -- solo al usar comandos git
keys = { "<leader>gg" }        -- solo al presionar la tecla

-- 4. Cargar temas con prioridad alta
{ "catppuccin/nvim", priority = 1000, lazy = false }

-- 5. Usar build condicional (solo compilar si es necesario)
build = function()
  if vim.fn.executable("make") == 1 then
    vim.cmd("make")
  end
end,

-- 6. Desactivar plugins no usados
{ "plugin/package", enabled = false }
```

**Tiempo de inicio aceptable**:
```text
< 50ms   → Excelente (casi instantáneo)
50-100ms → Muy bueno (aceptable)
100-200ms → Normal (con muchos plugins)
200-500ms → Pesado (revisar qué plugins tardan)
> 500ms  → Necesita optimización urgente
```

---

### 4. Lockfile: Bloquear Versiones

El archivo `lazy-lock.json` guarda los commits exactos de cada plugin. Esto garantiza que tu configuración sea reproducible.

```bash
# Commitear el lockfile en tu dotfiles
git add ~/.config/nvim/lazy-lock.json
git commit -m "nvim: bloquear versiones de plugins"
```

**Restaurar desde lockfile**:
```text
:Lazy restore       → restaura plugins a las versiones del lockfile
```

**Actualizar y regenerar lockfile**:
```text
:Lazy update        → actualiza plugins y regenera lazy-lock.json
```

---

### 5. Plugins de Edición Recomendados

```lua
-- lua/plugins/editing.lua
return {
  -- Comentar código
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Rodear texto con paréntesis, comillas, tags
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Cerrar automáticamente pares: (), [], {}, "", ''
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Mejorar movimientos f/t (saltar entre ventanas, etc.)
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward" },
    },
    opts = {},
  },

  -- Undo tree visual
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" } },
  },
}
```

**Comandos de plugins de edición**:
```text
gcc         → Comment.nvim: comentar/descomentar línea
gc{motion}  → Comment.nvim: comentar/descomentar motion
ys i w "    → nvim-surround: rodear palabra con "
ds "        → nvim-surround: eliminar surround "
cs " '      → nvim-surround: cambiar " por '
```

---

### 6. Dotfiles: Organización Recomendada

```text
~/.config/nvim/                       # Repositorio git de dotfiles
├── init.lua                          # Punto de entrada
├── lazy-lock.json                    # Versiones bloqueadas
├── lua/
│   ├── config/
│   │   ├── lazy.lua                  # Bootstrap de lazy.nvim
│   │   ├── options.lua               # vim.opt.* (de semana 1)
│   │   ├── keymaps.lua               # vim.keymap.set (de semana 1-4)
│   │   └── autocmds.lua              # Autocomandos
│   └── plugins/
│       ├── ui.lua                    # Tema, lualine, neo-tree
│       ├── editing.lua               # Comment, surround, autopairs
│       ├── lsp.lua                   # LSP, completion (semana 8)
│       ├── git.lua                   # gitsigns, fugitive
│       └── tools.lua                 # Telescope, which-key
└── after/
    └── ftplugin/                     # Config por tipo de archivo
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────┐
│ TEMAS Y OPTIMIZACIÓN                                  │
│                                                       │
│ TEMAS:                                                │
│   catppuccin, tokyonight, rose-pine, onedark         │
│   priority = 1000, lazy = false                      │
│                                                       │
│ WHICH-KEY:                                            │
│   Muestra mappings disponibles                       │
│   <leader> → esperar 500ms → popup con grupos        │
│                                                       │
│ OPTIMIZACIÓN:                                         │
│   nvim --startuptime → medir                         │
│   :Lazy profile → perfilado                          │
│   lazy = true + event "VeryLazy" → estándar          │
│   cmd/keys → carga por demanda                       │
│                                                       │
│ LOCKFILE:                                             │
│   lazy-lock.json → versiones exactas                 │
│   :Lazy restore → restaurar                          │
│   Commitear en dotfiles                              │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Colorscheme instalado con `priority = 1000`
- [ ] which-key configurado y muestra mappings
- [ ] Medí tiempo de inicio con `nvim --startuptime`
- [ ] Usé `:Lazy profile` para identificar plugins lentos
- [ ] Plugins no esenciales usan `event = "VeryLazy"`
- [ ] `lazy-lock.json` está commiteado en mis dotfiles
- [ ] Plugins de edición: Comment, surround, autopairs

---

## 🎮 Ejercicio Rápido

```text
1. Instala 2 temas diferentes
2. :colorscheme tokyonight → observa el cambio
3. :colorscheme catppuccin → compara
4. Presiona <leader> → which-key muestra grupos
5. nvim --startuptime /tmp/nvim-startup.log +q
6. nvim /tmp/nvim-startup.log → revisa tiempos
7. :Lazy profile → identifica los 3 plugins más lentos
8. Optimiza uno cambiándole el evento de carga
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
