# 🔁 El Comando `.` (Dot)

## 🎯 Objetivos

- Entender qué es un "cambio" en Vim y qué repite `.`
- Diseñar ediciones "repetibles" para multiplicar eficiencia
- Combinar `.` con búsqueda (`n`) para cambios masivos
- Evitar los antipatrones que rompen la repetibilidad del `.`

---

## 📋 Contenido

### 1. ¿Qué es el Comando `.`?

El punto (`.`) repite el **último cambio** que modificó el buffer. No es el último comando — es el último **cambio**.

![`.` repite el último cambio, no el último movimiento](../0-assets/01-dot-repeat.svg)

```text
Qué REPITE '.':
- c i w hola Esc        → cambió palabra por "hola"
- d d                    → eliminó línea
- > i {                  → indentó bloque
- A ; Esc                → añadió ";" al final
- :s/foo/bar/g           → sustitución en línea
- o nueva línea Esc      → insertó línea abajo con texto

Qué NO repite '.':
- j, k, w, b, f (        → movimientos del cursor
- y y                    → yank (no modifica el buffer)
- / patrón               → búsqueda (no modifica)
- Esc                    → salir de modo (no modifica)
- u, Ctrl-r              → undo/redo (estos SÍ son cambios, pero '.' no los repite)
```

---

### 2. La Anatomía de un Cambio Repetible

El superpoder real de `.` aparece cuando diseñas ediciones que se pueden repetir.

```text
❌ MAL: Editar carácter por carácter
   Vas a cada línea, entras a Insert mode, editas manualmente.
   '.' no ayuda porque cada cambio es diferente.

✅ BIEN: Un cambio atómico y repetible
   ciw nuevoNombre Esc → '.' repetirá "cambiar palabra por nuevoNombre"
```

**Ejemplo clásico — añadir `;` al final de 5 líneas**:

```javascript
const name = "Ana"       // cursor aquí
const age = 30
const city = "Madrid"
const active = true
const role = "admin"

// Enfoque repetible:
A ; Esc          → const name = "Ana";
j                → siguiente línea
.                → const age = 30;
j .              → const city = "Madrid";
j .              → const active = true;
j .              → const role = "admin";
```

5 líneas editadas con 1 comando original + 4 teclas `.` + navegación.

---

### 3. `.` + `n`: El Combo Imparable

`. ` + `n` es la combinación más productiva de Vim. Permite buscar y modificar sistemáticamente:

```text
Estrategia:
1. /patrón        → busca lo que quieres cambiar
2. ciw nuevo Esc  → cambia la primera ocurrencia
3. n              → siguiente ocurrencia
4. .              → repite el cambio
5. n . n . n .    → sigue hasta terminar
```

**Caso real — renombrar variable**:

```javascript
function procesar(userData) {
    const userData = userData.filter(x => x.active);
    console.log(userData);
    return userData;
}
// Quieres renombrar userData → datos

*                 → busca siguiente "userData" (estás en la primera)
ciw datos Esc     → cambia primera ocurrencia
n                 → siguiente "userData"
.                 → cambia a "datos"
n .               → siguiente, cambia
n .               → siguiente, cambia
```

---

### 4. Diseñando Cambios Repetibles

La clave no es solo usar `.`, sino **pensar antes de ejecutar** para que el cambio sea repetible.

```text
Principio: El cambio que hagas en la primera ocurrencia,
           '.' lo repetirá EXACTAMENTE igual en las siguientes.

Pregúntate: ¿este cambio funcionará igual en la siguiente ocurrencia?
```

**Ejemplo de cambio NO repetible**:

```text
Quieres cambiar "user_name" por "userName" en camelCase.
Si haces: ciw userName Esc
Esto funciona para la primera, pero ¿qué pasa si encuentras
"user_name" en medio de "get_user_name"?

En "get_user_name" con cursor en "name":
ciw userName → get_user_userName  ❌ MAL

Solución: Usa text objects correctos
En "user_name" con cursor en cualquier parte:
ciw userName → funciona porque iw selecciona la palabra completa
```

**El antigpatrón más común**:

```text
❌ Insertar, mover cursor, insertar más, borrar, insertar...
   '.' solo repite el ÚLTIMO cambio de esa secuencia.

✅ Una acción atómica: un operador + un motion/text object.
   '.' repite TODO el cambio.
```

---

### 5. Casos de Uso Reales

#### Caso 1: Añadir prefijo a variables

