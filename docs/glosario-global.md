# Glosario Global — Bootcamp Vim Zero to Hero

Todos los términos del bootcamp ordenados alfabéticamente. Cada entrada incluye la semana donde se introduce y un enlace al glosario de esa semana para profundizar.

---

## A

| Término | Semana | Definición |
|---------|--------|-----------|
| `a` (around) | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Prefijo de text object que incluye el contenido, delimitadores y espacios. Ej: `da"` elimina las comillas también. |
| arglist | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Lista de archivos pasados como argumentos a Vim. Navegable con `:n`/`:N`. Procesable con `:argdo`. |
| `:argdo` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Ejecuta un comando en cada archivo del arglist. Requiere `set hidden`. |
| AST (Abstract Syntax Tree) | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Árbol sintáctico del código generado por Treesitter. Permite resaltado semántico y text objects estructurales. |
| Autocmd (Autocomando) | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Comando que se ejecuta automáticamente en respuesta a un evento de Vim (abrir archivo, guardar, etc.). |
| Augroup | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Grupo de autocomandos que permite limpiarlos al recargar configuración, evitando duplicados. |
| Autocompletado | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Motor de sugerencias mientras escribes. nvim-cmp conecta múltiples fuentes: LSP, buffer, path, snippets. |
| alternate buffer (`#`) | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | El buffer que estabas viendo antes del actual. Accesible con `Ctrl-6` o `:b#`. |
| autopairs | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Plugin que cierra automáticamente pares `()`, `[]`, `{}`, `""`, etc. |

---

## B

