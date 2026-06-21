# 📚 Arglist y Procesamiento Batch

## 🎯 Objetivos

- Usar el arglist para agrupar archivos a procesar
- Ejecutar comandos en lote con `:argdo` y `:bufdo`
- Procesar la quickfix list con `:cfdo`
- Realizar refactorizaciones masivas de forma segura

---

## 📋 Contenido

### 1. ¿Qué es el Arglist?

El arglist es una lista de archivos. Originalmente eran los argumentos al abrir Vim (`vim *.lua`), pero puedes manipularla dinámicamente.

```text
Cada buffer tiene su arglist.
Puedes añadir, eliminar y modificar archivos en ella.
```

---

### 2. Gestionar el Arglist

```text
:args                    → ver lista de argumentos
:args {patrón}           → reemplazar arglist con archivos que coinciden

:arga {archivo}          → añadir archivo al arglist
:argadd {archivo}        → alias de :arga
:argd {patrón}           → eliminar archivos que coinciden
:argdelete {patrón}      → alias de :argd

:n / :next               → siguiente archivo en arglist
:N / :prev               → archivo anterior
:rewind / :first         → primer archivo
:last                    → último archivo
```

```text
Ejemplos:
:args src/**/*.lua        → todos los .lua en src/
:args                      → ver la lista
:arga test/*.lua           → añade tests a la lista
:argd *spec*               → elimina archivos con "spec"
```

---

### 3. `:argdo` — Ejecutar en Todo el Arglist

El comando más poderoso para procesamiento batch. Ejecuta un comando en cada archivo del arglist.

```text
:argdo {comando}           → ejecutar en todos los args
:argdo %s/old/new/g        → sustituir en todos los archivos
:argdo %s/old/new/g | update → sustituir y guardar
:argdo norm @q             → ejecutar macro @q en todos
```

**Precaución**: `:argdo` abre cada archivo secuencialmente. Para evitar problemas con buffers modificados:

```text
:set hidden                 ← IMPRESCINDIBLE para :argdo
:argdo %s/old/new/g | update   ← sustituir y guardar cada uno
```

**Receta: renombrar variable en todo el proyecto**:
```text
:args **/*.lua              → todos los .lua
:argdo %s/\<old_var\>/new_var/g | update
:args prev                  → vuelve al archivo anterior
```

**Receta: aplicar macro a todos los archivos**:
```text
:args src/**/*.lua
:argdo norm @q              → ejecuta macro @q en cada archivo
:argdo update               → guarda cada archivo modificado
```

---

### 4. `:bufdo` — Ejecutar en Todos los Buffers

Similar a `:argdo` pero opera sobre todos los buffers abiertos.

```text
:bufdo {comando}
:bufdo %s/old/new/g | update
:bufdo bd                  → cerrar todos los buffers
```

---

### 5. `:cfdo` — Ejecutar en Archivos de Quickfix

Ejecuta un comando en cada archivo de la quickfix list (sin duplicados).

```text
:vimgrep /TODO/gj **/*.lua  → busca TODO en todos los .lua
:cfdo %s/TODO/DONE/g | update → reemplaza en cada archivo con TODOs
```

```text
Flujo de refactorización:
1. :vimgrep /oldName/gj **/*.lua      → encuentra todas las ocurrencias
2. :copen                              → revisa los resultados
3. :cfdo %s/\<oldName\>/newName/g | update → reemplaza en todos
```

---

### 6. `:tabdo` y `:windo`

```text
:tabdo {comando}     → ejecutar en todas las pestañas
:windo {comando}     → ejecutar en todas las ventanas
```

---

### 7. Precauciones con Batch Operations

```text
⚠️  SIEMPRE:
1. set hidden          → buffers modificados pueden ocultarse
2. Guardar antes       → :wa (por si algo sale mal)
3. Probar en 1 archivo → antes de aplicar a todos
4. Usar /gc            → confirmación en sustituciones
5. Tener backup        → git stash / copia de seguridad

✅ Flujo seguro:
1. :vimgrep /patrón/gj **/*.lua
2. :copen → revisar resultados
3. :cfdo %s/patrón/reemplazo/gc | update
   → 'y' para cada cambio (confirmación)
8. :Lazy sync
```

---

### 8. Caso Real: Refactorización Completa

```text
Tarea: Renombrar la función "calcular" a "compute" en un proyecto Lua.

1. Encontrar:
   :vimgrep /\<calcular\>/gj **/*.lua
   :copen
   → 23 resultados en 5 archivos

2. Revisar:
   :cnext :cnext :cnext ...
   → verificar que todas son la función correcta

3. Reemplazar:
   :cfdo %s/\<calcular\>/compute/gc | update
   → confirmar cada cambio con 'y' o 'a' (todos)

4. Verificar:
   :vimgrep /\<calcular\>/gj **/*.lua
   → 0 resultados (cambio exitoso)

5. Commit:
   :Git commit -m "refactor: rename calcular → compute"
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ PROCESAMIENTO BATCH                                       │
│                                                           │
│ :argdo {cmd}     → en cada archivo del arglist           │
│ :bufdo {cmd}     → en cada buffer abierto                │
│ :cfdo {cmd}      → en cada archivo de quickfix           │
│ :tabdo {cmd}     → en cada pestaña                       │
│ :windo {cmd}     → en cada ventana                       │
│                                                           │
│ REQUISITO: set hidden                                     │
│                                                           │
│ FLUJO REFACTORIZACIÓN:                                   │
│   1. :vimgrep /old/gj **/*.ext                           │
│   2. :copen → revisar                                    │
│   3. :cfdo %s/old/new/gc | update                       │
│   4. Verificar: :vimgrep /old/gj                         │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Gestiono arglist con `:args`, `:arga`, `:argd`
- [ ] Uso `:argdo` para procesar múltiples archivos
- [ ] Uso `:cfdo` para procesar resultados de quickfix
- [ ] Tengo `set hidden` activado
- [ ] Uso `/gc` para confirmación en sustituciones batch

---

## 🎮 Ejercicio Rápido

```text
1. :args **/*.md            → todos los markdown
2. :args                     → ver la lista
3. :argdo %s/vim/Vim/ge | update   → reemplazar en todos
4. :argdo update             → guardar todos
5. :first                    → volver al primero

Con quickfix:
1. :vimgrep /Vim/gj **/*.md  → buscar
2. :copen → ver resultados
3. :cfdo %s/Vim/Neovim/ge | update → reemplazar
```

---

## ➡️ Siguiente

[03 - Sesiones y Location List](03-sesiones-y-location.md)
