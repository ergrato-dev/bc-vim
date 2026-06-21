# 🎯 Ejercicio 01: Drill f/t

## 🎯 Objetivo

Automatizar `f`, `t`, `F`, `T`, `;`, `,` para saltos de precisión en una línea.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear Archivo de Práctica

```bash
nvim ~/vim-practica-ft.txt
```

Copia este contenido (en Insert mode: `i`, pega, `Esc`):

```text
Línea 01: abc.def.ghi.jkl.mno.pqr.stu.vwx.yz
Línea 02: function(a, b, c, d, e, f, g, h)
Línea 03: const name = "value"; let x = data;
Línea 04: path/to/file/location/config.json
Línea 05: <div class="container"><p>texto</p></div>
Línea 06: { key1: val1, key2: val2, key3: val3, key4: val4 }
Línea 07: result = calculate(a, b, c) + extra(x, y)
Línea 08: import { readFile, writeFile, appendFile } from "fs";
Línea 09: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
Línea 10: user.created_at = "2024-01-15T10:30:00Z";
```

Guarda con `:w`.

---

## 🎮 Ejercicios

### Ejercicio A: f básico (salto a carácter)

```text
1. Ve a Línea 01 (1G)
2. f. → salta al primer punto
3. ;  → siguiente punto
4. ;  → siguiente punto
5. ;  → sigue saltando hasta el final
6. ,  → punto anterior
7. ,  → punto anterior
8. Repite con diferentes letras: f g, f m, f y
```

### Ejercicio B: t (hasta antes de)

```text
1. Ve a Línea 01, inicio (0)
2. t. → hasta ANTES del primer punto (cursor en 'c' de abc)
3. ;  → hasta antes del siguiente punto
4. ;  → continúa
5. Compara: f. vs t. en la misma posición inicial
   f. te deja SOBRE el punto
   t. te deja ANTES del punto
```

### Ejercicio C: F y T (hacia atrás)

```text
1. Ve a Línea 01, final ($)
2. F. → busca punto hacia atrás (último punto)
3. ;  → punto anterior (más atrás)
4. ;  → continúa hacia atrás
5. T. → hasta después del punto hacia atrás
```

### Ejercicio D: Combinar f/t con operadores

```text
1. Ve a Línea 02: "function(a, b, c, d, e, f, g, h)"
2. Coloca el cursor al inicio (0)
3. df, → elimina hasta la primera coma INCLUSIVE
   Resultado: " b, c, d, e, f, g, h)"
4. u   → deshacer
5. dt, → elimina hasta ANTES de la primera coma
   Resultado: ", b, c, d, e, f, g, h)"
6. u   → deshacer
7. Ahora cambia: cf, hola Esc → cambia desde cursor hasta ',' por "hola"
8. u   → deshacer
9. ct, hola Esc → cambia hasta ANTES de ','
```

### Ejercicio E: Edición quirúrgica

```text
1. Ve a Línea 03: "const name = "value"; let x = data;"
2. Coloca cursor al inicio (0)
3. f" → salta a la primera comilla
4. ci" → cambia contenido de comillas
5. Escribe: result Esc
   Resultado: const name = "result"; let x = data;
6. Ahora ve al segundo string:
   f" → primera comilla de "result"
   ;  → segunda comilla de "result"
   ;  → primera comilla de "data"
   ci" → cambia "data" por "output" Esc
```

### Ejercicio F: Navegación con f y saltos

```text
1. Ve a Línea 05 (HTML): "<div class="container"><p>texto</p></div>"
2. Con f y ; solamente, navega a cada < y > de la línea
3. Siempre desde el inicio: f< ; ; ; y cuenta cuántas etiquetas hay
4. Repite el mismo recorrido con F< desde el final de la línea

Pregunta: ¿Cuántas etiquetas tiene esta línea?
Respuesta: 6 (<div, class=..., </p>, </div> son atributos, los tags son <div>, <p>, </p>, </div> = 4 tags)
```

### Ejercicio G: Drill cronometrado

```text
Haz esta secuencia 5 veces seguidas:
1. gg          → inicio del archivo
2. f/          → salta al primer /
3. ;           → siguiente /
4. ;           → siguiente /
5. cf/         → cambia hasta /
6. escribe: new
7. Esc         → vuelve a Normal
8. u           → deshacer
9. f"          → salta a comilla
10. ci"holaEsc → cambia contenido de comillas
11. u          → deshacer

Objetivo: hacer la secuencia entera en menos de 30 segundos.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Diferencias f (sobre) de t (antes) sin pensarlo? | | |
| ¿Usas ; y , para repetir sin reescribir el carácter? | | |
| ¿Combinas d/c/y con f/t automáticamente? | | |
| ¿Prefieres f/t sobre mantener hjkl para saltos largos en una línea? | | |
| ¿Usaste F y T para buscar hacia atrás? | | |

---

## 💡 Consejo

> **f y t son tus comandos más usados después de hjkl.** Si no los estás usando constantemente al final de esta semana, vuelve a este drill.

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Text Objects →](../02-ejercicio-text-objects/README.md)
