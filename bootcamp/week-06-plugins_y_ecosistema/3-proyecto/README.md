# 🎯 Proyecto Semana 06: Starter Kit de Plugins Modular

## 📋 Descripción

Crearás un "starter kit" de plugins para desarrollo con lazy.nvim, organizado modularmente en archivos por categoría. El resultado será tu configuración real de Neovim lista para desarrollo profesional.

---

## 🎯 Objetivos

- ✅ Configurar lazy.nvim con bootstrap automático
- ✅ Organizar plugins en archivos modulares (ui, editing, git, tools)
- ✅ Instalar 8+ plugins esenciales con keymaps documentados
- ✅ Configurar which-key con grupos de mappings
- ✅ Aplicar y personalizar un tema de color
- ✅ Bloquear versiones con lazy-lock.json

---

## 📦 Requisitos Funcionales

### RF-01: Bootstrap y Estructura (15%)

```
~/.config/nvim/
├── init.lua                    # Punto de entrada
├── lua/
│   ├── config/
│   │   └── lazy.lua            # Bootstrap de lazy.nvim
│   └── plugins/
│       ├── ui.lua              # Tema, lualine, neo-tree
│       ├── editing.lua         # Comment, surround, autopairs
│       ├── git.lua             # gitsigns, fugitive
│       └── tools.lua           # Telescope, which-key
└── lazy-lock.json              # Lockfile
```

### RF-02: Plugins Mínimos (50%)

| # | Plugin | Archivo | Propósito |
|---|--------|---------|-----------|
| 1 | Colorscheme (onedark, catppuccin, etc.) | ui.lua | Tema visual |
| 2 | lualine.nvim | ui.lua | Barra de estado |
| 3 | neo-tree.nvim o nvim-tree | ui.lua | File tree |
| 4 | Comment.nvim | editing.lua | Comentar código |
| 5 | nvim-surround | editing.lua | Rodear texto |
| 6 | nvim-autopairs | editing.lua | Cerrar pares |
| 7 | telescope.nvim | tools.lua | Fuzzy finder |
| 8 | which-key.nvim | tools.lua | Descubrir mappings |
| 9 | gitsigns.nvim | git.lua | Git en gutter |
| 10 | vim-fugitive | git.lua | Git desde Vim |

### RF-03: Keymaps Documentados (15%)

Cada plugin debe incluir keymaps relevantes con descripciones (para which-key).

### RF-04: Lazy-Loading Correcto (10%)

- Solo `lazy = false` para tema y lualine
- El resto usa `event = "VeryLazy"`, `keys`, o `cmd`
- Tiempo de inicio < 150ms medido con `nvim --startuptime`

### RF-05: Lockfile (10%)

- `lazy-lock.json` generado y presente
- Opcional: commiteado en repositorio dotfiles

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md                            # Este archivo
├── starter/
│   ├── ejemplo-ui.lua
│   ├── ejemplo-editing.lua
│   ├── ejemplo-git.lua
│   └── ejemplo-tools.lua
└── (tu entregable)
    └── plugins-config.zip / screenshot   # Evidencia de tu configuración
```

---

## 📝 Instrucciones

### Paso 1: Crear el Bootstrap

Crea `~/.config/nvim/lua/config/lazy.lua` con el código de bootstrap (ver teoría o ejercicio 01).

### Paso 2: Configurar init.lua

Asegúrate de tener en `~/.config/nvim/init.lua`:

```lua
require("config.lazy")                         -- bootstrap
-- Tus opciones vim.opt.*
-- Tus keymaps vim.keymap.set
require("lazy").setup("plugins")               -- cargar plugins
```

### Paso 3: Crear Archivos de Plugins

Implementa cada archivo de `lua/plugins/` con al menos los plugins de RF-02.

### Paso 4: Instalar y Verificar

```text
:Lazy sync               → instala todo
:Lazy profile            → verifica tiempos
nvim --startuptime /tmp/startup.log +q
```

### Paso 5: Documentar

Crea un README o captura de pantalla mostrando:
- `:Lazy` con plugins instalados
- which-key mostrando mappings
- lualine con información
- neo-tree abierto

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Bootstrap y estructura** (15%) | |
| init.lua + lazy.lua funcionales | 5 |
| 4 archivos modulares en lua/plugins/ | 10 |
| **Plugins mínimos** (50%) | |
| 10 plugins instalados y funcionales | 50 |
| 8-9 plugins | 40 |
| 6-7 plugins | 30 |
| **Keymaps documentados** (15%) | |
| Keymaps con desc para which-key | 15 |
| **Lazy-loading** (10%) | |
| lazy=false solo para tema y lualine | 5 |
| Tiempo inicio < 150ms | 5 |
| **Lockfile** (10%) | |
| lazy-lock.json presente | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Gestores de Plugins](../1-teoria/01-gestores-de-plugins.md)
- [Teoría: Configuración Modular](../1-teoria/02-configuracion-modular-lazy.md)
- [Teoría: Fuzzy Finder y File Tree](../1-teoria/03-fuzzy-finder-y-file-tree.md)
- [Teoría: Git y Statusline](../1-teoria/04-git-y-statusline.md)
- [Teoría: Temas y Optimización](../1-teoria/05-temas-y-optimizacion.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 06](../README.md)
