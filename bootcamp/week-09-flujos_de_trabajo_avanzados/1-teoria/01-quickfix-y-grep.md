# 🔍 Quickfix List y Búsqueda Multiarchivo

## 🎯 Objetivos

- Entender la quickfix list como lista global de posiciones
- Usar `:vimgrep` y `:grep` para buscar en múltiples archivos
- Navegar, filtrar y operar sobre resultados de quickfix
- Poblar quickfix con `:make` para flujos de compilación

---

## 📋 Contenido

### 1. ¿Qué es la Quickfix List?

Es una lista global de ubicaciones (archivo + línea + columna). Vim la llena automáticamente con resultados de búsqueda, errores de compilación y más.

```text
┌─────────────────────────────────────────────────┐
│ QUICKFIX LIST                                    │
│                                                  │
│ [1] src/main.lua:42:10 function calcular()       │
│ [2] src/main.lua:67:3  calcular(datos)           │
│ [3] test/main_spec.lua:15:5 calcular(2,3)       │
│ [4] lib/utils.lua:89:1 local function calcular   │
│                                                  │
│ :copen    → ver la lista                         │
│ :cnext    → ir al siguiente                      │
│ :cprev    → ir al anterior                       │
└─────────────────────────────────────────────────┘
```

---

### 2. `:vimgrep` — Buscar con Motor Interno

```text
:vimgrep /patrón/ {archivos}
:vim /patrón/ {archivos}        → alias

Ejemplos:
:vimgrep /TODO/gj **/*.lua      → busca TODO en todos los .lua
:vimgrep /function/gj src/**/*  → busca function en src/
:vimgrep /\<calcular\>/gj **/*.lua → palabra completa "calcular"
```

**Flags**:
```text
g  → todas las ocurrencias en una línea
j  → no saltar a la primera coincidencia (solo llenar quickfix)
```

**Patrones de archivo**:
```text
**/*.lua        → todos los .lua recursivo
src/**/*.js     → todos los .js bajo src/
*.{lua,py,js}   → .lua, .py y .js
**/*            → TODO (puede ser lento)
```

---

### 3. `:grep` — Buscar con grep Externo

Usa el comando `grep` del sistema (más rápido para proyectos grandes).

```text
:grep {patrón} {archivos}
:grep TODO **/*.lua
:grep "function main" src/**/*.c
```

**Configurar grep tool**:
```lua
-- Usar ripgrep si está instalado
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m"
end
```

```text
Con ripgrep configurado:
:grep TODO              → busca TODO en todo el proyecto
:grep function src/     → busca function en src/
```

**Sin ripgrep**:
```text
vim.opt.grepprg = "grep -n $* /dev/null"
```

---

### 4. Navegar la Quickfix List

```text
:copen           → abrir ventana de quickfix
:copen 10        → abrir con altura de 10 líneas
:cclose / :ccl   → cerrar ventana
:cnext / :cn     → siguiente ítem
:cprev / :cp     → ítem anterior
:cfirst / :cf    → primer ítem
:clast / :cl     → último ítem
:cnfile          → siguiente archivo
:cpfile          → archivo anterior
:cc {n}          → ir al ítem {n}
```

**En la ventana de quickfix**:
```text
j / k     → navegar ítems
Enter     → saltar a esa ubicación
o         → abrir en nueva ventana
```

**Mappings recomendados**:
```lua
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", { desc = "Abrir quickfix" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Cerrar quickfix" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Siguiente quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Anterior quickfix" })
```

---

### 5. `:make` — Compilar y Poblar Quickfix

`:make` ejecuta el programa definido en `makeprg` y automáticamente puebla quickfix con los errores.

```lua
-- Configurar makeprg según el proyecto
vim.opt.makeprg = "npm run build"    -- JavaScript
vim.opt.makeprg = "cargo build"      -- Rust
vim.opt.makeprg = "python3 -m py_compile %"  -- Python
```

```text
:make               → ejecuta makeprg
:copen              → abre quickfix con errores
:cnext              → salta al primer error
:make               → recompila
:cnext              → siguiente error
```

**Flujo compilar-corregir**:
```text
1. :make             → compila
2. :copen            → ve los errores
3. :cn → corregir → :w
4. :cn → corregir → :w
5. :make             → recompila
6. Repetir hasta que :make no tenga errores
```

---

### 6. Filtrar la Quickfix List

```lua
-- Plugin: nvim-bqf (better quickfix) — recomendado
{
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  opts = {},
}
```

Con nvim-bqf puedes filtrar la quickfix list con `/` como en cualquier buffer.

**Filtrado nativo**:
```text
:Cfilter /patrón/       → muestra solo ítems que coinciden
:Cfilter! /patrón/      → muestra solo ítems que NO coinciden
:packadd cfilter         → cargar plugin cfilter (incluido en Vim)
```

---

### 7. Quickfix para Refactorización

```text
Flujo: buscar → quickfix → corregir

1. :vimgrep /old_function/gj src/**/*.lua
2. :copen
   → ves todas las ocurrencias

3. :cnext → primera ocurrencia
4. ciw new_function Esc   → cambia
5. :cnext → siguiente
6. .                        → repite cambio
7. :cnext . :cnext .        → corrige todas con . (dot)

8. :cclose
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ QUICKFIX                                                  │
│                                                           │
│ POBLAR:                                                   │
│   :vimgrep /patrón/gj {archivos}  → búsqueda            │
│   :grep {patrón} {archivos}       → grep externo        │
│   :make                           → compilación          │
│                                                           │
│ NAVEGAR:                                                  │
│   :copen / :cclose   → abrir/cerrar                     │
│   :cn / :cp          → siguiente/anterior               │
│   ]q / [q            → con mappings                     │
│                                                           │
│ FLUJO COMPILAR-CORREGIR:                                 │
│   :make → :copen → :cn → corregir → :w → :cn → ...      │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Uso `:vimgrep` para buscar en múltiples archivos
- [ ] Navego resultados con `:cnext` / `:cprev`
- [ ] Uso `:copen` para ver la lista de quickfix
- [ ] Configuré ripgrep como grepprg
- [ ] Flujo `:make` + quickfix funciona

---

## 🎮 Ejercicio Rápido

```text
1. :vimgrep /require/gj **/*.lua   → busca require en .lua
2. :copen                           → abre lista
3. ]q ]q ]q                         → navega resultados
4. [q [q                             → vuelve
5. En un resultado: ciw loadstring  → cambia require
6. :cnext .                         → repite en siguiente
```

---

## ➡️ Siguiente

[02 - Arglist y Procesamiento Batch](02-arglist-y-batch.md)
