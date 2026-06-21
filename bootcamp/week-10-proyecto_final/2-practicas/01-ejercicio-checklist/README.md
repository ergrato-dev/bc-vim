# ✅ Ejercicio 01: Checklist Final de Configuración

## 🎯 Objetivo

Verificar que tu configuración cumple todos los requisitos del proyecto final.

**Duración estimada:** 1 hora

---

## 📝 Checklist de Verificación

### A. Estructura y Base

```text
☐ init.lua carga sin errores al abrir Neovim
☐ lazy.nvim bootstrap funciona (se clona automáticamente)
☐ lua/config/lazy.lua existe y es correcto
☐ lua/core/options.lua contiene todas las opciones
☐ lua/core/keymaps.lua contiene todos los mappings con desc
☐ lua/core/autocmds.lua contiene al menos 5 autocmds
☐ lua/plugins/ tiene archivos por categoría (ui, editing, lsp, git, tools)
☐ lazy-lock.json existe y está actualizado
```

### B. UI

```text
☐ Tema aplicado correctamente al iniciar
☐ lualine muestra modo, rama git, archivo, posición
☐ Neo-tree/nvim-tree abre con <leader>e
☐ Se pueden crear/eliminar/renombrar archivos desde neo-tree
☐ Íconos de archivo visibles (nerd font instalada)
```

### C. Navegación y Búsqueda

```text
☐ <leader>ff busca archivos con telescope
☐ <leader>fg busca texto con live_grep
☐ <leader>fb busca buffers abiertos
☐ Ctrl-hjkl navega entre splits
☐ <leader>bn / <leader>bp navega buffers
```

### D. Edición

```text
☐ gcc comenta/descomenta línea actual
☐ gc{motion} comenta bloque (ej: gc2j)
☐ ysiw" rodea palabra con comillas (surround)
☐ ds" elimina surround
☐ Autopairs cierra (), [], {}, "" automáticamente
```

### E. LSP y Autocompletado

```text
☐ :LspInfo muestra al menos 1 servidor conectado
☐ Diagnósticos visibles (virtual text o gutter)
☐ K muestra documentación (hover)
☐ gd salta a definición
☐ gr muestra referencias
☐ <leader>rn renombra símbolo
☐ [d / ]d navega errores
☐ Ctrl-Space abre menú de autocompletado
☐ 4 fuentes de cmp: LSP, buffer, path, snippets
☐ Tab / S-Tab navegan el menú de completado
```

### F. Git

```text
☐ gitsigns muestra │ en el gutter en archivos modificados
☐ ]h / [h navega hunks
☐ <leader>gb muestra blame de línea
☐ :Git abre status de git (si fugitive instalado)
```

### G. Treesitter

```text
☐ :TSModuleInfo muestra parsers instalados
☐ daf elimina función completa
☐ cif cambia cuerpo de función
☐ ]f / [f navega entre funciones
☐ :InspectTree funciona
```

### H. Extras (bonus)

```text
☐ DAP configurado para debuggear
☐ Terminal integrado con <leader>tt
☐ Snippets personalizados (al menos 5)
☐ which-key muestra menú al presionar <leader>
☐ Tiempo de inicio < 200ms (verificar con :Lazy profile)
☐ Sesiones se guardan/restauran
```

---

## 🔧 Correcciones Rápidas

### Si algo no funciona:

```text
1. :Lazy sync            → reinstalar/actualizar plugins
2. :Lazy profile          → ver si plugins cargan
3. :messages              → ver errores al iniciar
4. :checkhealth           → diagnóstico general
5. :checkhealth provider  → python, node, ruby
6. :checkhealth lsp       → estado de LSP
```

### Errores comunes:

```text
"LSP not found"          → :MasonInstall {server}
"No icons in neo-tree"   → instalar Nerd Font
"cmp no autocompleta"    → verificar fuentes en cmp.setup
"which-key no aparece"   → verificar delay < timeoutlen
"telescope no encuentra" → verificar ripgrep instalado
```

---

## 📊 Autoevaluación

| Categoría | Ítems OK | Total | % |
|-----------|----------|-------|---|
| Estructura | | 9 | |
| UI | | 5 | |
| Navegación | | 5 | |
| Edición | | 5 | |
| LSP/CMP | | 11 | |
| Git | | 5 | |
| Treesitter | | 5 | |
| Extras | | 6 | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: README y Screenshots →](../02-ejercicio-readme/README.md)
