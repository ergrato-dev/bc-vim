# 🔧 Ejercicio 04: Editar y Combinar Macros

## 🎯 Objetivo

Editar macros sin regrabarlas, combinarlas con registros y crear flujos de trabajo completos.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Usa los archivos de los ejercicios anteriores o crea uno nuevo:

```bash
cat > ~/vim-practica-combinado.txt << 'EOF'
usuario_1 email_1 ciudad_1 activo_1
usuario_2 email_2 ciudad_2 activo_2
usuario_3 email_3 ciudad_3 activo_3
usuario_4 email_4 ciudad_4 activo_4
usuario_5 email_5 ciudad_5 activo_5
EOF

nvim ~/vim-practica-combinado.txt
```

---

## 🎮 Ejercicios

### Ejercicio A: Inspeccionar y Editar una Macro

```text
1. Graba una macro 'x' (la haremos imperfecta a propósito):
   q x
   0 f _ s .  Esc f _ s .  Esc f _ s .  Esc
   q (falta f _ s . para el 4to campo)

2. :reg x              → inspecciona la macro
   Ves: "x   0f_s.^[f_s.^[f_s.^["
   (^[ es <Esc>)

3. "x p                → pega la macro en el buffer
   Ves: 0f_s.f_s.f_s.

4. Edítala para incluir el 4to campo:
   Añade: f_s. al final
   Línea editada: 0f_s.f_s.f_s.f_s.

5. "x y $              → copia la línea editada al registro 'x'
6. dd                  → elimina la línea
7. @x                  → prueba la macro corregida
```

### Ejercicio B: Append a una Macro

```text
1. Graba macro 'p' con la parte inicial:
   q p
   I "  Esc            → comilla al inicio
   q

2. Ahora añade más comandos con append:
   q P                 → P mayúscula = APPEND a 'p'
   f _ s ": "  Esc    → reemplaza '_' por '": "'
   q

3. q P                 → sigue añadiendo
   f _ s ":"  Esc     → más reemplazos
   A "  Esc            → comilla al final
   j                   → avanzar
   q

4. :reg p              → verifica la macro completa
5. @p                  → prueba
```

### Ejercicio C: Combinar Registros y Macros

```text
1. Guarda fragmentos de texto en registros:
   "a yy              → guarda línea como plantilla en 'a'
   "b yy              → guarda otra en 'b'

2. Graba macro que usa registros como "variables":
   q t
   "a P                → pega registro 'a' antes del cursor
   j                   → siguiente línea
   "b P                → pega registro 'b' antes
   j                   → siguiente línea
   q

3. @t @t @t            → pega plantillas alternadas
```

### Ejercicio D: Asignar Macros con :let

```text
1. :let @z = '0f_s.:f_s.": '   → asigna macro directamente
   (donde  se inserta con Ctrl-v Esc)

O mejor:
2. :let @z = "0f_s.:\<Esc>f_s.\": "

3. @z                  → prueba la macro
4. :reg z              → verifica

5. :let @y = @z        → copia macro 'z' a 'y'
6. :let @y .= 'j'      → añade 'j' al final de 'y'
7. @y                  → prueba (ahora avanza al final)
```

### Ejercicio E: Guardar Macros para Reutilizar

```text
1. Inspecciona una macro útil:
   :reg q

2. Crea (o abre) un archivo de macros:
   nvim ~/.config/nvim/macros.vim

3. Escribe:
   " Macro para formatear líneas separadas por '_'
   let @z = '0f_s.:\<Esc>f_s.":\<Esc>f_s.":\<Esc>f_s.":\<Esc>'

4. En init.lua, source el archivo:
   vim.cmd.source(vim.fn.stdpath("config") .. "/macros.vim")

5. Reinicia Vim → @z debería funcionar
```

### Ejercicio F: Pipeline de Macros

```text
En ~/vim-practica-combinado.txt:

Crea 3 macros en secuencia:
q a → limpia (elimina espacios extra)
q b → formatea (cambia '_' por '": "')
q c → finaliza (añade comillas y corchetes)

Flujo:
1. :%normal @a         → limpia todo
2. :%normal @b         → formatea todo
3. :%normal @c         → finaliza todo

Resultado: pipeline de transformación completo.
```

### Ejercicio G: Drill — Ciclo Completo

```text
En un archivo nuevo con 10 líneas de datos:

1. Graba macro 'w' (30 segundos)
2. Pruébala con @w    (5 segundos)
3. Si falla, edítala: "w p, editar, "w y $, dd (60 segundos)
4. Aplica a todo: :%normal @w (2 segundos)
5. u                  (deshacer todo)
6. Aplica recursiva:  (30 segundos)

Tiempo total: ~2 minutos para un ciclo completo
de grabar → probar → corregir → aplicar.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Editaste una macro pegándola, corrigiendo y recargando? | | |
| ¿Usaste q{R mayúscula} para append a una macro? | | |
| ¿Asignaste macros con :let @x = '...'? | | |
| ¿Combinaste registros y macros en un mismo flujo? | | |
| ¿Guardaste macros en un archivo para reutilizar? | | |
| ¿Implementaste un pipeline de macros (@a → @b → @c)? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
