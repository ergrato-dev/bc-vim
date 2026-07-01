# Ebooks Gratuitos — Semana 06

Gestores de plugins, configuración modular, fuzzy finder, git integrado y optimización — el ecosistema de plugins de Neovim.

---

## Imprescindibles esta semana

### Neovim User Documentation
- **Autor**: Neovim Core Team
- **URL**: https://neovim.io/doc/user/
- **Secciones recomendadas**: Lua Guide (`lua-guide.html`) y API Reference (`api.html`) — la base para entender cómo los plugins de esta semana se integran con Neovim
- **Por qué**: Es la referencia oficial y autoritativa del proyecto — necesaria para leer los `opts`/`config` de cualquier spec de plugin con criterio, no solo copiando ejemplos.

### LazyVim — Documentación de la Distribución
- **URL**: https://www.lazyvim.org
- **Por qué**: LazyVim es una distribución completa construida sobre lazy.nvim que expone —documentada y comentada— la misma estructura modular (`lua/plugins/*.lua`) que enseña `02-configuracion-modular-lazy.md`. Léela como referencia de arquitectura, no para copiar la configuración completa.

### lazy.nvim — README y Documentación
- **Autor**: Folke Lemaitre
- **URL**: https://github.com/folke/lazy.nvim
- **Por qué**: El README documenta cada opción de spec (`event`, `keys`, `cmd`, `ft`, `opts`, `dependencies`) con más detalle que cualquier tutorial de terceros — es la fuente primaria de `01-gestores-de-plugins.md` y `02-configuracion-modular-lazy.md`.

---

## Complementario

### telescope.nvim — Documentación
- **URL**: https://github.com/nvim-telescope/telescope.nvim
- **Por qué**: Lista completa de pickers (`find_files`, `live_grep`, `lsp_references`, etc.) más allá de los cubiertos en `03-fuzzy-finder-y-file-tree.md`.

### gitsigns.nvim — Documentación
- **URL**: https://github.com/lewis6991/gitsigns.nvim
- **Por qué**: Referencia completa de las opciones de `opts` (signos, blame, word_diff) usadas en `04-git-y-statusline.md`.

### which-key.nvim — Documentación
- **URL**: https://github.com/folke/which-key.nvim
- **Por qué**: Detalla los `preset` (`classic`, `modern`, `helix`) y la sintaxis de `spec` con grupos, referenciados en `05-temas-y-optimizacion.md`.

---

> Esta semana el "libro de texto" es el propio código fuente de los plugins: el README de cada repo suele documentar mejor su plugin que cualquier tutorial de terceros, porque lo mantiene quien escribió el código. Acostúmbrate a leer `:help <plugin>` y el README antes de buscar en otro lado.
