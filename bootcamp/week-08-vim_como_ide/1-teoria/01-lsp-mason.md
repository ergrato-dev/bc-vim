# 🔌 LSP y mason.nvim

## 🎯 Objetivos

- Entender qué es LSP y cómo convierte Neovim en un IDE
- Instalar y gestionar language servers con mason.nvim
- Configurar nvim-lspconfig para múltiples lenguajes
- Usar las features del LSP: diagnóstico, hover, go-to-def, rename

---

## 📋 Contenido

### 1. ¿Qué es LSP?

**Language Server Protocol** es un estándar creado por Microsoft que separa el editor del análisis de código. El editor (cliente LSP) se comunica con un servidor externo que entiende el lenguaje.

```text
┌──────────────┐         ┌──────────────────┐
│ Neovim       │  LSP    │ Language Server  │
│ (cliente)    │◄───────►│ pyright, lua_ls, │
│              │  JSON   │ ts_ls, rust_     │
│ Te muestra:  │  RPC    │ analyzer...      │
│ • errores    │         │                  │
│ • hover      │         │ Analiza código:  │
│ • go-to-def  │         │ • AST            │
│ • rename     │         │ • tipos          │
│ • code action│         │ • errores        │
└──────────────┘         └──────────────────┘
```

**Lo que LSP te da**:
```text
Diagnóstico       → errores y warnings mientras escribes
Hover             → documentación al pasar sobre un símbolo (K)
Go-to-definition  → saltar a definición (gd)
References        → encontrar todos los usos (gr)
Rename            → renombrar símbolo en todo el proyecto
Code actions      → refactorizaciones automáticas
Format            → formatear código
Signature help    → firma de función mientras escribes
```

---

### 2. mason.nvim — Gestor de Language Servers

Instala LSP servers, linters y formatters como si fueran paquetes.

**Instalación**:

```lua
-- lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
}
```

**Uso**:
```text
:Mason              → UI para instalar/desinstalar servers
:MasonInstall pyright  → instala pyright (Python)
:MasonInstall lua_ls   → instala lua-language-server
```

**Servidores populares**:
```text
pyright           → Python
lua_ls            → Lua
ts_ls             → TypeScript/JavaScript
rust_analyzer     → Rust
gopls             → Go
clangd            → C/C++
jdtls             → Java
omnisharp         → C#
html, cssls, jsonls → Web
```

---

### 3. nvim-lspconfig — Configuración de LSP

Conecta Neovim con los language servers instalados.

```lua
-- lua/plugins/lsp.lua
{
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- bridge mason↔lspconfig
  },
  config = function()
    -- Integrar mason con lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "ts_ls" },
    })

    -- Configurar LSP servers
    local lspconfig = require("lspconfig")

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    -- Python
    lspconfig.pyright.setup({})

    -- TypeScript
    lspconfig.ts_ls.setup({})

    -- Autoformatear al guardar
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.lua", "*.py", "*.ts", "*.js" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
```

---

### 4. Keymaps de LSP

```lua
-- lua/config/lsp.lua o en autocmd LspAttach
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, desc = "LSP" }
  local map = vim.keymap.set

  -- Navegación
  map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Ir a definición" }))
  map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Referencias" }))
  map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Implementación" }))
  map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Declaración" }))

  -- Información
  map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Documentación" }))
  map("n", "<leader>k", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Firma" }))

  -- Acciones
  map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Renombrar" }))
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
  map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "Formatear" }))

  -- Diagnóstico
  map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Error anterior" }))
  map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Error siguiente" }))
  map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Mostrar error" }))
  map("n", "<leader>q", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Lista de errores" }))
end

-- Conectar on_attach a cada server
lspconfig.lua_ls.setup({ on_attach = on_attach })
lspconfig.pyright.setup({ on_attach = on_attach })
```

---

### 5. Diagnóstico Visual

```lua
-- Mostrar diagnósticos en línea (virtual text)
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- Íconos para signcolumn
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
```

---

### 6. Código sin LSP (Fallback)

```lua
-- Si no hay LSP conectado, K usa keywordprg
vim.keymap.set("n", "K", function()
  if vim.lsp.buf.server_ready() then
    vim.lsp.buf.hover()
  else
    vim.cmd("normal! K")
  end
end, { desc = "Documentación (LSP o help)" })
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────────┐
│ LSP EN NEOVIM                                             │
│                                                           │
│ INSTALAR:                                                 │
│   mason.nvim → :Mason → instalar servers                 │
│   mason-lspconfig → ensure_installed automático          │
│                                                           │
│ CONFIGURAR:                                               │
│   nvim-lspconfig → lspconfig.{lang}.setup({})            │
│   on_attach → keymaps LSP por buffer                     │
│                                                           │
│ KEYMAPS:                                                  │
│   gd    → go-to-definition                                │
│   gr    → references                                      │
│   K     → hover (documentación)                           │
│   <leader>rn → rename                                     │
│   <leader>ca → code action                                │
│   [d/]d → navegar errores                                 │
│   <leader>f  → format                                     │
└─────────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] mason.nvim instalado y funcionando
- [ ] Al menos 3 LSP servers instalados (lua_ls, pyright, ts_ls)
- [ ] Keymaps LSP configurados con on_attach
- [ ] `gd` salta a definición
- [ ] `K` muestra documentación
- [ ] `[d` / `]d` navega errores
- [ ] Diagnóstico visual con virtual text y signos

---

## 🎮 Ejercicio Rápido

```text
1. :Mason → instala lua_ls y pyright
2. Abre init.lua → mueve cursor sobre vim.keymap.set
3. K → debe mostrar documentación de keymap.set
4. gd → debe saltar a definición (si está en el mismo archivo)
5. Escribe código con error: print(undefined_var)
6. [d → salta al error
7. <leader>e → muestra detalle del error
```

---

## ➡️ Siguiente

[02 - Autocompletado con nvim-cmp](02-autocompletado-cmp.md)
