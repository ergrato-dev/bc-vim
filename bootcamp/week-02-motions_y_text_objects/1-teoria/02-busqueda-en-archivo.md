# 🔎 / y ?: Búsqueda en Archivo

## 🎯 Objetivos

- Dominar `/` y `?` para buscar patrones en todo el archivo
- Navegar entre resultados con `n` y `N`
- Entender las opciones que afectan la búsqueda (ignorecase, smartcase, hlsearch, incsearch)
- Usar búsqueda como motion para combinar con operadores

---

## 📋 Contenido

### 1. /patrón: Buscar hacia Adelante

Busca el patrón desde la posición del cursor hacia el final del archivo.

```text
Sintaxis: /{patrón}<Enter>

Ejemplo:
/función<Enter>   → salta a la siguiente ocurrencia de "función"
```

**Búsqueda incremental** (`incsearch`): Si tienes activado `:set incsearch`, Vim muestra coincidencias mientras escribes. Cada carácter que escribes afina la búsqueda en tiempo real.

```lua
vim.opt.incsearch = true   -- imprescindible
```

---

### 2. ?patrón: Buscar hacia Atrás

Busca el patrón desde la posición del cursor hacia el **inicio** del archivo.

```text
Sintaxis: ?{patrón}<Enter>

Ejemplo:
?TODO<Enter>   → salta a la ocurrencia ANTERIOR de "TODO"
```

**Regla nemotécnica**:
- `/` = hacia **adelante** (la barra "apunta" hacia adelante en la lectura: `/patrón`)
- `?` = hacia **atrás** (la interrogación "mira" hacia atrás)

---

### 3. n y N: Navegar Resultados

| Comando | Acción |
|---------|--------|
| `n` | Siguiente ocurrencia en la **misma dirección** de la búsqueda |
| `N` | Siguiente ocurrencia en dirección **opuesta** |

```text
Ejemplo:
/función<Enter>   → primera ocurrencia
n                 → siguiente (hacia adelante)
n                 → siguiente
N                 → anterior (hacia atrás)
N                 → anterior

Si usaste ?función<Enter>:
n                 → siguiente (hacia atrás)
N                 → siguiente (hacia adelante — dirección opuesta)
```

**Memoriza**: `n` = **n**ext en la dirección de búsqueda. `N` = dirección contraria.

---

### 4. Resaltado de Búsqueda (hlsearch)

**Activar/desactivar resaltado**:

```lua
vim.opt.hlsearch = true    -- resaltar TODAS las coincidencias
```

Cuando haces una búsqueda, todas las coincidencias en el archivo se iluminan. Esto es útil para ver de un vistazo dónde aparece el patrón.

**Limpiar el resaltado**:
```text
:noh<Enter>     → no highlight (limpia resaltado)
:set nohlsearch → desactiva el resaltado permanentemente
```

**Mapping recomendado**:
```lua
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Limpiar resaltado" })
```

---

### 5. Opciones de Búsqueda Esenciales

| Opción | Efecto |
|--------|--------|
| `ignorecase` | Ignora mayúsculas/minúsculas (`function` = `Function`) |
| `smartcase` | Si el patrón tiene mayúsculas, búsqueda exacta; si no, ignora case |
| `hlsearch` | Resalta todas las coincidencias |
| `incsearch` | Muestra coincidencias mientras escribes |
| `wrapscan` | Al llegar al final, sigue desde el principio (cíclico) |

```lua
-- Configuración recomendada en init.lua
vim.opt.ignorecase = true   -- ignora mayúsculas por defecto
vim.opt.smartcase = true    -- sensible a mayúsculas si escribo alguna
vim.opt.hlsearch = true     -- resalta coincidencias
vim.opt.incsearch = true    -- búsqueda incremental
vim.opt.wrapscan = true     -- búsqueda cíclica (por defecto)
```

**Ejemplo de smartcase**:
```text
/buscar<Enter>  → encuentra "buscar", "Buscar", "BUSCAR"
/Buscar<Enter>  → encuentra SOLO "Buscar" (porque usaste mayúscula)
```

---

### 6. Patrones de Búsqueda

Vim soporta regex en las búsquedas:

