# 🎬 Macros: Grabación y Ejecución

## 🎯 Objetivos

- Grabar secuencias de comandos como macros con `q{reg}`
- Ejecutar macros con `@{reg}` y `@@`
- Repetir macros N veces con `{N}@{reg}`
- Aplicar macros a líneas seleccionadas con `:normal @{reg}`
- Entender el ciclo grabar → ejecutar → repetir

---

## 📋 Contenido

### 1. ¿Qué es una Macro?

Una macro es una secuencia de comandos Vim grabada en un registro. Permite automatizar tareas repetitivas sin programar.

```text
Grabar:   q a   → inicia grabación en registro 'a'
          (ejecutas comandos Vim normalmente)
          q     → detiene grabación

Ejecutar: @ a   → reproduce la macro del registro 'a'
          @ @   → repite la última macro ejecutada
```

```text
La magia: puedes grabar cualquier cosa que hagas en Vim.
Movimientos, ediciones, cambios de modo, búsquedas...
TODO es grabable y repetible.
```

---

### 2. Grabar una Macro

```text
q {reg}        → inicia grabación en registro {reg}
  ...           → ejecutas los comandos que quieres automatizar
q              → detiene grabación (presiona q en Normal mode)
```

```text
Indicadores durante la grabación:
  -- recording @a --      (Neovim)
  recording @a            (Vim)

Si ves "recording", todo lo que hagas se está grabando.
```

**Ejemplo simple — formatear una línea**:

```text
Línea: "ana,30,madrid"

Objetivo: convertir a "Nombre: Ana, Edad: 30, Ciudad: Madrid"

q a             → empieza grabación en 'a'
0               → inicio de línea
f ,             → salta a la primera coma
r :             → reemplaza coma por ':'
w               → siguiente palabra
g U i w         → mayúsculas a la palabra (ANA → Ana)
b               → palabra anterior
r :             → reemplaza siguiente carácter por ':' (era un espacio?)
                  No, vamos paso a paso:

Mejor:
0               → inicio
f ,             → primera coma
r :             → reemplaza por ':'
l               → derecha (salta el espacio)
iNombre:  Esc   → inserta "Nombre: "
f ,             → siguiente coma
r :             → reemplaza por ':'
l               → derecha
iEdad:  Esc     → inserta "Edad: "
f ,             → siguiente coma
r :             → reemplaza por ':'
l               → derecha
iCiudad:  Esc   → inserta "Ciudad: "
q               → detiene grabación

Resultado: "Nombre: ana: Edad: 30: Ciudad: madrid"

No quedó perfecto, pero la macro funciona.
La editaríamos para mejorarla (próxima lección).
```

---

### 3. Ejecutar una Macro

```text
@ a            → ejecuta macro en registro 'a'
@ b            → ejecuta macro en registro 'b'
3 @ a          → ejecuta macro 'a' 3 veces
100 @ a        → ejecuta macro 'a' 100 veces (¡cuidado!)

@ @            → repite la última macro ejecutada
```

**Ejemplo clásico — transformar CSV línea por línea**:

```text
Archivo CSV:
nombre,edad,ciudad
ana,30,madrid
carlos,25,barcelona
bea,28,valencia

q a             → grabar en 'a'
I " Esc         → inserta comilla al inicio
f ,             → primera coma
s ", " Esc      → sustituye coma por comilla-coma-comilla
f ,             → siguiente coma  
s ", " Esc      → mismo reemplazo
A " Esc         → añade comilla al final
j               → siguiente línea (prepara para la siguiente ejecución)
q               → detiene

Ahora:
j               → posiciona cursor en primera línea de datos (ana)
@ a             → transforma línea "ana" y baja a la siguiente
@ @             → transforma siguiente (carlos) y baja
@ @             → transforma siguiente (bea)
```

---

### 4. `@@` — Repetir Última Macro

```text
@@              → repite la macro más reciente
5 @@            → repite la última macro 5 veces

Es equivalente a @{último-registro-usado}
```

```text
Flujo eficiente:
1. Grabas macro en 'q'
2. @q            → primera ejecución
3. @@            → siguiente
4. @@            → siguiente
5. @@            → ...

O con número:
10 @q            → ejecuta 10 veces de golpe
```

---

### 5. Macros que Incluyen Navegación

El secreto para macros reutilizables es incluir navegación al inicio.

