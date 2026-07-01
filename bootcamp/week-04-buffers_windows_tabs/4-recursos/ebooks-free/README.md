# Ebooks Gratuitos — Semana 04

Buffers, ventanas, splits, pestañas y navegación de archivos con netrw.

---

## Imprescindibles esta semana

### Practical Vim (2nd Edition) — Capítulos 11-13
- **Autor**: Drew Neil
- **URL**: https://pragprog.com/titles/dnvim2/
- **Capítulos recomendados**:
  - **Ch. 11 (Manage Multiple Files)** — buffers, args y quickfix
  - Ch. 12 (Compile Code and Navigate Errors) — usa windows/buffers en flujo real
  - Ch. 13 (Convert a One-Off Command into a Repeatable Script) — contexto de arglist
- **Por qué**: Explica por qué Vim prefiere buffers a pestañas, con el argumento más convincente del libro.

### Learn Vim (the Smart Way) — Capítulos 10-12
- **Autor**: Igor Irianto (iggredible)
- **URL**: https://github.com/iggredible/Learn-Vim
- **Capítulos recomendados**:
  - Ch. 10 (Multiple Windows) — splits, redimensionar, cerrar
  - Ch. 11 (Multiple Tabs) — diferencia real con ventanas
  - **Ch. 17 (Netrw)** — capítulo completo dedicado al explorador nativo
- **Por qué**: Es de los pocos recursos gratuitos con un capítulo entero sobre netrw, en vez de mencionarlo de paso.

### Vim User Manual — Windows y Buffers
- **Autor**: Bram Moolenaar
- **URL**: https://vimhelp.org/usr_toc.txt.html
- **Secciones recomendadas**: `usr_08.txt` (Editing more than one file), `usr_07.txt` (Editing more than one file at a time — versiones antiguas), `usr_22.txt` (Finding the file to edit — cubre netrw)
- **Acceso desde Vim**: `:help usr_08`, `:help usr_22`

---

## Complementario

### `:help windows.txt`
- **URL**: https://vimhelp.org/windows.txt.html
- **Por qué**: Referencia técnica completa de `Ctrl-w`, resize, `:only`, `:close` y el layout de ventanas.

### `:help pi_netrw.txt`
- **URL**: https://vimhelp.org/pi_netrw.txt.html
- **Por qué**: Documentación oficial de netrw — todas las variables `g:netrw_*` para personalizar el explorador (ancho, vista en árbol, banner).

---

> Esta semana el objetivo es dejar de pensar en "archivos abiertos" y empezar a pensar en "buffers en memoria" + "layouts de ventanas". Ese cambio mental es más importante que memorizar comandos.
