# 🎯 Proyecto Semana 01: Tu Primer Init.lua

## 📋 Descripción

En este proyecto integrador, crearás tu primer archivo de configuración de Neovim (`init.lua`) completamente funcional, aplicando todos los conceptos aprendidos en la semana:

- Opciones de configuración (vim.opt)
- Mappings personalizados (vim.keymap.set)
- Leader key y atajos de teclado
- Sintaxis básica de Lua

---

## 🎯 Objetivos

Al completar este proyecto, habrás demostrado que puedes:

- ✅ Crear un init.lua desde cero que cargue sin errores
- ✅ Configurar opciones que mejoren tu experiencia de edición
- ✅ Crear mappings personalizados documentados
- ✅ Entender cada línea de tu propia configuración
- ✅ Personalizar la configuración según tus preferencias

---

## 📦 Requisitos Funcionales

### RF-01: Opciones Esenciales (40%)

Tu init.lua debe incluir las siguientes opciones **como mínimo**:

| # | Opción | Valor | Propósito |
|---|--------|-------|-----------|
| 1 | `number` | true | Ver números de línea |
| 2 | `relativenumber` | true | Números relativos para saltos |
| 3 | `tabstop` | 2 o 4 | Ancho de tabulación |
| 4 | `shiftwidth` | 2 o 4 | Ancho de indentación |
| 5 | `expandtab` | true | Tabs como espacios |
| 6 | `mouse` | "a" | Permitir ratón |
| 7 | `ignorecase` | true | Búsqueda sin mayúsculas |
| 8 | `smartcase` | true | Case-sensitive si usas mayúscula |
| 9 | `hlsearch` | true | Resaltar resultados de búsqueda |
| 10 | `termguicolors` | true | Colores 24-bit |

### RF-02: Leader Key (10%)

- Definir `<leader>` como `<space>`

### RF-03: Mappings Básicos (30%)

| Mapping | Modo | Acción |
|---------|------|--------|
| `<leader>w` | Normal | Guardar archivo |
| `<leader>q` | Normal | Cerrar ventana/buffer |
| `<leader>x` | Normal | Guardar y salir |
| `jk` o `jj` | Insert | Escapar a Normal mode |
| `<leader>h` | Normal | Limpiar resaltado de búsqueda |

### RF-04: Mappings de Navegación (10%)

| Mapping | Acción |
|---------|--------|
| `Ctrl-h` | Ir a split izquierdo |
| `Ctrl-j` | Ir a split inferior |
| `Ctrl-k` | Ir a split superior |
| `Ctrl-l` | Ir a split derecho |

### RF-05: Personalización (10%)

Agrega al menos 3 opciones adicionales de tu elección que no estén en RF-01. Ejemplos:

- `cursorline` — resaltar línea actual
- `scrolloff` — contexto al hacer scroll
- `signcolumn` — columna de signos
- `wrap` — control de ajuste de línea
- `colorcolumn` — guía visual de columna

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md              # Este archivo
└── starter/
    └── init.lua           # Implementar aquí tu configuración
```

---

## 📝 Instrucciones

### 1. Crear el Directorio de Configuración

```bash
mkdir -p ~/.config/nvim
```

### 2. Implementar tu init.lua

Abre el archivo `starter/init.lua` de este proyecto como referencia, pero **crea el tuyo desde cero** en `~/.config/nvim/init.lua`.

```bash
nvim ~/.config/nvim/init.lua
```

### 3. Estructura Sugerida

Organiza tu init.lua en secciones comentadas:

```lua
-- ============================================================
-- Bootcamp Vim — Mi Configuración
-- ============================================================

-- Opciones generales
vim.opt.number = true
-- ... más opciones

-- Tabulación
vim.opt.tabstop = 4
-- ...

-- Leader key
vim.g.mapleader = " "

-- Mappings
vim.keymap.set(...)
-- ...

-- Personalizaciones extra
vim.opt.cursorline = true
-- ...
```

### 4. Verificar

```bash
# Cierra Neovim y vuelve a abrirlo
nvim

# Verifica que:
# - No hay errores en rojo
# - :set number? muestra "number"
# - <leader>w guarda
# - jk escapa de Insert mode
```

### 5. Documentar

En los comentarios de tu init.lua, explica brevemente qué hace cada sección. No necesitas comentar cada línea, pero sí cada bloque.

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Opciones Esenciales** (40%) | |
| 10 opciones configuradas correctamente | 40 |
| 8-9 opciones | 30 |
| 6-7 opciones | 20 |
| **Leader Key** (10%) | |
| Configurada y funcional | 10 |
| **Mappings** (30%) | |
| 5 mappings básicos funcionales | 20 |
| 4 mappings de navegación funcionales | 10 |
| **Personalización** (10%) | |
| 3+ opciones extra | 10 |
| 1-2 opciones extra | 5 |
| **Calidad** (10%) | |
| Código comentado y organizado | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Neovim Options Reference](https://neovim.io/doc/user/options.html)
- [Lua Guide for Neovim](https://neovim.io/doc/user/lua-guide.html)
- [Ejemplo de la teoría: Configuración Inicial](../1-teoria/05-configuracion-inicial.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 01](../README.md)
