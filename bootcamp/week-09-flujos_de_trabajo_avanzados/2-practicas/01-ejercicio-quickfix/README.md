# 🔍 Ejercicio 01: Quickfix y vimgrep

## 🎯 Objetivo

Buscar en múltiples archivos con :vimgrep, navegar resultados con quickfix y ejecutar operaciones en lote.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

Trabaja en el directorio del bootcamp o en cualquier proyecto con múltiples archivos.

---

## 🎮 Ejercicios

### Ejercicio A: Primer vimgrep

```text
1. cd al directorio del bootcamp
2. :vimgrep /teoria/gj **/*.md     → busca "teoria" en todos los .md
3. :copen                           → abre quickfix
4. Observa la lista de resultados
5. :cnext → salta al primero
6. :cnext → salta al segundo
7. :cprev → vuelve al primero
```

### Ejercicio B: Navegar Quickfix Eficientemente

```text
Configura mappings en init.lua:
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Siguiente quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Anterior quickfix" })
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", { desc = "Abrir quickfix" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Cerrar quickfix" })

1. :vimgrep /function/gj **/*.lua
2. <leader>co → abre quickfix
3. ]q ]q ]q [q ]q → navega fluidamente
```

### Ejercicio C: Búsqueda con Palabra Completa

```text
1. :vimgrep /\<buffer\>/gj **/*.md
   → busca "buffer" como palabra completa
   → no encuentra "buffers"

2. :vimgrep /buffer/gj **/*.md
   → busca "buffer" en cualquier parte
   → encuentra "buffers", "bufferline", etc.
```

### Ejercicio D: Rango de Archivos

```text
1. :vimgrep /TODO/gj **/*.{lua,md,vim}
   → busca TODO en .lua, .md, .vim

2. :vimgrep /semana/gj bootcamp/*/README.md
   → busca "semana" en READMEs de cada semana
```

### Ejercicio E: :cdo — Operar en Resultados

```text
1. :vimgrep /NUEVO/gj bootcamp/**/*.md
   (busca marcadores de contenido nuevo)
2. :copen → revisa cuántos hay

3. :cdo s/NUEVO/COMPLETADO/ | update
   → reemplaza en cada resultado y guarda

4. (u → deshacer si no quieres el cambio)
```

### Ejercicio F: Filtrar Quickfix

```text
1. :vimgrep /function/gj **/*.lua
2. :Cfilter spec    → filtra resultados que contienen "spec"
   (requiere :packadd cfilter o plugin nvim-bqf)
```

### Ejercicio G: Configurar ripgrep

```lua
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m"
end
```

```text
1. :grep sema bootcamp/**/*.md
   → ripgrep busca "sema" (más rápido que vimgrep)
2. :copen → resultados en quickfix
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Busqué en múltiples archivos con :vimgrep? | | |
| ¿Navegué quickfix con :cnext/:cprev? | | |
| ¿Usé :cdo para operar en resultados? | | |
| ¿Configuré ripgrep como grepprg? | | |
| ¿Uso ]q/[q para navegar quickfix? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Arglist y Batch →](../02-ejercicio-arglist/README.md)
