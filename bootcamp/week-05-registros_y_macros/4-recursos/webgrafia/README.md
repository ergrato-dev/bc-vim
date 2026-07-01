# Webgrafía — Semana 05

Referencias web para registros, portapapeles del sistema, macros y flujos de automatización.

---

## Referencia rápida

### Vim Cheat Sheet — Registers y Macros
- **URL**: https://vim.rtorr.com/
- **Esta semana**: Secciones "Macros" y "Marks and Registers"
- **Uso**: Consultar la sintaxis exacta de `q{reg}`, `@{reg}`, `"{reg}y{motion}` cuando la memoria falla a mitad de una grabación.

### Vim Cheat Sheet — Registers (devhints)
- **URL**: https://devhints.io/vim#registers
- **Esta semana**: Tabla compacta de los registros especiales (`"0`-`"9`, `"a`-`"z`, `"+`, `"*`, `"%`, `".`)
- **Uso**: Referencia visual rápida mientras practicas `01-registros.md` y `02-registro-sistema.md`.

### `:help registers` (vimhelp.org)
- **URL**: https://vimhelp.org/change.txt.html#registers
- **Secciones de interés**: `quote_0`, `quote_number`, `quote_plus`, `quote_star`, `quote-alpha`
- **Acceso desde Vim**: `:help registers`, `:help quote0`, `:help quote+`

### `:help complex-repeat` (vimhelp.org)
- **URL**: https://vimhelp.org/repeat.txt.html#complex-repeat
- **Secciones de interés**: `q`, `@`, `@:`, `:normal`
- **Acceso desde Vim**: `:help q`, `:help @`, `:help :normal`

---

## Artículos recomendados

### "Vim: Seven habits of effective text editing" — Hábito 4
- **Autor**: Bram Moolenaar (creador de Vim)
- **URL**: https://www.moolenaar.net/habits.html
- **Por qué**: El hábito 4 ("use the `.` command and macros") es el argumento original del creador de Vim para automatizar ediciones repetitivas — la idea central de toda esta semana.

### "Your problem with Vim is that you don't grok vi" — revisitar
- **URL**: https://stackoverflow.com/a/1220118
- **Por qué**: Con registros y macros dominados, esta respuesta se lee de nuevo distinto: Vim como "lenguaje" que puedes grabar y reproducir, no solo atajos de teclado.

### Vim Tips Wiki: Using Registers
- **URL**: https://vim.fandom.com/wiki/Using_registers
- **Por qué**: FAQ con casos límite de registros (por qué `""` a veces no tiene lo que esperas, diferencia entre `"0` y `""` tras un delete).

### Vim Tips Wiki: Macros
- **URL**: https://vim.fandom.com/wiki/Macros
- **Por qué**: Ejemplos adicionales de macros recursivas y de macros aplicadas con `:g`, complementando `04-macros-edicion-batch.md`.

---

## Herramientas interactivas

### VimGolf — desafíos de macros
- **URL**: https://www.vimgolf.com
- **Esta semana**: Busca desafíos donde la solución ganadora usa `q{reg}` + `@{reg}` — son de los retos más instructivos de la plataforma para ver macros "elegantes".
- **Estrategia**: Resuelve primero grabando tu propia macro, luego compara con las soluciones top — verás formas de posicionamiento que no se te ocurrirían.

### Vim Adventures
- **URL**: https://vim-adventures.com
- **Esta semana**: Los niveles avanzados que premian repetición son un buen calentamiento mental antes de grabar macros reales.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| r/vim | busca "macro tips and tricks" | Macros no obvias que resuelven casos reales de refactor |
| r/vim | busca "registers explained" | Discusiones sobre los registros menos conocidos (`"=`, `".`, `"-`) |
| Vi and Vim Stack Exchange | busca "recursive macro" | Preguntas resueltas sobre macros recursivas que se detienen solas |

---

> Esta semana: el hábito 4 de Bram Moolenaar resume el objetivo — deja que Vim repita el trabajo mecánico mientras tú piensas en el problema.
