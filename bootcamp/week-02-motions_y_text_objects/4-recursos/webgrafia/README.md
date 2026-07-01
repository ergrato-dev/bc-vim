# Webgrafía — Semana 02

Referencias web para motions avanzados, text objects y búsqueda.

---

## Referencia rápida

### Vim Cheat Sheet — Motions y Text Objects
- **URL**: https://vim.rtorr.com/
- **Esta semana**: Secciones "Cursor movement" (completo), "Search", "Editing" (text objects)
- **Uso**: Consultar cuando no recuerdes un comando. No memorizar — practicar hasta que fluya.

### `:help motion` (vimhelp.org)
- **URL**: https://vimhelp.org/motion.txt.html
- **Secciones de interés**:
  - `word-motions` — w/b/e/W/B/E
  - `object-select` — text objects (iw, i", i{, etc.)
  - `various-motions` — %, *, #, g*
- **Acceso desde Vim**: `:help motion`

### `:help f` y `:help t`
- **URL**: https://vimhelp.org/motion.txt.html#f
- **Acceso desde Vim**: `:help f`, `:help t`, `:help ;`, `:help ,`

---

## Artículos recomendados

### "Vim Text Objects: The Definitive Guide" (Jared Carroll)
- **URL**: https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/
- **Por qué**: El artículo de referencia sobre text objects. Cubre todos los casos de `i` vs `a` con ejemplos concretos. Leer después de `04-text-objects.md`.

### "Your problem with Vim is that you don't grok vi" (revisitar)
- **URL**: https://stackoverflow.com/a/1220118
- **Por qué**: Si lo leíste la semana 1, reléelo ahora. Tiene otro significado después de entender text objects y el paradigma verbo+sustantivo.

### "Vim: Seven habits of effective text editing" — Habits 1-3
- **URL**: https://www.moolenaar.net/habits.html
- **Por qué**: Los hábitos 1-3 de Bram Moolenaar son exactamente lo que esta semana enseña: editar sin ratón, moverte a donde quieres, operar en text objects.

---

## Herramientas interactivas

### Vim Golf — desafíos de motions
- **URL**: https://www.vimgolf.com
- **Esta semana**: Busca desafíos que involucren `f`/`t`, text objects (`ci"`, `da{`) y búsqueda (`/`, `*`).
- **Estrategia**: Resuelve el desafío con tu solución primero, luego mira las soluciones ganadoras para aprender combinaciones que no conocías.

### Interactive Vim Tutorial (openvim.com) — niveles 2-3
- **URL**: https://www.openvim.com/tutorial.html
- **Esta semana**: Los niveles que cubren words, búsqueda y edición avanzada.

### Vim Genius
- **URL**: http://www.vimgenius.com/
- **Qué es**: Flashcards interactivas de comandos Vim. Útil para memorizar text objects.
- **Esta semana**: Categorías "Motions" y "Text Objects".

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-----------------|---------|
| r/vim | busca "text objects beginner" | Miles de variantes de `ci"` y trucos |
| r/neovim | busca "treesitter textobjects" | Preview de week-06: text objects basados en AST |
| Hacker News | busca "vim language" | Debates filosóficos sobre la gramática de Vim |

---

> Esta semana: una hora en VimGolf > dos horas leyendo. Los text objects solo se aprenden usándolos en código real.
