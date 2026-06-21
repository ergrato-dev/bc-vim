# 📜 Vimscript para Mantenimiento Legacy

## 🎯 Objetivos

- Leer y entender configuraciones en Vimscript
- Escribir Vimscript básico para scripts portables
- Interoperar entre Vimscript y Lua
- Mantener compatibilidad con plugins escritos en Vimscript

---

## 📋 Contenido

### 1. ¿Por Qué Aprender Vimscript en 2026?

```text
Razones prácticas:
1. Plugins legacy escritos en Vimscript (fugitive, vim-surround...)
2. Configuraciones de servidores (solo Vim, sin Neovim)
3. Compartir scripts con usuarios de Vim clásico
4. Entender dotfiles antiguos de la comunidad
5. Vimscript sigue siendo el lenguaje de comandos Ex (:)
```

**No necesitas ser experto.** Solo lo suficiente para leer y modificar.

---

### 2. Sintaxis Básica

```vim
" Comentarios con comillas dobles

" Variables
let g:mi_variable = "hola"
let s:local = 42           " script-local (s:)
let b:buffer_local = true  " buffer-local (b:)

" Opciones
set number
set relativenumber
set tabstop=4
set expandtab
set background=dark

" Condicionales
if has("nvim")
  set termguicolors
else
  set notermguicolors
endif

" Funciones
function! MiFuncion()
  echo "Hola desde Vimscript"
  return 42
endfunction

" Llamar función
call MiFuncion()
echo MiFuncion()
```

---

### 3. Equivalencias Vimscript ↔ Lua

```text
┌───────────────────────────┬──────────────────────────────┐
│ Vimscript                 │ Lua                          │
├───────────────────────────┼──────────────────────────────┤
│ set number                │ vim.opt.number = true        │
│ set tabstop=4             │ vim.opt.tabstop = 4          │
│ let g:mapleader = " "     │ vim.g.mapleader = " "        │
│ let b:myvar = 10          │ vim.b.myvar = 10             │
│ echo "hello"              │ print("hello")               │
│ echom "hello"             │ vim.notify("hello")          │
│ execute "w"               │ vim.cmd("w")                 │
│ call Func()               │ vim.fn.Func()                │
│ nnoremap <leader>w :w<CR> │ vim.keymap.set("n",...)      │
│ autocmd BufWrite *.lua :w │ nvim_create_autocmd(...)     │
│ command! Greet echo "hi"  │ nvim_create_user_command(...)│
└───────────────────────────┴──────────────────────────────┘
```

---

### 4. Modos de Mapeo en Vimscript

```vim
" Normal mode
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Insert mode
inoremap jj <Esc>
inoremap jk <Esc>

" Visual mode
vnoremap <space>y "+y

" Command-line mode
cnoremap <C-a> <Home>

" noremap = non-recursive (SIEMPRE usar)
" map = recursive (EVITAR)
```

---

### 5. Autocomandos en Vimscript

```vim
" Crear augroup (siempre)
augroup MiConfig
  autocmd!
  " autocmd! limpia el grupo primero (evita duplicados)

  " Restaurar posición al abrir
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Formatear al guardar (Neovim con LSP)
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()

augroup END
```

---

### 6. Variables y Scopes

```vim
" Scope de variables en Vimscript
let g:name = "global"     " g: = global
let s:name = "script"     " s: = script-local
let l:name = "local"      " l: = local a función
let a:name = "argument"   " a: = argumento de función
let b:name = "buffer"     " b: = buffer-local
let w:name = "window"     " w: = window-local
let t:name = "tab"        " t: = tab-local

" Sin prefijo → global (DENTRO de función es local)
let name = "global implícito"  " fuera de función = g:
                                " dentro de función = l:
```

---

### 7. Funciones en Vimscript

```vim
" Función básica
function! Saludar(nombre)
  echo "Hola, " . a:nombre . "!"
endfunction

" Función con rango
function! ContarPalabras() range
  let total = 0
  for i in range(a:firstline, a:lastline)
    let total += len(split(getline(i)))
  endfor
  echo total . " palabras"
endfunction

" La '!' después de function permite redefinir sin error
" Los argumentos se acceden con a:
" El rango se accede con a:firstline, a:lastline
```

---

### 8. Interoperar Vimscript y Lua

**Llamar Vimscript desde Lua**:
```lua
-- Ejecutar Ex commands
vim.cmd("set number")
vim.cmd([[
  highlight MyGroup guifg=#ff0000
]])

-- Llamar funciones Vim
local result = vim.fn.expand("%:p")
local exists = vim.fn.filereadable("config.lua") == 1

-- Evaluar expresión Vim
local val = vim.api.nvim_eval("g:mi_variable")
```

**Llamar Lua desde Vimscript**:
```vim
" Ejecutar chunk Lua
:lua print("hola desde Lua")
:lua require("util").find_todos()

" En autocmd o mapping
:autocmd BufWritePre *.lua lua vim.lsp.buf.format()
:nnoremap <leader>r <cmd>lua require("util").reload_config()<CR>

" En función Vimscript
function! MiFuncionLua()
  lua << EOF
    local util = require("util")
    util.show_startup_time()
EOF
endfunction
```

---

### 9. Scripts Portables (Vim + Neovim)

```vim
" ~/.vim/config.vim — funciona en Vim y Neovim

" Detectar editor
if has("nvim")
  " Config específica de Neovim
  lua << EOF
    vim.opt.inccommand = "nosplit"
EOF
else
  " Config para Vim clásico
  set inccommand=nosplit
endif

" Común a ambos
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
```

---

### 10. Migrar de Vimscript a Lua

**Antes (Vimscript)**:
```vim
set number
set relativenumber
set expandtab tabstop=4 shiftwidth=4
let g:mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap jj <Esc>
```

**Después (Lua)**:
```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Salir de Insert" })
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ VIMSCRIPT LEGACY                                         │
│                                                           │
│ USO: plugins legacy, servidores, scripts portables       │
│                                                           │
│ CLAVES:                                                   │
│   set → vim.opt                                          │
│   let → vim.g / vim.b / vim.w / vim.env                 │
│   nnoremap → vim.keymap.set("n", ...)                    │
│   autocmd → nvim_create_autocmd                          │
│   command → nvim_create_user_command                     │
│   function → function() ... end                          │
│                                                           │
│ INTEROP:                                                  │
│   Lua → Vim: vim.cmd(), vim.fn.Func()                   │
│   Vim → Lua: :lua, :luafile, lua << EOF                 │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Leo y entiendo configuraciones en Vimscript
- [ ] Diferencio `set`, `let`, `nnoremap`, `autocmd` en Vimscript
- [ ] Convierto Vimscript simple a Lua
- [ ] Llamo Lua desde Vimscript (`:lua`, `<cmd>lua`)
- [ ] Llamo funciones Vim desde Lua (`vim.fn`)

---

## 🎮 Ejercicio Rápido

Convierte estas líneas Vimscript a Lua:

```vim
set number relativenumber
set tabstop=4 shiftwidth=4 expandtab
let g:mapleader = " "
nnoremap <leader>w :w<CR>
inoremap jk <Esc>
autocmd BufWritePre *.lua lua vim.lsp.buf.format()
```

Solución:
```lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function() vim.lsp.buf.format() end,
})
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
