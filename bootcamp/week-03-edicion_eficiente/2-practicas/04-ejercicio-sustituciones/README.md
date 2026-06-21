# 🔄 Ejercicio 04: Sustituciones y Comandos Shell

## 🎯 Objetivo

Dominar `:s`, `:%s`, `:g`, `:r !` y `!{motion}` para transformar datos y automatizar tareas repetitivas.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear Archivos de Práctica

#### Archivo 1: `~/vim-practica-sustituciones.txt`

```bash
nvim ~/vim-practica-sustituciones.txt
```

Copia:

```text
# Datos de Práctica para Sustituciones

## Variables (snake_case)
user_name = "ana"
user_email = "ana@example.com"
user_age = 30
user_city = "Madrid"
user_role = "admin"

## Líneas con espacios extra
   linea con espacios al inicio
linea con espacios al final   
   linea con espacios en ambos lados   

## Líneas vacías



## Palabras para cambiar
foo foo foo foo
bar foo bar foo
foo bar foo bar
baz baz baz baz

## Líneas que deben ser eliminadas
DEBUG: mensaje de debug 1
INFO: mensaje informativo
DEBUG: mensaje de debug 2
ERROR: mensaje de error
DEBUG: mensaje de debug 3
WARN: advertencia

## Fechas en formato incorrecto
15/01/2024
22/02/2024
10/03/2024
05/04/2024

## Código
const OLD_VALUE = 100
const MAX_SIZE = 500
const MIN_SIZE = 10
```

#### Archivo 2: `~/vim-practica-shell.txt`

```bash
nvim ~/vim-practica-shell.txt
```

Escribe solo esto:

```text
# Reporte generado automáticamente

## Fecha de generación:

## Metadatos del sistema:

## Lista de archivos del proyecto:

## Datos del sistema:

```

Guarda con `:w`.

---

## 🎮 Ejercicios

### Ejercicio A: Sustituciones básicas

En `vim-practica-sustituciones.txt`:

```text
1. Cambia "foo" por "XXX" en la línea actual:
   Ve a la primera línea con "foo"
   :s/foo/XXX/g             → cambia todas las ocurrencias en la línea

2. Cambia TODAS las ocurrencias en el archivo:
   :%s/foo/XXX/g

3. Cambia SOLO "foo" como palabra completa:
   :%s/\<foo\>/XXX/g

4. Cambia "bar" por "YYY" SOLO en líneas 18-20:
   :18,20s/bar/YYY/g

5. u u u                    → deshacer los cambios
```

### Ejercicio B: Cambios con anclas

```text
1. Cambia snake_case a camelCase en variables:
   Observa: user_name → userName
   :%s/_\(.\)/\u\1/g
   Esto busca '_' seguido de cualquier carácter, y reemplaza
   por la versión en mayúscula del carácter capturado.

   Resultado en las variables:
   userName = "ana"
   userEmail = "ana@example.com"
   userAge = 30
   userCity = "Madrid"
   userRole = "admin"

2. u                         → deshacer (vuelve a snake_case)

3. Añade prefijo "old_" a todas las variables:
   :%s/\<user_/old_user_/g

4. u                         → deshacer
```

### Ejercicio C: Flags de sustitución

```text
1. Cuenta cuántas ocurrencias de "foo" hay:
   :%s/foo//gn               → muestra "X matches on Y lines" sin cambiar nada

2. Sustituye con confirmación:
   :%s/foo/REEMPLAZO/gc
   Practica: y (sí), n (no), a (todas), q (salir)

3. Ignora mayúsculas/minúsculas:
   :%s/DEBUG/info/gi          → cambia DEBUG, debug, Debug por "info"
```

### Ejercicio D: El comando `:g`

```text
1. Lista líneas que contienen "foo":
   :g/foo/p

2. Elimina TODAS las líneas que contienen "DEBUG":
   :g/DEBUG/d

3. Elimina TODAS las líneas vacías:
   :g/^$/d

4. u u                       → deshacer las eliminaciones

5. Mueve líneas con "DEBUG" al final del archivo:
   :g/DEBUG/m$

6. u                         → deshacer

7. Copia líneas con "ERROR" al final:
   :g/ERROR/t$

8. Elimina líneas que NO contienen letras (solo espacios):
   :v/\w/d
```

### Ejercicio E: Limpieza de datos

```text
1. Elimina espacios al inicio de línea:
   :%s/^\s\+//

2. Elimina espacios al final de línea:
   :%s/\s\+$//

3. Elimina líneas vacías:
   :g/^$/d

4. Cambia fechas de DD/MM/YYYY a YYYY-MM-DD:
   :%s/\(\d\{2}\)\/\(\d\{2}\)\/\(\d\{4}\)/\3-\2-\1/g

5. u varias veces → deshacer todo
```

### Ejercicio F: Comandos shell

En `vim-practica-shell.txt`:

```text
1. Inserta fecha actual:
   Ve a la línea "## Fecha de generación:"
   A → espacio, Esc
   :r !date "+%Y-%m-%d %H:%M:%S"

2. Inserta información del sistema:
   Ve a "## Metadatos del sistema:"
   o → nueva línea
   :r !uname -a

3. Inserta listado de archivos:
   Ve a "## Lista de archivos del proyecto:"
   o → nueva línea
   :r !ls -la ~/

4. Inserta datos del sistema:
   Ve a "## Datos del sistema:"
   o → nueva línea
   :r !df -h | head -5
```

### Ejercicio G: Filtrar texto por comandos

```text
En vim-practica-sustituciones.txt:

1. Ordena las líneas de variables (user_*):
   Ve a la sección de "## Variables"
   V 5 j                     → selecciona las 6 líneas (cabecera + 5 variables)
   ! sort                    → ordena alfabéticamente

2. u                         → deshacer

3. Convierte las variables a mayúsculas (solo las líneas de variables):
   V 5 j
   ! tr 'a-z' 'A-Z'

4. u                         → deshacer

5. Ordena TODO el archivo:
   :%! sort

6. u                         → deshacer

7. Numera las líneas del archivo:
   :%! nl

8. u                         → deshacer
```

### Ejercicio H: Combinado final

```text
En vim-practica-sustituciones.txt:

Limpia completamente el archivo:
1. :%s/^\s\+//               → sin espacios al inicio
2. :%s/\s\+$//               → sin espacios al final
3. :g/^$/d                   → sin líneas vacías
4. :g/DEBUG/d                → sin líneas DEBUG
5. :%s/\<foo\>/REEMPLAZO/g   → reemplaza foo
6. :%s/\<baz\>/OTRO/g        → reemplaza baz
7. :%s/\(\d\{2\}\)\/\(\d\{2\}\)\/\(\d\{4\}\)/\3-\2-\1/g  → normaliza fechas

8. V selecciona las variables → ! sort → ordena variables

Resultado: un archivo limpio, ordenado y con datos normalizados.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usas `:s` y `:%s` con confianza? | | |
| ¿Usas flags: `g`, `c`, `i`, `n`? | | |
| ¿Usas `:g` para operar en líneas que coinciden con patrón? | | |
| ¿Usas `:v` para operar en líneas que NO coinciden? | | |
| ¿Insertas salida de comandos con `:r !comando`? | | |
| ¿Filtraste texto por comandos externos (`!`, `:%!`)? | | |
| ¿Cambiaste el separador de `/` cuando el patrón contiene barras? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
