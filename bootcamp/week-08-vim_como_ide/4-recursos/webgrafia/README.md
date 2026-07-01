# Webgrafía — Semana 08

Referencias web para LSP, mason.nvim, autocompletado, Treesitter, debugging y snippets.

---

## Referencia rápida

### Neovim LSP — Documentación Oficial
- **URL**: https://neovim.io/doc/user/lsp.html
- **Esta semana**: `vim.lsp.buf.*`, `vim.diagnostic.*` y el ciclo de vida del cliente LSP — la base de `01-lsp-mason.md`
- **Acceso desde Vim**: `:help lsp`

### nvim-lspconfig Wiki
- **URL**: https://github.com/neovim/nvim-lspconfig/wiki
- **Esta semana**: Configuraciones por lenguaje (`pyright`, `lua_ls`, `ts_ls`, `rust_analyzer`) referenciadas en `01-lsp-mason.md`

### mason.nvim
- **URL**: https://github.com/williamboman/mason.nvim
- **Esta semana**: Gestor de language servers, linters y formatters instalado vía `:MasonInstall`, tema central de `01-lsp-mason.md`

### nvim-cmp Wiki
- **URL**: https://github.com/hrsh7th/nvim-cmp/wiki
- **Esta semana**: Recetas de configuración de fuentes y mappings — referencia directa de `02-autocompletado-cmp.md`

### Treesitter — Documentación
- **URL**: https://github.com/nvim-treesitter/nvim-treesitter
- **Esta semana**: `ensure_installed`, módulos de `highlight`/`indent`/`fold` y `nvim-treesitter-textobjects` — la base de `03-treesitter.md`

### nvim-dap Wiki
- **URL**: https://github.com/mfussenegger/nvim-dap/wiki
- **Esta semana**: Adaptadores de debug por lenguaje (`debugpy`, `vscode-js-debug`) usados en `04-dap-debugging.md`

### LuaSnip — Documentación
- **URL**: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
- **Esta semana**: Sintaxis de `s()`, `t()`, `i()`, `f()`, `c()` para crear snippets — referencia de `05-terminal-y-snippets.md`

### Language Server Protocol — Lista de Servidores
- **URL**: https://microsoft.github.io/language-server-protocol/implementors/servers/
- **Esta semana**: Catálogo completo de language servers disponibles por lenguaje, más allá de los cubiertos en `01-lsp-mason.md`

---

## Artículos y directorios recomendados

### kickstart.nvim
- **URL**: https://github.com/nvim-lua/kickstart.nvim
- **Por qué**: Configuración de referencia que integra LSP, mason.nvim, nvim-cmp y Treesitter en un solo archivo comentado — buen punto de comparación para el proyecto de la semana.

### Awesome Neovim
- **URL**: https://github.com/rockerBOO/awesome-neovim
- **Por qué**: Lista curada de plugins — útil para explorar alternativas a nvim-cmp (como blink.cmp) o configuraciones de DAP para lenguajes no cubiertos en la teoría.

### Treesitter Playground
- **URL**: https://treesitter-playground.netlify.app
- **Por qué**: Herramienta online para explorar el AST de un fragmento de código sin instalar nada — complementa `:InspectTree` de `03-treesitter.md`.

### Snippet Generator
- **URL**: https://snippet-generator.app
- **Por qué**: Genera la sintaxis de LuaSnip/VSCode a partir de un ejemplo visual — acelera la creación de los snippets personalizados de `05-terminal-y-snippets.md`.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| [Neovim Discourse](https://neovim.discourse.group) | busca "lspconfig" o "nvim-dap" | Foro oficial — dudas de configuración de LSP y debugging resueltas por mantenedores y usuarios avanzados |
| [r/neovim](https://reddit.com/r/neovim) | busca "IDE setup" | Comunidad activa con hilos de configuración completa de Neovim como IDE |

---

> Esta semana la mayoría de referencias viven en wikis de GitHub, no en documentación monolítica — cada plugin (`nvim-lspconfig`, `nvim-cmp`, `nvim-dap`) mantiene su propio wiki actualizado, que suele estar más al día que cualquier tutorial externo.
