# 📚 Glosario - Semana 5

Términos clave de la Semana 5: Registros y Macros.

---

## @

### @@
Repite la última macro ejecutada. Equivale a `@{último-registro-usado}`. Útil para repetir macros rápidamente sin recordar qué registro se usó.

### @{reg}
Ejecuta la macro almacenada en el registro `{reg}`. Si el registro contiene comandos Vim válidos, los reproduce secuencialmente.

```text
@a       → ejecuta macro en registro 'a'
@b       → ejecuta macro en registro 'b'
3@q      → ejecuta macro 'q' 3 veces
```

---

## C

### Clipboard
Portapapeles del sistema operativo. En Vim se accede con el registro `"+`. Integra Vim con el resto de aplicaciones (navegador, terminal, otras apps).

### Ctrl-a / Ctrl-x
Incrementa/decrementa el número bajo el cursor o el siguiente número en la línea. En macros permite crear secuencias numéricas automáticas.

```text
0 → Ctrl-a → 1 → Ctrl-a → 2 → ...
10 → Ctrl-x → 9
```

### Ctrl-r {reg}
En Insert mode, pega el contenido del registro `{reg}`. Útil para insertar texto almacenado sin salir de Insert mode.

```text
Ctrl-r "     → pega registro sin nombre
Ctrl-r a     → pega registro 'a'
Ctrl-r %     → pega nombre de archivo actual
```

---

## L

### :let @{reg} = '...'
Asigna contenido directamente a un registro sin necesidad de grabar una macro. Útil para definir macros programáticamente.

```text
:let @a = '0f,s": "j'     → asigna macro al registro 'a'
:let @a .= 'j'              → añade 'j' al final del registro 'a'
:let @a = ''                → vacía el registro 'a'
```

---

## M

### Macro
Secuencia de comandos Vim grabada en un registro. Permite automatizar tareas repetitivas sin programar.

```text
Grabar:    qa ... q       (qa inicia, q detiene)
Ejecutar:  @a              (reproduce la macro)
Repetir:   @@              (última macro ejecutada)
Lote:      :%normal @a     (aplica a cada línea)
```

### Macro recursiva
Macro que se llama a sí misma al final (`@a` dentro de `qa ... @a q`). Se ejecuta hasta que encuentra un error (ej: `j` falla al final del archivo). La auto-llamada debe ser el ÚLTIMO comando de la macro.

```text
qa I - Esc j @a q
@a          → ejecuta en líneas 1 a N automáticamente
```

---

## N

### :normal @{reg}
Ejecuta la macro `{reg}` como si fuera un comando Normal mode en cada línea del rango especificado. La macro se aplica UNA vez por línea.

```text
:%normal @q          → aplica macro 'q' a TODO el archivo
:10,50normal @w      → aplica macro 'w' a líneas 10-50
:g/ERROR/normal @e   → aplica macro 'e' solo a líneas con "ERROR"
```

---

## P

### Primary selection (`"*`)
En sistemas X11 (Linux), la selección primaria (texto seleccionado con el ratón, pegado con botón central). En Windows/macOS, generalmente equivalente a `"+`.

### `"0` (registro de yank)
Registro especial que almacena siempre el último texto **copiado** (`y`). No se sobrescribe con operaciones de delete (`d`, `x`, `c`). Permite recuperar una copia después de eliminar algo.

```text
yiw           → copia palabra → "" y "0
diw           → elimina palabra → "" (sobrescrito), "0 (intacto)
"0p           → pega la copia original
```

---

## Q

### q{reg} ... q
Inicia (`q{reg}`) y detiene (`q`) la grabación de una macro en el registro `{reg}`.

```text
qa            → inicia grabación en registro 'a'
...comandos...
q             → detiene grabación
```

### q{R mayúscula} ... q
Inicia grabación en modo APPEND. Los comandos se añaden al final del registro existente en vez de sobrescribirlo.

```text
qa ... q      → graba macro base
qA ... q      → añade más comandos al final de 'a'
```

---

## R

### Registro
Espacio de almacenamiento nombrado (1 carácter) para texto o comandos. Vim tiene ~40 registros especiales y 26 registros con nombre (`a`-`z`).

### Registro sin nombre (`""`)
Registro por defecto. Todo delete (`d`, `x`, `c`, `s`) y yank (`y`) va aquí automáticamente. `p` sin prefijo pega desde este registro.

### Registro de pequeño delete (`"-`)
Almacena texto eliminado que mide menos de una línea. `x`, `dw`, `D` van aquí, pero `dd` (línea completa) no.

### `:reg`
Muestra el contenido de todos los registros o de registros específicos.

```text
:reg              → todos los registros
:reg a b c        → registros 'a', 'b', 'c'
:reg ""           → registro sin nombre
:reg 0            → registro de yank
```

### Registro del sistema (`"+`)
Portapapeles del sistema operativo (Ctrl+C / Ctrl+V). Permite copiar/pegar entre Vim y otras aplicaciones.

### `"a`-`"z` (registros con nombre)
26 registros que el usuario controla explícitamente. Útiles para almacenar múltiples fragmentos de texto o macros diferentes.

### `"A`-`"Z` (registros append)
Las mayúsculas añaden al registro en vez de sobrescribir. Permiten acumular texto de múltiples fuentes en un mismo registro.

```text
"ayy            → 'a' = línea 1
"Ayy            → 'a' = línea 1 + línea 2
```

---

## S

### Sistema de portapapeles
Mecanismo del sistema operativo para compartir datos entre aplicaciones. En Vim se accede con `"+` (clipboard) y `"*` (primary selection en X11).

---

## Símbolos

### `Ctrl-^` / `Ctrl-6`
Alterna entre el buffer actual y el buffer alternativo (#). No confundir con registros — es navegación de buffers.

### `Ctrl-r Ctrl-r {reg}`
En línea de comandos, pega el contenido LITERAL del registro (sin interpretar caracteres especiales). Útil para editar macros con `:let`.

---

> 📖 **Tip**: Los dos conceptos más importantes de esta semana: (1) `"0` — el registro que protege tu última copia, (2) Macros recursivas — la automatización que se detiene sola. Domínalos y tu productividad en Vim se multiplica.
