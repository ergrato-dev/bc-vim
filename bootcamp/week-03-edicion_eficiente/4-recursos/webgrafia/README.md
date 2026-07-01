# Webgrafía — Semana 03

Referencias web para el dot command, Visual mode, marcas, sustituciones y filtros de shell.

---

## Referencia rápida

### Vim Cheat Sheet — Editing y Command Mode
- **URL**: https://vim.rtorr.com/
- **Esta semana**: Secciones "Editing" (`.`, `gu`, `gU`), "Visual mode" y "Search and replace" (`:s`, `:g`)
- **Uso**: Consultar cuando no recuerdes la sintaxis exacta de un flag de `:s`. No memorizar — practicar hasta que fluya.

### `:help change` (vimhelp.org)
- **URL**: https://vimhelp.org/change.txt.html
- **Secciones de interés**:
  - `single-repeat` — documentación oficial del comando `.`
  - `:substitute` — sintaxis completa de `:s` con todos los flags
  - `:global` — comando `:g` y su inverso `:v`
- **Acceso desde Vim**: `:help .`, `:help :s`, `:help :g`

### `:help visual` (vimhelp.org)
- **URL**: https://vimhelp.org/visual.txt.html
- **Secciones de interés**: `v_b_I` y `v_b_A` (insert/append en Visual block), `gv`, `o`
- **Acceso desde Vim**: `:help visual-block`, `:help v_b_I`

### `:help mark` (vimhelp.org)
- **URL**: https://vimhelp.org/motion.txt.html#mark-motions
- **Acceso desde Vim**: `:help mark-motions`, `:help :marks`

### Vim Regex Reference
- **URL**: https://vimhelp.org/pattern.txt.html
- **Esta semana**: Imprescindible para `:s` y `:g` — repasa `\v` (very magic), `\<`/`\>` (anclas de palabra) y clases de carácter (`\s`, `\d`, `\w`)

---

## Artículos recomendados

### "Vim: Seven habits of effective text editing" — Hábito 4 y 5
- **Autor**: Bram Moolenaar (creador de Vim)
- **URL**: https://www.moolenaar.net/habits.html
- **Por qué**: Los hábitos 4 (`.` y macros) y 5 (comandos globales) son exactamente el contenido de esta semana, explicado por el propio creador del editor.

### "Your problem with Vim is that you don't grok vi" — revisitar
- **URL**: https://stackoverflow.com/a/1220118
- **Por qué**: Tercera vez que aparece en el bootcamp. Ahora que conoces `.`, `:g` y filtros, la respuesta se lee distinto: verás por qué Vim se diseñó como "lenguaje", no como editor con atajos.

### Markdown Tables Generator
- **URL**: https://www.tablesgenerator.com/markdown_tables
- **Por qué**: Útil para verificar que la tabla que formatees a mano con Visual block en el proyecto semanal tenga el formato markdown correcto.

---

## Herramientas interactivas

### VimGolf — desafíos de la categoría "substitute" y "repeat"
- **URL**: https://www.vimgolf.com
- **Esta semana**: Busca desafíos que se resuelvan con `.`, `:s`/`:g` o Visual block — son los más comunes en la plataforma.
- **Estrategia**: Resuelve primero con tu propia solución, luego compara con las soluciones ganadoras (muchas usan `.` de formas que no esperarías).

### Vim Adventures
- **URL**: https://vim-adventures.com
- **Esta semana**: Los niveles que introducen macros y repetición refuerzan la mentalidad de "cambio repetible" del dot command.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| r/vim | busca "dot command tips" | Trucos avanzados de `.` que no están en ningún manual |
| r/vim | busca ":g command examples" | Casos de uso reales de `:g` para refactors masivos |
| Vi and Vim Stack Exchange | busca "visual block insert" | Preguntas resueltas sobre `I`/`A` en Visual block y casos límite |

---

> Esta semana: el hábito 4 de Bram Moolenaar resume todo — "use `.` whenever possible". Léelo, y luego practica hasta que sea automático.
