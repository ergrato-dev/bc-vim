# 📚 Glosario - Semana 2

Términos clave de la Semana 2: Motions y Text Objects.

---

## A

### a (around)
Prefijo de text object que incluye el contenido, los delimitadores y espacios asociados. Contraparte de `i` (inside).

```text
di"  → elimina contenido de comillas (deja "")
da"  → elimina contenido + comillas (las borra también)
```

---

## C

### c (change)
Operador que elimina texto y entra en Insert mode. Equivale a `d` + `i`.

```text
ciw  → change inner word
ci"  → change inside quotes
c3w  → change 3 words
```

---

## D

### d (delete)
Operador que elimina texto. El texto eliminado se guarda en el registro por defecto.

```text
diw  → delete inner word
da{  → delete around braces
dt;  → delete until ';'
```

---

## F

### f{char} (find)
Motion que salta el cursor SOBRE la siguiente ocurrencia de `{char}` en la línea actual. `F{char}` busca hacia atrás.

```text
fm   → salta sobre la siguiente 'm' en la línea
Fm   → salta sobre la 'm' anterior
```

### ; (semicolon)
Repite el último `f`, `t`, `F` o `T` en la misma dirección.

### , (comma)
Repite el último `f`, `t`, `F` o `T` en dirección opuesta.

---

## G

### g* / g#
Variantes de `*` y `#` que buscan la palabra bajo el cursor como **substring** (no palabra exacta).

```text
*   → busca "user" exacto (no encuentra "getUser")
g*  → busca "user" parcial (encuentra "getUser", "username")
```

### gu / gU
Operadores de cambio de capitalización:
- `gu{motion}`: convierte a minúsculas
- `gU{motion}`: convierte a MAYÚSCULAS
- `g~{motion}`: alterna capitalización

```text
guiw  → lowercase inner word
gUiw  → UPPERCASE inner word
g~iw  → tOGGLE iNNER wORD
```

---

## I

### i (inside)
Prefijo de text object que incluye SOLO el contenido interior, sin delimitadores ni espacios. Contraparte de `a` (around).

### iw / aw
- `iw`: inner word — palabra sin espacios alrededor
- `aw`: a word — palabra incluyendo espacio(s) posterior(es)

### iW / aW
Igual que `iw`/`aw` pero usando definición de WORD (secuencia de no-espacios).

### i" / a" (i' / a', i` / a`)
Text objects para contenido entre comillas (dobles, simples, backticks).

```text
ci"  → change inside quotes
da"  → delete around quotes (incluye las comillas)
```

### i( / a( (i) / a), ib / ab)
Text objects para contenido entre paréntesis.

### i{ / a{ (i} / a}, iB / aB)
Text objects para contenido entre llaves. `iB`/`aB` son alias (B mayúscula = Block).

### i[ / a[ (i] / a])
Text objects para contenido entre corchetes.

### i< / a< (i> / a>)
Text objects para contenido entre ángulos.

### it / at
Text objects para tags HTML/XML:
- `it`: inner tag (solo el contenido)
- `at`: a tag (contenido + tags)

### ip / ap
Text objects para párrafos:
- `ip`: inner paragraph (contenido sin línea en blanco separadora)
- `ap`: a paragraph (párrafo completo incluyendo línea separadora)

### is / as
Text objects para oraciones.

---

## M

### Motion
Comando que mueve el cursor. Los motions funcionan como "sustantivos" en el lenguaje Vim y se combinan con operadores (verbos).

```text
Motions básicos:    w, b, e, j, k, h, l, 0, $, gg, G
Motions de línea:   f{char}, t{char}, ;, ,
Motions de archivo: /patrón, ?patrón, n, N
Motions contextuales: %, *, #, g*, g#
```

---

## N

### n / N
Navegación de resultados de búsqueda:
- `n`: siguiente ocurrencia en la dirección de búsqueda
- `N`: siguiente ocurrencia en dirección opuesta

---

## O

### Operator (Operador)
Comando que modifica texto. Los operadores son los "verbos" del lenguaje Vim.

```text
d   → delete        (eliminar)
c   → change        (cambiar)
y   → yank          (copiar)
>   → indent right  (indentar derecha)
<   → indent left   (indentar izquierda)
=   → format        (formatear/autoindentar)
gu  → lowercase     (minúsculas)
gU  → uppercase     (mayúsculas)
g~  → toggle case   (alternar capitalización)
!   → filter        (filtrar por comando externo)
```

---

## P

### % (porcentaje)
Motion que salta al par correspondiente: `()` ↔ `()`, `{}` ↔ `{}`, `[]` ↔ `[]`.

```text
Cursor en '(' → % → ')' correspondiente
Cursor en '{' → % → '}' correspondiente
```

---

## S

### smartcase
Opción de Vim que hace la búsqueda sensible a mayúsculas solo si el patrón contiene mayúsculas. Complementa `ignorecase`.

```lua
vim.opt.ignorecase = true   -- ignora mayúsculas por defecto
vim.opt.smartcase = true    -- si pongo Mayúscula, busca exacto
```

---

## T

### t{char} (till)
Motion que salta el cursor hasta JUSTO ANTES de la siguiente ocurrencia de `{char}` en la línea. `T{char}` busca hacia atrás.

```text
t.   → hasta antes del siguiente punto
T.   → hasta después del punto anterior (hacia atrás)
```

### Text Object
Unidad estructural de texto que Vim reconoce semánticamente: palabras, strings, bloques, párrafos, tags HTML.

---

## V

### Verbo + Sustantivo
Paradigma fundamental de Vim: cada acción se compone de un operador (verbo) y un motion/text object (sustantivo).

```text
d + iw  = delete inner word    → "eliminar palabra"
c + i"  = change inside quotes → "cambiar string"
y + a{  = yank around braces   → "copiar bloque con llaves"
```

---

## W

### word vs WORD
Vim tiene dos definiciones de "palabra":
- **word** (`w`, `b`, `e`): secuencia de letras, dígitos y `_`. Se detiene en puntuación.
- **WORD** (`W`, `B`, `E`): secuencia de caracteres no-espacio. Solo se detiene en espacios.

```text
foo.bar(baz)
↑↑↑ ↑↑↑ ↑↑↑   ← word (3 palabras)
↑↑↑↑↑↑↑↑↑↑↑   ← WORD (1 sola)
```

---

## Y

### y (yank)
Operador que copia texto al registro. No modifica el buffer.

```text
yiw  → yank inner word (copiar palabra)
yi{  → yank inside braces (copiar contenido entre llaves)
yap  → yank a paragraph (copiar párrafo completo)
```

---

## Símbolos

### *
Busca la siguiente ocurrencia de la **palabra exacta** bajo el cursor hacia adelante.

### #
Busca la anterior ocurrencia de la **palabra exacta** bajo el cursor hacia atrás.

### /
Busca un patrón hacia adelante en el archivo.

### ?
Busca un patrón hacia atrás en el archivo.

### .
Repite el último cambio (no el último comando, solo cambios que modificaron el buffer).

```text
ciw hola Esc   → cambia palabra a "hola"
j .            → siguiente línea, repite el cambio
```

---

> 📖 **Tip**: Los text objects son el concepto más importante de esta semana. Si dominas `ci"`, `ci(`, `ci{`, `di{`, `da{`, `yi{`, `ya{` al final de esta semana, el resto del bootcamp será mucho más fácil.
