# Webgrafía — Semana 07

Referencias web para la API de Lua, keymappings avanzados, autocomandos, comandos de usuario y Vimscript legacy.

---

## Referencia rápida

### Neovim Lua Guide — Documentación Oficial
- **URL**: https://neovim.io/doc/user/lua-guide.html
- **Esta semana**: Ámbitos de opciones (`vim.opt`, `vim.bo`, `vim.wo`), `vim.cmd()` y `vim.fn` — la base de `01-lua-api-neovim.md`
- **Acceso desde Vim**: `:help lua-guide`

### Neovim API Reference — Documentación Oficial
- **URL**: https://neovim.io/doc/user/api.html
- **Esta semana**: `nvim_create_autocmd`, `nvim_create_user_command` y funciones `nvim_buf_*` usadas en `03-autocmds.md` y `04-comandos-y-funciones.md`
- **Acceso desde Vim**: `:help api`

### `:help usr_41` — Write a Vim Script (vimhelp.org)
- **URL**: https://vimhelp.org/usr_41.txt.html
- **Esta semana**: Sintaxis básica, variables y funciones de Vimscript — referencia oficial para `05-vimscript-legacy.md`

### `:help eval` — Vim Script Expressions (vimhelp.org)
- **URL**: https://vimhelp.org/eval.txt.html
- **Esta semana**: Funciones built-in (`has()`, `expand()`, `system()`) equivalentes a `vim.fn.*`, referenciadas en `01-lua-api-neovim.md` y `05-vimscript-legacy.md`

### Learn Vimscript the Hard Way
- **URL**: https://learnvimscriptthehardway.stevelosh.com/
- **Esta semana**: Libro completo online, capítulos sobre funciones y autocomandos en Vimscript clásico — referencia de `05-vimscript-legacy.md`

### Lua 5.1 Reference Manual
- **URL**: https://www.lua.org/manual/5.1/
- **Esta semana**: Sintaxis del lenguaje base (tablas, funciones, scopes `local`) que subyace a todos los temas Lua de la semana

---

## Artículos y directorios recomendados

### kickstart.nvim
- **URL**: https://github.com/nvim-lua/kickstart.nvim
- **Por qué**: Configuración de referencia en Lua puro, ampliamente comentada — buen punto de comparación para el proyecto de la semana.

### Awesome Neovim
- **URL**: https://github.com/rockerBOO/awesome-neovim
- **Por qué**: Lista curada de plugins Lua — útil para ver `nvim_create_user_command` y `nvim_create_autocmd` en código de producción, no solo en ejemplos didácticos.

### Neovim Lua Plugin Development
- **URL**: https://neovim.io/doc/user/develop.html
- **Por qué**: Guía oficial de convenciones para escribir plugins en Lua — estructura de módulos y buenas prácticas más allá del alcance de esta semana.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| [Neovim Discourse](https://neovim.discourse.group) | busca "vim.keymap.set" o "nvim_create_autocmd" | Foro oficial — dudas de API resueltas por mantenedores y usuarios avanzados |
| [Lua Users Wiki](http://lua-users.org/wiki/) | consulta tutoriales de sintaxis básica | Wiki de la comunidad Lua, útil si el lenguaje en sí (no la API de Neovim) es lo que genera dudas |
| [r/neovim](https://reddit.com/r/neovim) | busca "vimscript vs lua" | Comunidad activa con debates sobre migración de configuraciones legacy |

---

> Esta semana combina dos mundos: la documentación de Neovim (`neovim.io/doc`) para la API de Lua, y la documentación clásica de Vim (`vimhelp.org`) para Vimscript. Acostúmbrate a saltar entre ambas — es exactamente lo que hace cualquier configuración real de Neovim madura.
