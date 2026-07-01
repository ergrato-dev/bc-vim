# 💾 Sesiones y Location List

## 🎯 Objetivos

- Guardar y restaurar sesiones completas de Vim
- Usar la location list para búsquedas por ventana
- Entender la diferencia entre quickfix (global) y location (local)
- Crear sesiones automáticas y workflows persistentes

---

## 📋 Contenido

### 1. Location List — Quickfix por Ventana

La location list es igual que quickfix, pero **asociada a una ventana específica**. Cada ventana puede tener su propia location list independiente.

![Contraste entre quickfix (lista global compartida) y location list (una lista independiente por ventana)](../0-assets/03-quickfix-vs-location-list.svg)

```text
┌─────────────────────────────────────────────────┐
│ QUICKFIX LIST (global)                          │
│ • Una sola lista para todo Vim                  │
│ • :copen, :cnext, :cprev                       │
│ • Poblada con :make, :vimgrep, :grep            │
├─────────────────────────────────────────────────┤
│ LOCATION LIST (por ventana)                     │
│ • Una lista por cada ventana                    │
│ • :lopen, :lnext, :lprev                       │
│ • Poblada con :lvimgrep, :lgrep, :lmake         │
└─────────────────────────────────────────────────┘
```

**¿Cuándo usar cada una?**
```text
Quickfix: errores de compilación, búsquedas globales
Location: búsquedas en un archivo, diagnósticos LSP, 
          tareas específicas de una ventana
```

---

### 2. Comandos de Location List

```text
:lvimgrep /patrón/gj {archivos} → buscar (location)
:lgrep {patrón} {archivos}     → grep externo (location)
:lmake                          → :make pero a location list

:lopen                          → abrir location list
:lclose / :lcl                  → cerrar
:lnext / :ln                    → siguiente
:lprev / :lp                    → anterior
:lfirst / :lf                   → primero
:llast / :ll                    → último
```

```text
Ejemplo:
:lvimgrep /function/gj %        → busca "function" en archivo actual
:lopen                          → abre location list (solo para esta ventana)
:lnext                          → navega resultados
```

---

### 3. Sesiones — Guardar el Estado de Vim

Una sesión guarda TODO el estado de Vim: ventanas, pestañas, buffers, folds, marcas, etc.

```text
:mksession {archivo}     → guardar sesión
:mks! {archivo}          → sobrescribir sesión existente
:source {archivo}         → cargar sesión (también nvim -S)
```

```text
nvim -S sesion.vim        → abrir Vim restaurando sesión
nvim -S                   → restaurar Session.vim (default)
```

**Qué guarda una sesión**:
```text
✓ Buffers abiertos con sus rutas
✓ Ventanas y su layout
✓ Pestañas activas
✓ Posición del cursor en cada ventana
✓ Folds (código colapsado/expandido)
✓ Marcas (a-z, A-Z)
✓ Opciones locales a ventanas/buffers
✓ Directorio de trabajo actual
```

**Qué NO guarda**:
```text
✗ Registros (a no ser que configures :set sessionoptions+=globals)
✗ Macros (se pierden al cerrar)
✗ Historial de comandos
```

---

### 4. Configuración de Sesiones

```lua
-- Opciones de sesión
vim.opt.sessionoptions = {
  "buffers",        -- guardar buffers
  "curdir",         -- directorio actual
  "folds",          -- folds
  "help",           -- ventanas de ayuda
  "tabpages",       -- pestañas
  "winsize",        -- tamaño de ventanas
  "globals",        -- variables globales
  "localoptions",   -- opciones locales
  "options",        -- opciones globales
  "resize",         -- tamaño de terminal
  "winpos",         -- posición de ventana
  "terminal",       -- buffers de terminal
}
```

---

### 5. Auto-sesión con nvim

```lua
-- Guardar sesión automáticamente al salir
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local session_file = vim.fn.stdpath("data") .. "/session.vim"
    vim.cmd("mks! " .. session_file)
  end,
  desc = "Auto-guardar sesión al salir",
})

-- Restaurar sesión automáticamente al entrar
vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    local session_file = vim.fn.stdpath("data") .. "/session.vim"
    if vim.fn.filereadable(session_file) == 1 and vim.fn.argc() == 0 then
      vim.cmd("source " .. session_file)
    end
  end,
  desc = "Auto-restaurar sesión al abrir",
})
```

**Plugins de sesiones**:
```lua
-- auto-session: sesiones por proyecto automáticas
{
  "rmagatti/auto-session",
  lazy = false,
  opts = {},
}

-- :SessionSave y :SessionRestore
```

---

### 6. Sesiones por Proyecto

```bash
# Guardar sesión en la raíz del proyecto
cd ~/proyectos/mi-app
nvim
# ... organizas tus ventanas ...
:mks! .session.vim

# Después, desde el directorio:
nvim -S .session.vim
```

```lua
-- Restaurar sesión de proyecto automáticamente
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local session = ".session.vim"
    if vim.fn.filereadable(session) == 1 and vim.fn.argc() == 0 then
      vim.cmd("source " .. session)
    end
  end,
})
```

---

### 7. Location List Avanzado

```lua
-- Llenar location list manualmente desde Lua
local items = {
  { filename = "src/main.lua", lnum = 10, col = 5, text = "Issue 1" },
  { filename = "src/main.lua", lnum = 42, col = 1, text = "Issue 2" },
}
vim.fn.setloclist(0, items, "r")   -- winnr 0 = ventana actual, "r" = replace

-- Añadir a location list existente
vim.fn.setloclist(0, items, "a")   -- "a" = append
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ SESIONES Y LOCATION LIST                                  │
│                                                           │
│ LOCATION LIST (local):                                    │
│   :lvimgrep /patrón/gj {archivos}                        │
│   :lopen / :lclose                                       │
│   :lnext / :lprev                                        │
│                                                           │
│ SESIONES:                                                 │
│   :mksession {archivo}     → guardar                     │
│   nvim -S {archivo}         → restaurar                  │
│                                                           │
│ OPCIONES DE SESIÓN:                                       │
│   vim.opt.sessionoptions = { "buffers", "folds", ... }   │
│                                                           │
│ AUTO-SESIÓN:                                              │
│   Guardar en VimLeavePre                                 │
│   Restaurar en VimEnter                                  │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Diferencio quickfix (global) de location list (por ventana)
- [ ] Uso `:lvimgrep` y `:lopen` para búsquedas locales
- [ ] Guardo sesiones con `:mksession`
- [ ] Restauro sesiones con `nvim -S`
- [ ] Configuré sessionoptions

---

## 🎮 Ejercicio Rápido

```text
1. Abre 3 archivos en 2 splits + 1 tab
2. :mks! ~/test-session.vim
3. :qa! → cierra todo
4. nvim -S ~/test-session.vim → restaura

5. En un archivo: :lvimgrep /function/gj %
6. :lopen → location list solo para esta ventana
7. :lnext → navega resultados
```

---

## ➡️ Siguiente

[04 - Búsqueda y Reemplazo Avanzados](04-busqueda-y-reemplazo-avanzado.md)
