# 🔄 Sustituciones: `:s` y `:g`

## 🎯 Objetivos

- Dominar el comando `:s` para sustituciones en una línea
- Usar `:%s` para sustituciones en todo el archivo
- Aplicar flags: `g`, `c`, `i`, `I`, `n`
- Entender y usar el comando `:g` (global) para ejecutar acciones en líneas seleccionadas
- Combinar sustituciones con rangos y marcas

---

## 📋 Contenido

### 1. `:s` — Sustitución en la Línea Actual

```text
Sintaxis: :s/patrón/reemplazo/flags

:s/foo/bar/        → reemplaza PRIMERA ocurrencia de "foo" por "bar"
:s/foo/bar/g       → reemplaza TODAS las ocurrencias (g = global en la línea)
:s/foo/bar/gc      → reemplaza con CONFIRMACIÓN cada una
```

```text
Ejemplo:
Línea: "foo bar foo baz foo"

:s/foo/XXX/     → "XXX bar foo baz foo"   (solo primera)
:s/foo/XXX/g    → "XXX bar XXX baz XXX"   (todas en la línea)
```

---

### 2. Rangos de Líneas

```text
Sintaxis: :{rango}s/patrón/reemplazo/flags

:#s/foo/bar/g       → línea # específica
:10s/foo/bar/g       → línea 10
:5,15s/foo/bar/g     → líneas 5 a 15
:.,$s/foo/bar/g      → desde línea actual hasta el final
:.,.+5s/foo/bar/g    → desde línea actual hasta 5 líneas abajo
:1,.s/foo/bar/g      → desde inicio hasta línea actual
:%s/foo/bar/g        → TODO el archivo (% = 1,$)
:'a,'bs/foo/bar/g    → desde marca 'a' hasta marca 'b'
```

```text
Notación de rangos:
.       → línea actual
$       → última línea
%       → todo el archivo (equivale a 1,$)
+n      → n líneas abajo
-n      → n líneas arriba
'{marca} → línea de la marca
```

---

### 3. Flags de Sustitución

| Flag | Significado | Ejemplo |
|------|-------------|---------|
| `g` | Global: todas las ocurrencias en la línea | `:%s/foo/bar/g` |
| `c` | Confirm: pregunta antes de cada reemplazo | `:%s/foo/bar/gc` |
| `i` | Ignore case: ignora mayúsculas | `:%s/foo/bar/gi` |
| `I` | No ignore case: sensible a mayúsculas | `:%s/foo/bar/gI` |
| `n` | No sustituir: solo CUENTA ocurrencias | `:%s/foo/bar/gn` |
| `e` | No error: no muestra error si no encuentra | `:%s/foo/bar/ge` |

**Confirmación (`c`)**:
```text
:%s/foo/bar/gc

Opciones al confirmar:
y → sí (yes)
n → no
a → todas (all — sustituye todas las restantes sin preguntar)
q → salir (quit)
l → última (last — sustituye esta y sale)
Ctrl-e → scroll abajo
Ctrl-y → scroll arriba
```

---

### 4. El Patrón: Expresiones Regulares

```text
:%s/\<foo\>/bar/g      → palabra completa "foo" (no "foobar")
:%s/^foo/bar/           → "foo" al inicio de línea
:%s/foo$/bar/           → "foo" al final de línea
:%s/\s\+$//             → elimina espacios al final de línea
:%s/^\s\+//             → elimina espacios al inicio de línea
%s/\v(foo|bar)/XXX/g    → "foo" o "bar" (very magic)
```

**Anclas de palabra `\<` y `\>`**:
```text
Sin anclas:
:%s/foo/bar/g     → cambia "foo" en "foobar", "food", "bufoo", etc.

Con anclas:
:%s/\<foo\>/bar/g → cambia SOLO "foo" como palabra independiente
```

---

### 5. Referencias en el Reemplazo

Puedes usar partes del patrón en el reemplazo:

```text
&           → todo el texto coincidente
\0          → todo el texto coincidente
\1, \2, ... → grupos de captura \(...\)

:%s/\(foo\)/\1bar/g      → "foo" → "foobar" (añade "bar")
:%s/\(user\)_\(name\)/\1\2/g  → "user_name" → "username"
:%s/"\([^"]*\)"/'\1'/g   → cambia comillas dobles por simples
```

**Ejemplos prácticos**:
```text
Cambiar snake_case a camelCase (simplificado):
:%s/_\(.\)/\u\1/g       → "user_name" → "userName"

Añadir prefijo a variables:
:%s/\<\([a-z]\+\)\s*=/user_\1 =/g

Intercambiar dos palabras:
:%s/\(foo\),\(bar\)/\2,\1/g  → "foo,bar" → "bar,foo"
```

---

### 6. Separadores Alternativos

Cuando tu patrón o reemplazo contiene `/`, usa otro separador:

