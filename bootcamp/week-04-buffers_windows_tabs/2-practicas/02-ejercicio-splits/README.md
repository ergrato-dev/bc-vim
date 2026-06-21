# 🪟 Ejercicio 02: Split Navigation

## 🎯 Objetivo

Crear, navegar, redimensionar y gestionar ventanas divididas (splits) con fluidez.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear Archivos de Práctica

```bash
for i in $(seq 1 4); do
  echo "# Archivo $i" > ~/vim-split-$i.md
  echo "Línea 1 del archivo $i" >> ~/vim-split-$i.md
  echo "Línea 2 del archivo $i" >> ~/vim-split-$i.md
  echo "Línea 3 del archivo $i" >> ~/vim-split-$i.md
done
```

```bash
nvim ~/vim-split-1.md
```

---

## 🎮 Ejercicios

### Ejercicio A: Crear Splits

```text
1. :sp ~/vim-split-2.md     → split horizontal ARRIBA/ABAJO
   Ahora tienes 2 ventanas: arriba archivo1, abajo archivo2

2. Ctrl-w v                  → split vertical en la ventana ACTUAL
   :e ~/vim-split-3.md
   Ahora tienes 3 ventanas

3. Ctrl-w j                  → ve a la ventana inferior
4. :vs ~/vim-split-4.md     → split vertical (abre archivo4)
   Ahora tienes 4 ventanas (layout 2×2)

5. :only                    → cierra todas menos la actual
6. Ctrl-w =                 → si vuelves a abrir varias, iguala tamaños
```

### Ejercicio B: Navegar entre Ventanas

```text
Crea este layout 2×2:
┌──────────┬──────────┐
│ archivo1 │ archivo3 │
├──────────┼──────────┤
│ archivo2 │ archivo4 │
└──────────┴──────────┘

Comandos para crearlo:
nvim ~/vim-split-1.md
:sp ~/vim-split-2.md         → horizontal abajo
Ctrl-w v                     → ventana inferior se divide vertical
:e ~/vim-split-4.md
Ctrl-w k                     → ve arriba
Ctrl-w v                     → divide vertical
:e ~/vim-split-3.md

Ahora navega:
1. Ctrl-w h → izquierda
2. Ctrl-w j → abajo
3. Ctrl-w l → derecha
4. Ctrl-w k → arriba
5. Ctrl-w p → ventana anterior
6. Ctrl-w w → siguiente ventana (cíclico)
7. Ctrl-w t → primera ventana (top-left)
8. Ctrl-w b → última ventana (bottom-right)

Repite la secuencia de navegación 5 veces sin titubear.
```

### Ejercicio C: Redimensionar Ventanas

```text
Con el layout 2×2:

1. Ctrl-w =                → iguala todas (mismo tamaño)
2. Ctrl-w j                → ventana inferior
3. Ctrl-w +                → aumenta altura 1 línea
4. Ctrl-w + + +            → aumenta 3 líneas más
5. Ctrl-w -                → disminuye altura
6. Ctrl-w >                → aumenta anchura
7. Ctrl-w <                → disminuye anchura
8. Ctrl-w _                → maximizar altura
9. Ctrl-w |                → maximizar anchura
10. Ctrl-w =               → igualar de nuevo

Con comandos exactos:
11. :resize 20             → altura exacta de 20 líneas
12. :vertical resize 60    → anchura exacta de 60 columnas
13. :resize +5             → aumentar 5 líneas
14. :vertical resize -10   → disminuir 10 columnas
```

### Ejercicio D: Mover y Rotar Ventanas

```text
1. Ctrl-w r                → rotar ventanas (derecha/abajo)
   Observa cómo cambia la posición

2. Ctrl-w R                → rotar en dirección opuesta

3. Ctrl-w x                → intercambiar con siguiente ventana

4. Ctrl-w H                → mover ventana al borde IZQUIERDO
5. Ctrl-w J                → mover al borde INFERIOR
6. Ctrl-w K                → mover al borde SUPERIOR
7. Ctrl-w L                → mover al borde DERECHO

Prueba cada uno varias veces viendo cómo se reorganiza el layout.
```

### Ejercicio E: Misma Ventana, Múltiples Vistas

```text
1. :only                   → una sola ventana
2. :sp                     → split horizontal (MISMO buffer)
   
   Ahora tienes DOS VISTAS del mismo archivo.
   
3. En la ventana superior, ve al inicio: gg
4. Ctrl-w j                → ventana inferior
5. G                        → final del archivo
   
   Puedes ver inicio y final del mismo archivo simultáneamente.
   
6. :only                   → volver a una vista
```

### Ejercicio F: Cerrar Ventanas

```text
1. Crea un layout con 3+ ventanas
2. Ctrl-w q                → cierra ventana actual
3. Ctrl-w c                → cierra ventana actual (alias)
4. :close                  → cierra ventana (cierra Vim si es la última)
5. :only                   → cierra TODAS menos la actual
```

### Ejercicio G: Configurar Spacemacs/Doom-style splits

```text
Agrega estos mappings a tu init.lua (si no los tienes):

-- Navegación con Ctrl-hjkl (sin Ctrl-w)
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Redimensionar con Ctrl+flechas
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")

-- Igualar ventanas
vim.keymap.set("n", "<leader>=", "<C-w>=")
```

Pruébalos navegando entre splits con `Ctrl-hjkl`. Debería ser inmediato.

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Creaste splits horizontales y verticales? | | |
| ¿Navegaste fluidamente con Ctrl-w hjkl? | | |
| ¿Redimensionaste ventanas con precisión? | | |
| ¿Moviste ventanas de posición con Ctrl-w H/J/K/L? | | |
| ¿Configuraste mappings Ctrl-hjkl para navegación? | | |
| ¿Entiendes que una ventana es una vista de un buffer? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Tab Workflow →](../03-ejercicio-pestanas/README.md)
