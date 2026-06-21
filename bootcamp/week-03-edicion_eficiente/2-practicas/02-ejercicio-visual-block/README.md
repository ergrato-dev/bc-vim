# 🟦 Ejercicio 02: Visual Block

## 🎯 Objetivo

Dominar Visual block (Ctrl-v) para ediciones rectangulares: insertar en múltiples líneas, reemplazar columnas, alinear datos.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Crear Archivos de Práctica

#### Archivo 1: `~/vim-practica-block.txt`

```bash
nvim ~/vim-practica-block.txt
```

Copia:

```text
// Bloque de código para practicar Visual block

const name = "Ana"
const age = 30
const city = "Madrid"
const country = "España"
const role = "admin"

function uno() {
  return 1
}

function dos() {
  return 2
}

function tres() {
  return 3
}
```

#### Archivo 2: `~/vim-practica-csv.csv`

```bash
nvim ~/vim-practica-csv.csv
```

Copia:

```text
nombre,edad,ciudad,activo,saldo
Ana Garcia,30,Madrid,true,1500.50
Carlos Lopez,25,Barcelona,false,2300.00
Bea Martinez,28,Valencia,true,875.25
David Sanchez,35,Sevilla,true,3200.00
Elena Torres,22,Bilbao,false,450.75
```

Guarda con `:w`.

---

## 🎮 Ejercicios

### Ejercicio A: Comentar columnas (Ctrl-v + I)

```text
En el archivo block.txt:

1. Ve a la 'c' de "const name"
2. Ctrl-v 4 j       → selecciona primera columna de las 5 líneas const
3. I                → Insert mode al inicio de la selección
4. //               → escribe comentario
5. Esc              → ¡LAS 5 LÍNEAS se comentan simultáneamente!

Resultado:
//const name = "Ana"
//const age = 30
//const city = "Madrid"
//const country = "España"
//const role = "admin"

6. u                → deshacer
```

### Ejercicio B: Añadir al final de líneas (Ctrl-v + $ + A)

```text
En el archivo block.txt:

1. Ve a 'c' de "const name"
2. Ctrl-v 4 j       → selecciona primera columna de 5 líneas
3. $                → extiende cada línea hasta su final
4. A                → Insert mode al FINAL de cada línea
5. ;                → escribe ;
6. Esc              → añade ; a las 5 líneas

Resultado:
const name = "Ana";
const age = 30;
const city = "Madrid";
const country = "España";
const role = "admin";
```

### Ejercicio C: Reemplazar texto en bloque (Ctrl-v + c)

```text
1. Ve a "function uno" → cursor en 'f'
2. Ctrl-v 2 j        → selecciona primera columna de function uno/dos/tres
3. l l l l l l       → extiende hasta cubrir "function" (8 caracteres)
4. r                 → entrar a reemplazar
5. def               → reemplaza "fun" por "def"
   (solo 3 caracteres; r reemplaza carácter a carácter)

O mejor:
4. c                 → elimina "function" en las 3 líneas
5. def               → escribe "def"
6. Esc               → reemplaza "function" por "def" en las 3 líneas
```

### Ejercicio D: Alinear columnas CSV

```text
En el archivo CSV:

Tarea: Convertir estas líneas CSV en una tabla alineada con pipes.

Estrategia:
1. Reemplaza comas por " | ":
   :%s/,/ | /g

2. Añade "| " al inicio de cada línea de datos (no la cabecera):
   Ve a línea 2 (Ana Garcia)
   Ctrl-v 4 j       → selecciona primera columna de datos
   I                → Insert mode
   |                → escribe pipe y espacio
   Esc

3. Añade " |" al final de cada línea de datos:
   Ve a línea 2, Ctrl-v 4 j $ A " |" Esc
   O mejor: Ctrl-v 4 j $ A  | Esc

4. Crea separador de tabla debajo de la cabecera:
   Ve a línea 1 (cabecera)
   yy → copia
   p  → pega debajo
   En la línea copiada:
   :s/[^|]/-/g     → reemplaza todo lo que no sea | por -

Resultado final:
| nombre        | edad | ciudad     | activo | saldo    |
|---------------|------|------------|--------|----------|
| Ana Garcia    | 30   | Madrid     | true   | 1500.50  |
| Carlos Lopez  | 25   | Barcelona  | false  | 2300.00  |
| Bea Martinez  | 28   | Valencia   | true   | 875.25   |
| David Sanchez | 35   | Sevilla    | true   | 3200.00  |
| Elena Torres  | 22   | Bilbao     | false  | 450.75   |
```

### Ejercicio E: Incrementar números en bloque

```text
Crea rápidamente:
nvim ~/vim-practica-nums.txt

Escribe en Insert mode:
item_01
item_02
item_03
item_04
item_05

1. Cursor en '0' de "item_01"
2. Ctrl-v 4 j      → selecciona la columna de dígitos
3. g Ctrl-a        → incrementa todos

Resultado:
item_02
item_03
item_04
item_05
item_06
```

### Ejercicio F: Formatear múltiples líneas con operador =

```text
En el archivo block.txt:

1. Ve a "function uno" (asegúrate de tener indentación incorrecta)
2. V               → selecciona línea
3. 2 j             → extiende a las 3 funciones
4. =               → autoindenta las 3 funciones

También puedes usar text objects:
=i{                → formatea dentro de las llaves
```

### Ejercicio G: Drill combinado

```text
Usa el archivo CSV. Realiza esta secuencia sin mirar referencia:

1. :%s/,/ | /g                         → reemplaza comas
2. Ctrl-v 4 j I |  Esc                → pipes al inicio
3. Ctrl-v 4 j $ A  | Esc              → pipes al final
4. yy p                                → duplica cabecera
5. En la copia: :s/[^|]/-/g           → línea separadora
6. u u u u u                           → deshacer todo y repetir

Tiempo objetivo: menos de 45 segundos.
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿Usaste Ctrl-v + I para insertar al inicio de varias líneas? | | |
| ¿Usaste Ctrl-v + $ + A para añadir al final de varias líneas? | | |
| ¿Usaste r y c en Visual block? | | |
| ¿Entiendes cuándo usar Visual line (V) vs Visual block (Ctrl-v)? | | |
| ¿Te sientes cómodo editando en "modo rectangular"? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Marcas →](../03-ejercicio-marcas/README.md)
