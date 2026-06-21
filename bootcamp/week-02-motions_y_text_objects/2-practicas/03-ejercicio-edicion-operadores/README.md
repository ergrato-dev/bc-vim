# 🔧 Ejercicio 03: Edición con Operadores + Text Objects

## 🎯 Objetivo

Corregir un archivo mal formateado usando exclusivamente operadores combinados con text objects y motions. Prohibido editar carácter por carácter.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear el Archivo a Corregir

```bash
nvim ~/vim-practica-corregir.md
```

Copia este contenido (en Insert mode):

````markdown
# Documento Para Corregir

## Sección 1: Introduccion

este documento contiene varios errores que debes corregir
usando solo operadores + textObjects. no uses el raton
ni edicion caracter por caracter.

## Sección 2: Lista deTareas

- [] comprar pan  leche y huevos
- [ ] revisar el correo electronico
- [] llamar al medico para la cita
-[ ] preparar presentacion para el lunes
-[x] terminar informe mensual
-[ ] actualizar el software

## Seccion3: Datos de Contacto

Nombre: Ana Garcia
Email: ana@example .com
Telefono: 555 - 1234
Direccion: Calle Principal123,  Ciudad

##  sección   4: Notas

Esta sección tiene    espacios   multiples
y    tabs   por   todas      partes

Algunas palabras en MAYUSCULAS que deberian ir en minusculas
y OTRAS en minusculas que DEBERIAN ir en mayusculas.

"Texto con comillas mal" cerradas "y otras comillas normales"

(function() {
console.log("codigo mal indentado")
if(true){
return"sin espacios"
}
})()

## SECCION 5: Referencias

