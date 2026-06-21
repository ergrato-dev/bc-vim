# 📜 Ejercicio 04: Vimscript Legacy

## 🎯 Objetivo

Leer, entender y convertir Vimscript a Lua. Mantener scripts portables Vim+Neovim.

**Duración estimada:** 30 minutos

---

## 🎮 Ejercicios

### Ejercicio A: Leer Vimscript

Lee este fragmento e identifica qué hace cada línea:

```vim
" ¿Qué hace esto?
set number
set tabstop=4 shiftwidth=4
let g:my_var = 42
nnoremap <leader>s :w<CR>
autocmd BufWritePre *.lua :echo "guardando..."
```

Respuesta:
```text
set number                   → mostrar números de línea
set tabstop=4 shiftwidth=4   → tab = 4 espacios, indentación = 4
let g:my_var = 42            → variable global my_var con valor 42
nnoremap <leader>s :w<CR>    → <leader>s guarda archivo
autocmd BufWritePre *.lua    → antes de guardar .lua, muestra "guardando..."
```

### Ejercicio B: Convertir Vimscript a Lua

Convierte:

```vim
" Configuración de un plugin imaginario
let g:plugin_theme = "dark"
let g:plugin_auto_start = 1
let g:plugin_files = [".js", ".ts", ".jsx"]
nnoremap <leader>pt :PluginToggle<CR>
autocmd FileType javascript setlocal tabstop=2
```

Solución:
```lua
vim.g.plugin_theme = "dark"
vim.g.plugin_auto_start = true
vim.g.plugin_files = { ".js", ".ts", ".jsx" }
vim.keymap.set("n", "<leader>pt", "<cmd>PluginToggle<CR>")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function() vim.bo.tabstop = 2 end,
})
```

### Ejercicio C: Escribir Script Portable

Escribe un script que funcione en Vim y Neovim:

```vim
" ~/.vim/portable.vim
" Funciona en Vim clásico Y Neovim

" Opciones comunes
set number
set expandtab

" Detectar editor
if has("nvim")
  " Solo Neovim
  set inccommand=nosplit
else
  " Solo Vim
  set nocompatible
endif

" Mappings comunes
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Cargar configuración Lua si es Neovim
if has("nvim")
  lua << EOF
    vim.notify("Neovim detectado")
    -- más config Lua aquí
EOF
endif
```

### Ejercicio D: Llamar Lua desde Vimscript

```vim
" En un archivo .vim:
function! ActualizarPlugins()
  if has("nvim")
    lua require("lazy").sync()
  else
    PlugUpdate
  endif
endfunction

command! UpdatePlugins call ActualizarPlugins()
```

### Ejercicio E: Tabla de Conversión

Completa la tabla:

```text
Vimscript                    Lua
─────────────────────────────────────────
let g:x = 10                 vim.g.x = 10
set nu                       ?
nnoremap x :w<CR>            ?
call Func()                  ?
execute "echo 'hi'"          ?
autocmd BufWrite *.lua :w    ?
```

Respuesta:
```text
set nu                       vim.opt.number = true
nnoremap x :w<CR>            vim.keymap.set("n", "x", "<cmd>w<CR>")
call Func()                  vim.fn.Func()
execute "echo 'hi'"          vim.cmd("echo 'hi'")
autocmd BufWrite *.lua :w    nvim_create_autocmd(...)
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Lees configuraciones Vimscript sin dificultad? | | |
| ¿Conviertes set/let/nnoremap de Vimscript a Lua? | | |
| ¿Llamas Lua desde Vimscript con :lua o lua << EOF? | | |
| ¿Llamas funciones Vim desde Lua con vim.fn? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
