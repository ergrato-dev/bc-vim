# 🎯 Proyecto Semana 04: Configura tu Workspace de Proyecto

## 📋 Descripción

Configurarás un "workspace de proyecto" completo en Vim/Neovim con splits, navegación entre ventanas, gestión de buffers y pestañas. Implementarás mappings personalizados y documentarás tu configuración.

---

## 🎯 Objetivos

Al completar este proyecto, habrás demostrado que puedes:

- ✅ Organizar un proyecto en splits con layout profesional
- ✅ Configurar mappings para navegación fluida entre splits (Ctrl-hjkl)
- ✅ Implementar navegación de buffers con `<leader>bn` y `<leader>bp`
- ✅ Usar pestañas para separar contextos (código, docs, terminal)
- ✅ Abrir y usar netrw como explorador lateral
- ✅ Documentar tu configuración y flujo de trabajo

---

## 📦 Requisitos Funcionales

### RF-01: Workspace Base (30%)

Abre 3 archivos en un layout organizado:

```text
┌───────────────────────┬───────────────────────┐
│ src/main.lua          │ test/main_spec.lua    │
│ (código principal)    │ (tests)               │
├───────────────────────┴───────────────────────┤
│ README.md / documentación                     │
└───────────────────────────────────────────────┘
```

### RF-02: Mappings de Navegación (25%)

Implementa en tu `init.lua`:

| Mapping | Acción | Modo |
|---------|--------|------|
| `Ctrl-h` | Ir a split izquierdo | Normal |
| `Ctrl-j` | Ir a split inferior | Normal |
| `Ctrl-k` | Ir a split superior | Normal |
| `Ctrl-l` | Ir a split derecho | Normal |
| `<leader>bn` | Buffer siguiente | Normal |
| `<leader>bp` | Buffer anterior | Normal |
| `<leader>bd` | Eliminar buffer | Normal |

### RF-03: Mappings de Redimensión (15%)

Implementa:

| Mapping | Acción |
|---------|--------|
| `Ctrl-Up` | Aumentar altura 2 líneas |
| `Ctrl-Down` | Disminuir altura 2 líneas |
| `Ctrl-Right` | Aumentar anchura 2 columnas |
| `Ctrl-Left` | Disminuir anchura 2 columnas |
| `<leader>=` | Igualar tamaño de ventanas |

### RF-04: Pestañas y Netrw (15%)

- Crea una pestaña adicional con `:help` abierto
- Abre netrw en split lateral (`:Lex 25`)
- Configura netrw con estilo árbol (`vim.g.netrw_liststyle = 3`)

### RF-05: Documentación (15%)

Crea un archivo `workspace-config.md` documentando:

```markdown
# Configuración de Workspace - Semana 04

## Mappings implementados
| Mapping | Acción | ¿Por qué? |
|---------|--------|-----------|
| ... | ... | ... |

## Flujo de trabajo diario
1. Abro el proyecto con: ...
2. Organizo splits: ...
3. Navego entre archivos: ...

## Sesión guardada
Comando para restaurar mi workspace: ...
```

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md                  # Este archivo
├── starter/
│   └── ejemplo-workspace.lua  # Configuración de ejemplo para los mappings
└── (tu entregable)
    └── workspace-config.md    # Documentación de tu configuración
```

---

## 📝 Instrucciones

### Paso 1: Crear un Proyecto de Prueba

```bash
mkdir -p ~/proyecto-semana04/{src,test}
cat > ~/proyecto-semana04/src/main.lua << 'EOF'
-- Módulo principal
local M = {}

function M.sumar(a, b)
    return a + b
end

function M.restar(a, b)
    return a - b
end

return M
EOF

cat > ~/proyecto-semana04/test/main_spec.lua << 'EOF'
-- Tests del módulo principal
local main = require("src.main")

describe("main", function()
    it("suma correctamente", function()
        assert.equals(5, main.sumar(2, 3))
    end)
end)
EOF

cat > ~/proyecto-semana04/README.md << 'EOF'
# Proyecto Semana 04

Workspace de prueba para el bootcamp Vim.

## Estructura
- src/ → Código fuente
- test/ → Tests
EOF
```

### Paso 2: Configurar Mappings

Añade o verifica los mappings en `~/.config/nvim/init.lua`:

```lua
-- Navegación entre splits
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Split izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Split inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Split superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Split derecho" })

-- Navegación de buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Buffer siguiente" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Eliminar buffer" })

-- Redimensionar ventanas
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Más alto" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Más bajo" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Más ancho" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Más estrecho" })

-- Igualar ventanas
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Igualar ventanas" })

-- Configuración de splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Configuración de netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3  -- estilo árbol
vim.g.netrw_winsize = 25
```

### Paso 3: Crear el Workspace

```bash
cd ~/proyecto-semana04
nvim src/main.lua
```

Dentro de Vim:
```text
:vs test/main_spec.lua      → código + tests lado a lado
Ctrl-w j                    → ve abajo (si había split abajo)
:sp README.md               → documentación abajo
Ctrl-w =                    → igualar tamaños

:tabnew                     → nueva pestaña
:help windows.txt           → ayuda en pestaña 2

gt                          → vuelve a pestaña 1

:Lex 25                     → netrw lateral izquierda
Ctrl-h                      → ve a netrw
Ctrl-l                      → vuelve al código
```

### Paso 4: Guardar Sesión (Opcional)

```text
:mksession ~/proyecto-semana04/.session.vim

Para restaurar después:
nvim -S ~/proyecto-semana04/.session.vim
```

### Paso 5: Documentar

Crea `~/workspace-config.md` con la documentación de tu configuración.

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Workspace base** (30%) | |
| Layout con 3 archivos en splits organizados | 30 |
| **Mappings de navegación** (25%) | |
| Ctrl-hjkl funcionales | 15 |
| leader bn/bp/bd funcionales | 10 |
| **Mappings de redimensión** (15%) | |
| Ctrl-flechas y leader-= funcionales | 15 |
| **Pestañas y netrw** (15%) | |
| Pestaña adicional con :help | 5 |
| netrw configurado (árbol, sin banner) | 10 |
| **Documentación** (15%) | |
| workspace-config.md con mappings y flujo | 15 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Buffers](../../1-teoria/01-buffers.md)
- [Teoría: Ventanas y Splits](../../1-teoria/02-ventanas-splits.md)
- [Teoría: Navegación entre Ventanas](../../1-teoria/03-navegacion-ventanas.md)
- [Teoría: Pestañas](../../1-teoria/04-pestanas.md)
- [Teoría: netrw y :help](../../1-teoria/05-netrw-y-help.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 04](../README.md)
