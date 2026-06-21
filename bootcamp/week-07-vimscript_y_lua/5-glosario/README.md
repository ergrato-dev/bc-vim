# 📚 Glosario - Semana 7

Términos clave de la Semana 7: Vimscript y Lua.

---

## A

### Augroup
Grupo de autocomandos que permite limpiarlos al recargar configuración, evitando duplicados.

```lua
local group = vim.api.nvim_create_augroup("Nombre", { clear = true })
```

### Autocmd (Autocomando)
Comando que se ejecuta automáticamente en respuesta a un evento de Vim (abrir archivo, guardar, cambiar tipo de archivo, etc.).

---

## C

### Callback
Función Lua que se ejecuta cuando ocurre un evento (keymap, autocmd, comando). Alternativa más potente a strings de comandos.

```lua
callback = function(args)
  -- args.buf, args.file, args.match...
end
```

---

## E

### Evento
Nombre del suceso que dispara un autocmd. Ej: `BufWritePre`, `FileType`, `TextYankPost`, `LspAttach`.

### Ex command
Comandos que empiezan con `:` en Vim. `:w`, `:q`, `:set`, `:help`, `:e`, etc.

---

## F

### ftplugin
Directorio `after/ftplugin/` donde se colocan configuraciones por tipo de archivo. `lua.lua` se carga automáticamente para archivos `.lua`.

---

## I

### init.lua
Archivo de configuración principal de Neovim. Equivalente a `.vimrc`/`init.vim`. Punto de entrada de toda la configuración en Lua.

---

## L

### Lua
Lenguaje de scripting embebido en Neovim (desde 0.5) como alternativa moderna a Vimscript. Usado para configuración y desarrollo de plugins.

### :lua
Comando de Vim que evalúa código Lua en línea.

```text
:lua print("hola")
:lua require("modulo").funcion()
```

---

## M

### Módulo
Archivo Lua que expone funciones y variables mediante `return`. Cargable con `require()`.

```lua
-- lua/util/init.lua
local M = {}
function M.saludar() ... end
return M

-- Uso:
local util = require("util")
util.saludar()
```

---

## N

### nargs
Opción de `nvim_create_user_command` que especifica cuántos argumentos acepta el comando.

```text
nargs = 0    → sin argumentos
nargs = 1    → exactamente 1
nargs = "*"  → 0 o más
nargs = "?"  → 0 o 1
nargs = "+"  → 1 o más
```

---

## O

### `:set` → `vim.opt`
`vim.opt` es la API Lua para las opciones de Vim. Reemplaza `:set` de Vimscript.

---

## R

### range
Opción de comando que permite especificar rango de líneas: `:5,10MiComando`.

---

## S

### Scope (Ámbito)
Prefijo que determina dónde es visible una variable/opción:
- `g:` — global
- `b:` — buffer-local
- `w:` — window-local
- `s:` — script-local (Vimscript)
- `l:` — local (Vimscript)

### Script-local
Variable/función visible solo dentro del archivo donde se define. En Lua, variables `local`. En Vimscript, prefijo `s:`.

---

## V

### vim.api
Módulo Lua que proporciona acceso a la API pública de Neovim. Funciones como `nvim_create_autocmd`, `nvim_create_user_command`, `nvim_buf_get_lines`, etc.

### vim.bo (buffer option)
API para opciones buffer-local. `vim.bo.filetype`, `vim.bo.tabstop`, etc.

### vim.cmd()
Función Lua que ejecuta comandos Ex de Vimscript desde Lua.

```lua
vim.cmd("colorscheme onedark")
vim.cmd("write")
```

### vim.fn
Módulo Lua para llamar funciones built-in de Vimscript. Ej: `vim.fn.expand()`, `vim.fn.stdpath()`, `vim.fn.has()`.

### vim.g (global)
API para variables globales. `vim.g.mapleader`, `vim.g.netrw_banner`, etc.

### vim.keymap.set()
API moderna (Neovim 0.7+) para crear mapeos de teclas con soporte para descripciones, buffer-local, callbacks y más.

### vim.opt (options)
API para opciones de Vim que maneja automáticamente tipos booleanos, numéricos y strings.

### vim.wo (window option)
API para opciones window-local. `vim.wo.cursorline`, `vim.wo.spell`, etc.

### Vimscript
Lenguaje de scripting nativo de Vim. Reemplazado por Lua en Neovim para configuración, pero aún necesario para plugins legacy y scripts portables.

---

> 📖 **Tip**: La estructura `lua/core/{options,keymaps,autocmds}.lua` + `lua/util/init.lua` es el estándar de la comunidad para configuraciones modulares en Lua. Adoptarla te permitirá entender y compartir configuraciones con otros.
