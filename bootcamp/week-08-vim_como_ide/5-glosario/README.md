# 📚 Glosario - Semana 8

Términos clave de la Semana 8: Vim como IDE.

---

## A

### AST (Abstract Syntax Tree)
Árbol sintáctico que representa la estructura del código. Treesitter genera un AST para cada buffer, permitiendo resaltado semántico, text objects precisos y análisis estructural.

### Autocompletado
Motor de sugerencias mientras escribes. nvim-cmp es el estándar en Neovim, conectando múltiples fuentes: LSP, buffer, path, snippets.

---

## B

### Breakpoint
Punto de interrupción en el código donde la ejecución se detiene durante debugging. En nvim-dap se pone/ quita con `:DapToggleBreakpoint` o `<leader>db`.

---

## C

### cmp (completion)
Ver nvim-cmp.

### cmp-buffer
Fuente de nvim-cmp que sugiere palabras ya escritas en buffers abiertos.

### cmp-nvim-lsp
Fuente de nvim-cmp que provee sugerencias desde los language servers conectados.

### cmp-path
Fuente de nvim-cmp que sugiere rutas de archivos y directorios al escribir paths.

### Code Action
Refactorización o corrección automática sugerida por el LSP. Accesible con vim.lsp.buf.code_action().

### Code Lens
Anotaciones inline que el LSP puede mostrar (referencias, implementaciones, test runners).

---

## D

### DAP (Debug Adapter Protocol)
Protocolo estándar para debugging. Equivalente de LSP pero para debuggers.

### debugpy
Debug adapter para Python. Se comunica con nvim-dap mediante DAP.

### Diagnóstico (Diagnostic)
Errores, warnings, hints e información que el LSP reporta sobre el código. Mostrados como virtual text, signos en gutter y subrayados.

---

## F

### Folding
Colapsar/expandir secciones de código. Treesitter permite folding estructural (por funciones, clases, bloques).

### Fuente (Source)
Proveedor de sugerencias para nvim-cmp. Pueden ser: LSP, buffer, path, snippets, git, etc.

---

## H

### Hover
Documentación emergente al colocar el cursor sobre un símbolo (K con LSP). Muestra tipo, firma y documentación.

---

## I

### Incremental Selection
Selección progresiva de nodos del AST. gnn inicia, grn expande, grm reduce.

---

## L

### Language Server
Programa externo que analiza código y provee features de IDE mediante LSP. Ej: pyright (Python), lua_ls (Lua), ts_ls (TypeScript).

### LSP (Language Server Protocol)
Protocolo estándar para comunicación editor-servidor de lenguaje. Define mensajes para diagnóstico, completado, navegación, etc.

### LuaSnip
Motor de snippets en Lua. Soporta snippets estáticos, dinámicos, con transformaciones y choice nodes.

---

## M

### mason.nvim
Gestor de language servers, linters y formatters. Interfaz gráfica (:Mason) para instalar/desinstalar herramientas.

### mason-lspconfig.nvim
Puente entre mason.nvim y nvim-lspconfig. Automatiza la instalación y configuración de language servers.

---

## N

### nvim-cmp
Motor de autocompletado extensible para Neovim. Conecta múltiples fuentes (LSP, buffer, path, snippets) en un menú unificado.

### nvim-dap
Cliente DAP para Neovim. Permite debugging con breakpoints, step over/into/out, inspección de variables.

### nvim-dap-ui
Interfaz visual para nvim-dap. Muestra paneles de variables, stack, breakpoints y watch.

### nvim-lspconfig
Plugin que facilita la configuración de language servers en Neovim. Provee configuraciones predefinidas para ~150 servidores.

### nvim-treesitter
Plugin que integra la biblioteca Treesitter en Neovim. Provee resaltado semántico, text objects, folding e indentación basados en AST.

---

## O

### on_attach
Callback que se ejecuta cuando un LSP se conecta a un buffer. Ideal para configurar keymaps buffer-local.

---

## P

### Parser (Treesitter)
Gramática compilada que Treesitter usa para generar el AST de un lenguaje. Se instalan con `:TSInstall {lang}`.

---

## S

### Snippet
Plantilla de código expandible. Contiene tabstops (i), placeholders, texto literal (t) y funciones de transformación (f).

### Step over / Step into / Step out
Comandos de debugging. Step over ejecuta la línea actual, step into entra en la función, step out sale de la función.

---

## T

### Tabstop
Posición navegable dentro de un snippet. i(1), i(2), i(0). Tab avanza, S-Tab retrocede.

### Treesitter
Biblioteca de parsing incremental. Genera un AST (árbol sintáctico) del código, permitiendo análisis semántico preciso.

### Text Objects (Treesitter)
Extensiones de text objects basadas en AST: af (a function), if (inner function), ac (a class), al (a loop).

---

> 📖 **Tip**: La combinación LSP + nvim-cmp + Treesitter es lo que realmente convierte Neovim en un IDE. El LSP da inteligencia, cmp da velocidad al escribir, y Treesitter da precisión visual y estructural. Los tres juntos = experiencia IDE completa.
