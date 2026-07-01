# Ebooks Gratuitos — Semana 05

Registros, portapapeles del sistema, macros (grabación, edición, batch) y flujos avanzados.

---

## Imprescindibles esta semana

### Practical Vim (2nd Edition) — Capítulos 9-10 y 14-16
- **Autor**: Drew Neil
- **URL**: https://pragprog.com/titles/dnvim2/
- **Capítulos recomendados**:
  - **Ch. 9-10 (Macros)** — grabar, ejecutar y depurar macros; el núcleo de esta semana
  - Ch. 14-16 (Registers) — registro sin nombre, numerados, con nombre y de expresión
- **Por qué**: Es el mismo libro de referencia de semanas anteriores, pero aquí llega a los capítulos que justifican por qué existe: automatizar ediciones repetitivas sin salir de Normal mode.

### Learn Vim (the Smart Way) — Capítulos 13-15
- **Autor**: Igor Irianto (iggredible)
- **URL**: https://github.com/iggredible/Learn-Vim
- **Capítulos recomendados**:
  - Ch. 13 (Registers) — todos los tipos de registro con ejemplos
  - **Ch. 14 (Macros)** — grabación, edición y macros recursivas
  - Ch. 15 (Global command) — combina `:g` con macros para batch processing
- **Por qué**: Complementa Practical Vim con el capítulo de macros recursivas más claro de los dos libros.

### Vim User Manual y Reference — Registros y Macros
- **Autor**: Bram Moolenaar
- **URL**: https://vimhelp.org/usr_toc.txt.html
- **Secciones recomendadas**: `:help registers` (`change.txt#registers`) y `:help complex-repeat` (`repeat.txt#complex-repeat`)
- **Acceso desde Vim**: `:help registers`, `:help complex-repeat`, `:help q`
- **Por qué**: Documentación oficial y autoritativa — la que consultas cuando una macro no hace lo que esperabas.

---

## Complementario

### `:help change.txt` (sección de registros)
- **URL**: https://vimhelp.org/change.txt.html#registers
- **Por qué**: Referencia técnica completa de todos los registros especiales (`"%`, `"#`, `".`, `":`, `"/`, `"-`, `"=`) que aparecen en `01-registros.md` y `02-registro-sistema.md`.

### `:help repeat.txt` (sección de macros)
- **URL**: https://vimhelp.org/repeat.txt.html#complex-repeat
- **Por qué**: Documentación oficial de `q`, `@`, `@@` y `:normal` — la fuente primaria para resolver dudas sobre macros recursivas y aplicación en lote.

---

> Esta semana los ebooks son soporte, no punto de partida. Graba tu primera macro real antes de leer el capítulo completo — el libro tiene mucho más sentido después de haber sentido el problema que resuelve.
