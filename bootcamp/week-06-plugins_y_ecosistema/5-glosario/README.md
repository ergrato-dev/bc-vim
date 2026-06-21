# 📚 Glosario - Semana 6

Términos clave de la Semana 6: Plugins y Ecosistema.

---

## A

### autopairs
Plugin que automáticamente cierra pares de caracteres: `()` `[]` `{}` `""` `''` `` `` ``. Al escribir `(`, inserta `)` y posiciona el cursor entre ambos.

---

## B

### Bootstrap
Código de autoinstalación de lazy.nvim. Se ejecuta al iniciar Neovim y clona lazy.nvim si no existe, sin intervención del usuario.

### build
Directiva en spec de lazy.nvim para compilar o ejecutar comandos post-instalación. Ej: `build = "make"`.

---

## C

### cmd
Opción de lazy-loading que carga un plugin cuando se ejecuta un comando específico.

```lua
cmd = { "Fugitive", "Git" }  → carga al ejecutar :Fugitive o :Git
```

### Colorscheme
Tema de color para el editor. Define colores para sintaxis, fondo, UI, etc. Se aplica con `:colorscheme {nombre}`.

### Comment.nvim
Plugin para comentar/descomentar código con `gcc` (línea) o `gc{motion}` (bloque). Soporta múltiples lenguajes.

---

## D

### dependencies
En lazy.nvim, lista de plugins que deben instalarse antes que el plugin actual. Se instalan automáticamente.

---

## E

### event
Opción de lazy-loading que carga un plugin en respuesta a un evento de Vim.

```lua
event = "VeryLazy"                  → después de UI inicial
event = { "BufReadPre", "BufNewFile" } → al abrir archivos
event = "InsertEnter"               → al entrar a Insert mode
```

### enabled
Controla si un plugin se carga. `enabled = false` lo desactiva sin eliminar su configuración.

---

## F

### File tree
Explorador de archivos lateral. Alternativas: neo-tree.nvim, nvim-tree.lua, oil.nvim.

### Fugitive (vim-fugitive)
Plugin de git completo para Vim, creado por tpope. Permite hacer stage, commit, diff, blame, push desde Vim.

### Fuzzy finder
Buscador por coincidencia aproximada (no exacta). telescope.nvim es el estándar en Neovim.

---

## G

### Gitsigns
Plugin que muestra indicadores visuales de cambios git en la columna de signos (gutter). Muestra + (add), ~ (change), - (delete).

---

## K

### keys
Opción de lazy-loading que carga un plugin al presionar una combinación de teclas. También define keymaps.

```lua
keys = { { "<leader>ff", "...", desc = "Find files" } }
```

---

## L

### lazy-lock.json
Archivo generado por lazy.nvim que guarda los commits exactos de cada plugin instalado. Garantiza instalaciones reproducibles.

### lazy-loading
Técnica para cargar plugins solo cuando se necesitan, reduciendo el tiempo de inicio de Neovim.

### lazy.nvim
Gestor de plugins moderno para Neovim, creado por Folke Lemaitre. Soporta lazy-loading, UI interactiva, lockfile y perfilado.

### Lualine
Barra de estado (statusline) informativa. Muestra modo Vim, rama git, diagnóstico LSP, tipo de archivo y posición.

---

## M

### Modularidad
Organización de la configuración en archivos separados por responsabilidad (ui, editing, git, tools, lsp).

---

## N

### Neo-tree
File tree moderno para Neovim. Soporta iconos, git status, búsqueda, operaciones de archivo.

---

## O

### opts
Opción de spec en lazy.nvim para configuración declarativa. Se pasa automáticamente a `.setup()`. Alternativa más concisa a `config = function() ... end`.

---

## P

### Plugin manager
Herramienta para instalar, actualizar, desinstalar y gestionar plugins. lazy.nvim es el estándar para Neovim, vim-plug para Vim clásico.

### priority
Orden de carga de plugins. Valores más altos cargan primero. Los temas típicamente usan `priority = 1000`.

---

## R

### ripgrep (rg)
Herramienta de búsqueda de texto ultrarrápida. Usada por telescope para `live_grep`. Debe instalarse en el sistema.

---

## S

### Spec
Declaración de un plugin en lazy.nvim. Incluye URL, opciones de carga, dependencias y configuración.

### Statusline
Barra de estado en la parte inferior de cada ventana. Muestra información contextual del editor.

---

## T

### Telescope
Fuzzy finder universal para Neovim. Busca archivos, texto, buffers, ayuda, comandos y mucho más.

---

## V

### vim-plug
Gestor de plugins minimalista para Vim clásico (también funciona en Neovim). Creado por Junegunn Choi. Sintaxis en Vimscript.

---

## W

### which-key
Plugin que muestra una ventana emergente con los mappings disponibles al presionar una tecla prefijo. Ayuda a descubrir atajos sin memorizarlos.

---

> 📖 **Tip**: Un buen starter kit de plugins equilibra funcionalidad y velocidad. 10 plugins bien elegidos + lazy-loading < 100ms de inicio = configuración profesional. No instales plugins "por si acaso" — cada uno debe resolver un problema real que tengas.
