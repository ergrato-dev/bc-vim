# Semana 7: Vimscript y Lua

## 🎯 Objetivos

- Configurar Neovim completamente en Lua
- Crear mapeos de teclas personalizados usando la API de Neovim
- Definir comandos de usuario (:command)
- Crear autocmds para automatizar tareas por tipo de archivo
- Escribir funciones en Lua para extender Neovim
- Entender el sistema de opciones (vim.opt, vim.g, vim.bo, vim.wo)
- Fundamentos de Vimscript para mantenimiento de configuraciones legacy

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Lua API de Neovim: vim.opt, vim.keymap, vim.cmd | 1.5h | Teoría |
| Keymappings avanzados con Lua | 1.5h | Práctica |
| Autocmds y grupos de autocmds | 1h | Teoría + Práctica |
| Comandos de usuario (:command) | 1h | Práctica |
| Funciones en Lua para Neovim | 1.5h | Práctica |
| Vimscript básico (para legacy) | 1h | Teoría |
| Evaluación | 0.5h | Evaluación |

## 🔑 Conceptos Clave

- **vim.opt**: Acceso tipo "options" para configuración (ej: `vim.opt.number = true`)
- **vim.keymap.set()**: API moderna para mapeos con soporte para descripciones
- **vim.api.nvim_create_autocmd()**: Crear autocmds con la API de Neovim
- **vim.api.nvim_create_user_command()**: Definir comandos personalizados
- **vim.cmd()**: Ejecutar comandos Ex desde Lua
- **Grupos de autocmds (augroup)**: Organizar y permitir recarga limpia de autocmds

## 💻 Prácticas

1. **Convertir init.vim a init.lua**: Migra una configuración básica de Vimscript a Lua
2. **Keymappings**: Crea mappings con descripciones para tus plugins de la semana 6
3. **Autocmds**: Configura formateo automático al guardar, resaltar trailing whitespace, etc.
4. **User commands**: Crea comandos como `:Todo` para buscar TODOs, `:Reload` para recargar config
5. **Funciones Lua**: Escribe una función que formatee código al guardar, una que abra terminal en split

## 📦 Proyecto Semanal

Refactoriza tu configuración de Neovim a una estructura modular en Lua:

```
~/.config/nvim/
├── init.lua              # Punto de entrada (require los módulos)
├── lua/
│   ├── core/
│   │   ├── options.lua   # Configuración de opciones (vim.opt)
│   │   ├── keymaps.lua   # Todos los mapeos de teclas
│   │   └── autocmds.lua  # Autocomandos
│   ├── plugins/
│   │   ├── init.lua      # Configuración de lazy.nvim
│   │   ├── ui.lua        # Plugins de interfaz
│   │   ├── editing.lua   # Plugins de edición
│   │   └── git.lua       # Plugins de git
│   └── util/
│       └── init.lua      # Funciones de utilidad
└── after/
    └── ftplugin/         # Configuración por tipo de archivo
```

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Diferencia entre vim.opt, vim.g, vim.bo y vim.wo
- Explica por qué es importante usar augroup en autocmds
- Describe la API de keymaps de Neovim vs :map

### Evidencia de Desempeño (40%)
- Ejercicio en vivo: crear un comando de usuario y un autocmd desde cero

### Evidencia de Producto (30%)
- Configuración modular en Lua completamente funcional
- Mappings documentados con descripciones

## 📚 Recursos

- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html) — Guía oficial de Lua en Neovim
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/) — Para Vimscript
- [Neovim Lua Plugin Development](https://neovim.io/doc/user/develop.html)
- [Awesome Neovim Configs](https://github.com/nvim-lua/kickstart.nvim) — kickstart.nvim

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Lua** | Lenguaje de scripting embedido en Neovim para configuración |
| **Vimscript** | Lenguaje de scripting nativo de Vim |
| **vim.opt** | API para opciones de tipo booleano, numérico y string |
| **vim.keymap.set()** | API moderna para crear mapeos de teclas |
| **Autocmd** | Comando que se ejecuta automáticamente en respuesta a eventos |
| **Augroup** | Grupo de autocmds que permite limpiarlos al recargar |
| **User command** | Comando personalizado definido con :command |
| **init.lua** | Archivo de configuración principal de Neovim (equivalente a .vimrc) |
