# Webgrafía — Semana 06

Referencias web para gestores de plugins, configuración modular, fuzzy finder, git integrado y optimización.

---

## Referencia rápida

### lazy.nvim — Documentación Oficial
- **URL**: https://github.com/folke/lazy.nvim
- **Esta semana**: Sección "Spec" del README — todas las claves posibles (`event`, `keys`, `cmd`, `ft`, `opts`, `dependencies`, `build`, `cond`)
- **Uso**: Consulta obligatoria al escribir cualquier spec en `01-gestores-de-plugins.md` y `02-configuracion-modular-lazy.md`.

### telescope.nvim — Documentación Oficial
- **URL**: https://github.com/nvim-telescope/telescope.nvim
- **Esta semana**: Secciones "Pickers" y "Mappings" — todos los buscadores disponibles más allá de `find_files`/`live_grep`
- **Uso**: Referencia para `03-fuzzy-finder-y-file-tree.md`.

### neo-tree.nvim — Documentación Oficial
- **URL**: https://github.com/nvim-neo-tree/neo-tree.nvim
- **Esta semana**: Sección de opciones `filesystem` y atajos por defecto
- **Uso**: Referencia para `03-fuzzy-finder-y-file-tree.md`.

### gitsigns.nvim — Documentación Oficial
- **URL**: https://github.com/lewis6991/gitsigns.nvim
- **Esta semana**: Tabla de `opts` (`signs`, `current_line_blame`, `watch_gitdir`)
- **Uso**: Referencia para `04-git-y-statusline.md`.

### lualine.nvim — Wiki de Componentes
- **URL**: https://github.com/nvim-lualine/lualine.nvim/wiki
- **Esta semana**: Lista de componentes (`branch`, `diff`, `diagnostics`, `filename`) y temas disponibles
- **Uso**: Referencia para `04-git-y-statusline.md`.

### which-key.nvim — Documentación Oficial
- **URL**: https://github.com/folke/which-key.nvim
- **Esta semana**: Sección de `spec` y `preset` (`classic`, `modern`, `helix`)
- **Uso**: Referencia para `05-temas-y-optimizacion.md`.

### Neovim Lua Guide
- **URL**: https://neovim.io/doc/user/lua-guide.html
- **Esta semana**: Cómo Neovim carga módulos Lua — base para entender `require()` en cualquier spec de plugin
- **Acceso desde Vim**: `:help lua-guide`

---

## Artículos y directorios recomendados

### Awesome Neovim
- **URL**: https://github.com/rockerBOO/awesome-neovim
- **Por qué**: Lista curada por categoría (fuzzy finders, git, LSP, temas) — el punto de partida cuando buscas una alternativa a un plugin visto esta semana.

### NeovimCraft
- **URL**: https://neovimcraft.com
- **Por qué**: Buscador de plugins con filtros por categoría y popularidad — útil para comparar alternativas a telescope/neo-tree antes de decidir.

### Dotfyle
- **URL**: https://dotfyle.com
- **Por qué**: Configuraciones reales de la comunidad, indexadas y buscables — ver cómo otros organizan su `lua/plugins/` ayuda a validar (o cuestionar) tu propia estructura modular.

### This Week in Neovim
- **URL**: https://this-week-in-neovim.org
- **Por qué**: Newsletter semanal del ecosistema — plugins nuevos y cambios en Neovim core, útil para mantenerse al día después del bootcamp.

### LazyVim
- **URL**: https://www.lazyvim.org
- **Por qué**: Distribución de referencia construida sobre lazy.nvim — comparar su `lua/plugins/` con la tuya es un buen ejercicio de revisión al terminar el proyecto de la semana.

---

## Comunidad

| Plataforma | Hilo recomendado | Por qué |
|-----------|-------------------|---------|
| [Neovim Discourse](https://neovim.discourse.group) | busca "lazy.nvim spec" o "telescope pickers" | Foro oficial — dudas específicas de configuración resueltas por mantenedores y usuarios avanzados |
| r/neovim | busca "plugin setup lua" | Configuraciones compartidas y debates sobre alternativas de plugins |

---

> Esta semana la documentación está en el propio repositorio de cada plugin: el README de GitHub suele ser más preciso que cualquier blog de terceros, porque lo mantiene quien escribió el código.
