# Ebooks Gratuitos — Semana 09

Quickfix y grep, arglist y operaciones batch, sesiones y location list, búsqueda y reemplazo avanzados, y fugitive avanzado — el flujo de trabajo de refactorización multiarchivo completo.

---

## Imprescindibles esta semana

### Practical Vim (2nd Edition) — Capítulos 17-20
- **Autor**: Drew Neil
- **URL**: https://pragprog.com/titles/dnvim2/
- **Capítulos recomendados**: Quickfix, Arglist, Grep y Sessions — cubren exactamente los cinco temas de esta semana, desde `01-quickfix-y-grep.md` hasta `03-sesiones-y-location.md`
- **Por qué**: Es el único libro que trata la quickfix list, el arglist y las sesiones como un flujo de trabajo integrado, no como comandos aislados — la misma filosofía de `04-busqueda-y-reemplazo-avanzado.md`.

### Vim User Manual — Quickfix y Editing
- **Autor**: Bram Moolenaar
- **URL**: https://vimhelp.org/quickfix.txt.html
- **Secciones recomendadas**: `quickfix.txt` (quickfix list, location list, `:make`, `:grep`, `:vimgrep` — base de `01-quickfix-y-grep.md`), `editing.txt` (arglist y `:mksession` — base de `02-arglist-y-batch.md` y `03-sesiones-y-location.md`)
- **Acceso desde Vim**: `:help quickfix`, `:help arglist`, `:help mksession`
- **Por qué**: Es la referencia autoritativa para cada bandera de `:vimgrep` (`/g`, `/j`) y cada opción de `:cdo`/`:cfdo` que se usan en `04-busqueda-y-reemplazo-avanzado.md`.

### vim-fugitive — Documentación Completa
- **Autor**: Tim Pope
- **URL**: https://github.com/tpope/vim-fugitive
- **Por qué**: El README del plugin documenta `:Gclog`, `:Gdiffsplit` y el flujo de resolución de conflictos usado en `05-fugitive-avanzado.md` con más detalle que cualquier tutorial externo.

---

## Complementario

### Learn Vim (the Smart Way)
- **Autor**: Igor Irianto (iggredible)
- **URL**: https://github.com/iggredible/Learn-Vim
- **Por qué**: Cubre navegación multiarchivo y control de versiones con Vim desde una perspectiva moderna y gratuita — buen complemento a Practical Vim para reforzar `02-arglist-y-batch.md` y `05-fugitive-avanzado.md` con otro enfoque pedagógico.

### `:help pattern.txt` — Regex Avanzado
- **Autor**: Bram Moolenaar
- **URL**: https://vimhelp.org/pattern.txt.html
- **Por qué**: Referencia completa de "very magic" (`\v`), clases de caracteres y grupos de captura — necesaria para el regex avanzado de `04-busqueda-y-reemplazo-avanzado.md` más allá de los ejemplos básicos.

---

> Esta semana el libro y la documentación oficial se complementan directamente: Practical Vim explica el "por qué" del flujo quickfix → arglist → sesión, y `:help quickfix`/`:help fugitive` dan el detalle exacto de cada comando. Lee primero el capítulo, luego confirma la sintaxis con `:help`.
