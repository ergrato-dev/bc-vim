# 📦 Buffers: Gestión de Archivos en Memoria

## 🎯 Objetivos

- Entender qué es un buffer y cómo Vim gestiona archivos en memoria
- Listar, cambiar, eliminar y navegar entre buffers
- Configurar `hidden` para trabajar fluidamente sin guardar
- Usar buffers como tool principal (no pestañas)

---

## 📋 Contenido

### 1. ¿Qué es un Buffer?

Un buffer es la representación en memoria de un archivo. Cuando abres un archivo en Vim, estás viendo un buffer a través de una ventana.

```text
┌─────────────────────────────────────┐
│ VIM                                  │
│                                      │
│  ┌──────────────────────────────┐   │
│  │ Ventana 1 (viewport)         │   │
│  │ Muestra BUFFER archivo.js    │   │
│  └──────────────────────────────┘   │
│                                      │
│ Buffers en memoria:                  │
│  1. archivo.js    ← visible         │
│  2. estilo.css    ← oculto          │
│  3. README.md     ← oculto          │
└─────────────────────────────────────┘
```

**Diferencia clave**: Un buffer puede existir sin ser visible. Una ventana es solo una vista de un buffer.

---

### 2. `:ls` — Listar Buffers

```text
:ls        → lista todos los buffers
:buffers   → alias de :ls
:files     → alias de :ls
:ls!       → lista incluyendo buffers internos
```

**Salida típica**:
```text
:ls
  1 %a   "src/main.lua"        línea 42
  2 #    "src/config.lua"      línea 10
  3  h   "README.md"           línea 1
  4      "test/main_spec.lua"  línea 25
```

**Indicadores**:
| Símbolo | Significado |
|---------|-------------|
| `%` | Buffer actual (el que estás viendo) |
| `#` | Buffer alternativo (el anterior que viste) |
| `a` | Activo (cargado y visible) |
| `h` | Oculto (hidden — modificado pero no visible) |
| `-` | No modificable (readonly) |
| `=` | Solo lectura |
| `+` | Modificado (cambios sin guardar) |
| `x` | Con errores de lectura |

---

### 3. Cambiar de Buffer

```text
:b {n}         → cambiar al buffer número {n}
:b {nombre}    → cambiar al buffer que contiene {nombre}
:b#            → cambiar al buffer alternativo (el anterior)
:bn            → siguiente buffer (next)
:bp            → buffer anterior (previous)
:bf            → primer buffer (first)
:bl            → último buffer (last)
:bdelete {n}   → eliminar buffer {n}
:bd            → eliminar buffer actual
```

```text
Ejemplos:
:b 2           → cambia al buffer 2
:b main        → cambia al buffer que tiene "main" en el nombre
Ctrl-6         → alterna entre buffer actual y el anterior (atajo)
Ctrl-^         → igual que Ctrl-6

:ls            → primero miras los números
:b 3           → saltas al que necesitas
```

**Tab completo**: `:b ` + `Tab` muestra todos los buffers para autocompletar.

---

### 4. `set hidden` — La Opción Más Importante

**Sin `hidden`**: No puedes cambiar de buffer si el actual tiene cambios sin guardar.

```text
❌ Sin hidden:
   Modificas archivo.js
   :e README.md
   → Error: "No write since last change (add ! to override)"

✅ Con hidden:
   Modificas archivo.js
   :e README.md
   → El buffer de archivo.js queda oculto (hidden)
   → Puedes volver después y guardar
```

```lua
-- En tu init.lua:
vim.opt.hidden = true  -- IMPRESCINDIBLE para trabajo multi-archivo
```

**hidden NO es peligroso**: Los cambios no se pierden. Están en memoria. Si cierras Vim (`:q`), te advertirá que hay buffers modificados.

---

### 5. Eliminar Buffers

```text
:bd {n}       → delete buffer {n}
:bd           → delete buffer actual
:bw {n}       → wipe buffer {n} (más agresivo que bd)
:%bd          → delete TODOS los buffers (cierra todos)
:bd 2 3 5     → delete buffers 2, 3 y 5

:1,5bd        → delete buffers 1 a 5
:.bd          → delete buffer actual (punto = actual)
:$bd          → delete último buffer
```

