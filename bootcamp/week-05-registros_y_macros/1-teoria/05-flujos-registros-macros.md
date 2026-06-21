# 🚀 Flujos Avanzados con Registros y Macros

## 🎯 Objetivos

- Combinar registros y macros en flujos de trabajo reales
- Usar macros con incremento/decremento numérico
- Aplicar patrones de diseño de macros para diferentes escenarios
- Guardar y reutilizar macros entre sesiones

---

## 📋 Contenido

### 1. Combinar Registros y Macros

Los registros y las macros son herramientas complementarias. Juntos forman un sistema de automatización completo.

```text
Flujo: almacenar plantillas en registros, usarlas en macros.

1. "a y i p        → copia una plantilla JSON a registro 'a'
2. "b y i p        → copia una plantilla XML a registro 'b'

3. q j             → graba macro
   "a P            → pega plantilla JSON antes del cursor
   f "             → salta a primera comilla
   c i " valor Esc → reemplaza placeholder
   q               → detiene

Ahora @j pega la plantilla y te deja en Insert mode
para reemplazar el valor.
```

---

### 2. Plantillas con Registros

```text
Guarda fragmentos de código en registros:

1. Escribe tu plantilla en cualquier parte:
   if (condition) {
       // TODO: implement
   }

2. "i y i {        → copia a registro 'i' (if template)

3. En cualquier archivo:
   "i P             → pega la plantilla
```

**Múltiples plantillas**:
```text
"i → if/else template
"f → for loop template
"c → console.log template (JS)
"t → test case template
"d → docstring template
"h → HTML snippet
```

**Mapeo rápido**:
```lua
-- Mapeos para pegar plantillas frecuentes
vim.keymap.set("n", "<leader>ti", '"ip', { desc = "Plantilla if" })
vim.keymap.set("n", "<leader>tf", '"fp', { desc = "Plantilla for" })
vim.keymap.set("n", "<leader>tc", '"cp', { desc = "Plantilla console" })
```

---

### 3. Macros con Incremento/Decremento

`Ctrl-a` incrementa un número, `Ctrl-x` decrementa. En macros, esto permite crear secuencias numéricas.

```text
Archivo con 10 líneas iguales:
item 0
item 0
item 0
...

q i                     → grabar
Ctrl-a                  → incrementa número (0 → 1)
j                       → siguiente línea
q                       → detener

gg j                    → posiciona en primera línea
9 @ i                   → ejecuta 9 veces

Resultado:
item 1
item 2
item 3
...
item 10
```

**Ejemplo real — numerar líneas**:

```text
Tienes líneas sin número:
tarea: revisar documentación
tarea: actualizar dependencias
tarea: escribir tests

1. Crea contador en línea aparte: 1 (y borra al final)
2. "a y y             → copia "1" al registro 'a' (base)

q n                     → grabar
"a P                    → pega el contador al inicio
.  Ctrl-a              → incrementa el contador
j                       → siguiente línea
q                       → detener

Ejecuta para todas las líneas.
```

---

### 4. Macros Parametrizables con Registros

Puedes hacer que una macro use diferentes registros como "parámetros":

```text
q p                     → grabar macro parametrizable
"a P                    → pega contenido de registro 'a'
j                       → siguiente línea
q                       → detener

Ahora:
"a y y @p               → pega línea actual en siguiente línea
"b y y @p               → pega contenido diferente
```

```text
Técnica — macro que usa el contenido de un registro
como valor a insertar:

1. Copia "42" a registro 'v': "v y i w
2. Macro usa @v:
   q m
   i valor = Ctrl-r v Esc
   q

3. @m → inserta "valor = 42"
4. Cambias "99" a 'v': "v y i w
5. @m → inserta "valor = 99"
```

---

### 5. Procesamiento de Datos en Pipeline

```text
Flujo real — limpiar y formatear datos:

Archivo: datos_sucios.txt
nombre, edad , ciudad  
Ana Garcia ,   30,Madrid
  Carlos Lopez,25,  Barcelona  

Paso 1 — Macro de limpieza:
q l                     → limpiar una línea
0                       → inicio
:s/\s*,\s*/,/g Enter    → elimina espacios alrededor de comas
:s/^\s\+// Enter        → elimina espacios al inicio
:s/\s\+$// Enter        → elimina espacios al final
0                       → inicio
q                       → detener

:%normal @l             → limpia todas las líneas

Paso 2 — Macro de formateo a JSON:
q j                     → formatear a JSON
0                       → inicio
f ,                     → primera coma
r :                     → reemplaza por ':'
c t , " Esc            → cambia hasta la coma por comilla
A " Esc                 → añade comilla al final
I " Esc                 → añade comilla al inicio
j                       → siguiente línea
q                       → detener

gg @j @@ @@ ...          → formatea cada línea
```

