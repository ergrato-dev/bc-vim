# 🖥️ Terminal Integrado y Snippets

## 🎯 Objetivos

- Usar el terminal integrado de Neovim para flujos de desarrollo
- Configurar atajos para abrir, cerrar y navegar el terminal
- Instalar y configurar LuaSnip como motor de snippets
- Crear snippets personalizados con tabstops y placeholders

---

## 📋 Contenido

### 1. Terminal Integrado en Neovim

Neovim tiene un terminal integrado como buffer nativo. No necesitas plugins.

**Comandos básicos**:
```text
:term              → terminal en split horizontal (actual)
:vert term         → terminal en split vertical
:tab term          → terminal en nueva pestaña
:below term        → terminal abajo
:above term        → terminal arriba
:botright term     → terminal abajo-derecha
```

**Modos en el terminal**:
```text
Terminal mode  → escribes comandos (como en cualquier terminal)
  i / a / ...  → entra a Terminal mode
  Ctrl-\ Ctrl-n → sale a Normal mode

Normal mode (en buffer de terminal):
  hjkl → mover cursor en la salida
  y    → copiar texto
  /    → buscar en la salida
```

---

### 2. Keymaps de Terminal

```lua
-- Abrir terminal
vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<CR>", { desc = "Terminal abajo" })
vim.keymap.set("n", "<leader>tv", "<cmd>vert botright terminal<CR>", { desc = "Terminal vertical" })

-- Salir de Terminal mode con Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir de Terminal mode" })

-- Navegar ventanas desde terminal (Normal mode)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Split izquierdo" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Split inferior" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Split superior" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Split derecho" })

-- Cerrar terminal
vim.keymap.set("t", "<leader>q", "<C-\\><C-n><cmd>close<CR>", { desc = "Cerrar terminal" })
```

**Automatizar terminal**:
```lua
-- Lanzar comando en terminal
vim.keymap.set("n", "<leader>tp", function()
  vim.cmd("botright split | terminal python3 %")
end, { desc = "Ejecutar Python" })

vim.keymap.set("n", "<leader>tn", function()
  vim.cmd("botright split | terminal node %")
end, { desc = "Ejecutar Node" })

-- Ejecutar tests
vim.keymap.set("n", "<leader>ttt", function()
  vim.cmd("botright split | terminal pytest " .. vim.fn.expand("%"))
end, { desc = "Ejecutar tests" })
```

---

### 3. Snippets con LuaSnip

LuaSnip es el motor de snippets para Neovim. Permite crear plantillas expandibles.

**Instalación**:

```lua
-- lua/plugins/lsp.lua (con nvim-cmp)
{
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },  -- snippets pre-hechos
  config = function()
    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- Cargar snippets de friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    -- Cargar snippets personalizados
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
  end,
}
```

---

### 4. Crear Snippets Personalizados

```lua
-- ~/.config/nvim/lua/snippets/all.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

return {
  -- JavaScript: console.log
  s("cl", {
    t("console.log("),
    i(1, "variable"),
    t(");"),
  }),

  -- Python: if __name__ == "__main__"
  s("ifmain", {
    t({ 'if __name__ == "__main__":', "\t" }),
    i(1, "main()"),
  }),

  -- HTML: anchor
  s("a", {
    t('<a href="'),
    i(1, "https://"),
    t('">'),
    i(2, "link"),
    t("</a>"),
  }),

  -- Lua: función
  s("func", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "args"),
    t({ ")", "\t" }),
    i(3, "-- body"),
    t({ "", "end" }),
  }),

  -- Markdown: código
  s("code", {
    c(1, {
      { t("```lua"), t({ "", "" }), i(2, "code"), t({ "", "```" }) },
      { t("```python"), t({ "", "" }), i(2, "code"), t({ "", "```" }) },
      { t("```javascript"), t({ "", "" }), i(2, "code"), t({ "", "```" }) },
      { t("```"), t({ "", "" }), i(2, "code"), t({ "", "```" }) },
    }),
  }),
}
```

