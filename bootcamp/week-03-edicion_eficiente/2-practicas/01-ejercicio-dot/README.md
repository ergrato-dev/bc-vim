# 🔁 Ejercicio 01: Dot Command Drill

## 🎯 Objetivo

Automatizar el uso de `.` para repetir cambios. Al final de este ejercicio, usarás `.` sin pensar.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Crear Archivo de Práctica

```bash
nvim ~/vim-practica-dot.md
```

Copia este contenido:

```markdown
# Lista de Tareas

## Tareas Pendientes
- [] comprar leche
- [] llamar al medico
- [] revisar correos
- [] preparar presentacion
- [] actualizar software
- [] escribir informe
- [] enviar factura
- [] archivar documentos
- [] hacer backup
- [] limpiar cache

## Notas
Estas notas contienen algunas palabras en MAYUSCULAS
que DEBERIAN ir en minusculas PARA mantener
consistencia en EL documento.

## Referencias
- user_name
- user_name
- user_name
- user_name
- user_name

## Codigo
const x = 1
const y = 2
const z = 3
let a = 4
let b = 5
let c = 6

## Comentarios
//TODO revisar esto
//TODO implementar aquello
//TODO probar integracion
//FIXME arreglar bug
//FIXME optimizar query
```

Guarda con `:w`.

---

## 🎮 Ejercicios

### Ejercicio A: Añadir `;` al final (A + .)

```text
1. Ve a "const x = 1"
2. Presiona A ; Esc          → const x = 1;
3. j                         → siguiente línea
4. .                         → const y = 2;
5. j . j .                   → añade ; a las demás líneas const/let

Resultado:
const x = 1;
const y = 2;
const z = 3;
let a = 4;
let b = 5;
let c = 6;
```

### Ejercicio B: Corregir checkboxes (ciw + n + .)

```text
Problema: "- []" debe ser "- [ ]" (falta espacio)

1. Ve a "- [] comprar leche", cursor en '['
2. i → Insert mode, añade espacio: " ["
3. Esc
4. j → siguiente línea
5. . → repite en "- [] llamar al medico"

Pero espera: '.' repite el ÚLTIMO CAMBIO.
¿Qué cambio fue? 'i [ Esc' = insertar " [" antes del cursor.
Si el cursor está en '[' de "llamar", funcionará.

Si no funciona bien, usa esta estrategia:
1. /\[\]<Enter>   → busca "- []"
2. f]             → salta al ']'  
3. i " " Esc      → añade espacio
4. n              → siguiente "[]"
5. .              → repite el espacio
6. n . n . n .    → corrige TODOS los checkboxes
```

### Ejercicio C: Renombrar variable (ciw + n + .)

```text
1. Ve a la sección "Referencias"
2. Cursor en "user_name"
3. ciw user_email Esc   → cambia palabra
4. n                     → siguiente "user_name"
5. .                     → repite cambio
6. n . n . n .           → cambia todos los user_name a user_email
```

### Ejercicio D: Cambiar mayúsculas (guiw + n + .)

```text
1. Ve a "MAYUSCULAS" en la sección Notas
2. guiw                    → lowercase inner word
3. n                       → siguiente palabra en mayúsculas ("DEBERIAN")
4. .                       → lowercase
5. n .                     → "PARA" → lowercase
6. n .                     → "EL" → lowercase
```

### Ejercicio E: Comentar líneas (I + .)

```text
1. Ve a "const x = 1"
2. I// Esc                 → //const x = 1
3. j                       → siguiente línea
4. .                       → //const y = 2;
5. j . j . j . j . j .     → comenta TODAS las líneas const/let

6. u u u u u u             → deshacer (o :e! para recargar)
```

### Ejercicio F: Corregir TODOs (ciw + n + .)

```text
1. /TODO<Enter>            → primer TODO
2. ciw TODO-SEMANA3 Esc    → cambia la palabra
3. n                       → siguiente TODO
4. .                       → repite cambio
5. n . n .                 → cambia todos los TODOs

6. /FIXME<Enter>           → primer FIXME
7. ciw FIXME-SEMANA3 Esc
8. n .                     → cambia todos los FIXMEs
```

### Ejercicio G: Drill cronometrado

```text
Haz esta secuencia 3 veces (usa u para deshacer entre rondas):

1. Ve a la primera línea "const x = 1"
2. A ; Esc                 → añade ; al final
3. j . j . j . j . j .     → repite en todas las líneas const/let
4. u 6 veces                → deshacer los ;
5. Ve a "MAYUSCULAS"
6. guiw                     → lowercase
7. n . n . n .             → lowercase a todas las palabras en mayúsculas
8. u 4 veces                → deshacer
9. Ve a "user_name"
10. ciw username Esc       → cambio de nombre
11. n . n . n . n .        → todas las ocurrencias
12. u 5 veces               → deshacer

Objetivo: completar la secuencia en menos de 1 minuto.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste `.` para repetir cambios en lugar de volver a teclear? | | |
| ¿Combinaste `.` + `n` para cambios en múltiples ocurrencias? | | |
| ¿Piensas en "hacer el cambio una vez, luego `.`" al editar? | | |
| ¿Notas que editas más rápido que sin `.`? | | |
| ¿Entiendes qué constituye un "cambio" y qué no? | | |

---

## 💡 Consejo

> **El `.` es el comando más importante de Vim.** Si solo aprendes una cosa esta semana, que sea esto. Todo lo demás (Visual mode, marcas, sustituciones) son herramientas. `.` es el martillo que usas todo el día.

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Visual Block →](../02-ejercicio-visual-block/README.md)