```text
❌ Macro MALA:
   (asume que el cursor ya está en la posición correcta)
   I " Esc f , s ", " Esc ...

✅ Macro BUENA:
   0                → va al inicio (posicionamiento garantizado)
   I " Esc
   f , s ", " Esc
   f , s ", " Esc
   A " Esc
   j                → avanza a siguiente línea
```

**Regla de oro**: Siempre empieza con un posicionamiento predecible (`0`, `^`, `gg`, `/patrón`).

---

### 6. Macros con Búsqueda

Puedes incluir `/` en macros para encontrar la siguiente ocurrencia:

```text
Ejemplo — cambiar todas las instancias de "TODO" en líneas específicas:

q t             → grabar en 't'
0               → inicio de línea
/ TODO Esc      → busca "TODO" (Esc para salir del modo búsqueda)
c w DONE Esc    → cambia la palabra a "DONE"
q               → detiene

@ t             → ejecuta (busca y cambia)
@ @             → repite en la siguiente ocurrencia
```

---

### 7. Aplicar Macro a Múltiples Líneas con `:normal`

```text
:normal @{reg}     → ejecuta macro como comando Normal en línea actual
:%normal @{reg}    → ejecuta macro en CADA línea del archivo
:{rango}normal @{reg} → ejecuta en rango de líneas
```

```text
Ejemplo — aplicar macro 'q' a líneas 5-50:
:5,50 normal @q

Ejemplo — aplicar macro 'w' a todas las líneas que contienen "ERROR":
:g/ERROR/normal @w
```

**Precaución**: `:normal @q` ejecuta la macro UNA vez por línea. Si tu macro ya incluye `j` para avanzar, se saltará líneas. Para `:normal`, NO incluyas `j` en la macro — deja que `:normal` avance.

```text
Macro para :normal:         Macro para ejecución manual:
q n                          q m
I * Esc                      I * Esc
q                            j
                             q

:%normal @n                  @m @m @m @m
(procesa todas las líneas)   (procesa y avanza manualmente)
```

---

### 8. Detener Macros en Error

Por defecto, si una macro encuentra un error (ej: `f {char}` no encuentra el carácter), se **detiene**.

```text
Esto es BUENO: evita que la macro se ejecute infinitamente.

Ejemplo:
La macro busca "DELETE ME" y elimina la línea.
Si no hay más líneas con "DELETE ME", la búsqueda falla
→ la macro se detiene automáticamente.
```

---

### 9. Macros que Terminan Solas

Combinando búsqueda + detención en error:

```text
q a                     → grabar
/ PENDIENTE Enter       → busca "PENDIENTE"
c w HECHO Esc           → cambia a "HECHO"
q                       → detiene

Ahora: 1000 @a          → ejecuta hasta que no haya más "PENDIENTE"
                          (la búsqueda falla → macro se detiene)
```

---

## 💡 Resumen Visual

```text
┌─────────────────────────────────────────────────────┐
│ MACROS                                               │
│                                                      │
│ q {reg}       → iniciar grabación                   │
│ q             → detener grabación                   │
│ @ {reg}       → ejecutar macro                      │
│ @ @           → repetir última macro                │
│ {N} @ {reg}   → ejecutar N veces                    │
│ :normal @{reg} → ejecutar como comando Normal       │
│ :%normal @{reg} → ejecutar en todo el archivo       │
│                                                      │
│ Regla de oro: empezar con posicionamiento            │
│ predecible (0, ^, gg, /patrón)                      │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Inicio grabación con `q{reg}` y detengo con `q`
- [ ] Ejecuto macros con `@{reg}` y repito con `@@`
- [ ] Aplico macros N veces con `{N}@{reg}`
- [ ] Incluyo posicionamiento al inicio de cada macro
- [ ] Uso `:normal @{reg}` para aplicar en lote
- [ ] Entiendo que las macros se detienen en error

---

## 🎮 Ejercicio Rápido

```text
Crea un archivo con 10 líneas iguales:
for i in $(seq 1 10); do echo "item $i: valor" >> ~/v-macro.txt; done
nvim ~/v-macro.txt

1. q a                       → grabar
2. I - [ ]  Esc              → añade checkbox
3. $ a  (ok) Esc             → añade "(ok)" al final
4. j                         → siguiente línea
5. q                         → detener

6. @ a                       → ejecuta en línea 2
7. @ @ @ @ @ @ @ @           → repite 8 veces más

Resultado: las 10 líneas con checkbox y "(ok)".
```

---

## ➡️ Siguiente

[04 - Edición de Macros y Batch](04-macros-edicion-batch.md)