---

### 5. Sintaxis de Snippets

```text
t("texto")        → texto literal
i({n}, "placeholder") → tabstop con placeholder
f(function, args) → función de transformación
c({n}, {opciones}) → choice (elegir entre opciones)
d({n}, function)  → nodo dinámico (contenido variable)

Ejemplo con función de transformación:
s("upper", {
  i(1, "texto"),
  t(" → "),
  f(function(args, snip)
    return args[1][1]:upper()
  end, { 1 }),
}),
→ "hola" se convierte en "hola → HOLA"
```

**Tabstops y placeholders**:
```text
i(1, "nombre")   → primer tabstop, placeholder "nombre"
i(2, "edad")     → segundo tabstop
i(0)             → tabstop final (cursor al terminar)

Al expandir el snippet:
1. Escribes en tabstop 1
2. Tab → saltas a tabstop 2
3. Tab → saltas a tabstop 0 (fin)
```

---

### 6. Flujo de Desarrollo Integrado

```text
┌─────────────────────────────────────────────────────────┐
│ FLUJO IDE COMPLETO                                        │
│                                                           │
│ 1. Escribir código                                       │
│    → Autocompletado con nvim-cmp                         │
│    → Snippets con LuaSnip                                │
│    → Diagnóstico en tiempo real del LSP                  │
│                                                           │
│ 2. Navegar                                               │
│    → gd a definición, gr a referencias                   │
│    → ]f / [f entre funciones (Treesitter)                │
│    → telescope para archivos/grep                        │
│                                                           │
│ 3. Refactorizar                                          │
│    → <leader>rn para rename                              │
│    → <leader>ca para code actions                        │
│    → Text objects Treesitter (daf, cif, vaf)             │
│                                                           │
│ 4. Ejecutar / Testear                                    │
│    → <leader>tp para ejecutar Python                     │
│    → <leader>ttt para tests                              │
│    → Terminal integrado para comandos                    │
│                                                           │
│ 5. Debuggear                                             │
│    → <leader>db breakpoint                               │
│    → <leader>dc start debugging                          │
│    → DAP UI para variables/watch/stack                   │
└─────────────────────────────────────────────────────────┘
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ TERMINAL + SNIPPETS                                       │
│                                                           │
│ TERMINAL:                                                 │
│   :term              → split horizontal                  │
│   <leader>tt         → terminal abajo                    │
│   Ctrl-\ Ctrl-n      → salir de Terminal mode            │
│   <leader>tp         → ejecutar Python (%)               │
│                                                           │
│ SNIPPETS:                                                 │
│   Expandir: escribe trigger + Tab (o Enter con cmp)      │
│   Navegar tabstops: Tab / S-Tab                          │
│   Crear: lua/snippets/{filetype}.lua                     │
│                                                           │
│ ELEMENTOS:                                                │
│   t("texto")         → texto literal                     │
│   i(n, "placeholder") → tabstop                           │
│   f(fn, {n})         → función de transformación         │
│   c(n, {opts})       → choice                            │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Terminal integrado funciona con `<leader>tt`
- [ ] Puedo salir de Terminal mode con Esc
- [ ] LuaSnip instalado con friendly-snippets
- [ ] Snippets pre-hechos funcionan (for, if, func)
- [ ] Creé al menos 3 snippets personalizados
- [ ] Navego tabstops con Tab/S-Tab

---

## 🎮 Ejercicio Rápido

```text
1. <leader>tt → abre terminal abajo
2. ls → prueba comandos
3. Esc → sale a Normal mode
4. y → copia texto de la salida
5. Ctrl-h → navega a split de código
6. En código, escribe: func + Ctrl-Space + Enter
   → debe expandir snippet de función

Snippets:
7. Crea un snippet para tu lenguaje favorito
8. Guárdalo en lua/snippets/{lang}.lua
9. Recarga con :luafile %
10. Prueba el snippet en un archivo
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