```python
name = input()
age = int(input())
city = "Unknown"
state = "Unknown"

# Quieres añadir "user_" a cada variable:

Cursor en 'n' de name:
I user_ Esc    → user_name = input()
j .            → user_age = int(input())
j .            → user_city = "Unknown"
j .            → user_state = "Unknown"
```

#### Caso 2: Eliminar argumento de función

```python
procesar(id, nombre, email, telefono)
guardar(id, nombre, email, telefono)
validar(id, nombre, email, telefono)
enviar(id, nombre, email, telefono)

# Quieres eliminar "email" de todas las llamadas:

Cursor en 'email' de la primera:
daw            → procesar(id, nombre, telefono)
n              → busca siguiente "email" (en guardar)
.              → elimina
n . n .        → elimina de las demás
```

#### Caso 3: Cambiar comillas simples a dobles

```javascript
const name = 'Ana';
const city = 'Madrid';
const role = 'admin';
const lang = 'es';

// Cambiar todas las ' ' por " ":

Cursor en 'Ana' (dentro de comillas):
ci' " Esc       → const name = "Ana";  (espera, eso salió mal)
// Mejor: ci" (cambiar dentro de comillas, escribe "Ana")

Estrategia correcta:
ci' Ana Esc    → (cambiar contenido, se mantienen las comillas simples)
// No, eso no cambia las comillas.

Estrategia real con :s (Semana 3):
:%s/'\([^']*\)'/"\1"/g

Pero con .:
Necesitas cambiar cada string manualmente. No es ideal para '.'
porque '.' repite cambio de contenido, no de delimitadores.

Lección: No todo es trabajo para '.'. A veces ':s' es mejor.
```

#### Caso 4: Formatear líneas de log

```text
ERROR 2024-01-15 conexion fallida
WARN 2024-01-15 memoria alta
INFO 2024-01-15 inicio servicio
ERROR 2024-01-15 timeout

// Quieres poner el nivel entre corchetes:

Cursor en primera línea, 'E' de ERROR:
ysiw]           → ERROR] 2024... (con vim-surround, futuro)
O con Vim vanilla:
I [ Esc         → [ ERROR 2024...
f<Space>        → cursor en espacio después de ERROR
i ] Esc         → [ERROR] 2024...
// Todo eso es UN cambio (la secuencia de Insert a Esc)
j 0             → siguiente línea, inicio
.               → repite I [ Esc (poner '[' al inicio)
f<Space>        → espacio después de WARN
.               → repite i ] Esc (añadir ']')
```

---

### 6. Cuándo `.` No es la Mejor Herramienta

| Situación | Mejor usar |
|-----------|-----------|
| Cambiar muchas líneas idénticas | `:s` / `:%s` (sustitución) |
| Cambios en líneas no consecutivas | `.` + navegación |
| Cambios que requieren edición diferente cada vez | Edición manual |
| Cambios masivos con patrón regex | `:g` o `:%s` |
| Selecciones rectangulares | `Ctrl-v` + edición |

---

### 7. La Fórmula Dot

Del libro *Practical Vim* de Drew Neil:

```text
La "Dot Formula": Una tecla para mover, una tecla para ejecutar.

Ideal: navegas con 1 tecla (n, j, k, *, #) y ejecutas con 1 tecla (.)
```

---

## 💡 Resumen

```text
El comando '.' repite el ÚLTIMO CAMBIO.

Para que '.' sea útil:
1. Diseña cambios atómicos (un operador + un text object)
2. No hagas microediciones dentro de Insert mode
3. Combinar '.' + 'n' = poder masivo

Regla de oro:
Si hiciste algo una vez y necesitas hacerlo otra vez 
en otro lugar → '.'.
```

---

## ✅ Checklist de Verificación

- [ ] Entiendo qué constituye un "cambio" en Vim
- [ ] Uso `.` para repetir cambios simples (A algo Esc, ciw algo Esc)
- [ ] Combino `.` + `n` para cambios en múltiples ocurrencias
- [ ] Diseño mis ediciones pensando en que sean repetibles
- [ ] Evito microediciones en Insert mode que rompen la repetibilidad

---

## 🎮 Ejercicio Rápido

```text
1. Abre cualquier archivo
2. Encuentra una palabra repetida
3. ciw nuevoTexto Esc   → cambia la primera
4. n . n . n . n .       → cambia todas las demás
5. Encuentra líneas que necesiten ; al final:
   A ; Esc → j . → j . → j .

Prueba también fallar a propósito:
- Haz 3 cambios diferentes en Insert mode sin salir
- Presiona '.' → verás que solo repite el último cambio
```

---

## ➡️ Siguiente

[02 - Visual Mode](02-visual-mode.md)
