# 💾 Ejercicio 03: Sesiones y Location List

## 🎯 Objetivo

Guardar y restaurar sesiones, usar location list para búsquedas por ventana.

**Duración estimada:** 45 minutos

---

## 🎮 Ejercicios

### Ejercicio A: Location List Básica

```text
1. Abre un archivo Lua con varias funciones
2. :lvimgrep /function/gj %
   → busca "function" solo en archivo actual (location)
3. :lopen
   → abre location list (NO quickfix)
4. :lnext → navega
5. :lclose

Compara con quickfix:
6. :vimgrep /function/gj %   → busca (quickfix global)
7. :copen → quickfix global
```

### Ejercicio B: Location List por Ventana

```text
1. Abre 2 archivos en splits
2. En ventana izquierda:
   :lvimgrep /function/gj %
   :lopen

3. En ventana derecha:
   :lvimgrep /return/gj %
   :lopen

Cada ventana tiene su propia location list.
Quickfix sería una sola lista global.
```

### Ejercicio C: Guardar Sesión

```text
1. Abre 3 archivos en splits
2. Abre 2 tabs con otros archivos
3. :mks! ~/test-session.vim
   → guarda TODO el layout

4. :qa!
   → cierra todo

5. nvim -S ~/test-session.vim
   → restaura splits, tabs, archivos y posición
```

### Ejercicio D: Auto-sesión

```lua
-- En lua/core/autocmds.lua:
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = augroup("Session", { clear = true }),
  callback = function()
    vim.cmd("mks! " .. vim.fn.stdpath("data") .. "/session.vim")
  end,
  desc = "Auto-guardar sesión",
})
```

```text
1. Recarga config (:Reload o :source)
2. Abre algunos archivos y organiza ventanas
3. :qa!
4. nvim → ¿se restauró?
```

### Ejercicio E: Session Options

```text
1. :set sessionoptions?  → ver opciones actuales
2. :set sessionoptions+=globals  → añadir variables globales
3. :set sessionoptions-=options   → quitar opciones globales
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usé :lvimgrep para location list? | | |
| ¿Diferencio quickfix (global) de location (ventana)? | | |
| ¿Guardé y restauré una sesión con :mksession? | | |
| ¿Configuré auto-sesión? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Fugitive Avanzado →](../04-ejercicio-fugitive/README.md)
