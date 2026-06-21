# 🐚 Comandos Shell y Filtros

## 🎯 Objetivos

- Ejecutar comandos de shell desde Vim con `:!`
- Insertar la salida de comandos en el buffer con `:r !`
- Filtrar texto a través de comandos externos con `!{motion}` y `:%!`
- Cambiar capitalización de texto con `gu`, `gU`, `g~`
- Entender el operador `!` (filter) y sus usos prácticos

---

## 📋 Contenido

### 1. `:!` — Ejecutar Comando de Shell

Ejecuta un comando externo y muestra la salida temporalmente.

```text
:!ls              → lista archivos del directorio actual
:!git status      → muestra estado de git
:!node --version  → versión de Node.js
:!python3 %       → ejecuta el archivo actual con Python
:!gcc % && ./a.out → compila y ejecuta el archivo C actual
```

```text
El % en :! se expande al nombre del archivo actual:
:!node %          → ejecuta "node archivo-actual.js"
```

**Presiona Enter para volver a Vim** después de ver la salida.

---

### 2. `:r !` — Insertar Salida de Comando

Lee la salida de un comando y la inserta en el buffer.

```text
:r !date                  → inserta la fecha actual
:r !ls                    → inserta listado de archivos
:r !git log --oneline -5  → inserta últimos 5 commits
:r !cat otro-archivo.txt  → inserta contenido de otro archivo
:r !curl -s https://api.github.com/users/torvalds → inserta JSON de API
```

```text
Ejemplo — crear un reporte con metadatos:

Archivo reporte.md:
# Reporte Semanal

## Metadatos
Generado: |   ← cursor aquí

:r !date "+%Y-%m-%d %H:%M:%S"
Resultado:
## Metadatos
Generado: 2024-01-15 10:30:00
```

**Con rango de líneas**:
```text
:10r !date    → inserta la fecha DESPUÉS de la línea 10
:0r !date     → inserta al INICIO del archivo
:$r !date     → inserta al FINAL del archivo
```

---

### 3. `!{motion}` y `:%!` — Filtrar por Comando

El operador `!` pasa texto a través de un comando externo y reemplaza el texto con la salida del comando.

```text
!{motion}{comando}   → filtra el texto del motion por el comando
:{rango}!{comando}   → filtra las líneas del rango por el comando
```

```text
Ejemplos con el operador !:

! G sort              → ordena desde cursor hasta final del archivo
! 5 j sort            → ordena las siguientes 5 líneas
! i p sort            → ordena el párrafo actual
! a p jq '.text'      → extrae .text de JSON (con jq instalado)

:%! sort              → ordena TODO el archivo
:%! uniq              → elimina líneas duplicadas (requiere sort previo)
:%! python3 -m json.tool  → formatea JSON
:%! column -t         → alinea columnas con espacios
```

**Caso práctico — ordenar datos**:
```text
Archivo con lista desordenada:
zeta
alfa
gamma
beta

gg                  → inicio del archivo
! G sort            → ordena todo

Resultado:
alfa
beta
gamma
zeta
```

---

### 4. Filtros Externos Útiles

```text
sort                 → ordena líneas alfabéticamente
sort -n              → ordena numéricamente
sort -u              → ordena y elimina duplicados
uniq                 → elimina líneas duplicadas consecutivas
column -t            → alinea columnas (separador por defecto: espacio)
column -t -s ','     → alinea columnas con separador ','
tr 'a-z' 'A-Z'       → convierte a mayúsculas
sed 's/foo/bar/g'    → sustituye foo por bar
awk '{print $1}'     → imprime primera columna
wc -l                → cuenta líneas
nl                   → numera líneas
tac                  → invierte orden de líneas
rev                  → invierte cada línea
```

```text
Ejemplos combinados:

! G column -t -s ','     → alinea CSV como tabla
! G awk '{print $2}'     → extrae segunda columna
! G sort -n | uniq       → ordena numéricamente y elimina duplicados
```

---

### 5. `:shell` y `:terminal`

```text
:shell       → abre un shell interactivo (sale con exit para volver)
:term        → abre un buffer de terminal en Neovim (dividido)
:vert term   → terminal en split vertical
```

```text
En Neovim, el terminal es un buffer normal:
i            → entra a Terminal mode (para escribir comandos)
Ctrl-\ Ctrl-n → sale de Terminal mode a Normal mode
```

---

### 6. `gu`, `gU`, `g~` — Cambio de Capitalización