---

### 6. Guardar Macros entre Sesiones

Las macros se pierden al cerrar Vim. Para conservarlas:

**Método 1: Archivo de macros**

```lua
-- En tu init.lua:
vim.cmd([[
  let @a = '0f,ct"A"j'
  let @b = 'I- [ ] j'
  let @i = 'if () {}O'
]])
```

```text
Para capturar una macro actual:
:echo @a         → muestra el contenido
:reg a           → copia el output
Pega en init.lua con let @a = '...'
```

**Método 2: Archivo .vim separado**:

```lua
-- ~/.config/nvim/macros.vim
let @j = '0f,s","f,s","A"j'
let @k = '0f,ct":"A,j'

-- En init.lua:
vim.cmd.source(vim.fn.stdpath("config") .. "/macros.vim")
```

**Método 3: Sesiones**:

```text
:mksession ~/sesion-con-macros.vim
nvim -S ~/sesion-con-macros.vim
→ restaura ventanas + registros + macros + marcas
```

---

### 7. Técnica: Macro Incremental Paso a Paso

Cuando una tarea es compleja, divídela en macros encadenadas:

```text
En vez de 1 macro gigante que hace todo:

q a         → paso 1: limpiar
q b         → paso 2: normalizar
q c         → paso 3: formatear
q d         → paso 4: validar

Flujo:
@a          → limpiar todo
@b          → normalizar
@c          → formatear
@d          → validar

Si un paso falla, puedes corregir solo ese paso,
no toda la macro.
```

---

### 8. Macros con `:for` y `:while` (Avanzado)

```vim
" Procesar líneas 1 a 100 con macro 'q'
:for i in range(1, 100)
:  execute i . "normal @q"
:endfor

" Mismo efecto que:
:%normal @q
```

```vim
" Procesar hasta que no haya cambios
:while search("TODO", "w") > 0
:  normal @t
:endwhile
```

---

### 9. Anti-patrones de Macros

```text
❌ Macro sin posicionamiento inicial:
   f, s", " Esc ...
   (si el cursor no está en la posición esperada, falla)

✅ Siempre empieza con 0, ^, gg, o /patrón

❌ Macro que asume ancho fijo:
   5 l f , ...
   (si el contenido varía de longitud, falla)

✅ Usa búsquedas (f, /) en vez de posiciones fijas

❌ Macro muy larga (20+ comandos):
   Difícil de depurar, frágil ante cambios

✅ Divide en macros pequeñas encadenadas

❌ Macro con @a como COMANDO INTERMEDIO:
   ... @a j ...
   (@a se expande y j nunca se ejecuta)

✅ @a solo al FINAL de la macro (recursión)
```

---

## 💡 Patrones de Diseño de Macros

```text
┌─────────────────────────────────────────────────────────┐
│ PATRONES DE MACROS                                       │
│                                                          │
│ Lineal:       una línea → transformar → siguiente        │
│               I " Esc f , s ", " Esc j                   │
│                                                          │
│ Búsqueda:     buscar patrón → transformar → repetir      │
│               / TODO Enter c w DONE Esc n @a            │
│                                                          │
│ Recursiva:    transformar → avanzar → auto-llamada       │
│               0 f , s ": " Esc j @a                     │
│                                                          │
│ Paramétrica:  usa registros como variables               │
│               "a P f : l c t , Ctrl-r b Esc              │
│                                                          │
│ Pipeline:     macros encadenadas @a @b @c @d             │
│               cada una hace una transformación           │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Combino registros y macros en flujos de trabajo
- [ ] Uso `Ctrl-a`/`Ctrl-x` en macros para secuencias numéricas
- [ ] Guardo macros útiles en init.lua con `:let @a = '...'`
- [ ] Divido tareas complejas en macros encadenadas
- [ ] Aplico posicionamiento predecible al inicio de cada macro
- [ ] Evito macros que asumen anchos fijos

---

## 🎮 Ejercicio Rápido

```text
Crea un archivo con 5 líneas:
echo "usuario_X, puntuacion: 0" > ~/v-macro-avanzado.txt
for i in 2 3 4 5; do echo "usuario_$i, puntuacion: 0" >> ~/v-macro-avanzado.txt; done

1. q a                     → grabar
2. 0                       → inicio
3. f :                     → salta a ':'
4. w                       → siguiente palabra (el número)
5. Ctrl-a                  → incrementa: 0 → 1
6. Ctrl-a Ctrl-a           → 1 → 3
7. b                       → palabra anterior
8. g U i w                 → mayúsculas a "PUNTUACION"
9. j                       → siguiente línea
10. q                      → detener

11. gg j @a @@ @@ @@       → ejecuta en todas las líneas

Resultado: números incrementados en +3, PUNTUACION en mayúsculas.
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
