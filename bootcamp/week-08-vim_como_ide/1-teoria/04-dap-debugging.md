# 🐛 Debugging con nvim-dap

## 🎯 Objetivos

- Entender DAP (Debug Adapter Protocol)
- Configurar nvim-dap para Python y otros lenguajes
- Poner breakpoints, inspeccionar variables y ejecutar paso a paso
- Usar nvim-dap-ui para una interfaz visual de debugging

---

## 📋 Contenido

### 1. ¿Qué es DAP?

**Debug Adapter Protocol** es el equivalente de LSP pero para debugging. Un adaptador de debug (debugpy, codelldb, etc.) se comunica con Neovim mediante DAP.

```text
┌──────────────┐         ┌──────────────────┐
│ Neovim       │   DAP   │ Debug Adapter    │
│ (nvim-dap)   │◄───────►│ debugpy (Python) │
│              │         │ lldb-vscode (C)  │
│ UI:          │         │ vscode-js (JS)   │
│ • breakpoints│         │                  │
│ • variables  │         │ Controla:        │
│ • stack      │         │ • ejecución      │
│ • watch      │         │ • breakpoints    │
│ • REPL       │         │ • variables      │
└──────────────┘         └──────────────────┘
```

---

### 2. Instalación

```lua
-- lua/plugins/dap.lua
return {
  -- Core
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")

      -- Python (debugpy)
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
          pythonPath = function()
            return vim.fn.exepath("python3") or "python3"
          end,
        },
      }

      -- TypeScript/JavaScript (vscode-js-debug)
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
        },
      }

      -- Lua (local-lua-debugger-vscode)
      dap.adapters["local-lua"] = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/extension/debugAdapter.js" },
      }
    end,
  },

  -- UI visual
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Instalar adaptadores vía mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = { "python", "js" },
    },
  },
}
```

---

### 3. Keymaps de Debugging

```lua
-- lua/core/keymaps.lua o en config de nvim-dap
local dap = require("dap")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint condicional" })

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue / Start" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })

vim.keymap.set("n", "<leader>dr", dap.repl_open, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })

vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle UI" })

-- Evaluar bajo cursor
vim.keymap.set("n", "<leader>de", function()
  dap.ui.widgets.hover()
end, { desc = "Evaluar expresión" })

vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").preview()
end, { desc = "Preview (hover)" })
```

---

### 4. Flujo de Debugging

```text
1. Poner breakpoint: <leader>db sobre una línea
2. Iniciar debug: <leader>dc (DAP Continue)
   → se abre DAP UI con:
     • Variables locales y globales
     • Stack de llamadas
     • Breakpoints
     • Watch expressions
3. Ejecución se detiene en el breakpoint
4. Navegar:
   <leader>do → step over (siguiente línea)
   <leader>di → step into (entrar en función)
   <leader>dO → step out (salir de función)
5. Inspeccionar:
   <leader>de → hover sobre variable
   DAP UI → ver todas las variables
6. Continuar: <leader>dc o <leader>dc para detener
```

---

### 5. Debugging Remoto (Python)

```lua
dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Attach remote",
    host = "localhost",
    port = 5678,
  },
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    env = { PYTHONPATH = "${workspaceFolder}/src" },
    console = "integratedTerminal",
  },
}
```

---

### 6. Virtual Text para Debugging

```lua
-- Mostrar valores de variables en línea mientras debuggeas
local dap = require("dap")

dap.listeners.after.event_stopped["virtual_text"] = function()
  local frame = dap.session().current_frame
  if frame then
    vim.api.nvim_buf_clear_namespace(0, 99, 0, -1)
    for _, scope in pairs(frame.scopes) do
      if scope.variables then
        for _, var in pairs(scope.variables) do
          local line = var.line
          if line and var.value then
            vim.api.nvim_buf_set_extmark(0, 99, line - 1, 0, {
              virt_text = { { "→ " .. var.name .. " = " .. var.value, "Comment" } },
            })
          end
        end
      end
    end
  end
end
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ DEBUGGING CON NVIM-DAP                                    │
│                                                           │
│ CONFIGURAR:                                               │
│   dap.adapters.{lang} → debug adapter                   │
│   dap.configurations.{lang} → launch configs            │
│                                                           │
│ KEYMAPS:                                                  │
│   <leader>db → toggle breakpoint                        │
│   <leader>dc → continue / start                         │
│   <leader>do → step over                                │
│   <leader>di → step into                                │
│   <leader>dO → step out                                 │
│   <leader>du → toggle DAP UI                            │
│                                                           │
│ DAP UI:                                                   │
│   • Variables (locales y globales)                       │
│   • Stack de llamadas                                    │
│   • Breakpoints                                          │
│   • Watch expressions                                    │
│   • Consola REPL                                          │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] nvim-dap instalado con al menos 2 adaptadores
- [ ] nvim-dap-ui configurado y funcional
- [ ] Puedo poner breakpoints con `<leader>db`
- [ ] Puedo iniciar debug con `<leader>dc`
- [ ] Navego con step over/into/out
- [ ] Inspecciono variables en DAP UI

---

## 🎮 Ejercicio Rápido

```python
# Crea ~/test-debug.py
def sumar(a, b):
    result = a + b
    return result

x = 10
y = 20
z = sumar(x, y)
print(f"Resultado: {z}")
```

```text
1. <leader>db en la línea "result = a + b"
2. <leader>dc → inicia debugging
3. En DAP UI, expande "Locals" → ve a, b
4. <leader>do → ejecuta la línea, ve result
5. <leader>dc → continúa hasta el final
```

---

## ➡️ Siguiente

[05 - Terminal y Snippets](05-terminal-y-snippets.md)