```text
:%s#/ruta/vieja#/ruta/nueva#g
:%s@http://viejo@https://nuevo@g
:%s;foo/bar;baz/qux;g
```

Puedes usar cualquier carácter no alfanumérico como separador: `#`, `@`, `;`, `|`, `,`, etc.

---

### 7. El Comando `:g` (Global)

`:g` ejecuta un comando en las líneas que coinciden con un patrón.

```text
Sintaxis: :g/patrón/comando

:g/foo/d              → elimina TODAS las líneas que contienen "foo"
:g/^$/d               → elimina TODAS las líneas vacías
:g/^\s*$/d            → elimina líneas vacías o con solo espacios
:g/TODO/p             → imprime (lista) líneas que contienen "TODO"
:g/debug/normal dd    → ejecuta dd en líneas con "debug" (las elimina)
:g/foo/m$             → mueve al final del archivo las líneas con "foo"
:g/foo/t$             → copia al final las líneas con "foo"
```

**`:g` vs `:%s`**:
```text
:%s/patrón/reemplazo/  → cambia TEXTO dentro de líneas
:g/patrón/comando      → ejecuta ACCIÓN en LÍNEAS completas

Ejemplo:
:g/debug/d             → elimina líneas completas que contienen "debug"
:%s/debug/info/g       → cambia "debug" por "info" dentro de las líneas
```

---

### 8. `:v` (Inverse Global)

`:v` es lo opuesto a `:g`: ejecuta en líneas que **NO** coinciden.

```text
:v/foo/d              → elimina líneas que NO contienen "foo"
:v/\w/d               → elimina líneas que no tienen caracteres de palabra
:v/^#/d               → elimina líneas que no empiezan con # (deja solo comentarios)
```

---

### 9. Sustitución en Selección Visual

```text
1. V o v → seleccionas líneas
2. :      → aparece :'<,'>
3. s/foo/bar/g → sustituye SOLO en la selección

Resultado: :'<,'>s/foo/bar/g
```

---

### 10. Receta Práctica: Limpieza de Datos

```text
Tienes un archivo de datos sucio:
  nombre , edad , ciudad  
  Ana  ,  30  ,  Madrid   
  Carlos,25,Barcelona
    Bea   ,   28   ,   Valencia

Pasos de limpieza:
1. :%s/\s*,\s*/,/g        → elimina espacios alrededor de comas
2. :%s/^\s\+//             → elimina espacios al inicio de línea
3. :%s/\s\+$//             → elimina espacios al final de línea
4. :g/^$/d                 → elimina líneas vacías

Resultado:
nombre,edad,ciudad
Ana,30,Madrid
Carlos,25,Barcelona
Bea,28,Valencia
```

---

## 💡 Tabla de Referencia Rápida

```text
┌────────────────────────────────────────────────────┐
│ SUSTITUCIONES                                       │
│                                                     │
│ :s/foo/bar/        → línea actual, primera ocurr.   │
│ :s/foo/bar/g       → línea actual, todas            │
│ :%s/foo/bar/g      → todo el archivo, todas         │
│ :10,20s/foo/bar/g  → líneas 10-20                   │
│ :.,$s/foo/bar/g    → desde aquí al final            │
│                                                     │
│ FLAGS: g=global c=confirm i=ignore case n=count     │
│                                                     │
│ :g/patrón/comando  → ejecuta comando en líneas      │
│ :v/patrón/comando  → ejecuta en líneas SIN patrón   │
│                                                     │
│ Separadores alt: :%s#/ruta/vieja#/ruta/nueva#g     │
│ Capturas: :%s/\(foo\)/\1bar/g                      │
└────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Uso `:s` para sustituir en la línea actual
- [ ] Uso `:%s` con `/g` para sustituir en todo el archivo
- [ ] Aplico flags: `c` para confirmar, `i` para ignorar case
- [ ] Uso anclas `\<` y `\>` para palabras completas
- [ ] Uso `:g` para eliminar/mover líneas que coinciden con un patrón
- [ ] Uso `:v` para operar en líneas que NO coinciden
- [ ] Cambio separadores cuando el patrón contiene `/`
- [ ] Uso rangos con marcas: `:'a,'bs/foo/bar/g`
- [ ] Combino selección visual con `:s`

---

## 🎮 Ejercicio Rápido

Abre cualquier archivo de código y practica:

```text
1. :%s/\<const\>/let/g     → cambia "const" por "let" (palabra exacta)
2. u                        → deshacer
3. :%s/\s\+$//              → elimina espacios al final de línea
4. :g/console/d             → elimina líneas con console.log
5. u                        → deshacer
6. :g/TODO/p                → lista todas las líneas con TODO
7. :v/export/d              → elimina líneas que no tengan export
8. u                        → deshacer siempre
```

---

## ➡️ Siguiente

[05 - Comandos Shell y Filtros](05-comandos-shell-y-filtros.md)