[Link roto](http:// ejemplo .com)
[Otro link]( https://ejemplo.org/pagina )
- Item sin link
* Item con asterisco en vez de guion
+ Item con plus en vez de guion
````

Guarda con `:w`.

### Paso 2: Reglas del Ejercicio

**PROHIBIDO**:
- Editar carácter por carácter (entrar a Insert mode y borrar con Backspace)
- Usar el ratón para seleccionar
- Usar las flechas para moverte

**OBLIGATORIO**:
- Usar text objects (`iw`, `i"`, `i(`, `i{`, `ip`)
- Usar motions (`w`, `b`, `f`, `t`, `/`, `%`)
- Usar operadores (`d`, `c`, `y`, `>`, `<`, `=`, `gu`, `gU`)
- Usar `.` para repetir cambios

---

## 🎮 Tareas de Corrección

### Tarea 1: Corregir formato de checkboxes

```text
Problema: Los checkboxes están mal formateados:
  - [] → falta espacio
  -[ ] → falta espacio después del guion
  - [ ] → formato correcto

Solución con frase Vim:
1. Ve a "- [] comprar..." 
2. Coloca cursor en la '[' 
3. i → Insert mode, añade espacio: " [ ]"
4. Esc
5. j → siguiente línea (ya está bien, siguiente)
6. j → "-[] llamar..." 
7. . → repite el cambio (añadir espacio)
8. j → "-[ ] preparar..."
9. Esto YA tiene espacio, pero veamos:
   El guion está pegado al corchete.
   Coloca cursor en '[', presiona i, espacio, Esc
   O mejor: ve al inicio de línea con 0, luego f[
   ciw (cambiar palabra) y escribe "- [" Esc
10. Continúa hasta corregir todos los checkboxes

Al final todas las líneas deben verse como:
- [ ] tarea
- [x] tarea completada
```

### Tarea 2: Corregir errores de puntuación y formato

```text
1. "Introduccion" → debe ser "Introducción"
   cursor en 'c' de "Introduccion", ciw, escribe "Introducción" Esc

2. "deTareas" → "de Tareas"
   cursor en 'T', i, espacio, Esc

3. "Seccion3" → "Sección 3"
   cursor en '3', i, espacio, Esc
   cursor en 'Seccion', ciw, "Sección" Esc

4. "  sección   4:" → "## Sección 4:"
   - Usa ciw para cambiar "sección" a "Sección"
   - Usa dw para eliminar palabra extra
   - Usa f4 para saltar a 4
   - Usa I (I mayúscula) para ir a inicio de línea e insertar "## "

5. "Ana Garcia" → "Ana García"
   fG → salta a 'G', ciw, "García" Esc

6. "ana@example .com" → "ana@example.com"
   f. → salta al punto antes de com
   dw → elimina el espacio + punto (depende de la posición)
   O: colócate en el espacio después de example, f<Space> desde example, x
   después f. → salta al punto antes de com
   diw → elimina el espacio que sigue al punto
   Mejor: colócate en el espacio antes de ".com", f<Space>, luego dtc 
   y escribe "."

7. "555 - 1234" → "555-1234"
   f- → salta al guion
   dt1 → elimina espacios y guion hasta antes del 1
   O: f- → x (borrar guion) → f<Space> → x → f<Space> → x
   Luego i → "-" → Esc
```

### Tarea 3: Corregir mayúsculas/minúsculas

```text
1. "MAYUSCULAS" → "mayúsculas"
   cursor en 'M', guiw (lowercase inner word)
   También puedes: gUiw para mayúsculas, g~iw para alternar

2. "DEBERIAN" → "DEBERÍAN"
   cursor en 'D', ciw, escribe "DEBERÍAN" Esc
   O simplemente añade la tilde: fE, a, "Í" (no, eso no funciona bien)
   Mejor: ciw y reescribe

3. "Otras" (después de DEBERIAN) → "otras"
   cursor en 'O', guiw

4. "SECCION" → "Sección"
   cursor en 'S', ciw, "Sección" Esc

5. Párrafo de "Esta sección tiene    espacios":
   Hay que normalizar espacios múltiples.
   Esto es avanzado, pero prueba:
   vip → selecciona el párrafo
   :'<,'>s/\s\+/ /g → sustituye espacios múltiples por uno solo
```

### Tarea 4: Corregir código mal indentado

```text
1. Ve al bloque:
   (function() {
   console.log("codigo mal indentado")
   if(true){
   return"sin espacios"
   }
   })()

2. Coloca el cursor en la '{' de function
3. =i{ → autoformatea el bloque

4. "return"sin espacios"" → añadir espacio después de return
   cursor en 'r' de return
   ciw → "return " Esc (o: f" → i → " " → Esc)

5. "sin espacios" → ci" → "con espacios" Esc
```

### Tarea 5: Corregir links y listas

```text
1. "[Link roto](http:// ejemplo .com)"
   Coloca cursor dentro de los ()
   ci( → cambia URL completa
   Escribe: "http://ejemplo.com" Esc

2. "[Otro link]( https://ejemplo.org/pagina )"
   ci( → escribe "https://ejemplo.org/pagina" Esc

3. "- Item sin link" y "* Item con asterisco" y "+ Item con plus"
   - Los guiones están bien para el formato normal
   - Para cambiar el asterisco: cursor en '*', r-
   - Para cambiar el plus: cursor en '+', r-
```

### Tarea 6: Limpieza final

```text
1. El documento debe estar formateado correctamente.
2. :w para guardar.
3. Revisa visualmente que no queden errores.

Comandos que debes haber usado en este ejercicio:
- ciw, ci(, ci"   (cambiar palabras, contenido de paréntesis, strings)
- diw, di(, di"   (eliminar palabras, contenido, strings)
- f{char}, t{char} (saltos de precisión)
- guiw, gUiw      (cambio de capitalización)
- =i{             (autoformateo)
- vip, dap, yap   (manipular párrafos)
- .               (repetición)
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Resolviste todas las tareas sin editar carácter por carácter? | | |
| ¿Usaste `.` para repetir cambios similares? | | |
| ¿Pensaste en "frases Vim" (verbo + sustantivo) antes de ejecutar? | | |
| ¿Te sentiste más rápido que en la Semana 1? | | |
| ¿Encontraste situaciones donde no sabías qué text object usar? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Búsqueda y Navegación →](../04-ejercicio-busqueda/README.md)
