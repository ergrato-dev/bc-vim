# 🔍 Ejercicio 02: Fuzzy Finder y File Tree

## 🎯 Objetivo

Configurar telescope.nvim y neo-tree.nvim. Buscar archivos, texto y buffers con fuzzy finder. Navegar proyecto con file tree.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Instalar Dependencia

```bash
# Instalar ripgrep (necesario para live_grep)
sudo apt install ripgrep          # Debian/Ubuntu
brew install ripgrep              # macOS
```

### Paso 2: Agregar telescope.nvim

```bash
nvim ~/.config/nvim/lua/plugins/tools.lua
```

```lua
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Ayuda" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recientes" },
      { "<leader>fs", "<cmd>Telescope grep_string<CR>", desc = "Palabra" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
      },
    },
  },
}
```

### Paso 3: Agregar neo-tree.nvim

En `lua/plugins/ui.lua`, debajo del tema:

```lua
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
        hide_gitignored = true,
      },
    },
  },
}
```

### Paso 4: Instalar

```text
:Lazy sync
```

---

## 🎮 Ejercicios

### Ejercicio A: Buscar Archivos

```text
1. <leader>ff       → Telescope find_files
2. Escribe: lazy     → busca archivos con "lazy"
3. Ctrl-n/p          → navega resultados
4. Enter             → abre el archivo seleccionado
5. Ctrl-v            → abre en split vertical
6. Ctrl-x            → abre en split horizontal
```

### Ejercicio B: Buscar Texto (live_grep)

```text
1. <leader>fg        → Telescope live_grep
2. Escribe: vim.opt  → busca líneas que contienen "vim.opt"
3. Navega resultados con Ctrl-n/p
4. Enter en resultado → salta a esa línea en ese archivo
```

### Ejercicio C: Buscar Texto en Todo el Proyecto

```bash
# Busca en los archivos del bootcamp:
cd ~/proyecto-camino-a-vim/bootcamp
nvim
```

```text
1. <leader>fs        → grep_string (palabra bajo el cursor)
   O: <leader>fg     → live_grep
2. Escribe: text object
3. Observa cuántas referencias aparecen
```

### Ejercicio D: Buscar Buffers y Recientes

```text
1. :e ~/archivo1.txt (si no existe)
2. :e ~/archivo2.txt
3. :e ~/archivo3.txt
4. <leader>fb        → Telescope buffers
   Lista los 3 + tus archivos de configuración

5. <leader>fr        → Telescope oldfiles
   Muestra archivos abiertos recientemente
```

### Ejercicio E: File Tree

```text
1. <leader>e          → toggle neo-tree
2. Navega con hjkl
3. Enter sobre directorio → expandir/colapsar
4. Enter sobre archivo   → abrir
5. a                  → crear archivo
6. Escribe: test.txt → Enter
7. R                  → renombrar (sobre test.txt)
8. d                  → eliminar (sobre test.txt, confirmar)
```

### Ejercicio F: Combinado

```text
1. <leader>e          → abre file tree
2. Navega a un directorio
3. a → crea "prueba-telescope.txt"
4. <leader>ff         → fuzzy finder
5. Escribe: prueba-tel → encuentra el archivo
6. Enter para abrir
7. <leader>fg         → busca texto
8. Escribe: lua        → busca "lua" en archivos
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿<leader>ff busca archivos fuzzy? | | |
| ¿<leader>fg busca texto en todo el proyecto? | | |
| ¿<leader>fb lista buffers abiertos? | | |
| ¿<leader>e abre/cierra file tree? | | |
| ¿Puedes crear/renombrar/eliminar archivos desde neo-tree? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Git y Statusline →](../03-ejercicio-git-statusline/README.md)
