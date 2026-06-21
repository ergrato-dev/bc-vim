# 🪟 Ventanas y Splits

## 🎯 Objetivos

- Crear divisiones de pantalla horizontales y verticales
- Redimensionar ventanas con precisión
- Cerrar, rotar y reorganizar ventanas
- Usar argumentos (args) y el arglist para lotes de archivos

---

## 📋 Contenido

### 1. ¿Qué es una Ventana (Window)?

Una ventana es un **viewport** (vista) de un buffer. Múltiples ventanas pueden mostrar el mismo buffer o buffers diferentes.

```text
┌───────────────────────┬───────────────────────┐
│ Ventana 1             │ Ventana 2             │
│ Buffer: main.lua      │ Buffer: config.lua    │
│                       │                       │
│ Editas código...      │ Ves configuración...  │
│                       │                       │
└───────────────────────┴───────────────────────┘
```

**Regla fundamental**: Cada ventana muestra un buffer. Puedes tener 3 ventanas mostrando 2 buffers (una ventana duplicada).

---

### 2. Crear Splits

```text
:split [archivo]        → split horizontal (abre archivo opcional)
:sp [archivo]           → alias de :split

:vsplit [archivo]       → split vertical
:vs [archivo]           → alias de :vsplit

:new                    → split horizontal con buffer vacío
:vnew                   → split vertical con buffer vacío
```

```text
Desde Normal mode:
Ctrl-w s                → split horizontal (mismo buffer)
Ctrl-w v                → split vertical (mismo buffer)
Ctrl-w n                → split horizontal + buffer vacío
```

```text
Ejemplos:
:sp                     → divide horizontalmente mostrando el mismo buffer
:sp archivo2.txt        → divide horizontal con archivo2.txt
:vs README.md           → divide vertical con README.md
```

---

### 3. Cerrar Ventanas

```text
Ctrl-w q        → cerrar ventana actual (quit)
Ctrl-w c        → cerrar ventana actual (close)
:q              → cerrar ventana/buffer actual
:close          → cerrar ventana (sale de Vim si es la última)
:only           → cerrar TODAS menos la actual (Ctrl-w o)
:on             → alias de :only
```

```text
Atención:
:q      → cierra ventana + buffer
:close  → cierra SOLO ventana (buffer sigue en memoria)
:bd     → elimina buffer + cierra su ventana
```

---

### 4. Navegar entre Ventanas

```text
Ctrl-w h      → ventana izquierda
Ctrl-w j      → ventana inferior
Ctrl-w k      → ventana superior
Ctrl-w l      → ventana derecha
Ctrl-w w      → siguiente ventana (cíclico)
Ctrl-w W      → ventana anterior (cíclico)
Ctrl-w p      → última ventana visitada
Ctrl-w t      → primera ventana (top-left)
Ctrl-w b      → última ventana (bottom-right)
```

```text
Alternativa con teclas de flecha:
Ctrl-w ← ↓ ↑ →    → mismo que hjkl
```

---

### 5. Redimensionar Ventanas

```text
Ctrl-w =            → igualar tamaño de TODAS las ventanas
Ctrl-w _            → maximizar altura (hacerla lo más alta posible)
Ctrl-w |            → maximizar anchura (lo más ancha posible)
Ctrl-w +            → aumentar altura 1 línea
Ctrl-w -            → disminuir altura 1 línea
Ctrl-w >            → aumentar anchura 1 columna
Ctrl-w <            → disminuir anchura 1 columna

:{n}Ctrl-w +        → aumentar altura {n} líneas
:{n}Ctrl-w >        → aumentar anchura {n} columnas

:resize {n}         → altura exacta de {n} líneas
:vertical resize {n} → anchura exacta de {n} columnas
:resize +{n}        → aumentar {n} líneas
:vertical resize -{n} → disminuir {n} columnas
```

```text
Ejemplos:
Ctrl-w =            → distribuye espacio equitativamente (muy usado)
:resize 15          → ventana actual a 15 líneas de alto
:vertical resize 80 → ventana actual a 80 columnas de ancho
10 Ctrl-w +         → aumentar 10 líneas
```

---

### 6. Mover y Rotar Ventanas

```text
Ctrl-w r      → rotar ventanas (derecha/abajo)
Ctrl-w R      → rotar en dirección opuesta (izquierda/arriba)
Ctrl-w x      → intercambiar posición con siguiente ventana
Ctrl-w H      → mover ventana al borde IZQUIERDO
Ctrl-w J      → mover ventana al borde INFERIOR
Ctrl-w K      → mover ventana al borde SUPERIOR
Ctrl-w L      → mover ventana al borde DERECHO
Ctrl-w T      → mover ventana a su propia pestaña
```

