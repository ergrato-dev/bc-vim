# 📚 Glosario - Semana 4

Términos clave de la Semana 4: Buffers, Ventanas y Pestañas.

---

## A

### arglist
Lista de archivos pasados como argumentos al iniciar Vim. Accesible con `:args`. Navegable con `:n` (next) y `:N` (previous). Útil para procesar lotes de archivos con `:argdo`.

```text
nvim *.lua         → arglist contiene todos los .lua
:argdo %s/foo/bar/g | update
```

### alternate buffer (#)
El buffer que estabas viendo antes del buffer actual. Accesible con `Ctrl-6`, `Ctrl-^` o `:b#`. Vim siempre recuerda uno.

---

## B

### Buffer
Representación en memoria de un archivo. Un buffer puede estar visible (en una ventana), oculto (hidden) o inactivo.

```text
:ls          → lista todos los buffers
:b {n}       → cambia al buffer {n}
:bd          → elimina buffer
:bn / :bp    → siguiente/anterior buffer
```

### Buffer hidden (oculto)
Buffer modificado pero no visible en ninguna ventana. Solo posible con `set hidden`. Sin esta opción, Vim no permite cambiar de buffer si hay cambios sin guardar.

---

## C

### Ctrl-6 / Ctrl-^
Atajo para alternar entre el buffer actual y el buffer alternativo (#). El "toggle" de buffers más rápido.

### Ctrl-w
Prefijo para comandos de ventana (Window). `Ctrl-w h` = ir a ventana izquierda, `Ctrl-w s` = split horizontal.

### Ctrl-o / Ctrl-i
Navegación en el jump list (historial de saltos). `Ctrl-o` = salto anterior, `Ctrl-i` = salto siguiente.

---

## D

### :Explore / :Ex
Abre netrw (explorador de archivos) en la ventana actual. `:Vexplore` lo abre en split vertical, `:Sexplore` en horizontal, `:Texplore` en pestaña nueva.

---

## H

### hidden (opción)
Opción que permite tener buffers modificados sin ser visibles. **Imprescindible** para trabajo multi-archivo fluido.

```lua
vim.opt.hidden = true
```

---

## J

### Jump list
Historial de saltos de navegación. Navegable con `Ctrl-o` (atrás) y `Ctrl-i` (adelante). Los saltos incluyen: `gg`, `G`, `/`, `?`, `*`, `#`, `%`, `:n`, cambios de buffer, marcas.

---

## M

### `:mksession`
Guarda el estado completo de Vim (ventanas, pestañas, buffers, marcas, opciones) en un archivo de sesión.

```text
:mksession proyecto.vim      → guarda sesión
nvim -S proyecto.vim         → restaura sesión
```

---

## N

### netrw
Plugin incluido por defecto en Vim/Neovim para explorar y gestionar archivos. Se abre con `:Explore`, `:e .` o `-`.

Comandos clave de netrw:
```text
%          → crear archivo
d          → crear directorio
D          → eliminar
R          → renombrar
i          → cambiar estilo (thin/long/wide/tree)
mf         → marcar archivo
mt         → marcar target
mc         → copiar marcados al target
mm         → mover marcados al target
```

---

## P

### Pestaña (Tab)
Colección de ventanas (layout). En Vim, una pestaña NO es un archivo individual — es un "workspace" que contiene una o más ventanas.

```text
:tabnew       → nueva pestaña
:tabclose     → cerrar pestaña
gt / gT       → siguiente/anterior pestaña
{n}gt         → ir a pestaña {n}
:tabmove {n}  → reordenar pestaña
```

---

## Q

### Quickfix list
Lista de posiciones generada por comandos como `:vimgrep`, `:make`, `:helpgrep`. Navegable con `:cnext` / `:cprev`. Se muestra con `:copen`.

---

## S

### Sesión
Archivo que guarda el estado completo de Vim. Ver `:mksession`.

### Split
División de la pantalla en ventanas. Horizontal (`:split`/`:sp`) o vertical (`:vsplit`/`:vs`).

```text
Ctrl-w s / Ctrl-w v    → split horizontal/vertical
Ctrl-w =               → igualar tamaños
Ctrl-w q               → cerrar ventana
:only                  → solo esta ventana
```

---

## T

### Tab (ver Pestaña)

---

## V

### Ventana (Window)
Vista (viewport) de un buffer. Múltiples ventanas pueden mostrar el mismo buffer o buffers diferentes. Una pestaña contiene una o más ventanas.

```text
┌──────────────────────────┐
│ Pestaña (Tab)            │
│ ┌────────┬─────────────┐ │
│ │ Vent. 1│ Vent. 2     │ │
│ │ Buf A  │ Buf B       │ │
│ └────────┴─────────────┘ │
└──────────────────────────┘
```

---

## W

### Window (ver Ventana)

### Workspace
Término para describir un layout organizado de ventanas y pestañas para un contexto de trabajo específico (código, tests, documentación, terminal).

---

## Símbolos

### `-`
En Normal mode, abre netrw en el directorio del archivo actual. En netrw, sube al directorio padre.

### `%`
En netrw: crea un nuevo archivo en el directorio actual. En comandos: representa el nombre del archivo actual (`:!node %`).

### `#`
En comandos: representa el buffer alternativo (`:e #`, `:vs #`). Ver alternate buffer.

---

> 📖 **Tip**: La distinción Buffer/Window/Tab es el concepto más importante de esta semana. Buffer = contenido (memoria). Window = vista (pantalla). Tab = colección de vistas (layout). Un mismo buffer puede estar en múltiples ventanas y pestañas.
