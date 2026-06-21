# 👁️ Visual Mode

## 🎯 Objetivos

- Dominar los 3 tipos de Visual mode (carácter, línea, bloque)
- Usar Visual block (Ctrl-v) para ediciones rectangulares
- Insertar y añadir en múltiples líneas simultáneamente con `I` y `A`
- Combinar selecciones visuales con operadores y comandos `:`

---

## 📋 Contenido

### 1. Los 3 Tipos de Visual Mode

```text
┌──────────────────────────────────────────────────┐
│ VISUAL MODE                                       │
│                                                    │
│ v       → carácter a carácter                     │
│ V       → línea a línea                           │
│ Ctrl-v  → bloque rectangular                      │
│                                                    │
│ gv      → re-selecciona la última selección       │
│ o       → salta al otro extremo de la selección    │
│ O       → salta a la otra esquina (Visual block)  │
└──────────────────────────────────────────────────┘
```

### 2. Visual Mode Carácter (`v`)

Selecciona desde el cursor hacia donde te muevas, carácter por carácter.

```text
v      → entra a Visual mode
j j j  → extiende selección 3 líneas abajo
w w    → extiende 2 palabras
f )    → extiende hasta el siguiente ')'
Esc    → sale de Visual mode
```

```text
Ejemplo: "Hola mundo cruel"
Cursor en 'H':
v e   → selecciona "Hola"
v f c → selecciona "Hola mundo c" (hasta la 'c' de cruel)
```

**Operaciones típicas**:
```text
v i w  → selecciona palabra (igual que en Normal, pero se ve)
v i {  → selecciona contenido de llaves
v a p  → selecciona párrafo completo
```

---

### 3. Visual Line Mode (`V`)

Selecciona líneas completas. Ideal para mover, copiar o eliminar bloques de código.

```text
V      → selecciona línea actual
j      → extiende una línea abajo
5 j    → extiende 5 líneas abajo
G      → extiende hasta el final del archivo
```

```text
Caso real — mover una función:

V         → selecciona la línea de la función
j j j j   → extiende hasta la llave de cierre
d         → elimina (corta) la función
G         → ve al final del archivo
p         → pega la función al final
```

**Comandos con `:` en Visual mode**:
```text
Seleccionas líneas con V, luego:
:'<,'>s/foo/bar/g     → sustituye SOLO en líneas seleccionadas
:'<,'>sort            → ordena las líneas seleccionadas
:'<,'>w archivo.txt   → guarda selección en otro archivo
```

El rango `'<,'>` aparece automáticamente al presionar `:` en Visual mode.

---

### 4. Visual Block Mode (`Ctrl-v`)

El más poderoso y único de Vim. Selecciona un **rectángulo** de texto, no líneas completas.

```text
Ctrl-v    → entra a Visual block
j j j     → extiende 3 líneas abajo (misma columna)
l l l     → extiende 3 caracteres a la derecha
w         → extiende hasta fin de palabra
$         → extiende hasta fin de línea (cada línea a su $)
```

```text
     Col1  Col2  Col3
     ┌──┐  ┌──┐  ┌──┐
L1:  │Ac│  │Bc│  │Cc│
L2:  │Ad│  │Bd│  │Cd│
L3:  │Ae│  │Be│  │Ce│
     └──┘  └──┘  └──┘

Ctrl-v + 2j + 2l → selecciona el rectángulo de 3×3 mostrado
```

---

### 5. Edición en Bloque: `I` y `A`

Este es el verdadero superpoder. Puedes insertar texto en **múltiples líneas simultáneamente**.

```text
Ctrl-v + seleccionar columnas + I + escribir + Esc
→ el texto aparece en TODAS las líneas seleccionadas
```

**Ejemplo — comentar un bloque**:
```javascript
function foo() {
    console.log("foo")
    return true
}

// Quieres comentar console.log y return:

Cursor en 'c' de console.log:
Ctrl-v      → entra a Visual block
j           → selecciona también la línea de return
I           → entra a Insert mode (al inicio de la selección)
//          → escribe el comentario
Esc         → sale
// El '//' aparece en AMBAS líneas simultáneamente

Resultado:
function foo() {
    //console.log("foo")
    //return true
}
```

**Ejemplo — añadir al final de múltiples líneas**:
```text
Ctrl-v + seleccionar + $ (lleva cada línea a su fin) + A + texto + Esc
```

```text
nombre,edad,ciudad
Ana,30,Madrid
Carlos,25,Barcelona
Bea,28,Valencia

// Añadir ",España" al final de las últimas 3 líneas:

Cursor en 'Ana', columna 1:
Ctrl-v 3 j $    → selecciona bloque hasta fin de cada línea (3 líneas)
A               → Insert mode al FINAL de cada línea
,España Esc     → añade el texto
```

---

### 6. Reemplazar en Bloque: `r` y `c`

```text
Ctrl-v + seleccionar + r{char}  → reemplaza cada carácter por {char}
Ctrl-v + seleccionar + c        → cambia (elimina e inserta) el bloque
```

