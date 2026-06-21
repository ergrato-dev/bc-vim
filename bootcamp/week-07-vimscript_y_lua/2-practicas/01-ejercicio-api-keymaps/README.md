# 📘 Ejercicio 01: API Lua y Keymaps

## 🎯 Objetivo

Dominar la API básica de Lua en Neovim y crear keymappings avanzados.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

Trabaja directamente en tu configuración de Neovim o en archivos de prueba.

---

## 🎮 Ejercicios

### Ejercicio A: Explorar la API con :lua

```text
1. :lua print(vim.opt.number:get())        → ¿está activado?
2. :lua print(vim.g.mapleader)             → ¿cuál es tu leader?
3. :lua print(vim.bo.filetype)             → tipo de archivo actual
4. :lua print(vim.fn.expand("%:p"))        → ruta completa
5. :lua print(vim.fn.stdpath("config"))    → dir de configuración
6. :lua print(vim.fn.executable("git"))    → ¿git instalado?
```

### Ejercicio B: Ámbitos de Opciones

```text
1. :lua vim.opt.number = true              → activa números
2. :lua vim.opt.number = false             → desactiva
3. :lua vim.bo.tabstop = 2                 → buffer-local: tab=2
4. :lua print(vim.bo.tabstop)              → verifica: 2
5. :lua vim.wo.cursorline = true           → window-local
6. :lua print(vim.wo.cursorline)           → verifica: true

7. Abre otro buffer (:e otro-archivo.lua)
8. :lua print(vim.bo.tabstop)              → ¿sigue siendo 2?
```

### Ejercicio C: Crear Keymaps desde :lua

```text
1. :lua vim.keymap.set("n", "<leader>tt", function()
     vim.notify("Hora: " .. os.date("%H:%M:%S"))
   end, { desc = "Mostrar hora" })

2. <leader>tt → debe mostrar notificación con la hora

3. :lua vim.keymap.set("n", "<leader>tw", function()
     vim.wo.wrap = not vim.wo.wrap
     vim.notify("Wrap: " .. tostring(vim.wo.wrap))
   end, { desc = "Toggle wrap" })

4. <leader>tw → toggle wrap on/off
```

### Ejercicio D: Convertir Vimscript a Lua

Convierte estas líneas Vimscript a Lua (en tu init.lua o en un archivo):

```vim
" Vimscript original:
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set background=dark
set clipboard=unnamedplus
set splitbelow
set splitright
let g:mapleader = " "
let g:maplocalleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap jj <Esc>
vnoremap <space>y "+y
```

Solución:
```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de Insert" })
vim.keymap.set("v", "<space>y", '"+y', { desc = "Copiar al sistema" })
```

### Ejercicio E: Keymap con Callback Avanzado

```lua
-- Toggle entre tema claro y oscuro
vim.keymap.set("n", "<leader>td", function()
  local current = vim.opt.background:get()
  if current == "dark" then
    vim.opt.background = "light"
    vim.notify("Tema claro", vim.log.levels.INFO)
  else
    vim.opt.background = "dark"
    vim.notify("Tema oscuro", vim.log.levels.INFO)
  end
end, { desc = "Toggle dark/light mode" })
```

### Ejercicio F: Keymap por Tipo de Archivo

```lua
-- En un archivo Lua:
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("luafile %")
  vim.notify("Archivo ejecutado")
end, { buffer = 0, desc = "Ejecutar archivo Lua" })

-- En archivo Python (crea un .py y pega):
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("!python3 %")
end, { buffer = 0, desc = "Ejecutar archivo Python" })
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Diferencia entre vim.opt, vim.g, vim.bo, vim.wo? | | |
| ¿Creaste keymaps con descripciones? | | |
| ¿Usaste callback en lugar de string para lógica? | | |
| ¿Convertiste Vimscript a Lua correctamente? | | |
| ¿Creaste keymap buffer-local? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Autocmds →](../02-ejercicio-autocmds/README.md)
