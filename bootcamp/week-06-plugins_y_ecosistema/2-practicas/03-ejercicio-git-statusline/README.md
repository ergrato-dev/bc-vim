# 🔀 Ejercicio 03: Git y Statusline

## 🎯 Objetivo

Configurar gitsigns para ver cambios en gutter, vim-fugitive para operaciones git y lualine como statusline profesional.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Agregar gitsigns y fugitive

```bash
nvim ~/.config/nvim/lua/plugins/git.lua
```

```lua
return {
  -- Gitsigns: cambios en gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
      },
    },
    keys = {
      { "]h", desc = "Siguiente hunk" },
      { "[h", desc = "Hunk anterior" },
      {
        "<leader>gb",
        function() require("gitsigns").blame_line({ full = true }) end,
        desc = "Blame línea",
      },
      {
        "<leader>gp",
        function() require("gitsigns").preview_hunk() end,
        desc = "Preview hunk",
      },
    },
  },

  -- Fugitive: git completo
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gdiffsplit", "Gblame", "Glog", "Gcommit" },
  },
}
```

### Paso 2: Agregar lualine

En `lua/plugins/ui.lua`, añadir:

```lua
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    options = {
      theme = "auto",
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
```

### Paso 3: Keymaps para fugitive

En `init.lua`:

```lua
-- Git keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Gcommit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gl", "<cmd>Glog<CR>", { desc = "Git log" })
```

### Paso 4: Instalar

```text
:Lazy sync
```

---

## 🎮 Ejercicios

### Ejercicio A: gitsigns en Acción

```text
1. Abre un archivo en un repo git
2. Haz un cambio (añade o modifica una línea)
3. Observa el gutter: debe aparecer "│" en la columna
4. Después de 1 segundo, debe aparecer blame inline

5. ]h → siguiente hunk
6. [h → hunk anterior
7. <leader>gp → preview del hunk actual
8. <leader>gb → blame detallado de la línea
```

### Ejercicio B: Git Status con Fugitive

```text
1. <leader>gg      → abre :Git (status)
2. Navega con j/k   → mueve entre archivos modificados
3. - sobre archivo  → stage/unstage
4. = sobre archivo  → toggle diff inline
5. cc               → commit (abre buffer de mensaje)
   (no completes el commit si no quieres)
```

### Ejercicio C: Git Diff

```text
1. <leader>gd       → Gdiffsplit
   Muestra el diff del archivo actual en split

2. ]c / [c          → navegar cambios (diff mode)
3. :diffget         → tomar cambios del otro lado
4. :diffput         → poner cambios al otro lado
5. :diffoff         → salir del modo diff
```

### Ejercicio D: Verificar lualine

```text
1. Abre Neovim → observa la barra de estado inferior
2. Debe mostrar:
   - Modo (NORMAL, INSERT, VISUAL)
   - Rama git (si estás en un repo)
   - Cambios (+N ~N -N)
   - Nombre del archivo
   - Tipo de archivo
   - Posición (línea:columna)
```

### Ejercicio E: Tab Navigation con lualine

```text
Si tienes tabs abiertos y quieres verlas en lualine:

En lua/plugins/ui.lua, añade a lualine:
lualine_b = { "branch", "diff", "diagnostics" },

O instala bufferline.nvim para pestañas visuales:
{
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {},
}
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿gitsigns muestra │ en el gutter al modificar archivos? | | |
| ¿]h / [h navegan entre hunks? | | |
| ¿<leader>gg abre :Git con status? | | |
| ¿lualine muestra modo, rama, archivo y posición? | | |
| ¿Funciona el blame inline después de 1s? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Tema y which-key →](../04-ejercicio-tema-whichkey/README.md)
