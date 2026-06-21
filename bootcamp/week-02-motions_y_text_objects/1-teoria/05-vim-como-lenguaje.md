# 🗣️ Vim como Lenguaje

## 🎯 Objetivos

- Entender Vim como un lenguaje de edición (no como atajos sueltos)
- Interiorizar el paradigma `{operador}{cantidad}{sustantivo}`
- Conocer todos los operadores y con qué sustantivos se combinan
- Usar el punto (`.`) para repetir cambios compuestos

---

## 📋 Contenido

### 1. De Atajos a Lenguaje

La mayoría de editores tienen atajos. Vim tiene una **gramática**.

```text
Editor tradicional:
  Ctrl+Shift+Flecha → seleccionar palabra
  Ctrl+X           → cortar
  Son combinaciones fijas. Cada acción = un atajo diferente.

Vim:
  d  i  w  =  delete inner word
  ↓  ↓  ↓
  verbo + sustantivo = frase con significado

  Puedes cambiar el verbo (c i w = change inner word)
  Puedes cambiar el sustantivo (d i " = delete inside quotes)
  Puedes añadir cantidad (d 3 w = delete 3 words)
```

**Esto es revolucionario**: No memorizas 100 atajos. Aprendes ~10 verbos y ~20 sustantivos, y obtienes ~200 combinaciones.

---

### 2. La Gramática de Vim

```text
{verbo}{cantidad opcional}{sustantivo}

Verbo   = operador (d, c, y, >, <, =, gu, gU, g~, !, v)
Cantidad = número (opcional)
Sustantivo = motion o text object
```

```text
Ejemplos de "frases" en Vim:

d  3  w    → delete 3 words
c  i  "    → change inside quotes
y  a  {    → yank a block (llaves + contenido)
>  2  j    → indent 2 lines down
=  i  {    → format inside braces
gu i  w    → lowercase inner word
d  f  :    → delete until ':'
c  /  end  → change until 'end'
```

---

### 3. Los Verbos (Operadores)

| Verbo | Acción | Nemotecnia |
|-------|--------|------------|
| `d` | Delete (cortar) | **d**elete |
| `c` | Change (cortar + insert) | **c**hange |
| `y` | Yank (copiar) | **y**ank |
| `>` | Indentar derecha | |
| `<` | Indentar izquierda | |
| `=` | Formatear (autoindent) | |
| `gu` | Lowercase (minúsculas) | **gu** (gut, alemán: bueno → chico) |
| `gU` | Uppercase (mayúsculas) | **gU** (opuesto a gu) |
| `g~` | Toggle case | **g~** (la tilde alterna) |
| `!` | Filtrar por comando externo | |
| `v` | Seleccionar visualmente | **v**isual |

**El operador `c` es especial**: Después de ejecutar `c{motion}`, entra automáticamente en Insert mode para que escribas el reemplazo.

---

### 4. Los Sustantivos (Motions y Text Objects)

#### Motions (Semana 1 + esta semana)

| Motion | Descripción |
|--------|-------------|
| `w`, `W` | Palabra/WORD adelante |
| `b`, `B` | Palabra/WORD atrás |
| `e`, `E` | Fin de palabra/WORD |
| `j`, `k` | Línea abajo/arriba |
| `h`, `l` | Carácter izquierda/derecha |
| `0`, `$` | Inicio/fin de línea |
| `^` | Primer carácter no-espacio |
| `gg`, `G` | Inicio/fin de archivo |
| `f{char}`, `t{char}` | Find/till en línea |
| `/patrón`, `?patrón` | Búsqueda en archivo |
| `%` | Par correspondiente |
| `*`, `#` | Palabra bajo cursor |
| `{`, `}` | Párrafo anterior/siguiente |

#### Text Objects (esta semana)

| Text Object | Descripción |
|-------------|-------------|
| `iw`, `aw` | Inner/a word |
| `iW`, `aW` | Inner/a WORD |
| `i"`, `a"` | Inside/around comillas dobles |
| `i'`, `a'` | Inside/around comillas simples |
| `i(`, `a(` | Inside/around paréntesis |
| `i{`, `a{` | Inside/around llaves |
| `i[`, `a[` | Inside/around corchetes |
| `it`, `at` | Inside/around tag (HTML) |
| `ip`, `ap` | Inner/a paragraph |
| `is`, `as` | Inner/a sentence |

---

### 5. La Cantidad (Multiplicador)

Puedes insertar un número para repetir el sustantivo:

```text
d 3 w     → delete 3 words
y 5 j     → yank 5 lines down
c 2 f )   → change until 2nd ')'
> 3 {     → indent 3 paragraphs down
```

**Sin cantidad** = 1 por defecto.

---

### 6. Tabla de Combinaciones Frecuentes

```text
┌──────────┬────────────────────────────────────────────────┐
│ Operador │ Combinaciones diarias                          │
├──────────┼────────────────────────────────────────────────┤
│ d (del)  │ dd, dw, db, d$, d0, df:, dt), diw, di", di{, │
│          │ da{, dap, d/patrón                             │
├──────────┼────────────────────────────────────────────────┤
│ c (chg)  │ cc, cw, c$, ciw, ci", ci{, ca{, cit, c/patrón │
├──────────┼────────────────────────────────────────────────┤
│ y (yank) │ yy, yw, y$, yi{, ya{, yip, y/patrón           │
├──────────┼────────────────────────────────────────────────┤
│ > (indt) │ >>, >j, >i{, >ip                              │
├──────────┼────────────────────────────────────────────────┤
│ = (fmt)  │ ==, =i{, =ip, =G                              │
├──────────┼────────────────────────────────────────────────┤
│ gu/gU    │ guiw, gUiw, guap, gUap                         │
└──────────┴────────────────────────────────────────────────┘
```

