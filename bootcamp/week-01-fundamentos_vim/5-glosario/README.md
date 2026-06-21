# 📚 Glosario - Semana 1

Términos clave de la Semana 1: Fundamentos de Vim.

---

## B

### Buffer
Representación en memoria de un archivo. Cuando abres un archivo en Vim, se carga en un buffer. Un buffer puede estar visible (en una ventana) u oculto.

```text
:ls      → lista todos los buffers
:b 2     → cambia al buffer 2
:bn      → siguiente buffer
:bp      → buffer anterior
```

---

## C

### Command-line Mode (Modo de Comandos)
Modo accedido con `:` desde Normal mode. Permite ejecutar comandos como guardar (`:w`), salir (`:q`), buscar (`/`), etc.

### Ctrl (Control)
Tecla modificadora. En Vim se abrevia como `<C-{tecla}>`. Ej: `<C-w>` significa Ctrl+w.

---

## E

### Esc
Tecla de escape. En Vim, **siempre te lleva a Normal Mode**. Es la tecla más importante. Presiónala cada vez que termines de escribir.

---

## H

### hjkl
Las "flechas" de Vim: `h` (izquierda), `j` (abajo), `k` (arriba), `l` (derecha). Están en la fila home del teclado para mantener las manos en posición de escritura.

```text
¿Por qué no usar las flechas?
→ Las flechas alejan la mano derecha de la fila home
→ hjkl mantiene las manos en posición óptima
→ Después de 2 semanas, es más rápido
```

---

## I

### init.lua
Archivo de configuración principal de Neovim. Equivalente al `.vimrc` de Vim clásico. Se escribe en Lua y se ubica en `~/.config/nvim/init.lua`.

```lua
-- Ejemplo mínimo de init.lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
```

### Insert Mode (Modo Inserción)
Modo para escribir texto. Se accede con `i`, `a`, `o` (y sus variantes). Se sale con `<Esc>`.

---

## L

### Leader Key
Tecla prefijo para mappings personalizados. Por defecto es `\`, pero comúnmente se reasigna a `<space>`.

```lua
vim.g.mapleader = " "      -- leader ahora es espacio

-- <leader>w significa: presiona espacio, luego w
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
```

### Lua
Lenguaje de scripting usado para configurar Neovim. Reemplazó a Vimscript como el lenguaje recomendado para configuración.

---

## M

### Mapping (Mapeo)
Asignación de una combinación de teclas a una acción. Se crean con `vim.keymap.set()`.

```lua
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
--              ↑      ↑           ↑                ↑
--            modo   teclas      acción         descripción
```

---

## N

### Neovim
Fork moderno de Vim iniciado en 2014. Añade LSP nativo, API en Lua, arquitectura de plugins mejorada y terminal integrado. Es el editor recomendado para este bootcamp.

### Normal Mode (Modo Normal)
Modo por defecto de Vim. Se usa para navegar y ejecutar comandos. **No** se escribe texto en este modo. Es el "hogar" de todo usuario de Vim.

---

## O

### Operator (Operador)
Comando que modifica texto. Los principales son:
- `d` — delete (eliminar)
- `c` — change (cambiar)
- `y` — yank (copiar)
- `>` — indentar derecha
- `<` — indentar izquierda

Los operadores se combinan con motions: `dw` = delete word, `cj` = change abajo.

---

## R

### relativenumber
Opción que muestra números de línea relativos a la posición del cursor. Facilita los saltos: si ves "5" arriba, presionas `5k`.

```lua
vim.opt.relativenumber = true
```

---

## S

### Split
División de la pantalla en ventanas. Horizontal (`:split`) o vertical (`:vsplit`). Se navega con `Ctrl-w hjkl`.

### .vimrc
Archivo de configuración de Vim clásico. Equivalente a `init.lua` para Neovim. Se escribe en Vimscript.

---

## T

### Tab
En Vim, una pestaña es una colección de ventanas (un layout). No es un archivo diferente.

### true color
Soporte para 16.7 millones de colores (24-bit) en la terminal. Se activa con `vim.opt.termguicolors = true`.

---

## V

### Vim
Vi IMproved. Editor de texto modal creado por Bram Moolenaar en 1991. Basado en vi (1976).

### Vimscript
Lenguaje de scripting nativo de Vim. Neovim soporta Lua como alternativa moderna.

### Visual Mode (Modo Visual)
Modo para seleccionar texto. Tres variantes: `v` (carácter), `V` (línea), `Ctrl-v` (bloque rectangular).

---

## W

### Window (Ventana)
Vista de un buffer. Puedes tener múltiples ventanas mostrando el mismo buffer o buffers diferentes.

---

## Y

### Yank
Término de Vim para "copiar". Se usa el comando `y`. `yy` copia una línea, `yw` copia una palabra.

---

> 📖 **Tip**: Este glosario crecerá cada semana. Vuelve a consultarlo cuando encuentres un término nuevo.
