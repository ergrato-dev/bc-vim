# Ebooks Gratuitos — Semana 08

LSP y mason.nvim, autocompletado con nvim-cmp, Treesitter, debugging con nvim-dap y terminal integrado con snippets — todo lo necesario para convertir Neovim en un IDE completo.

---

## Imprescindibles esta semana

### Neovim User Documentation
- **Autor**: Neovim Core Team
- **URL**: https://neovim.io/doc/user/
- **Secciones recomendadas**: `lsp.txt` (`:help lsp`) y `treesitter.txt` (`:help treesitter`) — cubren la arquitectura cliente-servidor de `01-lsp-mason.md` y los conceptos de AST de `03-treesitter.md`
- **Por qué**: Es la referencia oficial y autoritativa del proyecto — necesaria para entender `vim.lsp.buf.*`, `vim.diagnostic.*` y las opciones de Treesitter con criterio, no solo copiando ejemplos.

### Language Server Protocol Specification
- **Autor**: Microsoft
- **URL**: https://microsoft.github.io/language-server-protocol/specification-current
- **Por qué**: La especificación completa del protocolo detrás de todo lo visto en `01-lsp-mason.md` — entender qué es una petición `textDocument/definition` o `textDocument/completion` ayuda a diagnosticar problemas de LSP que van más allá de la configuración de Neovim.

### Practical Vim (2nd Edition) — Capítulos sobre edición asistida
- **Autor**: Drew Neil
- **URL**: https://pragprog.com/titles/dnvim2/
- **Por qué**: Aunque el libro es anterior a LSP/Treesitter en Neovim, sus capítulos sobre autocompletado y refactorización manual ayudan a entender qué problemas resuelven ahora `nvim-cmp` (`02-autocompletado-cmp.md`) y las herramientas de rename/code action del LSP.

---

## Complementario

### Lua 5.1 Reference Manual
- **Autor**: Roberto Ierusalimschy et al.
- **URL**: https://www.lua.org/manual/5.1/
- **Por qué**: Los snippets de LuaSnip (`05-terminal-y-snippets.md`) y las configuraciones de `dap.adapters`/`dap.configurations` (`04-dap-debugging.md`) son tablas y funciones Lua puras — esta referencia aclara la sintaxis base cuando la documentación del plugin no alcanza.

### kickstart.nvim
- **Autor**: Neovim Community (TJ DeVries et al.)
- **URL**: https://github.com/nvim-lua/kickstart.nvim
- **Por qué**: Configuración de referencia en un solo `init.lua` que ya integra `nvim-lspconfig`, `mason.nvim`, `nvim-cmp` y Treesitter juntos — útil para ver cómo encajan las piezas de esta semana en un ejemplo real y comentado.

---

> Esta semana la documentación "de libro" es más escasa que en semanas anteriores — LSP, Treesitter y DAP evolucionan rápido y su mejor referencia suele ser la documentación oficial de cada plugin (`:help`, wikis de GitHub) más que un ebook estático. Prioriza `:help lsp`, `:help treesitter` y los wikis de los plugins antes que fuentes desactualizadas.
