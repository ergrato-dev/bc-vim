# 🐙 Publicación de Dotfiles en GitHub

## 🎯 Objetivos

- Crear un repositorio profesional de dotfiles
- Escribir un README atractivo con screenshots e instrucciones
- Organizar archivos con licencia, .gitignore y estructura clara
- Compartir tu configuración con la comunidad

---

## 📋 Contenido

### 1. Preparar el Repositorio

```bash
# 1. Inicializar repo en tu configuración
cd ~/.config/nvim
git init

# 2. Crear .gitignore
cat > .gitignore << 'EOF'
# Plugins (se instalan con lazy)
lazy-lock.json.backup

# Archivos temporales
*.swp
*.swo
*~

# Sesiones
session.vim
*.session.vim

# Datos de Neovim (no son parte de la config)
plugin/packer_compiled.lua
spell/
EOF

# 3. Primer commit
git add .
git commit -m "feat: configuración inicial de Neovim"
```

---

### 2. Estructura del README.md

```markdown
# 🚀 Mi Configuración de Neovim

![Screenshot](./screenshots/overview.png)

Configuración modular de Neovim con lazy.nvim, optimizada para
desarrollo en [tus lenguajes principales].

## ✨ Características

- ⚡ [Tema] — Tema [nombre] personalizado
- 🔍 Telescope — Búsqueda fuzzy de archivos, texto, buffers
- 🌳 Neo-tree — Explorador de archivos lateral
- 🔌 LSP — Soporte para [tus lenguajes] con autocompletado
- 🐛 DAP — Debugging integrado (opcional)
- 🎨 Treesitter — Resaltado semántico avanzado
- 📝 Which-key — Descubrimiento de atajos de teclado
- 🔀 Git — Integración con gitsigns y fugitive

## 📦 Requisitos

- Neovim ≥ 0.9.0
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) (para telescope live_grep)
- [Nerd Font](https://www.nerdfonts.com) (para íconos)

## 🚀 Instalación

### Linux / macOS

\`\`\`bash
# 1. Backup de tu configuración actual
mv ~/.config/nvim ~/.config/nvim.backup

# 2. Clonar este repositorio
git clone https://github.com/tu-usuario/nvim ~/.config/nvim

# 3. Abrir Neovim (lazy.nvim se instala automáticamente)
nvim

# 4. Instalar plugins
:Lazy sync

# 5. Instalar language servers
:MasonInstall lua_ls pyright ts_ls
\`\`\`

### Windows (PowerShell)

\`\`\`powershell
mv ~/AppData/Local/nvim ~/AppData/Local/nvim.backup
git clone https://github.com/tu-usuario/nvim ~/AppData/Local/nvim
nvim
:Lazy sync
\`\`\`

## 🗂️ Estructura

\`\`\`
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
\`\`\`

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

> Ver todos: presiona `<leader>` y espera a which-key

## 🎨 Screenshots

### Vista general
![Dashboard](./screenshots/dashboard.png)

### Edición con LSP y autocompletado
![Coding](./screenshots/coding.png)

### Búsqueda con Telescope
![Telescope](./screenshots/telescope.png)

## 📝 Licencia

MIT — Ver [LICENSE](./LICENSE)
```

---

### 3. Tomar Screenshots

**Herramientas recomendadas**:

```bash
# Linux: flameshot
sudo apt install flameshot

# macOS: CleanShot X o captura nativa (Cmd+Shift+4)

# Desde Neovim:
:screenshot  -- plugin vim-screenshot
```

**Qué capturar**:
1. Vista general del editor con código real
2. Menú de autocompletado (cmp con íconos)
3. Búsqueda con telescope (archivos o grep)
4. File tree (neo-tree) con git status
5. Hover de LSP (documentación flotante)
6. Dashboard/startup screen (si tienes)

**Directorio de screenshots**:
```bash
mkdir -p ~/.config/nvim/screenshots
```

---

### 4. Publicar en GitHub

![Diagrama de flujo para publicar dotfiles en GitHub: crear repositorio, conectar remoto, hacer push y verificar en el navegador](../0-assets/02-flujo-publicacion-github.svg)

```bash
# 1. Crear repo en GitHub (con UI o gh CLI)
gh repo create nvim --public --description "Mi configuración de Neovim"

# 2. Conectar y push
cd ~/.config/nvim
git remote add origin https://github.com/tu-usuario/nvim.git
git branch -M main
git push -u origin main

# 3. Verificar en el navegador
gh repo view --web
```

---

### 5. Mantener Actualizado

```bash
# Actualizar plugins regularmente
:Lazy update

# Commitear cambios periódicamente
cd ~/.config/nvim
git add .
git commit -m "feat: [descripción del cambio]"
git push

# Mensajes de commit convencionales:
feat: agregar soporte para Rust
fix: corregir keymap de telescope
docs: actualizar instrucciones de instalación
chore: actualizar plugins
```

---

### 6. Compartir en la Comunidad

- **Reddit**: Publica en r/neovim con tag `[dotfiles]`
- **Discourse**: [neovim.discourse.group](https://neovim.discourse.group) → categoría `#configs`
- **Dotfyle**: Sube a [dotfyle.com](https://dotfyle.com) para indexación
- **Twitter/X**: #neovim #dotfiles

---

## 💡 Checklist de Publicación

```text
☐ Repositorio creado en GitHub
☐ README.md con: título, features, requisitos, instalación, estructura, screenshots
☐ LICENSE (MIT, Apache 2.0, etc.)
☐ .gitignore con exclusiones correctas
☐ Screenshots subidos y visibles en README
☐ lazy-lock.json commiteado
☐ URL del repo compartida en la entrega
```

---

## ➡️ Siguiente

[03 - Documentación y Presentación](03-documentacion-y-presentacion.md)
