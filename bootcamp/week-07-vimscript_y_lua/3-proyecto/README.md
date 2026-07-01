# 🎯 Proyecto Semana 07: Configuración Modular en Lua

## 📋 Descripción

Refactorizarás tu configuración de Neovim a una estructura completamente modular en Lua con archivos separados para opciones, keymaps, autocmds y utilidades.

---

## 🎯 Objetivos

- ✅ Refactorizar `init.lua` como punto de entrada que requiere módulos
- ✅ Separar opciones en `lua/core/options.lua`
- ✅ Separar keymaps en `lua/core/keymaps.lua` con descripciones
- ✅ Separar autocmds en `lua/core/autocmds.lua` con augroups
- ✅ Crear al menos 3 comandos de usuario útiles
- ✅ Crear módulo `lua/util/init.lua` con funciones reutilizables

---

## 📦 Requisitos Funcionales

### RF-01: Estructura Modular (25%)

```
~/.config/nvim/
├── init.lua                    # Punto de entrada limpio
├── lua/
│   ├── core/
│   │   ├── options.lua         # vim.opt.* (semana 1-4)
│   │   ├── keymaps.lua         # vim.keymap.set (todos)
│   │   └── autocmds.lua        # nvim_create_autocmd
│   ├── plugins/
│   │   ├── ui.lua              # (semana 6)
│   │   └── ...                 # otros plugins
│   └── util/
│       └── init.lua            # funciones reutilizables
└── lazy-lock.json
```

### RF-02: init.lua Limpio (10%)

```lua
-- ~/.config/nvim/init.lua
require("config.lazy")           -- bootstrap

-- Core
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Lazy plugins
require("lazy").setup("plugins")
```

### RF-03: options.lua (15%)

Contiene TODAS las opciones `vim.opt.*`, `vim.g.*`, `vim.wo.*` de semanas anteriores.

### RF-04: keymaps.lua (15%)

Contiene TODOS los mappings con descripciones.

### RF-05: autocmds.lua (15%)

Contiene al menos 5 autocmds con augroups:
1. Restaurar posición del cursor
2. Resaltar al copiar (TextYankPost)
3. Formatear al guardar (opcional: necesita LSP)
4. Configuración por tipo de archivo (Markdown, Lua, Python)
5. Uno de tu elección (plantilla, igualar ventanas, etc.)

### RF-06: Comandos y Utilidades (20%)

- 3+ comandos de usuario (`:Reload`, `:Todo`, `:Info`, etc.)
- `lua/util/init.lua` con al menos 3 funciones:
  1. `get_project_root()` — detectar raíz git
  2. `show_startup_time()` — mostrar tiempo de inicio
  3. Una de tu elección

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md                       # Este archivo
├── starter/
│   ├── init-ejemplo.lua
│   ├── options-ejemplo.lua
│   ├── keymaps-ejemplo.lua
│   └── autocmds-ejemplo.lua
└── (tu entregable)
    └── screenshots o zip de tu ~/.config/nvim/
```

---

## 📝 Instrucciones

### Paso 1: Crear Estructura

```bash
mkdir -p ~/.config/nvim/lua/{core,plugins,util}
touch ~/.config/nvim/lua/core/{options,keymaps,autocmds}.lua
touch ~/.config/nvim/lua/util/init.lua
```

### Paso 2: Migrar Opciones a options.lua

Mueve todos los `vim.opt.*`, `vim.g.*`, `vim.wo.*` de `init.lua` a `lua/core/options.lua`.

### Paso 3: Migrar Keymaps a keymaps.lua

Mueve todos los `vim.keymap.set` a `lua/core/keymaps.lua`. Asegúrate de que cada uno tenga `{ desc = "..." }`.

### Paso 4: Migrar Autocmds a autocmds.lua

Mueve todos los `nvim_create_autocmd` a `lua/core/autocmds.lua`. Usa augroups.

### Paso 5: Simplificar init.lua

Reduce `init.lua` a solo los `require()` y el setup de lazy.

### Paso 6: Crear Comandos y Utilidades

Implementa los comandos de usuario y el módulo `util/`.

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Estructura modular** (25%) | |
| init.lua solo requiere módulos | 10 |
| core/{options,keymaps,autocmds}.lua existentes | 15 |
| **options.lua** (15%) | |
| Todas las opciones migradas correctamente | 15 |
| **keymaps.lua** (15%) | |
| Todos los keymaps con descripciones | 15 |
| **autocmds.lua** (15%) | |
| 5+ autocmds con augroups | 15 |
| **Comandos y utilidades** (20%) | |
| 3+ comandos de usuario | 10 |
| util/init.lua con 3+ funciones | 10 |
| **Funcionalidad** (10%) | |
| Configuración carga sin errores | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Lua API de Neovim](../1-teoria/01-lua-api-neovim.md)
- [Teoría: Keymappings Avanzados](../1-teoria/02-keymappings-avanzados.md)
- [Teoría: Autocmds](../1-teoria/03-autocmds.md)
- [Teoría: Comandos de Usuario y Funciones Lua](../1-teoria/04-comandos-y-funciones.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 07](../README.md)
