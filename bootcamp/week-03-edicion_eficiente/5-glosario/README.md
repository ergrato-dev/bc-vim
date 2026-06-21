# 📚 Glosario - Semana 3

Términos clave de la Semana 3: Edición Eficiente.

---

## C

### Cambio (change)
En Vim, una modificación del buffer. Lo que activa el comando `.`. Incluye: inserciones (`i texto Esc`), eliminaciones (`dd`), sustituciones (`:s/foo/bar/`), cambios de caso (`guiw`). No incluye: movimientos (`j`, `w`), búsquedas (`/patrón`), copias (`yy`).

### Ctrl-v
Tecla para entrar a **Visual block mode** (selección rectangular). Permite editar columnas de texto en múltiples líneas simultáneamente.

### Ctrl-o / Ctrl-i
Navegación en el **jump list** (lista de saltos). `Ctrl-o` va al salto anterior, `Ctrl-i` al siguiente. Diferente a las marcas (que son posiciones fijas nombradas).

---

## D

### Dot Command (`.`)
El comando más poderoso de Vim. Repite el último **cambio** que modificó el buffer. Base de la "Dot Formula": una tecla para moverse, una tecla para ejecutar.

```text
ciw hola Esc  → cambia palabra
j             → siguiente línea
.             → repite el cambio
```

---

## E

### Expresión regular (regex)
Patrón de búsqueda usado en `:s`, `:g`, `/` y `?`. Vim tiene su propio dialecto de regex con caracteres especiales que pueden escaparse o activarse con `\v` (very magic).

---

## F

### Filter (`!`)
Operador que pasa texto a través de un comando externo y reemplaza el texto con la salida.

```text
! G sort          → ordena desde cursor hasta final del archivo
! i p column -t   → alinea párrafo como tabla con columnas
:%! python3 -m json.tool → formatea JSON
```

---

## G

### `:g` (global)
Comando que ejecuta una acción en todas las líneas que coinciden con un patrón.

```text
:g/patrón/d       → elimina líneas que coinciden
:g/patrón/m$      → mueve líneas coincidentes al final
:g/patrón/p       → imprime (lista) líneas coincidentes
```

### `gv`
Re-selecciona la última selección visual. Útil cuando sales de Visual mode y necesitas ajustar la selección.

### `gu` / `gU` / `g~`
Operadores de cambio de capitalización:
- `gu{motion}`: lowercase (minúsculas)
- `gU{motion}`: uppercase (MAYÚSCULAS)
- `g~{motion}`: toggle case (AlTeRnAr)

---

## J

### Jump list
Historial de saltos de navegación en Vim. Navegable con `Ctrl-o` (atrás) y `Ctrl-i` (adelante). Los saltos incluyen: `gg`, `G`, `/`, `?`, `*`, `#`, `%`, `:n`, marcas.

---

## M

### Marcas (Marks)
Posiciones guardadas en archivos para navegación rápida.

```text
m{a-z}    → marca local (por archivo)
m{A-Z}    → marca global (entre archivos)
'{marca}  → salta al inicio de línea de la marca
`{marca}  → salta a posición exacta de la marca
''        → alterna entre posición actual y anterior
:marks    → lista todas las marcas
:delm a   → elimina marca 'a'
```

---

## R

### Rango
Especificación de líneas para comandos `:`.

```text
.          → línea actual
$          → última línea
%          → todo el archivo (1,$)
+n         → n líneas abajo desde actual
-n         → n líneas arriba desde actual
'{marca}   → línea de la marca
'<,'>      → selección visual (automático)
```

---

## S

### `:s` (sustitución)
Comando para reemplazar texto.

```text
:s/foo/bar/        → línea actual, primera ocurrencia
:s/foo/bar/g       → línea actual, todas
:%s/foo/bar/g      → todo el archivo, todas
:5,15s/foo/bar/g   → líneas 5-15
:'a,'bs/foo/bar/g  → desde marca 'a' hasta 'b'
```

### Flags de sustitución
- `g`: global (todas las ocurrencias en la línea)
- `c`: confirm (pregunta antes de cada reemplazo)
- `i`: ignore case (ignora mayúsculas)
- `I`: no ignore case
- `n`: no sustituir (solo cuenta ocurrencias)
- `e`: no error (no muestra error si no encuentra)

### Shell command
Ejecución de comandos del sistema desde Vim.

```text
:!comando         → ejecuta y muestra salida
:r !comando       → inserta salida en el buffer
:{rango}!comando  → filtra líneas por comando
:%!comando        → filtra todo el archivo
```

---

## V

### `:v` (inverse global)
Opuesto a `:g`. Ejecuta comando en líneas que **NO** coinciden con el patrón.

```text
:v/patrón/d       → elimina líneas que NO contienen patrón
:v/\w/d           → elimina líneas sin caracteres de palabra
```

### Visual mode
Modo de selección de texto. Tres variantes:
- `v`: carácter a carácter
- `V`: línea a línea
- `Ctrl-v`: bloque rectangular

En Visual mode se puede:
- Aplicar operadores (`d`, `c`, `y`, `>`, `<`, `gu`, `gU`)
- Ejecutar comandos `:` con rango automático `'<,'>`
- Insertar en múltiples líneas con `I` / `A`

---

## Símbolos

### `.` (punto)
Ver **Dot Command**.

### `%`
En el contexto de sustituciones: representa todo el archivo (`1,$`). En el contexto de comandos shell: representa el nombre del archivo actual.

```text
:%s/foo/bar/g      → % = rango 1,$ (todo el archivo)
:!node %           → % = nombre del archivo actual
```

### `'<,'>`
Rango automático que aparece al presionar `:` desde Visual mode. Representa la selección visual.

### `''` (dos comillas simples)
Salta a la posición anterior al último salto. El "undo" del movimiento.

### `\v` (very magic)
Prefijo en patrones regex que hace que la mayoría de caracteres especiales tengan su significado regex sin necesidad de escape.

```text
:%s/\v(foo|bar)/reemplazo/g
```

### `\<` y `\>`
Anclas de palabra en patrones regex. `\<` marca el inicio de palabra, `\>` marca el final.

```text
:%s/\<foo\>/bar/g   → cambia SOLO "foo" como palabra completa
```

### `\s`
Espacio en blanco (espacio, tab). `\s\+` = uno o más espacios. `\s*` = cero o más espacios.

---

> 📖 **Tip**: El comando `.` y `:g` son los dos multiplicadores de fuerza más importantes de Vim. `.` multiplica cambios en el espacio (múltiples ubicaciones), `:g` multiplica comandos en líneas que cumplen una condición.
