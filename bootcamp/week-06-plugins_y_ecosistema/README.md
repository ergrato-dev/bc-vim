# Semana 6: Plugins y Ecosistema

## 🎯 Objetivos

- Instalar y configurar lazy.nvim como gestor de plugins para Neovim
- Configurar vim-plug como alternativa para Vim clásico
- Instalar plugins esenciales: fuzzy finder, file tree, statusline, git
- Personalizar temas de color (colorschemes)
- Entender lazy-loading y optimización de tiempo de inicio

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Gestores de plugins: comparativa | 0.5h | Teoría |
| lazy.nvim: instalación y configuración básica | 1.5h | Teoría + Práctica |
| Fuzzy finder (telescope.nvim / fzf) | 2h | Práctica |
| File tree (neo-tree / nvim-tree) | 1h | Práctica |
| Statusline (lualine.nvim / vim-airline) | 1h | Práctica |
| Git integration (gitsigns + fugitive) | 1h | Práctica |
| Temas (tokyonight / catppuccin / rose-pine) | 0.5h | Práctica |
| Evaluación | 0.5h | Evaluación |

## 🔑 Conceptos Clave

- **lazy.nvim**: Gestor de plugins moderno con lazy-loading automático
- **vim-plug**: Gestor minimalista para Vim clásico, configuración declarativa
- **Lazy-loading**: Cargar plugins solo cuando se necesitan (evento, comando, tecla)
- **Fuzzy finder**: Búsqueda difusa de archivos, buffers, grep, comandos
- **File tree**: Explorador de archivos estilo IDE en panel lateral
- **Statusline**: Barra de estado informativa con modo, rama git, tipo de archivo

## 💻 Prácticas

1. **Instalar lazy.nvim / vim-plug**: Configura el bootstrap del gestor de plugins
2. **Fuzzy finder**: Buscar archivos por nombre, por contenido (grep), buffers abiertos
3. **File tree**: Navegar proyecto, crear/renombrar/eliminar archivos, atajos de teclado
4. **Git**: Ver cambios en gutter (gitsigns), hacer commit/blame con fugitive
5. **Tema**: Instalar y configurar 3 temas, comparar legibilidad en diferentes lenguajes

## 📦 Proyecto Semanal

Configura un "starter kit" de plugins para desarrollo que incluya:

1. **lazy.nvim** como gestor de plugins, organizado en archivos modulares
2. **telescope.nvim** con keybindings para buscar archivos, grep y buffers
3. **neo-tree.nvim** con iconos de archivo y diagnóstico git
4. **lualine.nvim** con información de modo, rama git y posición
5. **gitsigns.nvim** para ver cambios en gutter
6. **catppuccin** o **tokyonight** como tema
7. **which-key.nvim** para mostrar keybindings disponibles
8. **vim-commentary** o **Comment.nvim** para comentar código

Entrega: `~/.config/nvim/lua/plugins/` con archivos modulares

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Diferencia entre lazy.nvim y vim-plug
- Explica qué es lazy-loading y sus beneficios
- Describe la función de cada plugin esencial

### Evidencia de Desempeño (40%)
- Demostración en vivo: instalar y configurar un plugin desde cero

### Evidencia de Producto (30%)
- Configuración modular de plugins funcional
- Captura de pantalla del setup completo

## 📚 Recursos

- [lazy.nvim](https://github.com/folke/lazy.nvim) — Documentación oficial
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — Fuzzy finder
- [vim-plug](https://github.com/junegunn/vim-plug) — Alternativa para Vim clásico
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) — Lista curada de plugins

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Plugin manager** | Herramienta para instalar, actualizar y gestionar plugins |
| **lazy.nvim** | Gestor de plugins moderno para Neovim con lazy-loading |
| **vim-plug** | Gestor de plugins minimalista para Vim |
| **Lazy-loading** | Cargar plugins solo cuando se necesitan, no al inicio |
| **Fuzzy finder** | Búsqueda por coincidencia aproximada (no exacta) |
| **Colorscheme** | Tema de colores para el editor |
| **Gitsigns** | Plugin que muestra cambios de git en el gutter |
| **Fugitive** | Plugin completo de git para Vim creado por tpope |