**Diferencia `:bd` vs `:bw`**:
```text
:bd  → elimina el buffer, pero mantiene opciones locales
:bw  → eliminación completa, borra también opciones locales
```

---

### 6. Navegación Rápida entre Buffers

```text
Ctrl-6 / Ctrl-^    → alternar entre buffer actual y anterior
                     (el marcado con # en :ls)

:bn :bp            → siguiente/anterior en la lista numérica
                     (NO es necesariamente el más reciente)
```

**Problema de `:bn` / `:bp`**: El orden numérico no siempre es el orden de uso. Buffers eliminados dejan huecos.

**Alternativa con plugins** (Semana 6):
- `telescope.nvim` → búsqueda fuzzy de buffers
- `bufferline.nvim` → pestañas visuales estilo VS Code

**Por ahora**: Usa `:ls` + `:b {n}` o `Ctrl-6`.

---

### 7. Guardar y Salir con Múltiples Buffers

```text
:wa           → write all (guarda todos los buffers modificados)
:qa           → quit all (cierra todo, falla si hay sin guardar)
:wqa          → write + quit all
:qa!          → quit all sin guardar (fuerza)
:xa           → igual que :wqa (save and exit all)
```

---

### 8. Buffer Alternativo (`#`)

Vim siempre recuerda el "buffer alternativo" (el anterior que estabas viendo).

```text
Ctrl-6        → salta al buffer alternativo (toggle)
Ctrl-^        → igual
:b#           → mismo efecto

# en comandos:
:e #          → abre el archivo del buffer alternativo
:vs #         → abre buffer alternativo en split vertical
```

---

### 9. Workflow con Buffers

**Flujo típico de desarrollo**:

```text
1. nvim src/main.lua          → abres tu código principal
2. :e src/config.lua          → abres configuración (hidden activado)
3. :e test/main_spec.lua      → abres tests
4. :vs src/utils.lua          → abres utils en split vertical
5. :ls                         → verificas qué está abierto:
   %a main.lua
   #  config.lua
    h main_spec.lua
    a utils.lua
6. Ctrl-6 → vuelves a config.lua
7. Ctrl-6 → vuelves a main.lua
8. :b spec → cambias al buffer de tests (autocompletado)
9. :wa → guardas todo al final
```

---

### 10. Mappings Recomendados para Buffers

```lua
-- Navegación de buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Siguiente buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Eliminar buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>ls<CR>:b<Space>", { desc = "Listar y cambiar buffer" })

-- Alternar buffer (toggle)
vim.keymap.set("n", "<Tab>", "<cmd>b#<CR>", { desc = "Alternar buffer" })
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────┐
│ BUFFERS                                           │
│                                                    │
│ :ls              → listar buffers                 │
│ :b {n/nombre}    → cambiar a buffer               │
│ :bn / :bp        → siguiente / anterior           │
│ :bd              → eliminar buffer                │
│ Ctrl-6           → alternar último buffer         │
│ :wa / :wqa       → guardar/salir todos            │
│                                                    │
│ vim.opt.hidden = true  ← MANDATORIO               │
└─────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Entiendo la diferencia entre buffer (memoria) y ventana (vista)
- [ ] Tengo `set hidden` en mi configuración
- [ ] Listo buffers con `:ls` y entiendo los indicadores (% # a h +)
- [ ] Cambio buffers con `:b {n}` y `Ctrl-6`
- [ ] Elimino buffers que ya no necesito con `:bd`
- [ ] Guardo todo con `:wa` antes de salir
- [ ] Tengo mappings para `<leader>bn` y `<leader>bp`

---

## 🎮 Ejercicio Rápido

```text
1. Abre Vim: nvim archivo1.txt
2. :e archivo2.txt
3. :e archivo3.txt
4. :ls           → verifica 3 buffers
5. :b 1          → vuelve a archivo1
6. Ctrl-6        → alterna a archivo3
7. Ctrl-6        → alterna a archivo1
8. :bn :bn :bp   → navega con next/prev
9. :bd 2         → elimina archivo2
10. :ls          → solo quedan 1 y 3
```

---

## ➡️ Siguiente

[02 - Ventanas y Splits](02-ventanas-splits.md)
