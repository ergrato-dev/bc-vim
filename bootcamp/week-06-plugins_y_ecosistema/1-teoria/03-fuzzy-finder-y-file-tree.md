# 🔍 Fuzzy Finder y File Tree

## 🎯 Objetivos

- Configurar telescope.nvim como fuzzy finder universal
- Buscar archivos, texto, buffers, comandos y ayuda con telescope
- Instalar y usar un file tree (neo-tree.nvim o nvim-tree.lua)
- Navegar proyectos grandes sin salir del teclado

---

## 📋 Contenido

### 1. telescope.nvim — El Fuzzy Finder Definitivo

telescope.nvim es el buscador difuso más potente para Neovim. Reemplaza Ctrl+P de VS Code, grep, búsqueda de buffers y más.

**Instalación**:

```lua
-- lua/plugins/tools.lua
{
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar archivos" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Buscar texto" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buscar buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Buscar ayuda" },
    { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Buscar comandos" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Buscar keymaps" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
    },
  },
}
```

---

### 2. Búsquedas Esenciales con Telescope

```text
┌─────────────────────────────────────────────────────────┐
│ TELESCOPE: QUÉ BUSCAR                                   │
│                                                          │
│ find_files     → archivos por nombre fuzzy              │
│ live_grep      → texto en archivos (ripgrep)            │
│ grep_string    → palabra bajo el cursor en proyecto      │
│ buffers        → buffers abiertos                       │
│ oldfiles       → archivos recientes                     │
│ help_tags      → temas de ayuda                          │
│ commands       → comandos de Vim                        │
│ keymaps        → mappings disponibles                   │
│ diagnostics    → errores y advertencias LSP             │
│ lsp_references → referencias a símbolo                 │
│ git_files      → archivos rastreados por git            │
│ git_status     → estado de git                          │
└─────────────────────────────────────────────────────────┘
```

**Atajos dentro de telescope**:
```text
Ctrl-n / Ctrl-p    → siguiente/anterior ítem
Ctrl-j / Ctrl-k    → siguiente/anterior ítem (alternativa)
Ctrl-t             → abrir en nueva pestaña
Ctrl-v             → abrir en split vertical
Ctrl-x             → abrir en split horizontal
<Esc> / Ctrl-c     → cerrar
Ctrl-/             → mostrar keymaps de telescope
?                  → mostrar ayuda de telescope
```

---

### 3. live_grep: Buscar Texto en Todo el Proyecto

```text
<leader>fg → Telescope live_grep

Escribe cualquier texto → búsqueda fuzzy en todos los archivos.
Requiere ripgrep (rg) instalado en el sistema.

Sin ripgrep:
sudo apt install ripgrep      # Debian/Ubuntu
brew install ripgrep           # macOS
```

```text
Ejemplo: buscar todas las referencias a "calcularTotal"

<leader>fg
calcularTotal
→ muestra todas las líneas que contienen "calcularTotal"
→ Enter abre el archivo en la línea exacta
```

---

### 4. Mappings Recomendados para Telescope

```lua
-- Búsqueda con <leader>f
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Archivos" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Ayuda" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recientes" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Palabra" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Comandos" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })

-- Git
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })

-- LSP (funciona cuando hay LSP conectado)
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Referencias" })
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Definición" })
```

---

### 5. File Tree: neo-tree.nvim

Un explorador de archivos lateral estilo IDE.

**Instalación**:

```lua
-- lua/plugins/ui.lua
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorador" },
    { "<leader>bf", "<cmd>Neotree reveal_force_cwd<CR>", desc = "Explorador aquí" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
```

**Atajos dentro de neo-tree**:
```text
Enter      → abrir archivo/directorio
R          → renombrar
a          → crear archivo/directorio
d          → eliminar
m          → mover
c          → copiar
y          → copiar nombre
p          → pegar desde portapapeles
Ctrl-/     → mostrar ayuda de neo-tree
```

**Alternativa: nvim-tree.lua**:

```lua
{
  "nvim-tree/nvim-tree.lua",
  keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorador" } },
  opts = {
    sort = { sorter = "case_sensitive" },
    view = { width = 30 },
  },
}
```

---

### 6. ¿Fuzzy Finder o File Tree?

```text
┌─────────────────────────────────────────────────────┐
│ CUÁNDO USAR CADA UNO                                 │
│                                                      │
│ FUZZY FINDER (telescope):                            │
│ • Conoces el nombre del archivo                      │
│ • Buscas texto en múltiples archivos                 │
│ • Saltas entre buffers abiertos                      │
│ • Velocidad: <leader>ff + nombre → instantáneo       │
│                                                      │
│ FILE TREE (neo-tree):                                │
│ • Explorar proyecto por primera vez                  │
│ • Ver estructura de directorios                      │
│ • Operaciones de archivo (renombrar, mover, crear)   │
│ • Navegación visual cuando no sabes el nombre        │
│                                                      │
│ Regla: si sabes el nombre → fuzzy finder.             │
│        Si no sabes qué hay → file tree.               │
└─────────────────────────────────────────────────────┘
```

---

### 7. Configuración Opcional: telescope file_browser

Si quieres navegar directorios dentro de telescope:

```lua
{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>fe", "<cmd>Telescope file_browser<CR>", desc = "Explorador fuzzy" },
  },
}
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────┐
│ FUZZY FINDER + FILE TREE                              │
│                                                       │
│ <leader>ff → buscar archivos                         │
│ <leader>fg → buscar texto (live grep)                │
│ <leader>fb → buscar buffers                          │
│ <leader>fr → archivos recientes                      │
│ <leader>e  → toggle file tree                        │
│                                                       │
│ Dentro de telescope:                                 │
│   Ctrl-t/v/x → abrir en tab/split                    │
│   Ctrl-/     → ayuda                                 │
│                                                       │
│ Dentro de neo-tree:                                  │
│   a → crear    d → eliminar    R → renombrar         │
│   m → mover    y → copiar nombre                     │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] telescope.nvim instalado con fzf-native
- [ ] `<leader>ff` busca archivos por nombre fuzzy
- [ ] `<leader>fg` busca texto en todo el proyecto
- [ ] `<leader>fb` busca entre buffers abiertos
- [ ] neo-tree o nvim-tree instalado como file tree
- [ ] `<leader>e` abre/cierra el explorador
- [ ] Puedo crear/renombrar/eliminar archivos desde el file tree

---

## 🎮 Ejercicio Rápido

```text
1. <leader>ff → escribe "init" → debería encontrar init.lua
2. <leader>fg → escribe "function" → encuentra funciones
3. <leader>fb → lista buffers abiertos
4. <leader>e  → abre file tree, navega con hjkl
5. En file tree: presiona a → crea "test-lazy.txt"
6. R → renombra a "lazy-test.txt"
7. d → elimínalo
8. Ctrl-t en telescope → abre archivo en nueva pestaña
```

---

## ➡️ Siguiente

[04 - Git y Statusline](04-git-y-statusline.md)
