# 🏃 Ejercicio 02: Movimiento sin Flechas

## 🎯 Objetivo

Practicar navegación en Vim usando exclusivamente el teclado, sin flechas ni ratón.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear Archivo de Práctica

Desde tu terminal, crea un archivo de práctica con 200 líneas:

```bash
# Genera 200 líneas de texto aleatorio
for i in $(seq 1 200); do
  echo "Línea $i: Esta es una línea de práctica para navegación en Vim. Palabras extra: manzana, pera, uva, naranja, kiwi, mango, papaya, coco."
done > ~/vim-practica-movimiento.txt
```

### Paso 2: Abrir en Vim

```bash
nvim ~/vim-practica-movimiento.txt
```

---

## 🎮 Ejercicios de Movimiento

Ejecuta cada secuencia 5 veces hasta que sea fluida.

### Ejercicio A: Movimiento básico (hjkl)

```text
1. Posiciónate en la línea 50 (50G)
2. Usa solo j y k para llegar a la línea 100
3. Regresa a la línea 50
4. En la línea 50, usa h y l para moverte al inicio y fin de la línea
```

**Check**: ¿Usaste las flechas? Si sí, repite. Si no, avanza.

### Ejercicio B: Navegación por palabras

```text
1. Ve a la línea 10 (10G)
2. Navega 5 palabras adelante con w (presiona w 5 veces)
3. Regresa 3 palabras atrás con b (presiona b 3 veces)
4. Salta al final de la palabra actual con e
5. Repite 3 veces en diferentes líneas
```

### Ejercicio C: Inicio y fin de línea

```text
1. Ve a cualquier línea
2. Presiona $ para ir al final
3. Presiona 0 para ir al inicio
4. Repite 10 veces en diferentes líneas
```

### Ejercicio D: Búsqueda en línea (f y t)

```text
1. Ve a una línea que contenga "manzana"
2. Presiona fm para saltar a la 'm' de manzana
3. Presiona ; para ir a la siguiente 'm' en la línea
4. Presiona , para regresar a la 'm' anterior
5. Prueba tp para saltar "hasta antes" de la siguiente 'p'
```

### Ejercicio E: Navegación de archivo

```text
1. gg → inicio del archivo
2. G → final del archivo
3. gg → inicio
4. 100G → línea 100
5. Ctrl-d → media pantalla abajo
6. Ctrl-u → media pantalla arriba
7. Ctrl-d Ctrl-d Ctrl-d → una pantalla y media abajo
8. Ctrl-u Ctrl-u → una pantalla arriba
```

### Ejercicio F: Búsqueda en archivo

```text
1. /naranja → busca "naranja"
2. n → siguiente
3. n → siguiente
4. n → siguiente
5. N → anterior
6. N → anterior
7. :noh → limpia el resaltado
```

### Ejercicio G: Combinado (el verdadero test)

```text
Secuencia de 10 pasos. Repite 3 veces:

1. gg          → inicio del archivo
2. 10j         → 10 líneas abajo
3. w w w       → 3 palabras adelante
4. f.          → salta al siguiente punto
5. $           → final de línea
6. 0           → inicio de línea
7. G           → final del archivo
8. 50G         → línea 50
9. /kiwi       → busca "kiwi"
10. n n n      → 3 ocurrencias adelante
```

---

## 📊 Autoevaluación

Después de completar los ejercicios, responde:

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste las flechas en algún momento? | | |
| ¿Tuviste que mirar el teclado para encontrar hjkl? | | |
| ¿Te perdiste en el archivo y no sabías dónde estabas? | | |
| ¿Pudiste completar el ejercicio G en menos de 1 minuto? | | |

**Objetivo**: 4 "Sí" en la última pregunta al final de la semana.

---

## 💡 Consejo

> Si te encuentras usando las flechas por reflejo, pega un post-it sobre ellas o desactívalas en tu configuración:
> ```lua
> vim.keymap.set("n", "<Up>", "<Nop>")
> vim.keymap.set("n", "<Down>", "<Nop>")
> vim.keymap.set("n", "<Left>", "<Nop>")
> vim.keymap.set("n", "<Right>", "<Nop>")
> ```

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Edición →](../03-ejercicio-edicion/README.md)