```text
Ejemplo — reorganizar:
Tienes 3 splits verticales: [A] [B] [C]
Cursor en [B], presionas Ctrl-w H:
[A] [C]
[B]
→ B se mueve a la izquierda, ocupando espacio vertical
```

---

### 7. Mappings Recomendados

```lua
-- Navegación entre splits con Ctrl-hjkl (sin Ctrl-w)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir a split izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir a split inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir a split superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir a split derecho" })

-- Redimensionar con Ctrl + flechas
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Aumentar altura" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Disminuir altura" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Aumentar anchura" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Disminuir anchura" })

-- Igualar splits
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Igualar tamaño de ventanas" })
```

---

### 8. Flujos de Trabajo con Splits

#### Flujo 1: Código + Tests (Vertical)

```bash
nvim src/calculator.lua
:vs test/calculator_spec.lua
Ctrl-w =                    # igualar anchos
```

#### Flujo 2: Código + Referencia + Config (Mixto)

```bash
nvim src/main.lua
:sp src/config.lua          # horizontal (abajo)
Ctrl-w j                    # ve al split de abajo
:vs README.md               # vertical (derecha abajo)
Ctrl-w =                    # igualar todo
```

#### Flujo 3: Exploración de Código

```bash
nvim src/main.lua
:sp                         # mismo buffer, otra vista
Ctrl-w j                    # abajo
100G                        # ve a línea 100
# Ahora tienes 2 vistas del mismo archivo: arriba principio, abajo línea 100
```

---

### 9. Configuraciones de Splits

```lua
-- Hacia dónde se abren los splits
vim.opt.splitbelow = true    -- split horizontal abre ABAJO
vim.opt.splitright = true    -- split vertical abre DERECHA

-- Tamaños preferidos
vim.opt.winwidth = 30        -- anchura mínima de ventana
vim.opt.winminwidth = 5      -- anchura mínima absoluta
vim.opt.winheight = 15       -- altura mínima de ventana
vim.opt.winminheight = 3     -- altura mínima absoluta
vim.opt.equalalways = true   -- igualar al crear/cerrar ventanas
```

---

### 10. Combinar Splits con Text Objects

```text
Ctrl-w v            → split vertical
Ctrl-w j o Ctrl-w l → navegar entre ventanas

Los comandos de edición (d, c, y, text objects) funcionan
igual en cualquier ventana. Las ventanas son solo vistas.
```

---

## 💡 Resumen Visual

```text
┌─────────────────────────────────────────────────────┐
│ SPLITS Y VENTANAS                                     │
│                                                       │
│ :sp / :vs        → split horizontal / vertical        │
│ Ctrl-w s / v     → split horizontal / vertical        │
│ Ctrl-w h/j/k/l   → navegar entre ventanas             │
│ Ctrl-w =         → igualar tamaño de ventanas         │
│ Ctrl-w q         → cerrar ventana                     │
│ :only            → solo esta ventana                  │
│                                                     │
│ :resize {n}      → altura exacta                     │
│ :vertical resize {n} → anchura exacta                │
│ Ctrl-w + - > <   → redimensionar incremental          │
│ Ctrl-w r / R     → rotar ventanas                     │
│ Ctrl-w H J K L   → mover al borde                     │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Creo splits horizontales (`:sp`) y verticales (`:vs`)
- [ ] Navego entre ventanas con `Ctrl-w hjkl`
- [ ] Igualo tamaño de ventanas con `Ctrl-w =`
- [ ] Cierro ventanas con `Ctrl-w q` y `:only`
- [ ] Redimensiono con `:resize` y `:vertical resize`
- [ ] Muevo ventanas de posición con `Ctrl-w H/J/K/L`
- [ ] Configuré `splitbelow` y `splitright`
- [ ] Tengo mappings para `Ctrl-hjkl` → navegación de splits

---

## 🎮 Ejercicio Rápido

```text
1. Abre Vim con un archivo cualquiera
2. :sp              → split horizontal
3. :vs              → split vertical en la ventana inferior
4. Ctrl-w =         → igualar tamaños
5. Ctrl-w hjkl      → navegar entre las 3 ventanas
6. Ctrl-w + + +     → aumentar altura
7. Ctrl-w > > >     → aumentar anchura
8. :only            → volver a una sola ventana
```

---

## ➡️ Siguiente

[03 - Navegación entre Ventanas](03-navegacion-ventanas.md)