```text
Operadores de caso:

gu {motion}    → lowercase (minúsculas)
gU {motion}    → uppercase (MAYÚSCULAS)
g~ {motion}    → toggle case (aLtErNaR)
```

```text
Combinaciones comunes:

gu i w         → palabra a minúsculas
gU i w         → PALABRA A MAYÚSCULAS
g~ i w         → AlTeRnAr palabra
gu u           → línea actual a minúsculas (guu)
gU u           → LÍNEA ACTUAL A MAYÚSCULAS (gUU)
gu G           → desde cursor hasta final, todo minúsculas
V + u          → seleccionar y lowercase
V + U          → seleccionar y uppercase
```

```text
Ejemplos:
HELLO → guiw → hello
hello → gUiw → HELLO
Hello → g~iw → hELLO
```

**Sin text objects**:
```text
gu $           → minúsculas hasta fin de línea
gU 0           → mayúsculas hasta inicio de línea
```

---

### 7. `~` — Alternar Caso de un Carácter

```text
~              → cambia el carácter bajo el cursor (h → H, H → h)
```

```text
En Visual mode:
cursor sobre 'h':
~              → H
~              → h
```

---

### 8. El Operador `!` y Text Objects

```text
! i p sort       → ordena inner paragraph
! a { jq .       → filtra around braces con jq
! i " sort       → ordena inside quotes (contenido de string con líneas)
```

---

### 9. Casos de Uso Reales

#### Caso 1: Insertar estructura de archivos

```text
:r !tree -L 2    → inserta árbol de directorios
```

#### Caso 2: Formatear JSON

```text
:%!python3 -m json.tool    → formatea JSON con indentación
```

#### Caso 3: Insertar diff de git

```text
:r !git diff HEAD~1    → inserta diff del último commit
```

#### Caso 4: Crear tabla de contenidos numérica

```text
V                           → selecciona líneas (sección de un reporte)
! nl                        → numera las líneas
```

#### Caso 5: Convertir texto a columnas alineadas

```text
# Datos crudos:
nombre edad ciudad
Ana 30 Madrid
Carlos 25 Barcelona

:%! column -t
# Resultado:
nombre   edad  ciudad
Ana      30    Madrid
Carlos   25    Barcelona
```

---

### 10. Precauciones

```text
⚠️  :%!comando   reemplaza TODO el contenido del buffer con la salida
⚠️  :!rm %       ELIMINA el archivo actual
⚠️  :!git reset --hard  PIERDES cambios no commiteados
```

Si ejecutas algo destructivo:
```text
u               → deshacer en Vim
:e!             → recargar el archivo del disco
```

---

## 💡 Tabla de Referencia Rápida

```text
┌───────────────────────────────────────────────────┐
│ COMANDOS SHELL                                     │
│                                                    │
│ :!comando          → ejecutar y ver salida         │
│ :r !comando        → insertar salida en buffer     │
│ :{rango}!comando   → filtrar líneas por comando    │
│                                                    │
│ % = archivo actual                                 │
│ :!node %           → ejecutar archivo con node     │
│                                                    │
│ CAMBIO DE CASO                                     │
│ gu{motion}         → lowercase                    │
│ gU{motion}         → UPPERCASE                    │
│ g~{motion}         → tOGGLE                        │
│                                                    │
│ COMBOS ÚTILES                                      │
│ !G sort            → ordenar archivo               │
│ !ip column -t      → alinear párrafo como tabla    │
│ :%!python3 -m json.tool → formatear JSON          │
└───────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Ejecuto comandos de shell con `:!comando`
- [ ] Inserto salida de comandos en el buffer con `:r !comando`
- [ ] Filtro texto por comandos externos con `!{motion}comando`
- [ ] Uso `:%!comando` para procesar todo el archivo
- [ ] Cambio capitalización con `gu`, `gU`, `g~`
- [ ] Alterno caso de caracteres con `~`
- [ ] Uso `column -t` para alinear datos tabulares
- [ ] Uso `sort` y `uniq` para limpiar listas

---

## 🎮 Ejercicio Rápido

```text
1. :r !date                      → inserta fecha actual
2. Crea 5 líneas con palabras al azar
3. ! G sort                      → ordena las líneas
4. u                             → deshacer
5. V selecciona las palabras → ! tr 'a-z' 'A-Z' → mayúsculas
6. u                             → deshacer
7. gUiw sobre una palabra        → mayúsculas a una palabra
8. guiw sobre la misma           → de vuelta a minúsculas

9. :r !curl -s https://api.github.com/users/github | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('login','?'))" 2>/dev/null
   → inserta el login del usuario github de la API
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
