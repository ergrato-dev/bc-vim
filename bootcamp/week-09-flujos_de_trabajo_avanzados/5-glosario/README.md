# 📚 Glosario - Semana 9

Términos clave de la Semana 9: Flujos de Trabajo Avanzados.

---

## A

### Arglist
Lista de archivos que Vim procesa como argumentos. Originalmente son los archivos pasados al iniciar Vim, pero se puede modificar dinámicamente con `:args`, `:arga`, `:argd`.

### :argdo
Ejecuta un comando en cada archivo del arglist secuencialmente. Requiere `set hidden`.

```text
:argdo %s/old/new/g | update
```

---

## B

### :bufdo
Similar a `:argdo` pero ejecuta el comando en todos los buffers abiertos (no en el arglist).

### Batch processing
Procesamiento por lotes: ejecutar un comando en múltiples archivos sin abrirlos manualmente. `:argdo`, `:bufdo`, `:cfdo`, `:cdo`.

---

## C

### :cdo
Ejecuta un comando en cada entrada de la quickfix list. 50 resultados = 50 ejecuciones.

### :cfdo
Ejecuta un comando en cada archivo único de la quickfix list. 50 resultados en 5 archivos = 5 ejecuciones. Más eficiente para sustituciones globales por archivo.

### :Cfilter
Filtra la quickfix list. `:Cfilter /patrón/` muestra solo ítems coincidentes. `:Cfilter! /patrón/` excluye coincidentes.

### :cnext / :cprev
Navegan al siguiente/anterior ítem en la quickfix list. Recomendado mapear a `]q`/`[q`.

### :copen / :cclose
Abren/cierran la ventana de quickfix.

---

## D

### Diff
Comparación visual entre dos versiones de un archivo. `:Gdiffsplit` muestra diff git, `:diffthis` en ventanas manuales.

---

## F

### Fugitive (vim-fugitive)
Plugin de git para Vim creado por tpope. Wrapper completo que sigue la filosofía de Vim. Comandos clave: `:Gstatus`, `:Gcommit`, `:Gdiffsplit`, `:Gblame`, `:Glog`, `:Gedit`.

---

## G

### :grep
Busca un patrón usando la herramienta grep externa configurada en `grepprg`. Más rápido que `:vimgrep` si se configura ripgrep.

### grepprg
Opción que define qué programa usar para `:grep`. Recomendado: `rg --vimgrep --no-heading --smart-case`.

---

## L

### Location list
Similar a quickfix pero asociada a una ventana específica. Cada ventana puede tener su propia location list. Comandos: `:lopen`, `:lnext`, `:lprev`, `:lvimgrep`, `:lgrep`.

---

## M

### :make
Ejecuta el programa definido en `makeprg` y automáticamente puebla la quickfix list con los errores de compilación.

### makeprg
Opción que define qué comando ejecutar con `:make`. Ej: `cargo build`, `npm run build`.

### :mksession
Guarda el estado completo de Vim (ventanas, pestañas, buffers, folds, marcas) en un archivo de sesión. Restaurable con `nvim -S`.

---

## Q

### Quickfix list
Lista global de ubicaciones (archivo + línea + columna) poblada por `:vimgrep`, `:grep`, `:make`, etc. Navegable con `:copen`, `:cnext`, `:cprev`.

---

## R

### ripgrep (rg)
Herramienta de búsqueda de texto ultrarrápida (en Rust). Usada como `grepprg` para `:grep`. Comando: `rg --vimgrep`.

---

## S

### Sesión
Archivo que guarda el estado completo de Vim. Ver `:mksession`.

### sessionoptions
Opciones que controlan qué se guarda en una sesión. `buffers`, `folds`, `tabpages`, `winsize`, `globals`, `options`, etc.

---

## V

### :vimgrep
Busca un patrón en múltiples archivos usando el motor de regex interno de Vim. Pobla la quickfix list.

```text
:vimgrep /patrón/gj **/*.lua
```

### :vimgrep flags
- `g`: todas las ocurrencias en una línea
- `j`: no saltar al primer resultado (solo llenar quickfix)

---

> 📖 **Tip**: El trío `:vimgrep` → `:copen` → `:cfdo %s/old/new/gc | update` es el flujo de refactorización más potente de Vim. Encuentras, analizas, reemplazas y guardas — todo sin salir del editor.