```text
╔══════╦══════╦══════╗
║ uno  ║ dos  ║ tres ║
║ uno  ║ dos  ║ tres ║
║ uno  ║ dos  ║ tres ║
╚══════╩══════╩══════╝

Cursor en la 'u' de "uno":
Ctrl-v 2 j 2 l    → selecciona rectángulo 3×3 de "uno" en cada línea
c                 → elimina e inserta
xxx Esc           → reemplaza por "xxx"
```

---

### 7. Incrementar/Decrementar Números en Bloque

```text
Ctrl-v + seleccionar columna de números + g Ctrl-a → incrementar todos
Ctrl-v + seleccionar columna de números + g Ctrl-x → decrementar todos
```

```text
item_01
item_02
item_03

Cursor en '1' de item_01:
Ctrl-v 2 j      → selecciona 1, 2, 3
g Ctrl-a        → incrementa todos
Resultado:
item_02
item_03
item_04
```

---

### 8. gv: Re-seleccionar

`gv` re-selecciona la última selección visual. Útil para ajustar una selección.

```text
v i {           → selecciona bloque
Esc             → te diste cuenta que faltó algo
g v             → recupera la misma selección
j               → extiendes una línea más
d               → eliminas
```

---

### 9. Casos de Uso Comunes

#### Formatear CSV a tabla Markdown

```text
Datos CSV:
nombre,edad,ciudad,activo
Ana,30,Madrid,true
Carlos,25,Barcelona,false
Bea,28,Valencia,true
David,35,Sevilla,true

// Convertir a tabla alineada:
| nombre  | edad | ciudad    | activo |
|---------|------|-----------|--------|
| Ana     | 30   | Madrid    | true   |
| Carlos  | 25   | Barcelona | false  |
...

Estrategia con Visual block:
1. Añadir "| " al inicio de cada línea de datos
2. Reemplazar comas por " | "
3. Añadir " |" al final de cada línea
4. Insertar separadores de tabla
```

#### Cambiar indentación de bloque

```text
V         → selecciona línea
j j j     → selecciona bloque
>         → indenta derecha
.         → indenta otra vez
<         → indenta izquierda
```

#### Duplicar una selección rectangular

```text
Ctrl-v   → selecciona rectángulo
y        → yank (copia)
p        → pega después del cursor
```

---

### 10. Visual vs Normal Mode Directo

Muchos comandos de Visual mode tienen equivalente directo en Normal mode:

```text
Visual mode          Normal mode equivalente
─────────────────────────────────────────────
v i w d              d i w
V j j d              d 2 j
V j j >              > 2 j
Ctrl-v I // Esc      No hay equivalente directo ← esto es exclusivo
```

**Regla**: Si necesitas **ver** lo que estás seleccionando antes de actuar, usa Visual mode. Si ya sabes exactamente el alcance, usa Normal mode directo (menos teclas).

---

## 💡 Resumen Visual

```text
┌──────────────┬──────────────────────────────────┐
│ Modo         │ Tecla   Uso principal             │
├──────────────┼──────────────────────────────────┤
│ Carácter     │ v       Selección quirúrgica      │
│ Línea        │ V       Mover/copiar/eliminar     │
│              │         bloques de líneas         │
│ Bloque       │ Ctrl-v  Ediciones rectangulares,  │
│              │         comentar columnas,        │
│              │         insertar en múltiples      │
│              │         líneas a la vez           │
├──────────────┼──────────────────────────────────┤
│ Re-seleccionar │ gv    Recuperar última selección│
└──────────────┴──────────────────────────────────┘

En Visual block:
  I texto Esc   → inserta al inicio de cada línea
  A texto Esc   → añade al final de cada línea
  r{char}       → reemplaza por carácter
  c texto Esc   → cambia el bloque
```

---

## ✅ Checklist de Verificación

- [ ] Uso `v` para selecciones carácter a carácter
- [ ] Uso `V` para seleccionar líneas completas y mover/eliminar bloques
- [ ] Uso `Ctrl-v` para ediciones rectangulares
- [ ] Inserto texto en múltiples líneas con `Ctrl-v` + `I` + texto + `Esc`
- [ ] Añado texto al final de múltiples líneas con `Ctrl-v` + `$` + `A` + texto + `Esc`
- [ ] Uso `gv` para re-seleccionar
- [ ] Ejecuto comandos `:` sobre selecciones visuales (rango `'<,'>`)

---

## 🎮 Ejercicio Rápido

Crea un archivo con datos tabulares:

```text
uno dos tres
uno dos tres
uno dos tres
uno dos tres
```

Practica:
```text
1. Ctrl-v + selecciona la columna "dos" (todas las líneas) + c → nuevo → Esc
2. Ctrl-v + selecciona primera columna + I → "* " → Esc
3. Ctrl-v + selecciona última columna + $ → A → " fin" → Esc
4. gv → verifica que recupera la última selección
```

---

## ➡️ Siguiente

[03 - Marcas](03-marcas.md)
