# ⚡ Ejercicio 02: Autocmds

## 🎯 Objetivo

Crear autocmds con `augroup` para automatizar tareas: formateo, restauración de cursor, resaltado y más.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

Crea un archivo `~/.config/nvim/lua/core/autocmds.lua` o trabaja en `init.lua`.

---

## 🎮 Ejercicios

### Ejercicio A: Augroup y Restaurar Cursor

```lua
-- lua/core/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("General", { clear = true })

-- Restaurar última posición al abrir archivo
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Ir a última posición al abrir archivo",
})
```

Prueba:
```text
1. Abre un archivo largo
2. Ve a línea 50
3. Cierra y vuelve a abrir → ¿estás en línea 50?
```

### Ejercicio B: Yank Highlight

```lua
-- Resaltar texto al copiar (yank)
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
  desc = "Resaltar texto copiado",
})
```

Prueba:
```text
1. yiw → copia una palabra → debe iluminarse brevemente
2. yy  → copia una línea → debe iluminarse
```

### Ejercicio C: Formatear al Guardar

```lua
local format_group = augroup("AutoFormat", { clear = true })

autocmd("BufWritePre", {
  group = format_group,
  pattern = { "*.lua", "*.vim" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  desc = "Formatear Lua/Vim al guardar",
})
```

### Ejercicio D: Config por Tipo de Archivo

```lua
local ft_group = augroup("FileTypeSettings", { clear = true })

autocmd("FileType", {
  group = ft_group,
  pattern = "markdown",
  callback = function(args)
    vim.wo[args.buf].wrap = true
    vim.wo[args.buf].spell = true
    vim.bo[args.buf].tabstop = 2
  end,
  desc = "Config para Markdown",
})

autocmd("FileType", {
  group = ft_group,
  pattern = { "lua", "python", "javascript" },
  callback = function()
    vim.opt_local.colorcolumn = "80,120"
  end,
  desc = "Guía de columna para código",
})
```

### Ejercicio E: Plantilla para Nuevos Archivos

```lua
autocmd("BufNewFile", {
  group = general,
  pattern = { "*.sh", "*.bash" },
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "#!/usr/bin/env bash",
      "",
      "set -euo pipefail",
      "",
      "",
    })
    vim.api.nvim_win_set_cursor(0, { 4, 0 })
  end,
  desc = "Plantilla bash",
})
```

Prueba:
```text
:e ~/test-script.sh  → debe mostrar el esqueleto
```

### Ejercicio F: Igualar Ventanas

```lua
autocmd("VimResized", {
  group = general,
  callback = function()
    vim.cmd("wincmd =")
  end,
  desc = "Igualar ventanas al redimensionar",
})
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste augroup con clear=true? | | |
| ¿Restauras posición del cursor al abrir archivos? | | |
| ¿Resaltas texto al copiar? | | |
| ¿Formateas al guardar? | | |
| ¿Configuraste Markdown con wrap y spell? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Comandos de Usuario →](../03-ejercicio-comandos/README.md)