| Patrón | Significado |
|--------|-------------|
| `\d` | Cualquier dígito (0-9) |
| `\w` | Carácter de palabra (letra, dígito, _) |
| `\s` | Espacio en blanco |
| `^` | Inicio de línea |
| `$` | Fin de línea |
| `.` | Cualquier carácter |
| `*` | Cero o más del anterior |
| `\+` | Uno o más del anterior |
| `\v` | Activa "very magic" (regex más natural) |

```text
/función\s*(   → busca "función" seguido de espacios y '('
/^import        → busca "import" al inicio de línea
/;\s*$          → busca ';' al final de línea
/\vfunction\s+\( → very magic: function seguido de espacios y '('
```

**Very magic (`\v`)**: Hace que la mayoría de caracteres tengan su significado regex sin escapar. Recomendado para patrones complejos.

---

### 7. Búsqueda como Motion

`/` y `?` son motions. Puedes combinarlos con operadores:

```text
d / patrón <Enter>     → delete hasta siguiente ocurrencia de patrón
c / patrón <Enter>     → change hasta siguiente ocurrencia
y / patrón <Enter>     → yank hasta siguiente ocurrencia
v / patrón <Enter>     → seleccionar hasta siguiente ocurrencia
```

```text
Ejemplo: Tienes una función larga y quieres eliminar desde aquí hasta
         la línea que dice "return":

d / return <Enter>     → elimina todo hasta "return" (no inclusive)
```

**Caso práctico**:
```javascript
// Quieres eliminar todo el bloque de comentarios:
// TODO: refactorizar esta sección
//   - mejorar manejo de errores
//   - añadir logging
const data = fetchData();

// Cursor en "TODO", ejecutas:
d / const <Enter>      → elimina TODO + todo hasta antes de "const"
```

---

### 8. Historial de Búsquedas

Vim recuerda tus búsquedas:

```text
/              → abre búsqueda vacía
<Up>           → muestra búsqueda anterior
<Up> <Up>      → dos búsquedas atrás
<Down>         → más reciente
<Enter>        → ejecuta la búsqueda mostrada
```

También puedes ver el historial completo:
```text
:history /      → historial de búsquedas hacia adelante
:history ?      → historial de búsquedas hacia atrás
q /             → ventana navegable del historial (puedes editarlo)
```

---

### 9. Sustitución con Búsqueda (Adelanto)

Esto pertenece a la Semana 3, pero es bueno que sepas que existe:

```text
:%s/patrón/reemplazo/g     → sustituye en todo el archivo
:%s/patrón/reemplazo/gc    → sustituye con confirmación
:s/patrón/reemplazo/g      → sustituye en la línea actual
:5,10s/patrón/reemplazo/g  → sustituye en líneas 5 a 10
```

---

## 💡 Resumen Visual

```text
Búsqueda en archivo:

  /patrón → adelante
  ?patrón → atrás

  n → siguiente (misma dirección)
  N → anterior (dirección opuesta)

  :noh → limpiar resaltado

  Combinación con operadores:
  d/patrón → delete hasta patrón
  c?patrón → change hasta patrón (hacia atrás)
```

---

## ✅ Checklist de Verificación

- [ ] Busco con `/` hacia adelante y `?` hacia atrás
- [ ] Navego resultados con `n` y `N` sin confundir direcciones
- [ ] Limpio el resaltado con `:noh` cuando ya no lo necesito
- [ ] Entiendo cómo `smartcase` afecta mis búsquedas
- [ ] Uso `/` como motion con operadores: `d/patrón`
- [ ] Sé navegar el historial de búsquedas con `<Up>`/`<Down>`

---

## 🎮 Ejercicio Rápido

Abre un archivo con más de 100 líneas (tu init.lua o cualquier código):

```text
1. /function<Enter>     → busca "function"
2. n n n                → navega 3 ocurrencias adelante
3. N                    → una atrás
4. :noh                 → limpia resaltado
5. ?return<Enter>       → busca "return" hacia atrás
6. n n                  → 2 ocurrencias hacia atrás
7. d / end <Enter>      → elimina hasta "end"
8. u                    → deshacer

Bono:
9. /*.js<Enter>         → busca archivos .js en comentarios (regex)
10. n n n               → navega las coincidencias
11. /\vTODO\|FIXME      → busca TODO o FIXME con very magic
```

---

## ➡️ Siguiente

[03 - Saltos Contextuales](03-saltos-contextuales.md)
