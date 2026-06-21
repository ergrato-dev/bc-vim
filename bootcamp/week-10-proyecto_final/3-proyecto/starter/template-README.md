# 🚀 Mi Configuración de Neovim

[Breve descripción de una línea sobre tu configuración]

## ✨ Características

- ⚡ **Tema**: [nombre del tema]
- 🔍 **Telescope** — Búsqueda fuzzy de archivos, texto, buffers
- 🌳 **Neo-tree** — Explorador de archivos lateral
- 🔌 **LSP** — Soporte para [tus lenguajes] con autocompletado
- 🐛 **DAP** — Debugging integrado (opcional)
- 🎨 **Treesitter** — Resaltado semántico avanzado
- 📝 **Which-key** — Descubrimiento de atajos
- 🔀 **Git** — Integración con gitsigns y fugitive

## 📦 Requisitos

- Neovim ≥ 0.9.0
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) (para telescope live_grep)
- [Nerd Font](https://www.nerdfonts.com) (para íconos)

## 🚀 Instalación

```bash
# 1. Backup de tu configuración actual
mv ~/.config/nvim ~/.config/nvim.backup

# 2. Clonar este repositorio
git clone https://github.com/TU-USUARIO/TU-REPO ~/.config/nvim

# 3. Abrir Neovim (lazy.nvim se instala automáticamente)
nvim

# 4. Instalar plugins
:Lazy sync

# 5. Instalar language servers
:MasonInstall lua_ls pyright ts_ls
```

## 🗂️ Estructura

```
~/.config/nvim/
├── init.lua              # Punto de entrada
├── lazy-lock.json        # Versiones de plugins
├── lua/
│   ├── config/lazy.lua   # Bootstrap de lazy.nvim
│   ├── core/
│   │   ├── options.lua   # Configuración general
│   │   ├── keymaps.lua   # Atajos de teclado
│   │   └── autocmds.lua  # Autocomandos
│   ├── plugins/          # Plugins por categoría
│   └── util/             # Funciones de utilidad
└── README.md
```

## ⌨️ Atajos Principales

| Atajo | Acción |
|-------|--------|
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar texto |
| `<leader>e` | Explorador de archivos |
| `<leader>w` | Guardar |
| `K` | Documentación (hover) |
| `gd` | Ir a definición |
| `[d / ]d` | Navegar errores |
| `<leader>rn` | Renombrar símbolo |
| `<leader>ca` | Code actions |

> Ver todos: presiona `<leader>` y espera a which-key

## 🎨 Screenshots

### Vista general
![Overview](./screenshots/overview.png)

### Autocompletado
![CMP](./screenshots/cmp.png)

### Búsqueda con Telescope
![Telescope](./screenshots/telescope.png)

## 📝 Licencia

MIT — Ver [LICENSE](./LICENSE)
