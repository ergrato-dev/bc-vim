# 📂 Ejercicio 04: netrw y :help

## 🎯 Objetivo

Usar netrw para navegar y gestionar archivos, y dominar el sistema `:help` para consultas rápidas.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Preparación

Crea un directorio con estructura de proyecto:

```bash
mkdir -p ~/proyecto-netrw-test/{src,test,docs,assets}
touch ~/proyecto-netrw-test/src/main.lua
touch ~/proyecto-netrw-test/src/utils.lua
touch ~/proyecto-netrw-test/test/main_spec.lua
touch ~/proyecto-netrw-test/docs/README.md
touch ~/proyecto-netrw-test/docs/API.md
touch ~/proyecto-netrw-test/assets/logo.txt
```

---

## 🎮 Ejercicios — PARTE 1: netrw

### Ejercicio A: Abrir y Navegar netrw

```text
1. nvim                          → abre Vim sin archivo
2. :Explore ~/proyecto-netrw-test → abre netrw en el proyecto
3. Navega con hjkl:
   j → línea abajo
   k → línea arriba
   Enter sobre src/ → entra al directorio
   - → sube al directorio padre
   Enter sobre main.lua → abre el archivo

4. Cambia estilos de listado:
   i → thin → long → wide → tree
   Repite i varias veces hasta encontrar el que más te guste.
```

### Ejercicio B: Crear, Renombrar y Eliminar Archivos

```text
Desde netrw en ~/proyecto-netrw-test:

1. %                            → crear archivo
   Escribe: config.lua → Enter
   → el archivo se crea y se abre

2. :Explore .                  → vuelve a netrw
3. d                            → crear directorio
   Escribe: lib → Enter
   → el directorio se crea

4. Navega a config.lua con el cursor
5. R                            → renombrar
   Escribe: settings.lua → Enter
   → el archivo se renombra

6. Crea un archivo temporal: % → temp.txt → Enter
7. Vuelve a netrw, cursor sobre temp.txt
8. D                            → eliminar
   Confirma: y → Enter
   → temp.txt se elimina
```

### Ejercicio C: Copiar y Mover Archivos

```text
Desde netrw:

1. Navega a src/main.lua
2. mf                           → marca el archivo
3. Navega a lib/ (el directorio destino)
4. mt                           → marca como target
5. mc                           → copia (pide confirmación: y)
   → main.lua se copia a lib/

Ahora mueve:
6. Navega a lib/main.lua
7. mf                           → marca
8. Navega a test/
9. mt                           → target
10. mm                          → mueve (confirma: y)
    → main.lua ahora está en test/

Limpia:
11. Mueve test/main.lua de vuelta a src/ (mf → navega a src → mt → mm)
```

### Ejercicio D: Abrir Archivos en Splits desde netrw

```text
Desde netrw, coloca el cursor sobre un archivo:

1. Enter                       → abre en la ventana actual
2. Ctrl-w h                    → abre en split horizontal
3. Ctrl-w v                    → abre en split vertical
4. p                           → vista previa (se cierra al mover el cursor)
5. gn                          → abre en split horizontal (nueva ventana)
```

### Ejercicio E: Abrir netrw en Split Lateral

```text
1. :Lex 30                     → abre netrw a la izquierda (ancho 30)
   Ahora tienes explorador a la izquierda, editor a la derecha.

2. Navega en netrw (izquierda), Enter sobre archivos para abrirlos
   Los archivos se abren en la ventana derecha.

3. Ctrl-w h / Ctrl-w l         → alterna entre netrw y el editor
```

---

## 🎮 Ejercicios — PARTE 2: :help

### Ejercicio F: Sistema de Ayuda Básico

```text
1. :help                        → índice general
   Navega con j/k
   Ctrl-] sobre un tag         → sigue el enlace
   Ctrl-t / Ctrl-o             → vuelve atrás

2. :help :split                 → ayuda sobre el comando :split
3. :help CTRL-W                 → ayuda sobre Ctrl-w (prefijo de ventanas)
4. :help windows.txt            → documentación completa de ventanas
```

### Ejercicio G: Buscar en la Ayuda

```text
1. :help 'number'              → ayuda sobre la opción number (con comillas)
2. :help 'hidden'              → ayuda sobre la opción hidden
3. :help i_CTRL-R              → Ctrl-R en Insert mode
4. :help v_o                   → 'o' en Visual mode
5. :help :g                    → comando :g (global)
6. :help :s                    → comando :s (sustitución)
7. :help netrw                 → documentación de netrw
8. :help netrw-D               → netrw: comando D (delete)
```

### Ejercicio H: Helpgrep — Buscar en Toda la Documentación

```text
1. :helpgrep text object      → busca "text object" en TODA la documentación
2. :cwindow                   → abre la ventana de resultados (quickfix)
3. Navega resultados con j/k y Enter para saltar a cada uno
4. :cclose                    → cierra ventana de resultados
5. :cnext / :cprev            → navegar resultados sin la ventana abierta
```

### Ejercicio I: Ayuda Contextual

```text
1. Abre tu init.lua
2. Coloca el cursor sobre "vim.opt.number"
3. :help 'number'             → busca la opción number
4. Coloca el cursor sobre "vim.keymap.set"
5. :help vim.keymap.set       → documentación de la API Lua

O con el atajo K (en Normal mode):
6. Coloca el cursor sobre una palabra como "number"
7. K                          → abre :help para esa palabra
```

### Ejercicio J: Drill Combinado

```text
En menos de 2 minutos:
1. :help windows.txt          → abre ayuda de ventanas
2. /resize                    → busca "resize" en el documento
3. Ctrl-] sobre el tag de resize
4. Lee la sección
5. Ctrl-t                     → vuelve
6. :q                         → cierra ayuda
7. :Explore                   → abre netrw
8. d                          → crea directorio "temporal"
9. %                          → crea archivo "nota.txt" dentro
10. R                         → renombra a "notas.txt"
11. D                         → elimina "notas.txt"
12. D                         → elimina directorio "temporal"
13. :Lex 25                   → netrw lateral
14. Ctrl-w =                  → igualar ventanas
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Navegaste netrw con soltura (Enter, -, i para estilos)? | | |
| ¿Creaste, renombraste y eliminaste archivos desde netrw? | | |
| ¿Copiaste/moviste archivos con mf/mt/mc/mm? | | |
| ¿Usaste :help con tags específicos? | | |
| ¿Navegaste enlaces en :help con Ctrl-] y Ctrl-t? | | |
| ¿Usaste :helpgrep para buscar en la documentación? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
