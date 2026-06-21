# 🛠️ Ejercicio 03: Comandos de Usuario y Módulos Lua

## 🎯 Objetivo

Crear comandos personalizados y módulos Lua reutilizables.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Crea `~/.config/nvim/lua/util/init.lua` para funciones y agrega comandos a tu configuración.

---

## 🎮 Ejercicios

### Ejercicio A: Comando Reload

```lua
-- En init.lua o lua/core/commands.lua:
vim.api.nvim_create_user_command("Reload", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Configuración recargada ✓", vim.log.levels.INFO)
end, { desc = "Recargar configuración de Neovim" })
```

Prueba: `:Reload`

### Ejercicio B: Módulo de Utilidades

Crea `~/.config/nvim/lua/util/init.lua`:

```lua
local M = {}

function M.info()
  local config = vim.fn.stdpath("config")
  local data = vim.fn.stdpath("data")
  local lines = vim.api.nvim_buf_line_count(0)
  local ft = vim.bo.filetype

  return string.format([[
Neovim Info:
  Config:  %s
  Data:    %s
  Archivo: %s (%d líneas, %s)
  ]], config, data, vim.fn.expand("%:t"), lines, ft)
end

function M.get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines > 1 then
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  end
  return table.concat(lines, "\n")
end

function M.find_todos()
  vim.cmd("Telescope live_grep default_text=TODO")
end

return M
```

### Ejercicio C: Comando Info

```lua
local util = require("util")

vim.api.nvim_create_user_command("Info", function()
  vim.notify(util.info(), vim.log.levels.INFO)
end, { desc = "Mostrar información de Neovim" })
```

Prueba: `:Info`

### Ejercicio D: Comando con Rango

```lua
vim.api.nvim_create_user_command("SortLines", function(opts)
  local start = opts.line1
  local finish = opts.line2
  local lines = vim.api.nvim_buf_get_lines(0, start - 1, finish, false)
  table.sort(lines)
  vim.api.nvim_buf_set_lines(0, start - 1, finish, false, lines)
end, { range = true, desc = "Ordenar líneas seleccionadas" })
```

Prueba:
```text
Escribe 5 líneas desordenadas
V selecciónalas → :SortLines → se ordenan
```

### Ejercicio E: Comando Todo

```lua
vim.api.nvim_create_user_command("Todo", function()
  util.find_todos()
end, { desc = "Buscar TODOs en el proyecto" })
```

Prueba: `:Todo` → debe abrir telescope buscando "TODO"

### Ejercicio F: Comando con Argumentos

```lua
vim.api.nvim_create_user_command("Sh", function(opts)
  vim.cmd("belowright split | terminal " .. opts.args)
end, { nargs = "+", desc = "Ejecutar comando shell en split" })
```

Prueba: `:Sh ls -la` → abre terminal con output de ls

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Creaste al menos 3 comandos de usuario? | | |
| ¿Al menos 1 acepta rango? | | |
| ¿Al menos 1 acepta argumentos? | | |
| ¿Creaste módulo util/ con funciones reutilizables? | | |
| ¿Usaste require("util") en otros archivos? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Vimscript Legacy →](../04-ejercicio-vimscript/README.md)
