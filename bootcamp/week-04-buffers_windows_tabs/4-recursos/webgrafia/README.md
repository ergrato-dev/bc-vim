# Webgrafía — Semana 04

Referencias web para buffers, ventanas, splits, pestañas y netrw.

---

## Referencia rápida

### Vim Buffer Management Cheatsheet
- **URL**: https://devhints.io/vim#buffers
- **Esta semana**: Referencia rápida de `:ls`, `:bn`/`:bp`, `:bd`, `:b {nombre}`
- **Uso**: Consultar cuando no recuerdes el comando exacto para saltar entre buffers.

### `:help windows` (vimhelp.org)
- **URL**: https://vimhelp.org/windows.txt.html
- **Secciones de interés**: `CTRL-W` (todos los sub-comandos), `:resize`, `:only`, `window-moving`
- **Acceso desde Vim**: `:help windows`, `:help CTRL-W`

### `:help tabpage` (vimhelp.org)
- **URL**: https://vimhelp.org/tabpage.txt.html
- **Secciones de interés**: `:tabnew`, `:tabclose`, `gt`/`gT`, `:tabmove`
- **Acceso desde Vim**: `:help tab-page-commands`

### `:help netrw` (vimhelp.org)
- **URL**: https://vimhelp.org/pi_netrw.txt.html
- **Acceso desde Vim**: `:help netrw-browse-cmds` (lista completa de teclas dentro del explorador)

---

## Artículos recomendados

### How to Use netrw
- **URL**: https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
- **Por qué**: La guía más completa y actualizada de netrw en español/inglés accesible — cubre configuración (`g:netrw_banner`, `g:netrw_liststyle`) que la documentación oficial no explica con la misma claridad.

### Vim Tips Wiki: Buffer FAQ
- **URL**: https://vim.fandom.com/wiki/Vim_buffer_FAQ
- **Por qué**: Responde las preguntas más comunes sobre buffers ocultos, `hidden`, y por qué Vim se queja al cambiar de buffer sin guardar.

### Vim Sessions Guide
- **URL**: https://vim.fandom.com/wiki/Go_away_and_come_back
- **Por qué**: Extiende el tema de la semana — cómo guardar y restaurar un layout completo de ventanas/pestañas/buffers con `:mksession`.

---

## Herramientas y referencias interactivas

### Netrw Cheatsheet
- **URL**: https://gist.github.com/t-mart/4d1b31b8e3e1dda93eb7d3b4416cb470
- **Por qué**: Lista compacta de todas las teclas de netrw (`%`, `d`, `R`, `D`, `mf`, `mc`) sin tener que leer `:help netrw-browse-cmds` completo.

### Vim Cheat Sheet — Windows
- **URL**: https://vim.rtorr.com/
- **Esta semana**: Sección "Working with multiple files"

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| r/vim | busca "buffers vs tabs workflow" | El debate recurrente sobre por qué la comunidad Vim prefiere buffers |
| r/neovim | busca "netrw vs telescope vs oil.nvim" | Preview de semana 06: cuándo SÍ conviene un plugin de exploración de archivos |
| Vi and Vim Stack Exchange | busca "restore window layout session" | Casos reales de `:mksession` y `:mkview` |

---

> Esta semana: si terminas dependiendo de `Ctrl-w hjkl` con mappings propios en vez de la combinación de 2 teclas nativa, vas por buen camino.
