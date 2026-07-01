# Webgrafía — Semana 09

Referencias web para quickfix, arglist, sesiones, búsqueda/reemplazo avanzados y fugitive.

---

## Referencia rápida

### `:help quickfix` (vimhelp.org)
- **URL**: https://vimhelp.org/quickfix.txt.html
- **Esta semana**: Quickfix list, location list, `:make`, `:grep`, `:vimgrep`, `:cdo`, `:cfdo` — la base completa de `01-quickfix-y-grep.md`, `03-sesiones-y-location.md` y `04-busqueda-y-reemplazo-avanzado.md`

### `:help editing.txt` (vimhelp.org)
- **URL**: https://vimhelp.org/editing.txt.html
- **Esta semana**: Arglist (`:args`, `:argdo`, `:next`), sesiones (`:mksession`) — referencia directa de `02-arglist-y-batch.md` y `03-sesiones-y-location.md`

### `:help pattern.txt` — Regex Avanzado (vimhelp.org)
- **URL**: https://vimhelp.org/pattern.txt.html
- **Esta semana**: "very magic" (`\v`), grupos de captura y clases de caracteres usados en `04-busqueda-y-reemplazo-avanzado.md`

### vim-fugitive (GitHub)
- **URL**: https://github.com/tpope/vim-fugitive
- **Esta semana**: `:Gstatus`, `:Gdiffsplit`, `:Gclog`, `:Gblame` y el flujo de merge conflicts de `05-fugitive-avanzado.md`

---

## Artículos y guías recomendadas

### Vimcasts: The Fugitive Series
- **URL**: http://vimcasts.org/blog/2011/05/the-fugitive-series/
- **Por qué**: Cinco screencasts cortos del propio autor del plugin — el mejor punto de entrada visual antes de leer el README completo, refuerza `05-fugitive-avanzado.md`.

### Vim Tips: Search and Replace
- **URL**: https://vim.fandom.com/wiki/Search_and_replace
- **Por qué**: Recetas de sustitución (`:s`, `:g`, `:v`) con ejemplos concretos, complementa el flujo de confirmación (`/gc`) de `04-busqueda-y-reemplazo-avanzado.md`.

### ripgrep (GitHub)
- **URL**: https://github.com/BurntSushi/ripgrep
- **Por qué**: El backend recomendado para `:grep` en proyectos grandes — mucho más rápido que grep tradicional y respeta `.gitignore` por defecto, relevante para `01-quickfix-y-grep.md`.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| [Neovim Discourse](https://neovim.discourse.group) | busca "quickfix" o "fugitive" | Foro oficial — dudas de configuración de quickfix, arglist y fugitive resueltas por mantenedores y usuarios avanzados |
| [r/vim](https://reddit.com/r/vim) | busca "refactoring workflow" | Comunidad activa con hilos sobre flujos de refactorización multiarchivo con quickfix/arglist |

---

> Esta semana combina documentación oficial de Vim (`vimhelp.org`) para quickfix, arglist y sesiones, con la documentación del plugin (`vim-fugitive` en GitHub) para el control de versiones — el mismo patrón de saltar entre fuentes que ya viste con Vimscript/Lua en la semana 07.