| Término | Semana | Definición |
|---------|--------|-----------|
| Batch processing | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Ejecutar un comando en múltiples archivos sin abrirlos manualmente. Herramientas: `:argdo`, `:bufdo`, `:cfdo`. |
| Bootstrap (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Código de autoinstalación de lazy.nvim que se ejecuta si el plugin no existe al iniciar Neovim. |
| Breakpoint | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Punto de interrupción en el código donde la ejecución se detiene durante debugging (nvim-dap). |
| `:bufdo` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Ejecuta un comando en todos los buffers abiertos. |
| Buffer | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Representación en memoria de un archivo. Puede estar visible (en ventana) u oculto. |
| Buffer hidden (oculto) | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Buffer con cambios pero no visible en ninguna ventana. Requiere `set hidden`. |

---

## C

| Término | Semana | Definición |
|---------|--------|-----------|
| Callback | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Función Lua que se ejecuta cuando ocurre un evento (keymap, autocmd, comando). |
| Cambio (change) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Modificación del buffer que activa el comando `.`. Incluye inserciones, eliminaciones y sustituciones. |
| Clipboard | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Portapapeles del sistema. Accesible en Vim con el registro `"+`. |
| cmp-buffer | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Fuente de nvim-cmp que sugiere palabras ya escritas en buffers abiertos. |
| cmp-nvim-lsp | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Fuente de nvim-cmp con sugerencias desde los language servers conectados. |
| cmp-path | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Fuente de nvim-cmp que sugiere rutas de archivos y directorios. |
| Code Action | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Refactorización o corrección automática sugerida por el LSP. Accesible con `vim.lsp.buf.code_action()`. |
| Colorscheme | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Tema de color del editor. Se aplica con `:colorscheme {nombre}`. |
| Command-line Mode | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Modo de Vim accedido con `:`. Permite ejecutar comandos como `:w`, `:q`, `:s`, etc. |
| Comment.nvim | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Plugin para comentar/descomentar código con `gcc` (línea) o `gc{motion}` (bloque). |
| `Ctrl-a` / `Ctrl-x` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Incrementa/decrementa el número bajo el cursor. Útil en macros para crear secuencias numéricas. |
| `Ctrl-6` / `Ctrl-^` | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Alterna entre el buffer actual y el buffer alternativo (#). |
| `Ctrl-o` / `Ctrl-i` | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Navega el jump list. `Ctrl-o` = salto anterior, `Ctrl-i` = salto siguiente. |
| `Ctrl-r {reg}` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | En Insert mode, pega el contenido del registro `{reg}` sin salir del modo. |
| `Ctrl-v` | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Entra a Visual block mode para selección rectangular de texto en múltiples líneas. |

---

## D

| Término | Semana | Definición |
|---------|--------|-----------|
| DAP (Debug Adapter Protocol) | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Protocolo estándar para debugging. Equivalente de LSP para debuggers. |
| debugpy | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Debug adapter para Python que se comunica con nvim-dap. |
| Diagnóstico (LSP) | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Errores, warnings, hints e información que el LSP reporta sobre el código. |
| Diff | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Comparación visual entre dos versiones de un archivo. `:Gdiffsplit` muestra diff de git. |
| Dot Command (`.`) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Repite el último cambio que modificó el buffer. El comando más poderoso de Vim. |
| Dotfiles | [S10](../bootcamp/week-10-proyecto_final/5-glosario/README.md) | Archivos de configuración del entorno de desarrollo, versionados en git. |

---

## E

| Término | Semana | Definición |
|---------|--------|-----------|
| `enabled` (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Controla si un plugin se carga. `enabled = false` lo desactiva sin borrar su configuración. |
| Evento | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Nombre del suceso que dispara un autocmd. Ej: `BufWritePre`, `FileType`, `LspAttach`. |
| `event` (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Opción de lazy-loading que carga un plugin al dispararse un evento de Vim. |
| `:Explore` / `:Ex` | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Abre netrw (explorador de archivos) en la ventana actual. |
| Expresión regular (regex) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Patrón de búsqueda usado en `:s`, `:g`, `/` y `?`. Vim tiene su propio dialecto. |
| Ex command | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Comandos que empiezan con `:` en Vim: `:w`, `:q`, `:set`, `:help`, `:e`. |

---

## F

| Término | Semana | Definición |
|---------|--------|-----------|
| `f{char}` (find) | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Motion que salta el cursor SOBRE la siguiente ocurrencia de `{char}` en la línea. `F{char}` busca atrás. |
| File tree | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Explorador de archivos lateral. Alternativas: neo-tree.nvim, nvim-tree, oil.nvim. |
| Filter (`!`) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Operador que pasa texto a través de un comando externo y reemplaza el texto con la salida. |
| Folding | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Colapsar/expandir secciones de código. Treesitter permite folding estructural por funciones y bloques. |
| ftplugin | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Directorio `after/ftplugin/` para configuraciones por tipo de archivo. |
| Fugitive (vim-fugitive) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Plugin de git completo para Vim creado por tpope. Stage, commit, diff, blame, push desde Vim. |
| Fuzzy finder | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Buscador por coincidencia aproximada. telescope.nvim es el estándar en Neovim. |

---

## G

| Término | Semana | Definición |
|---------|--------|-----------|
| `:g` (global) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Ejecuta una acción en todas las líneas que coinciden con un patrón. |
| Gitsigns | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Plugin que muestra indicadores visuales de cambios git en el gutter (`+`, `~`, `-`). |
| `:grep` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Busca un patrón usando la herramienta grep externa configurada en `grepprg`. |
| `grepprg` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Opción que define qué programa usar para `:grep`. Recomendado: ripgrep (`rg --vimgrep`). |
| `g*` / `g#` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Variantes de `*`/`#` que buscan la palabra bajo el cursor como substring (no palabra exacta). |
| `gu` / `gU` / `g~` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Operadores de cambio de capitalización: lowercase, UPPERCASE, toggle. |
| `gv` | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Re-selecciona la última selección visual. |

---

## H

| Término | Semana | Definición |
|---------|--------|-----------|
| `hidden` (opción) | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Permite tener buffers modificados sin ser visibles. Imprescindible para trabajo multi-archivo. |
| hjkl | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Las "flechas" de Vim: `h` (izq), `j` (abajo), `k` (arriba), `l` (der). En fila home del teclado. |
| Hover | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Documentación emergente al colocar el cursor sobre un símbolo (`K` con LSP activo). |

---

## I

| Término | Semana | Definición |
|---------|--------|-----------|
| `i` (inside) | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Prefijo de text object que incluye SOLO el contenido interior, sin delimitadores. |
| `i"` / `a"`, `i{` / `a{`, etc. | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Text objects para pares de delimitadores: comillas, llaves, paréntesis, corchetes, ángulos. |
| `ip` / `ap` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Text objects de párrafo: `ip` = inner paragraph, `ap` = a paragraph (con línea separadora). |
| `it` / `at` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Text objects de tags HTML/XML: `it` = inner tag, `at` = a tag (con las etiquetas). |
| `iw` / `aw` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Inner word / a word. `iw` sin espacios, `aw` incluye espacio posterior. |
| Incremental Selection | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Selección progresiva de nodos del AST de Treesitter. `gnn` inicia, `grn` expande. |
| init.lua | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Archivo de configuración principal de Neovim. Ubicado en `~/.config/nvim/init.lua`. |
| Insert Mode | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Modo para escribir texto. Se accede con `i`, `a`, `o`. Se sale con `<Esc>`. |

---

## J

| Término | Semana | Definición |
|---------|--------|-----------|
| Jump list | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Historial de saltos de navegación. `Ctrl-o` = atrás, `Ctrl-i` = adelante. |

---

## K

| Término | Semana | Definición |
|---------|--------|-----------|
| `keys` (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Opción de lazy-loading que carga un plugin al presionar una combinación de teclas. |

---

## L

| Término | Semana | Definición |
|---------|--------|-----------|
| Language Server | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Programa externo que analiza código y provee features de IDE mediante LSP. |
| lazy-loading | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Técnica para cargar plugins solo cuando se necesitan, reduciendo el tiempo de inicio. |
| lazy-lock.json | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Archivo generado por lazy.nvim que guarda los commits exactos de cada plugin. |
| lazy.nvim | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Gestor de plugins moderno para Neovim. Soporta lazy-loading, lockfile y UI interactiva. |
| Leader Key | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Tecla prefijo para mappings personalizados. Por defecto `\`, comúnmente reasignada a `<space>`. |
| `:let @{reg}` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Asigna contenido directamente a un registro. Útil para definir o editar macros programáticamente. |
| Location list | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Similar a quickfix pero asociada a una ventana específica. Comandos: `:lopen`, `:lnext`. |
| LSP (Language Server Protocol) | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Protocolo estándar para comunicación editor-servidor de lenguaje. |
| Lua | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Lenguaje de scripting usado para configurar Neovim. Reemplazó Vimscript como estándar. |
| Lualine | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Barra de estado informativa. Muestra modo, rama git, diagnóstico LSP y posición. |
| LuaSnip | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Motor de snippets en Lua. Soporta snippets estáticos, dinámicos y con transformaciones. |

---

## M

| Término | Semana | Definición |
|---------|--------|-----------|
| Macro | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Secuencia de comandos Vim grabada en un registro. `qa ... q` graba, `@a` ejecuta. |
| Macro recursiva | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Macro que se llama a sí misma al final (`@a` dentro de la macro `a`). Se detiene al encontrar error. |
| `:make` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Ejecuta el programa en `makeprg` y puebla la quickfix list con errores de compilación. |
| Mapping (Mapeo) | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Asignación de teclas a una acción. Se crean con `vim.keymap.set()`. |
| Marcas (Marks) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Posiciones guardadas para navegación rápida. `m{a-z}` local, `m{A-Z}` global entre archivos. |
| mason.nvim | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Gestor de language servers, linters y formatters con interfaz gráfica (`:Mason`). |
| `:mksession` | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Guarda el estado completo de Vim en un archivo de sesión. Restaurable con `nvim -S`. |
| Módulo (Lua) | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Archivo Lua que expone funciones mediante `return`. Cargable con `require()`. |
| Modularidad | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Organización de la configuración en archivos separados por responsabilidad. |
| Motion | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Comando que mueve el cursor. Actúa como "sustantivo" y se combina con operadores. |

---

## N

| Término | Semana | Definición |
|---------|--------|-----------|
| `n` / `N` | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Navega resultados de búsqueda: `n` = siguiente, `N` = anterior en dirección opuesta. |
| Neo-tree | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | File tree moderno para Neovim con iconos, git status y operaciones de archivo. |
| Neovim | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Fork moderno de Vim (2014). Añade LSP nativo, API en Lua y arquitectura de plugins mejorada. |
| netrw | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Explorador de archivos incluido por defecto en Vim/Neovim. Se abre con `:Explore`. |
| `:normal @{reg}` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Ejecuta la macro `{reg}` en cada línea de un rango. `:%normal @q` = aplica a todo el archivo. |
| Normal Mode | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Modo por defecto de Vim para navegar y ejecutar comandos. No se escribe texto aquí. |
| nvim-cmp | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Motor de autocompletado extensible para Neovim. Une LSP, buffer, path y snippets. |
| nvim-dap | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Cliente DAP para Neovim. Debugging con breakpoints, step over/into/out e inspección. |
| nvim-lspconfig | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Plugin que facilita la configuración de language servers en Neovim. |
| nvim-treesitter | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Plugin que integra Treesitter en Neovim con resaltado semántico y text objects. |

---

## O

| Término | Semana | Definición |
|---------|--------|-----------|
| `on_attach` | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Callback que se ejecuta cuando un LSP se conecta a un buffer. Ideal para keymaps buffer-local. |
| Operator (Operador) | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Comando que modifica texto. Los principales: `d` (delete), `c` (change), `y` (yank), `>`, `<`. |
| `opts` (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Opción de spec en lazy.nvim para configuración declarativa, pasada automáticamente a `.setup()`. |

---

## P

| Término | Semana | Definición |
|---------|--------|-----------|
| Parser (Treesitter) | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Gramática compilada que Treesitter usa para generar el AST. Se instalan con `:TSInstall {lang}`. |
| Pestaña (Tab) | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Colección de ventanas (layout). En Vim, una tab NO es un archivo — es un workspace de ventanas. |
| Plugin manager | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Herramienta para instalar y gestionar plugins. lazy.nvim para Neovim, vim-plug para Vim clásico. |
| Primary selection (`"*`) | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | En sistemas X11 (Linux), la selección con el ratón, pegada con botón central. |
| `priority` (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Orden de carga de plugins. Temas típicamente usan `priority = 1000` para cargarse primero. |

---

## Q

| Término | Semana | Definición |
|---------|--------|-----------|
| `q{reg} ... q` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Inicia y detiene la grabación de una macro en el registro `{reg}`. |
| Quickfix list | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Lista de posiciones generada por `:vimgrep`, `:make`, etc. Se muestra con `:copen`. |

---

## R

| Término | Semana | Definición |
|---------|--------|-----------|
| `range` (comando) | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Opción de comando Vim que permite especificar rango de líneas: `:5,10MiComando`. |
| Rango | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Especificación de líneas para comandos `:`. Ej: `.` = actual, `%` = todo, `'<,'>` = selección visual. |
| `:reg` | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Muestra el contenido de todos los registros o de registros específicos. |
| Registro (`"`) | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Espacio de almacenamiento nombrado (1 carácter) para texto o comandos. |
| Registro `"0` (yank) | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Almacena siempre el último texto copiado (`y`). No se sobrescribe con operaciones de delete. |
| Registro `"+` (sistema) | [S5](../bootcamp/week-05-registros_y_macros/5-glosario/README.md) | Portapapeles del sistema operativo. Permite copiar/pegar entre Vim y otras aplicaciones. |
| `relativenumber` | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Opción que muestra números de línea relativos al cursor. Facilita saltos: `5k`, `3j`. |
| ripgrep (`rg`) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Herramienta de búsqueda ultrarrápida. Usada por telescope para `live_grep`. |

---

## S

| Término | Semana | Definición |
|---------|--------|-----------|
| Scope (Ámbito) | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Prefijo que determina la visibilidad: `g:` global, `b:` buffer-local, `w:` window-local. |
| Sesión | [S4](../bootcamp/week-04-buffers_windows_tabs/5-glosario/README.md) | Archivo que guarda el estado completo de Vim (ventanas, pestañas, buffers). Ver `:mksession`. |
| Shell command | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Ejecución de comandos del sistema desde Vim con `:!`, `:r !`, `:{rango}!`. |
| smartcase | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Opción que hace la búsqueda case-sensitive solo si el patrón contiene mayúsculas. |
| Snippet | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Plantilla de código expandible con tabstops, placeholders y transformaciones. |
| Spec (lazy.nvim) | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Declaración de un plugin en lazy.nvim con URL, opciones de carga y configuración. |
| Split | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | División de la pantalla en ventanas. `:split` (horizontal) o `:vsplit` (vertical). |
| `:s` (sustitución) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Reemplaza texto en el buffer. `:s/foo/bar/g` en línea, `:%s/foo/bar/g` en todo el archivo. |
| Statusline | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Barra de estado en la parte inferior de cada ventana con información contextual. |

---

## T

| Término | Semana | Definición |
|---------|--------|-----------|
| Tab (ver Pestaña) | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | En Vim, una pestaña es un layout de ventanas, no un archivo. |
| Tabstop | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Posición navegable dentro de un snippet. Tab avanza, S-Tab retrocede. |
| Telescope | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Fuzzy finder universal para Neovim. Busca archivos, texto, buffers, comandos y más. |
| Text Object | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Unidad estructural de texto semántica: palabras, strings, bloques, párrafos, tags. |
| `t{char}` (till) | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Motion que salta hasta JUSTO ANTES de `{char}` en la línea. `T{char}` busca hacia atrás. |
| Treesitter | [S8](../bootcamp/week-08-vim_como_ide/5-glosario/README.md) | Biblioteca de parsing incremental que genera un AST del código para análisis semántico. |
| true color | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Soporte para 16.7M de colores en terminal. Se activa con `vim.opt.termguicolors = true`. |

---

## V

| Término | Semana | Definición |
|---------|--------|-----------|
| Ventana (Window) | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Vista (viewport) de un buffer. Múltiples ventanas pueden mostrar el mismo o distintos buffers. |
| Verbo + Sustantivo | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | Paradigma de Vim: operador (verbo) + motion/text object (sustantivo) = acción. |
| `vim.api` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Módulo Lua con acceso a la API pública de Neovim. `nvim_create_autocmd`, `nvim_buf_get_lines`, etc. |
| `vim.cmd()` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Función Lua que ejecuta comandos Ex de Vimscript. `vim.cmd("colorscheme onedark")`. |
| `vim.fn` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | Módulo Lua para llamar funciones built-in de Vimscript: `vim.fn.expand()`, `vim.fn.stdpath()`. |
| `vim.g` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | API para variables globales de Vim. `vim.g.mapleader`, `vim.g.netrw_banner`. |
| `vim.keymap.set()` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | API moderna (Neovim 0.7+) para crear mapeos de teclas con descripciones y callbacks. |
| `vim.opt` | [S7](../bootcamp/week-07-vimscript_y_lua/5-glosario/README.md) | API Lua para opciones de Vim. Reemplaza `:set` de Vimscript. |
| Vim | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Vi IMproved. Editor de texto modal creado por Bram Moolenaar en 1991. |
| vim-plug | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Gestor de plugins minimalista para Vim clásico. Sintaxis en Vimscript. |
| `:vimgrep` | [S9](../bootcamp/week-09-flujos_de_trabajo_avanzados/5-glosario/README.md) | Busca un patrón en múltiples archivos usando regex interno de Vim. Puebla la quickfix list. |
| Vimscript | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Lenguaje de scripting nativo de Vim. Neovim soporta Lua como alternativa moderna. |
| Visual Mode | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Modo para seleccionar texto. `v` (carácter), `V` (línea), `Ctrl-v` (bloque rectangular). |
| `:v` (inverse global) | [S3](../bootcamp/week-03-edicion_eficiente/5-glosario/README.md) | Opuesto a `:g`. Ejecuta comando en líneas que NO coinciden con el patrón. |

---

## W

| Término | Semana | Definición |
|---------|--------|-----------|
| which-key | [S6](../bootcamp/week-06-plugins_y_ecosistema/5-glosario/README.md) | Plugin que muestra los mappings disponibles al presionar una tecla prefijo. |
| word vs WORD | [S2](../bootcamp/week-02-motions_y_text_objects/5-glosario/README.md) | `word` (w): se detiene en puntuación. `WORD` (W): solo se detiene en espacios. |

---

## Y

| Término | Semana | Definición |
|---------|--------|-----------|
| Yank | [S1](../bootcamp/week-01-fundamentos_vim/5-glosario/README.md) | Término de Vim para "copiar". Comando `y`. `yy` copia una línea, `yw` copia una palabra. |

---

> Cada semana tiene su propio glosario detallado en `bootcamp/week-XX-*/5-glosario/README.md` con ejemplos de código y contexto adicional.
