# 📍 Ejercicio 03: Marcas

## 🎯 Objetivo

Usar marcas locales y globales para navegación eficiente dentro y entre archivos.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear Archivo de Práctica

```bash
for i in $(seq 1 200); do
  echo "Línea $i: función_${i}() { return ${i}; }"
done > ~/vim-practica-marcas.txt
```

Esto genera 200 líneas con funciones numeradas.

```bash
nvim ~/vim-practica-marcas.txt
```

---

## 🎮 Ejercicios

### Ejercicio A: Crear marcas locales

```text
1. Ve a línea 1 (gg)              → m a  (marca 'a' en inicio)
2. Ve a línea 100 (100G)           → m b  (marca 'b' en línea 100)
3. Ve a línea 200 (G)              → m c  (marca 'c' en final)
4. Ve a línea 50 (50G)             → m d  (marca 'd' en línea 50)

5. Verifica tus marcas:
   :marks a b c d
```

### Ejercicio B: Saltar a marcas con ' y `

```text
1. 'a       → salta al inicio de la línea de marca 'a' (línea 1, col 0)
2. 'b       → salta a línea 100
3. 'c       → salta a línea 200
4. `a       → salta a posición EXACTA de la marca 'a'

¿Diferencia?
La marca 'a' la creaste en línea 1, columna 0 (gg te lleva ahí).
Si hubieras creado la marca en medio de una palabra,
' a te llevaría al inicio de la línea, `a a la posición exacta.
```

### Ejercicio C: Ir y volver (' ')

```text
1. Ve a línea 1 (gg)              → estás en inicio
2. Ve a línea 100 (100G)           → estás en línea 100
3. Presiona '' (dos comillas)      → vuelves a línea 1
4. Presiona '' otra vez            → vuelves a línea 100

'' es el "undo" del movimiento. Alternas entre dos posiciones.
```

### Ejercicio D: Marcas para refactorización

```text
1. Ve a línea 10                   → m f  (función de ejemplo)
2. Ve a línea 50                   → m t  (target de refactor)
3. Ve a línea 150                  → m r  (referencia)

Ahora puedes saltar entre las 3:
'f → 't → 'r → 'f → 't → ...

Cada vez que saltas, '' te lleva de vuelta al punto anterior.
```

### Ejercicio E: Eliminar entre marca y cursor

```text
1. Ve a línea 10                   → m a
2. Ve a línea 50
3. d 'a                            → elimina desde línea 50 hasta línea 10

El orden NO importa: d 'a siempre elimina desde el cursor hasta 
la línea de la marca 'a', en cualquier dirección.

4. u                               → deshacer
5. `a                              → vuelve a posición exacta de 'a'
```

### Ejercicio F: Marcas globales (entre archivos)

```text
1. En vim-practica-marcas.txt:
   Ve a línea 42                   → m A  (marca GLOBAL A)

2. Abre otro archivo:
   :e ~/vim-practica-dot.md

3. 'A                              → salta a vim-practica-marcas.txt, línea 42
4. ''                              → vuelve a vim-practica-dot.md

Las marcas globales persisten ENTRE archivos y ENTRE sesiones.
```

### Ejercicio G: Gestionar marcas

```text
1. :marks                          → lista todas las marcas activas
2. :delm a                         → elimina la marca 'a'
3. :delm a-d                       → elimina marcas 'a' a 'd'
4. :marks                          → verifica que se eliminaron

5. Crea nuevas marcas y usa :delm! → elimina todas las locales (a-z)
6. :marks                          → solo deberían quedar las globales y automáticas
```

### Ejercicio H: Combinado con Visual mode

```text
1. mA                               → marca en línea 10
2. Ve a línea 100
3. V 'a                             → selecciona visualmente desde línea 100 hasta 10
4. d                                → elimina el bloque

5. u                                → deshacer
6. V 'a                             → selecciona de nuevo
7. y                                → copia el bloque
8. G                                → final del archivo
9. p                                → pega el bloque al final
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Creaste marcas locales (ma, mb) y saltaste a ellas con 'a, 'b? | | |
| ¿Creaste al menos una marca global (mA) y saltaste desde otro archivo? | | |
| ¿Usaste '' para ir y volver entre dos posiciones? | | |
| ¿Combinaste marcas con operadores (d 'a, V 'b, y 'c)? | | |
| ¿Listaste tus marcas con :marks? | | |

---

## 💡 Consejos

> Usa letras nemotécnicas: mF para funciones, mC para config, mT para tests, mI para imports.

> Las marcas globales (A-Z) sobreviven entre sesiones si tienes shada configurado. Son tu "barra de favoritos" en Vim.

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Sustituciones y Shell →](../04-ejercicio-sustituciones/README.md)
