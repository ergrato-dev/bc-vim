# 🎬 Ejercicio 02: Macro Simple

## 🎯 Objetivo

Grabar y ejecutar macros para automatizar ediciones repetitivas. Al final de este ejercicio, grabarás macros sin pensar.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear Archivos de Práctica

```bash
cat > ~/vim-practica-macro.csv << 'EOF'
producto,precio,cantidad,disponible
laptop,1200,5,si
monitor,450,12,no
teclado,85,30,si
mouse,45,45,si
auriculares,95,20,no
webcam,75,15,si
hub,35,50,no
disco,110,8,si
memoria,65,10,no
cable,12,60,si
EOF

nvim ~/vim-practica-macro.csv
```

---

## 🎮 Ejercicios

### Ejercicio A: Tu Primera Macro

```text
Objetivo: Formatear cada línea CSV con corchetes y formato legible.

1. Ve a la línea 2 (primera de datos): j
2. q a                  → inicia grabación en registro 'a'
3. 0                    → inicio de línea
4. I - [  Esc           → añade "- [" al inicio
5. f ,                  → primera coma
6. s :  Esc             → reemplaza coma por ": "
7. f ,                  → siguiente coma
8. s :  Esc             → reemplaza por ": "
9. f ,                  → siguiente coma
10. s :  Esc            → mismo reemplazo
11. A ]  Esc            → añade " ]" al final
12. j                   → siguiente línea
13. q                   → DETENER GRABACIÓN

14. @ a                 → ejecuta en línea 3
15. @ @                 → ejecuta en línea 4
16. @ @ @ @ @ @ @       → ejecuta en líneas 5-11

Resultado:
producto,precio,cantidad,disponible
- [laptop: 1200: 5: si]
- [monitor: 450: 12: no]
- [teclado: 85: 30: si]
...
```

### Ejercicio B: Macro con Búsqueda

```text
Objetivo: Cambiar "si" por "✓" y "no" por "✗" en todas las líneas.

1. q s                  → grabar en 's'
2. /si Enter            → busca "si"
3. c w ✓ Esc            → cambia palabra por "✓"
4. n                    → siguiente ocurrencia
5. q                    → detener

6. @ s                  → ejecuta
7. @ @ @ @ ...           → repite para todas (fallará en "no")

Ahora para "no":
8. q n                  → grabar en 'n'
9. /no Enter            → busca "no"  
10. c w ✗ Esc           → cambia por "✗"
11. n                   → siguiente
12. q                   → detener

13. @ n @ @ @ @         → cambia todos los "no"
```

### Ejercicio C: Macro con Número de Repeticiones

```text
Objetivo: Ejecutar macro N veces con {N}@q.

1. Abre ~/vim-practica-macro.csv (recargar :e!)
2. Graba macro 'm' que:
   q m
   I |  Esc
   f , s |  Esc
   f , s |  Esc
   f , s |  Esc
   A |  Esc
   j
   q

3. Posiciónate en línea 2
4. 9 @ m                → ejecuta 9 VECES DE GOLPE

¡Todas las líneas formateadas en un solo comando!
```

### Ejercicio D: Corrección Rápida de Macro

```text
Si tu macro no funciona bien en algún caso:

1. :reg m              → inspecciona el contenido
2. "m p                → pega la macro en el buffer
3. Edítala como texto:
   Corrige errores, añade comandos faltantes
4. "m y $              → copia la macro editada de vuelta
5. dd                  → elimina la línea del buffer
6. @m                  → prueba de nuevo
```

### Ejercicio E: Macro de Transformación de Texto

```text
Objetivo: Crear una macro que convierta una línea en formato 
"clave: valor" a JSON.

nuevo archivo:
nvim ~/vim-practica-json.txt

Contenido:
nombre Ana
edad 30
ciudad Madrid
activo true
rol admin

1. q j                → grabar en 'j'
2. 0                  → inicio
3. i "  Esc           → inserta comilla al inicio
4. e                  → fin de palabra (nombre)
5. a ": "  Esc       → añade ": " después
6. w                  → siguiente palabra (Ana)
7. i "  Esc           → inserta comilla antes
8. A "  Esc           → añade comilla al final
9. A ,  Esc           → añade coma al final
10. j                 → siguiente línea
11. q                 → detener

12. @ j @ @ @ @       → ejecuta en las 5 líneas

Resultado:
"nombre": "Ana",
"edad": "30",
"ciudad": "Madrid",
"activo": "true",
"rol": "admin",
```

### Ejercicio F: Drill Cronometrado

```text
1. Abre ~/vim-practica-macro.csv (limpio)
2. Graba macro 't' en <30 segundos:
   - Añade "| " al inicio
   - Reemplaza todas las comas con " | "
   - Añade " |" al final
   - Baja a siguiente línea
3. Ejecuta en todas las líneas restantes en <10 segundos
   (usa 9@t)
4. :%s/,\s*/ | /g   → comparativa: ¿es más rápido :%s o macro?
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Grabaste macros con q{reg} ... q? | | |
| ¿Ejecutaste macros con @{reg} y @@? | | |
| ¿Ejecutaste N veces con {N}@{reg}? | | |
| ¿Incluiste posicionamiento (0, ^) al inicio? | | |
| ¿Inspeccionaste macros con :reg? | | |
| ¿Corregiste una macro pegándola y editándola? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Macro en Bloque →](../03-ejercicio-macros-batch/README.md)
