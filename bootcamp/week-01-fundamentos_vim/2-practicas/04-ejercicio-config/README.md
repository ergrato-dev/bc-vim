# ⚙️ Ejercicio 04: Primera Configuración

## 🎯 Objetivo

Crear tu primer archivo `init.lua` funcional para Neovim con opciones básicas y mappings personalizados.

**Duración estimada:** 30 minutos

---

## 📝 Instrucciones

### Paso 1: Crear el Directorio de Configuración

```bash
mkdir -p ~/.config/nvim
```

### Paso 2: Abrir init.lua

```bash
nvim ~/.config/nvim/init.lua
```

Este archivo está vacío. Vamos a poblarlo.

---

### Paso 3: Copiar la Configuración Base

Copia el contenido del archivo [`starter/init.lua`](starter/init.lua) línea por línea en tu `~/.config/nvim/init.lua`.

**No copies y pegues todo el archivo de una vez.** Escribe cada opción manualmente para desarrollar memoria muscular y entender qué hace cada línea.

### Paso 4: Verificar que Funciona

1. Cierra Neovim y vuelve a abrirlo:
   ```bash
   nvim ~/vim-practica-edicion.md
   ```

2. Verifica que:
   - [ ] Ves números de línea relativos (2, 1, 0, 1, 2...)
   - [ ] La línea actual está resaltada (cursorline)
   - [ ] No hay error rojo al abrir
   - [ ] Si presionas espacio, esperas, y luego w → guarda

3. Si hay errores:
   ```bash
   # Abre Neovim y ejecuta:
   :messages
   # Busca líneas en rojo que indiquen error
   ```

### Paso 5: Personalizar

Modifica estas opciones según tu preferencia:

```lua
-- Cambia el ancho de tabulación (2 o 4)
vim.opt.tabstop = 4      -- ¿prefieres 2?
vim.opt.shiftwidth = 4   -- ¿prefieres 2?

-- Cambia el escape de Insert mode
vim.keymap.set("i", "jk", "<Esc>")  -- ¿prefieres "jj" o "kj"?

-- Agrega tu propio mapping
-- Ejemplo: ¿quieres que <leader>s guarde?
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Guardar" })
```

### Paso 6: Agregar Opciones Extra (Opcional)

Explora estas opciones y agrega las que te gusten:

```lua
-- Mostrar caracteres invisibles (tabs, espacios)
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Colorear la columna 80 (límite de línea)
vim.opt.colorcolumn = "80"

-- Número mínimo de líneas de contexto al hacer scroll
vim.opt.scrolloff = 8

-- Desactivar el sonido de campana (beep)
vim.opt.errorbells = false

-- Título de la ventana del terminal
vim.opt.title = true

-- Mostrar comandos parciales en la barra de estado
vim.opt.showcmd = true
```

---

## ✅ Checklist de Verificación

- [ ] init.lua existe en `~/.config/nvim/init.lua`
- [ ] Números de línea relativos funcionan
- [ ] Tabulación configurada a mi gusto
- [ ] Leader key es `<space>`
- [ ] Esc con `jk` o `jj` funciona
- [ ] `<leader>w` guarda el archivo
- [ ] La configuración carga sin errores

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
