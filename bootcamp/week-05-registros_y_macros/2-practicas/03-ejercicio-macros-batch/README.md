# 🔁 Ejercicio 03: Macro en Bloque y Recursiva

## 🎯 Objetivo

Aplicar macros masivamente con `:normal`, `:global`, números y recursión.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Crear Archivos

```bash
# Archivo grande para batch
for i in $(seq 1 50); do
  echo "tarea_$i pendiente $(date +%s)"
done > ~/vim-practica-batch.txt

# Archivo con marcadores para recursión
cat > ~/vim-practica-recursivo.txt << 'EOF'
// FIXME: corregir validación
código normal aquí
// FIXME: optimizar consulta
más código normal
// FIXME: actualizar documentación
EOF

nvim ~/vim-practica-batch.txt
```

---

## 🎮 Ejercicios

### Ejercicio A: :normal @q (Batch en Todo el Archivo)

```text
En ~/vim-practica-batch.txt:

1. q b                → grabar (SIN j al final — para :normal)
2. I - [ ]  Esc      → añade checkbox al inicio
3. f _                → salta al primer '_'
4. s .  Esc          → reemplaza '_' por '.'
5. q                  → detener

6. :%normal @b        → ejecuta en TODAS las líneas

Observa: ¿se aplicó a todas? Debería ser instantáneo.

7. u                  → deshacer

Compara con versión CON j:
8. q c (con j)        → grabar macro CON j al final
9. :%normal @c        → solo procesa cada 2da línea (porque j avanza extra)
```

### Ejercicio B: :global con Macros

```text
En ~/vim-practica-batch.txt (después de u):

1. q d                → grabar macro para líneas específicas
2. I **  Esc          → añade negrita markdown
3. A **  Esc          → añade cierre negrita
4. q                  → detener (SIN j)

5. :g/pendiente/normal @d   → aplica macro SOLO a líneas con "pendiente"

6. :g/tarea_1/normal @d     → aplica SOLO a líneas con "tarea_1"
```

### Ejercicio C: Macro Recursiva

```text
En ~/vim-practica-batch.txt (limpio, recarga si es necesario):

1. q r                → grabar recursiva
2. 0                  → inicio
3. f p                → salta a 'p' de "pendiente"
4. c w HECHO Esc     → cambia "pendiente" por "HECHO"
5. j                  → siguiente línea
6. @ r                → RECURSIÓN (se llama a sí misma)
7. q                  → detener

8. gg j               → posiciona en primera línea de datos
9. @ r                → ejecuta → procesa TODAS las líneas del archivo

La macro se detiene sola cuando j falla al final del archivo.
```

### Ejercicio D: Macros con :g y Recursión Combinados

```text
En ~/vim-practica-recursivo.txt:

Objetivo: reemplazar todos los "FIXME" por "RESUELTO" y documentar la fecha.

1. q f                → grabar
2. / TODO Enter       → busca "TODO" o puedes buscar "FIXME"
   / FIXME Enter      → busca "FIXME"
3. c w RESUELTO Esc   → cambia la palabra
4. A  (2024-01-15) Esc → añade fecha
5. n                  → siguiente ocurrencia
6. @ f                → recursión
7. q                  → detener

8. gg                 → inicio
9. @ f                → procesa todos los FIXME automáticamente
```

### Ejercicio E: Macro con Incremento Numérico

```text
Crea un archivo de práctica:
bash -c 'for i in $(seq 1 20); do echo "item 0"; done' > ~/vim-practica-nums.txt
nvim ~/vim-practica-nums.txt

1. q n                → grabar
2. f 0                → salta al '0'
3. Ctrl-a              → incrementa (0 → 1)
4. j                  → siguiente línea
5. @ n                → recursión
6. q                  → detener

7. gg                 → inicio
8. @ n                → ejecuta

Resultado:
item 1
item 2
...
item 20
```

### Ejercicio F: Aplicar Macro a Rango de Líneas

```text
En ~/vim-practica-batch.txt:

1. Crea macro 's' que:
   q s
   I **  Esc A **  Esc
   q

2. Aplica a líneas 10-30:
   :10,30normal @s

3. Aplica de línea 5 hasta el final:
   :5,$normal @s

4. Aplica de marca 'a' hasta 'b':
   mA en línea 5, mB en línea 15
   :'a,'bnormal @s
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste :normal @q para aplicar a todo el archivo? | | |
| ¿Usaste :g/patrón/normal @q para líneas específicas? | | |
| ¿Creaste una macro recursiva (@reg al final)? | | |
| ¿Usaste Ctrl-a en una macro para incrementar números? | | |
| ¿Aplicaste macro a un rango de líneas? | | |
| ¿Entiendes la diferencia entre macro CON j y SIN j para :normal? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Editar y Combinar →](../04-ejercicio-edicion-macros/README.md)
