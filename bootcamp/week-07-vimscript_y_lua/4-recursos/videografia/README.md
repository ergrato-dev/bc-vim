# Videografía — Semana 07

Videos para ver la API de Lua, keymappings avanzados, autocomandos, comandos de usuario y Vimscript legacy en acción.

---

## Esenciales esta semana

### Neovim from Scratch (TJ DeVries)
- **URL**: https://www.youtube.com/playlist?list=PLGxiA7J0vUZxIDIUqQrPaLWJJIfGLIe2p
- **Cuándo verlo**: Antes o durante `01-lua-api-neovim.md`
- **Por qué**: Serie completa de configuración de Neovim desde cero por uno de los mantenedores del proyecto — muestra en vivo cómo se usa `vim.opt`, `vim.g` y `vim.keymap.set` en un `init.lua` real.

### Understanding Neovim Lua API (ThePrimeagen)
- **URL**: https://www.youtube.com/watch?v=w7i4amO_zaE
- **Cuándo verlo**: Después de `01-lua-api-neovim.md` y `02-keymappings-avanzados.md`
- **Por qué**: Walkthrough de la API de Lua con foco práctico — ayuda a fijar la diferencia entre `vim.cmd`, `vim.fn` y `vim.api` con ejemplos en vivo.

### Vimscript vs Lua (Vimjoyer)
- **URL**: https://www.youtube.com/watch?v=6pAG3BHurdM
- **Cuándo verlo**: Junto con `05-vimscript-legacy.md`
- **Por qué**: Comparativa directa entre Vimscript y Lua para las mismas tareas — refuerza la tabla de equivalencias del tema de Vimscript legacy.

---

## Complementario

### Búsquedas recomendadas en YouTube esta semana

Los enlaces anteriores son estables, pero para profundizar en un tema específico, estos términos encuentran contenido equivalente:

- **"vim.keymap.set tutorial"** — mappings modernos con `rhs` vs `callback`, tema de `02-keymappings-avanzados.md`
- **"nvim_create_autocmd tutorial"** — autocomandos y augroups, tema de `03-autocmds.md`
- **"neovim user commands lua nvim_create_user_command"** — comandos de usuario y funciones Lua, tema de `04-comandos-y-funciones.md`
- **"vimscript to lua migration"** — migrar configuraciones legacy, tema de `05-vimscript-legacy.md`

---

> Mira primero cómo alguien construye su `init.lua` línea por línea en vivo antes de copiar una configuración ya hecha — ver el "por qué" de cada `vim.opt`/`vim.keymap.set`/`autocmd` importa más que memorizar la sintaxis.