---

### 7. El Punto (`.`): Repetir Cambios

El comando `.` repite el **último cambio**. No el último comando — el último **cambio** (acciones que modificaron el buffer).

```text
Qué repite '.':
- c i w nuevoTexto Esc     → . repite "cambiar palabra por nuevoTexto"
- d d                      → . repite "borrar línea"
- > i {                    → . repite "indentar bloque"
- A ; Esc                  → . repite "añadir ; al final"

Qué NO repite '.':
- j, k, w, b, f{char}      → son movimientos, no cambios
- y y                      → yank no modifica el buffer
```

```text
Ejemplo práctico — renombrar múltiples ocurrencias:

const user = "Ana"
const admin = "Carlos"
const guest = "Bea"

// Quieres añadir ; al final de cada línea:
Cursor en primera línea:
A ; Esc     → const user = "Ana";
j           → siguiente línea
.           → const admin = "Carlos";
j           → siguiente línea  
.           → const guest = "Bea";
```

**El punto es superproductivo con text objects**:

```text
Tienes 5 strings para cambiar:

ci" nuevo Esc   → cambia el primer string
j               → siguiente string
.               → mismo cambio en el segundo
j .             → tercero
j .             → cuarto
j .             → quinto
```

---

### 8. Casos Prácticos: De-construyendo Frases

#### "Cambiar los argumentos de esta función"

```python
resultado = calcular(datos_viejos, opciones_viejas)
#                    ↑ cursor en 'd'

# Frase en Vim: "change inside parentheses"
ci( nuevo_dato Esc
#    ↑ verbo     ↑ sustantivo (text object)
```

#### "Eliminar este bloque JSON completo"

```json
{
    "deprecated": true,      ← cursor aquí
    "old_field": "valor"
}

# Frase: "delete around braces"
da{
#  ↑↑ verbo+sustantivo
```

#### "Indentar esta función"

```javascript
function foo() {
console.log("sin indentar")  ← cursor aquí
return true
}

# Frase: "indent inside braces"
>i{
# ↑↑↑ verbo+sustantivo (text object)

# O: "format auto inside braces"
=i{
```

#### "Poner en mayúsculas esta palabra"

```text
const MAX_SIZE = 100;
//    ↑ cursor en 'max_size'

# Frase: "uppercase inside word"
gUiw
# ↑↑↑↑ U = uppercase, iw = inner word

Resultado: const MAX_SIZE = 100;
```

---

### 9. Pensar en Vim

El cambio mental clave: cuando quieras hacer algo, tradúcelo a "frase Vim".

```text
Lo que quieres hacer          → Tu frase en Vim
─────────────────────────────────────────────────
"Cambiar el texto entre [ ]"  → ci[
"Borrar esta función entera"  → da{  (si estás dentro de {})
"Copiar este párrafo"         → yap
"Mover este bloque 2 líneas"  → >i{ j .
"Renombrar esta variable"     → * ciw nuevoNombre Esc n . n .
"Pasar a minúsculas"          → guiw
"Eliminar hasta el ;"         → dt;
"Cambiar hasta el final"      → C
"Cortar 3 palabras"           → d3w
```

**El objetivo**: Que esta traducción se vuelva instantánea. Como hablar un idioma — no traduces palabra por palabra, piensas directamente en el idioma.

---

### 10. La Pirámide de Aprendizaje

```text
        ┌──────────┐
        │ Fluidez  │  ← Piensas en frases Vim sin traducir
        │          │     (Semana 4+)
        ├──────────┤
        │ Sintaxis │  ← Combinas verbos + sustantivos
        │          │     conscientemente (Semana 2-3)
        ├──────────┤
        │ Palabras │  ← Conoces comandos sueltos
        │          │     (Semana 1)
        └──────────┘
```

Estás en el nivel de Sintaxis. Cada combinación que practiques te acerca a Fluidez.

---

## 💡 Resumen

```text
Vim = Lenguaje de edición

Gramática: {verbo}[cantidad]{sustantivo}

Verbos (10):    d c y > < = gu gU g~ !
Sustantivos:    motions (w b e $ 0 f t / ? %) +
                text objects (iw aw i" a" i( a( i{ a{ it at ip ap)

Combinaciones = 10 × 30+ = 300+ frases con ~40 piezas

+ . (punto) = repetición sin esfuerzo
```

---

## ✅ Checklist de Verificación

- [ ] Pienso en "frases Vim" (verbo + sustantivo), no en atajos sueltos
- [ ] Uso `d`, `c`, `y` combinados con al menos 5 motions diferentes
- [ ] Uso `d`, `c`, `y` combinados con al menos 5 text objects diferentes
- [ ] Uso multiplicadores: `d3w`, `y5j`, `c2f)`
- [ ] Uso `.` para repetir cambios compuestos
- [ ] Traduzco lo que quiero hacer directamente a una frase Vim

---

## 🎮 Ejercicio Rápido

Abre código real y para cada tarea, formula la frase Vim antes de ejecutar:

```text
1. "Cambiar esta palabra"        → ciw nuevoTexto Esc
2. "Copiar este bloque {}"       → yi{  (o ya{ si quieres las llaves)
3. "Eliminar hasta el siguiente ';'" → dt;
4. "Indentar estas 3 líneas"     → >2j
5. "Cambiar el contenido de []"  → ci[
6. "Eliminar este párrafo"       → dap
7. "Formatear esta función"      → =i{
8. "Pasar a mayúsculas"          → gUiw

Repite con .:
9. ciw hola Esc → j . → j . → j .  (cambia 4 palabras a "hola")
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
