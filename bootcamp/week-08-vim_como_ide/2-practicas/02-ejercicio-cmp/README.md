# 💡 Ejercicio 02: Autocompletado con nvim-cmp

## 🎯 Objetivo

Configurar nvim-cmp con 4 fuentes de completado: LSP, buffer, path y snippets.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Agregar nvim-cmp y fuentes

En `lua/plugins/lsp.lua`, añadir:

```lua
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
    })

    -- Completado en línea de comandos
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "cmdline" }, { name = "path" } },
    })
  end,
}
```

### Paso 2: Instalar

```text
:Lazy sync
```

---

## 🎮 Ejercicios

### Ejercicio A: Completado LSP

```text
1. Abre init.lua
2. Escribe: vim.key
3. Ctrl-Space → menú con sugerencias del LSP
4. Tab / S-Tab → navegar
5. Enter → aceptar
```

### Ejercicio B: Completado Buffer

```text
1. Escribe: "const usuarioAdmin = true"
2. En línea siguiente: "const usuario"
3. Ctrl-Space → debe sugerir "usuarioAdmin" (fuente buffer)
```

### Ejercicio C: Completado Path

```text
1. Escribe: require("
2. Ctrl-Space → debe sugerir directorios y archivos .lua
```

### Ejercicio D: Completado Snippets

```text
1. Escribe: func
2. Ctrl-Space → debe sugerir snippet "func"
3. Enter → expande plantilla de función
4. Escribe el nombre, Tab a argumentos, Tab al cuerpo
```

### Ejercicio E: Completado en Línea de Comandos

```text
1. :e <Space>
2. Ctrl-Space → sugiere archivos del directorio actual
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Autocompletado LSP funciona? | | |
| ¿Autocompletado buffer funciona? | | |
| ¿Autocompletado path funciona? | | |
| ¿Snippets se expanden? | | |
| ¿Tab/S-Tab navegan el menú? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Treesitter →](../03-ejercicio-treesitter/README.md)
