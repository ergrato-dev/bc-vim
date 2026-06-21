# 📑 Ejercicio 03: Tab Workflow

## 🎯 Objetivo

Usar pestañas como "workspaces" para organizar contextos de trabajo diferentes.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Usa los mismos archivos de los ejercicios anteriores o crea algunos nuevos con `:e`.

---

## 🎮 Ejercicios

### Ejercicio A: Crear y Navegar Pestañas

```text
1. Abre Vim con un archivo
2. :tabnew                    → nueva pestaña vacía
3. :e ~/vim-split-1.md        → abre archivo en esta pestaña
4. :tabnew ~/vim-split-2.md   → nueva pestaña con archivo 2
5. :tabnew ~/vim-split-3.md   → nueva pestaña con archivo 3

Tienes 4 pestañas (la inicial + 3 nuevas).

Navega:
6. gt                         → siguiente pestaña
7. gt                         → siguiente
8. gT                         → pestaña anterior
9. 3gt                        → ve directamente a la pestaña 3
10. 1gt                       → ve a la pestaña 1
```

### Ejercicio B: Organizar Workspaces por Contexto

```text
Borra todas las pestañas (:tabonly hasta que quede 1, luego :tabclose).
O reinicia Vim.

Crea 3 pestañas temáticas:

Tab 1 — "Código":
1. :e ~/vim-split-1.md
2. :sp ~/vim-split-2.md         → split horizontal
3. :vs ~/vim-split-3.md         → en la ventana inferior, split vertical

Tab 2 — "Documentación":
4. :tabnew README.md             → si no existe, créalo: :e ~/README.md
5. :sp CHANGELOG.md              → si no existe, créalo: :e ~/CHANGELOG.md

Tab 3 — "Terminal / Build":
6. :tabnew
7. :term                        → abre terminal integrado (Neovim)

Ahora tienes 3 contextos separados.
gt / gT → alterna entre código, docs y terminal.
```

### Ejercicio C: Mover Ventanas entre Pestañas

```text
1. Ve a Tab 1 ("Código")
2. En la ventana de la derecha: Ctrl-w T
   → esa ventana se mueve a su propia pestaña (nueva Tab)

3. :tabclose              → elimina la nueva pestaña
   → la ventana NO vuelve a Tab 1 (se pierde el split)

Para mover entre pestañas existentes necesitas plugins.
Por ahora, Ctrl-w T + reorganizar manualmente.
```

### Ejercicio D: Cerrar y Reordenar Pestañas

```text
1. :tabclose               → cierra pestaña actual
2. :tabonly                → cierra TODAS menos la actual

3. Crea 3 pestañas
4. :tabmove 0              → mueve pestaña actual al INICIO
5. :tabmove                → mueve pestaña actual al FINAL
6. :tabmove +1             → mueve 1 posición derecha
7. :tabmove -1             → mueve 1 posición izquierda
```

### Ejercicio E: Ejecutar en Todas las Pestañas

```text
1. :tabdo :pwd             → muestra directorio actual en cada pestaña
2. :tabdo %s/archivo/documento/g | update
   → sustituye "archivo" por "documento" en TODAS las pestañas
   → | update guarda después de cada sustitución (o usa :w)
```

### Ejercicio F: Guardar y Restaurar Sesión

```text
Crea un layout que te guste (2-3 pestañas con splits):

1. :mksession ~/vim-sesion-test.vim    → guarda la sesión

2. Cierra Vim: :qa!
3. Reabre la sesión: nvim -S ~/vim-sesion-test.vim

¿Se restauraron todas las pestañas, ventanas y buffers?
```

### Ejercicio G: Flujo de Desarrollo Completo

```text
Objetivo: Crear un workspace de desarrollo con:
- Código principal + tests (splits)
- Documentación (pestaña separada)
- Terminal (pestaña separada)
- netrw (pestaña o split)

1. Crea un directorio de proyecto:
   mkdir -p ~/proyecto-tab-test/src ~/proyecto-tab-test/test

2. Crea archivos:
   nvim ~/proyecto-tab-test/src/main.lua
   :e ~/proyecto-tab-test/test/main_spec.lua
   :e ~/proyecto-tab-test/README.md

3. Organiza en pestañas:
   Tab 1: src/main.lua (arriba) + test/main_spec.lua (abajo) [sp]
   Tab 2: README.md [solo]
   Tab 3: :term [terminal]

4. Guarda la sesión:
   :mksession ~/proyecto-tab-test/.session.vim
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Creaste y cerraste pestañas? | | |
| ¿Navegaste con gt/gT y {n}gt? | | |
| ¿Organizaste pestañas por contexto (no 1 archivo = 1 tab)? | | |
| ¿Moviste ventanas entre pestañas con Ctrl-w T? | | |
| ¿Guardaste y restauraste una sesión con :mksession? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: netrw y :help →](../04-ejercicio-netrw-help/README.md)
