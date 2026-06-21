# 📚 Glosario General — Bootcamp Vim Zero to Hero

## Conceptos Fundamentales por Semana

### Semana 1: Fundamentos de Vim
- **Modo Normal/Insert/Visual/Command-line**: Los 4 modos de edición
- **hjkl**: Movimiento en fila home
- **w, b, e**: Movimiento por palabras
- **dd, yy, p**: Eliminar, copiar, pegar líneas

### Semana 2: Motions y Text Objects
- **f{char}, t{char}**: Búsqueda en línea
- **ci", di{, ya[**: Operador + text object
- **iw vs aw**: Inside vs Around
- **Vim como lenguaje**: Verbo + Sustantivo

### Semana 3: Edición Eficiente
- **. (dot)**: Repetir último cambio
- **Visual block (Ctrl-v)**: Selección rectangular
- **Marcas (m{a-z})**: Bookmarks en archivos
- **:s, :%s, :g**: Sustituciones

### Semana 4: Buffers, Ventanas y Pestañas
- **Buffer**: Archivo en memoria
- **Window**: Vista de un buffer
- **Tab**: Colección de ventanas (layout)
- **:ls, :b, Ctrl-6**: Gestión de buffers

### Semana 5: Registros y Macros
- **Registros ("a-"z)**: Almacenamiento múltiple
- **"0**: Registro de yank (protege copias)
- **Macros (qa...q)**: Grabación de comandos
- **@@**: Repetir última macro

### Semana 6: Plugins y Ecosistema
- **lazy.nvim**: Gestor de plugins moderno
- **telescope.nvim**: Fuzzy finder
- **neo-tree**: File tree
- **lualine.nvim**: Statusline
- **gitsigns.nvim**: Git en gutter

### Semana 7: Vimscript y Lua
- **vim.opt, vim.g, vim.bo, vim.wo**: API de opciones
- **vim.keymap.set()**: API moderna de mappings
- **nvim_create_autocmd**: Autocomandos en Lua
- **Augroup**: Agrupar autocmds para evitar duplicados

### Semana 8: Vim como IDE
- **LSP**: Language Server Protocol
- **mason.nvim**: Gestor de LSP servers
- **nvim-cmp**: Motor de autocompletado
- **Treesitter**: Parsing semántico
- **nvim-dap**: Debug Adapter Protocol
- **LuaSnip**: Motor de snippets

### Semana 9: Flujos Avanzados
- **Quickfix list**: Lista global de posiciones
- **Location list**: Lista por ventana
- **:vimgrep, :grep**: Búsqueda multiarchivo
- **:argdo, :cfdo, :bufdo**: Procesamiento batch
- **:mksession**: Guardar estado de Vim
- **Fugitive**: Git wrapper completo

### Semana 10: Proyecto Final
- **Dotfiles**: Archivos de configuración versionados
- **README**: Documentación de proyecto
- **Demo**: Presentación de configuración
- **Comunidad**: r/neovim, Discourse, GitHub

---

## Comandos Esenciales (Top 20)

| Comando | Acción | Semana |
|---------|--------|--------|
| `ci"` | Cambiar dentro de comillas | 2 |
| `.` | Repetir último cambio | 3 |
| `*` | Buscar palabra bajo cursor | 2 |
| `%` | Saltar al par correspondiente | 2 |
| `Ctrl-v I` | Insertar en bloque | 3 |
| `dap` | Eliminar párrafo | 2 |
| `K` | Documentación (hover LSP) | 8 |
| `gd` | Ir a definición | 8 |
| `q a ... q @a` | Grabar y ejecutar macro | 5 |
| `:vimgrep /pat/gj **/*` | Buscar en proyecto | 9 |
| `:copen` | Abrir quickfix | 9 |
| `:cfdo %s/old/new/g` | Reemplazar en batch | 9 |
| `<leader>ff` | Buscar archivos (telescope) | 6 |
| `<leader>fg` | Buscar texto (live grep) | 6 |
| `]d / [d` | Navegar errores LSP | 8 |
| `:Lazy sync` | Instalar/actualizar plugins | 6 |
| `:Mason` | Gestionar LSP servers | 8 |
| `gcc` | Comentar/descomentar línea | 6 |
| `Ctrl-hjkl` | Navegar splits | 4 |
| `"0p` | Pegar última copia | 5 |

---

> 📖 **Tip**: Este glosario es tu referencia rápida. Guárdalo, compártelo, y sobre todo: PRACTICA. La única forma de dominar Vim es usándolo todos los días.
