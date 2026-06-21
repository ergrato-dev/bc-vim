# 📋 Ejercicio 01: Registro Drill

## 🎯 Objetivo

Dominar todos los tipos de registros: almacenar, recuperar, acumular y visualizar.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

Crea el archivo de práctica:

```bash
nvim ~/vim-practica-registros.txt
```

Copia este contenido:

```text
Línea 1: Datos del usuario Ana
Línea 2: Configuración del servidor
Línea 3: Registro de actividad reciente
Línea 4: Notas importantes del proyecto
Línea 5: Código de referencia para módulo
Línea 6: Tests unitarios pendientes
Línea 7: Documentación de API externa
Línea 8: Logs de depuración activos
Línea 9: Parámetros de conexión a BD
Línea 10: Script de despliegue automático
```

---

## 🎮 Ejercicios

### Ejercicio A: Registros con Nombre (a-z)

```text
1. "a yy          → copia línea 1 a registro 'a'
2. j "b yy        → copia línea 2 a registro 'b'
3. j "c yy        → copia línea 3 a registro 'c'
4. j "d yy        → copia línea 4 a registro 'd'
5. j "e yy        → copia línea 5 a registro 'e'

6. :reg a b c d e → verifica los contenidos
7. G              → final del archivo
8. "a p           → pega registro 'a' (línea 1)
9. "e p           → pega registro 'e' (línea 5)
10. "c p          → pega registro 'c' (línea 3)
```

### Ejercicio B: Append a Registros (A-Z)

```text
1. u u u           → deshacer los pegado
2. "a yy            → registro 'a' = línea 1
3. j "A yy          → APPEND: añade línea 2 a 'a'
4. j "A yy          → APPEND: añade línea 3 a 'a'
5. j "A yy          → APPEND: añade línea 4 a 'a'

6. :reg a           → verifica: 4 líneas acumuladas
7. G                → final del archivo
8. "a p             → pega las 4 líneas juntas
```

### Ejercicio C: El Registro de Yank ("0)

```text
1. Ve a línea 6: 6G
2. yy               → copia línea 6 ("" y "0 = línea 6)
3. j dd             → elimina línea 7 ("" = línea 7, "0 sigue siendo línea 6)
4. p                → pega desde "" (línea 7 eliminada)
5. u                → deshacer pegado
6. "0p              → pega desde "0 (línea 6 copiada originalmente)

El registro "0 protege tu último yank. 
Sin "0, habrías perdido la copia de la línea 6.
```

### Ejercicio D: Registro de Pequeño Delete ("-)

```text
1. Ve a línea 8
2. x                → elimina carácter (va a "" y "-")
3. dd               → elimina línea entera ("" = línea, "- sigue con el carácter)
4. "-p              → pega el carácter eliminado por x

El registro "- guarda deletes de menos de 1 línea.
```

### Ejercicio E: Pegar Registros en Insert Mode (Ctrl-r)

```text
1. Ve a línea 9
2. "a yy            → copia línea a registro 'a'
3. j o              → nueva línea, Insert mode
4. Ctrl-r a         → pega contenido de registro 'a'
5. Esc

6. o                → otra línea
7. Ctrl-r %         → pega nombre del archivo actual
8. Esc

9. o                → otra línea
10. Ctrl-r :        → pega último comando ejecutado
11. Esc
```

### Ejercicio F: Registros Especiales

```text
1. :reg %           → muestra el nombre del archivo (%)
2. "%p              → pega el nombre del archivo
3. :reg /           → muestra último patrón de búsqueda
4. /Línea Enter     → busca "Línea"
5. "/p              → pega el patrón "Línea"
6. :reg "           → muestra el registro sin nombre
```

### Ejercicio G: Limpiar Registros

```text
1. :let @a = ''     → vacía el registro 'a'
2. :reg a           → verifica que está vacío
3. :let @/ = ''     → limpia patrón de búsqueda (equivalente a :noh)
```

### Ejercicio H: Drill Combinado

```text
Realiza en menos de 2 minutos:
1. "a yy "b yy "c yy    → copia 3 líneas a a, b, c
2. :reg a b c            → verifica
3. "ay$ "by$ "cy$        → copia con movimiento (hasta fin de línea)
4. G "a p "b p "c p      → pega al final
5. u u u                 → deshacer pegado
6. "A yy                 → append a 'a' (otra línea)
7. :reg a                → verifica acumulación
8. "0p                   → recupera última copia
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Almacenas texto en registros con nombre ("ayy)? | | |
| ¿Acumulas texto con mayúsculas ("Ayy)? | | |
| ¿Usas "0p para recuperar copia tras un delete? | | |
| ¿Visualizas registros con :reg? | | |
| ¿Pegas registros en Insert mode con Ctrl-r? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Macro Simple →](../02-ejercicio-macros/README.md)
