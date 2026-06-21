# 🌳 Ejercicio 03: Treesitter

## 🎯 Objetivo

Instalar parsers de Treesitter, usar text objects avanzados y folding estructural.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Agregar Treesitter

En `lua/plugins/lsp.lua`:

```lua
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "markdown", "vim", "vimdoc" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
        },
      },
    })
  end,
}
```

### Paso 2: Text Objects

En `lua/plugins/editing.lua`:

```lua
{
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer" },
          goto_previous_start = { ["[f"] = "@function.outer" },
        },
      },
    })
  end,
}
```

### Paso 3: Instalar

```text
:Lazy sync
:TSInstall lua python  (si no se instalaron automáticamente)
```

---

## 🎮 Ejercicios

### Ejercicio A: Resaltado

```text
1. Abre un archivo Lua con funciones, strings, comentarios
2. Observa los colores: ¿diferentes tipos de funciones se ven distinto?
3. :InspectTree → mira el AST
```

### Ejercicio B: Text Objects

```text
1. En una función Lua:
   daf   → elimina la función completa
   u     → deshacer
   vif   → selecciona cuerpo de la función (sin "function/end")
   cif   → cambia el cuerpo
   u     → deshacer
```

### Ejercicio C: Navegación

```text
1. ]f    → siguiente función
2. [f    → función anterior
3. Repite varias veces para navegar un archivo
```

### Ejercicio D: Selección Incremental

```text
1. gnn   → inicia selección (selecciona nodo actual)
2. grn   → expande al nodo padre
3. grn   → sigue expandiendo
4. grm   → reduce la selección
5. d     → elimina la selección
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Resaltado Treesitter activo? | | |
| ¿daf/cif/vaf funcionan? | | |
| ¿]f y [f navegan entre funciones? | | |
| ¿gnn/grn/grm funcionan? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: DAP y Snippets →](../04-ejercicio-dap-snippets/README.md)
