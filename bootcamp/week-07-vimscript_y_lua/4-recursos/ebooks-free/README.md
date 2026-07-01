# Ebooks Gratuitos — Semana 07

Lua API de Neovim, keymappings avanzados, autocomandos, comandos de usuario y Vimscript legacy — la base de la configuración moderna de Neovim.

---

## Imprescindibles esta semana

### Neovim User Documentation
- **Autor**: Neovim Core Team
- **URL**: https://neovim.io/doc/user/
- **Secciones recomendadas**: Lua Guide (`lua-guide.html`) y API Reference (`api.html`) — cubren `vim.opt`, `vim.g`, `vim.cmd`, `vim.fn` y `vim.api` usados en `01-lua-api-neovim.md`
- **Por qué**: Es la referencia oficial y autoritativa del proyecto — necesaria para entender los ámbitos de configuración (`vim.opt` vs `vim.bo` vs `vim.wo`) con criterio, no solo copiando ejemplos.

### Learn Vimscript the Hard Way
- **Autor**: Steve Losh
- **URL**: https://learnvimscriptthehardway.stevelosh.com/
- **Por qué**: El libro canónico y gratuito para entender la sintaxis, variables, scopes y funciones de Vimscript que cubre `05-vimscript-legacy.md` — escrito por alguien que también mantiene plugins Vimscript reales.

### Lua 5.1 Reference Manual
- **Autor**: Roberto Ierusalimschy et al.
- **URL**: https://www.lua.org/manual/5.1/
- **Por qué**: Neovim embebe Lua 5.1 (vía LuaJIT) — esta es la referencia del lenguaje base detrás de todo lo visto en `01-lua-api-neovim.md`, `02-keymappings-avanzados.md`, `03-autocmds.md` y `04-comandos-y-funciones.md`.

---

## Complementario

### Neovim Lua Plugin Development
- **URL**: https://neovim.io/doc/user/develop.html
- **Por qué**: Documenta convenciones de autores de plugins (estructura de módulos, `vim.api.nvim_create_user_command`, autocmds con `augroup`) referenciadas en `03-autocmds.md` y `04-comandos-y-funciones.md`.

### kickstart.nvim
- **URL**: https://github.com/nvim-lua/kickstart.nvim
- **Por qué**: Configuración de referencia en un solo archivo `init.lua` — útil para ver `vim.opt`, `vim.keymap.set` y `nvim_create_autocmd` combinados en un caso real, sin la complejidad de un framework de plugins.

---

> Esta semana el Vimscript y el Lua conviven: no descartes la documentación oficial de Vim (`:help eval.txt`, `:help usr_41.txt`) solo porque el bootcamp enfatiza Lua — muchos plugins y dotfiles legacy que encontrarás siguen escritos en Vimscript puro.
