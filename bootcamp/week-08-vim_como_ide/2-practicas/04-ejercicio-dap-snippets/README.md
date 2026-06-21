# 🐛 Ejercicio 04: DAP, Terminal y Snippets

## 🎯 Objetivo

Configurar nvim-dap para debugging, usar terminal integrado y crear snippets.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: DAP Básico

En `lua/plugins/dap.lua`:

```lua
return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")

      -- Python
      dap.adapters.python = {
        type = "executable",
        command = "python3",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
        },
      }

      -- Keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    end,
  },
}
```

```bash
pip install debugpy
:Lazy sync
```

### Paso 2: Terminal Keymaps

En `lua/core/keymaps.lua`:

```lua
-- Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<CR>", { desc = "Terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir Terminal" })
vim.keymap.set("n", "<leader>tp", "<cmd>botright split | terminal python3 %<CR>", { desc = "Ejecutar Python" })
```

### Paso 3: Snippets Personalizados

Crea `~/.config/nvim/lua/snippets/python.lua`:

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("ifmain", {
    t({ 'if __name__ == "__main__":', "\t" }),
    i(1, "main()"),
  }),
  s("def", {
    t("def "),
    i(1, "name"),
    t("("),
    i(2, "args"),
    t({ "):", "\t" }),
    i(3, "pass"),
  }),
}
```

---

## 🎮 Ejercicios

### Ejercicio A: Debugging Python

```bash
cat > ~/test-debug.py << 'EOF'
def calcular(a, b):
    resultado = a * b
    return resultado

x = 5
y = 3
z = calcular(x, y)
print(z)
EOF
nvim ~/test-debug.py
```

```text
1. <leader>db en "resultado = a * b"
2. <leader>dc → inicia debug
3. <leader>do → step over (ejecuta la línea)
4. <leader>do → siguiente línea
5. <leader>dc → continuar hasta el final
```

### Ejercicio B: Terminal

```text
1. <leader>tt → abre terminal abajo
2. python3 ~/test-debug.py → ejecuta
3. Esc → sale a Normal mode en terminal
4. y → copia parte de la salida
5. Ctrl-h → vuelve al código, p → pega
```

### Ejercicio C: Ejecutar Archivo Actual

```text
1. <leader>tp → ejecuta Python actual en terminal
2. Observa la salida
3. Esc + :close → cierra el terminal
```

### Ejercicio D: Probar Snippets

```text
1. Abre un .py: nvim ~/test-snippets.py
2. Escribe: ifmain + Ctrl-Space + Enter
   → expande plantilla if __name__ ...
3. Escribe: def + Ctrl-Space + Enter
   → expande plantilla de función
4. Tab → navega entre tabstops
```

### Ejercicio E: Crear tu Propio Snippet

```text
1. Crea snippet para tu lenguaje favorito
2. Guárdalo en lua/snippets/{lang}.lua
3. :luafile % → recargar
4. Prueba en un archivo de ese lenguaje
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Puedes poner breakpoints y debuggear? | | |
| ¿Terminal integrado funciona? | | |
| ¿Snippets pre-hechos se expanden? | | |
| ¿Creaste al menos 2 snippets personalizados? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
