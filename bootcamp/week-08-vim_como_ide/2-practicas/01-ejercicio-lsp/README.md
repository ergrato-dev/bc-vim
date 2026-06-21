# 🔌 Ejercicio 01: LSP y Mason

## 🎯 Objetivo

Instalar language servers con mason.nvim y configurar nvim-lspconfig para diagnósticos y navegación.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Agregar mason y lspconfig

En `lua/plugins/lsp.lua`:

```lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "pyright" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- (capabilities requiere nvim-cmp, saltar si no está instalado aún)

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        },
      })

      lspconfig.pyright.setup({ capabilities = capabilities })
    end,
  },
}
```

### Paso 2: Instalar Servidores

```text
:Lazy sync
:Mason               → abre UI
Buscar e instalar: lua_ls, pyright (con i)
```

---

## 🎮 Ejercicios

### Ejercicio A: Verificar LSP Activo

```text
1. Abre init.lua
2. :LspInfo           → debe mostrar lua_ls conectado
3. Verifica que aparece "LSP: lua_ls [ready]"
```

### Ejercicio B: Diagnósticos

```text
1. En init.lua, escribe: print(undefined_var)
2. Debe aparecer un warning/error (subrayado/virtual text)
3. :lua vim.diagnostic.get(0) → ver todos los diagnósticos
4. Corrige el error: print("ok")
5. El diagnóstico debe desaparecer
```

### Ejercicio C: Hover (Documentación)

```text
1. Coloca cursor sobre: vim.keymap.set
2. K                  → debe mostrar ventana con documentación
3. Verifica que describe los parámetros de keymap.set
```

### Ejercicio D: Go-to-Definition

```text
1. Coloca cursor sobre: require("lazy")
2. gd                 → salta a la definición de lazy.nvim
3. Ctrl-o             → vuelve a init.lua
```

### Ejercicio E: Code Actions

```text
1. En init.lua, escribe: local x = 1 (sin usar x)
2. Ve a esa línea
3. <leader>ca         → debe sugerir "remove unused variable"
4. Selecciona la acción → la línea se elimina
```

### Ejercicio F: Diagnósticos en Python

```bash
cat > ~/test-lsp.py << 'EOF'
def suma(a, b)
    return a + b

resultado = suma(10, 20)
print(resultado)
EOF
nvim ~/test-lsp.py
```

```text
1. pyright debe marcar error: falta ':' en def
2. [d → siguiente error
3. Corrige: def suma(a, b):
4. El error desaparece
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿:LspInfo muestra servidores conectados? | | |
| ¿Diagnósticos aparecen en tiempo real? | | |
| ¿K muestra documentación? | | |
| ¿gd salta a definición? | | |
| ¿[d/]d navega errores? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Autocompletado →](../02-ejercicio-cmp/README.md)
