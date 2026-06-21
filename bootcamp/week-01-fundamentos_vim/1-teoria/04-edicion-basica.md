# ✏️ Edición Básica

## 🎯 Objetivos

- Insertar texto eficientemente con i, a, o, I, A, O
- Eliminar caracteres y líneas con x, dd, D
- Copiar y pegar con yy, p, P
- Deshacer y rehacer cambios con u, Ctrl-r
- Guardar y salir del editor con fluidez

---

## 📋 Contenido

### 1. Insertar Texto

Ya viste los comandos en la lección de modos. Aquí los consolidamos con ejemplos prácticos.

| Comando | Acción | Cuándo usarlo |
|---------|--------|---------------|
| `i` | Insertar antes del cursor | Añadir texto en medio de una línea |
| `I` | Insertar al inicio de la línea | Añadir prefijo o indentación |
| `a` | Insertar después del cursor | Continuar escribiendo |
| `A` | Insertar al final de la línea | Añadir punto y coma, comentarios |
| `o` | Nueva línea abajo | Añadir nueva línea de código |
| `O` | Nueva línea arriba | Insertar línea antes del bloque actual |

```text
┌─────────────────────────────────────────────────────────┐
│ Texto inicial:    function hello(                      │
│                                                         │
│ Comando O:        function hello(                      │
│                   |              ← nueva línea arriba   │
│                                                         │
│ Comando o:        function hello(                      │
│                   |              ← nueva línea abajo    │
│                                                         │
│ Comando A:        function hello(|  ← final de línea    │
│                   ) {                                   │
└─────────────────────────────────────────────────────────┘
```

---

### 2. Eliminar Texto

| Comando | Acción | Nemotecnia |
|---------|--------|------------|
| `x` | Eliminar carácter bajo el cursor | Como "tachar" |
| `X` | Eliminar carácter antes del cursor | Backspace |
| `dd` | Eliminar línea completa | **d**elete **d** (doble) |
| `D` | Eliminar desde cursor hasta fin de línea | **D**elete to end |
| `dw` | Eliminar hasta siguiente palabra | Delete word |
| `d$` | Eliminar hasta fin de línea | Delete to $ |

```text
Línea: "Hola mundo cruel"

x  → "Hola mundocruel" (eliminó el espacio antes de cruel)
X  → "Hola mundocruel" (eliminó la 'o' de mundo)
dd → línea eliminada completamente
D  → "Hola m" (eliminó desde cursor hasta final)
```

**Diferencia entre x y X**:
- `x` = Delete (como Supr)
- `X` = Backspace (como la tecla Backspace real)

---

### 3. Copiar y Pegar (Yank y Put)

| Comando | Acción | Nemotecnia |
|---------|--------|------------|
| `yy` | Copiar línea completa | **y**ank **y** (doble) |
| `Y` | Copiar línea completa (alias de yy) | |
| `yw` | Copiar hasta siguiente palabra | Yank word |
| `p` | Pegar después del cursor | **p**aste / **p**ut |
| `P` | Pegar antes del cursor | **P**aste before |
| `ddp` | Mover línea hacia abajo (delete + paste) | |

```text
Línea 1: "primera línea"    ← cursor aquí
Línea 2: "segunda línea"

yy → copia "primera línea"
j  → mueve a línea 2
p  → pega DESPUÉS de línea 2

Resultado:
Línea 1: "primera línea"
Línea 2: "segunda línea"
Línea 3: "primera línea"
```

```text
ddp → mueve la línea actual una posición abajo
ddkp → mueve la línea actual una posición arriba

Visualmente con ddp en:
Línea 1: A
Línea 2: B  ← cursor aquí
Línea 3: C

dd  → elimina B
p   → pega después de C

Resultado:
Línea 1: A
Línea 2: C
Línea 3: B
```

---

### 4. Deshacer y Rehacer

| Comando | Acción |
|---------|--------|
| `u` | Deshacer último cambio |
| `Ctrl-r` | Rehacer cambio deshecho |
| `U` | Deshacer todos los cambios en la línea actual |

```text
Importante sobre u y Ctrl-r:

u     ← deshacer
u     ← deshacer más
u     ← deshacer aún más
Ctrl-r ← rehacer
Ctrl-r ← rehacer más
Ctrl-r ← rehacer aún más
```

**Vim tiene un árbol de undo**. A diferencia de la mayoría de editores (undo lineal), Vim recuerda todas las ramas de cambios. Esto es avanzado y lo exploraremos en la Semana 7.

---

### 5. Guardar y Salir

| Comando | Acción | Nemotecnia |
|---------|--------|------------|
| `:w` | Guardar (write) | **w**rite |
| `:q` | Salir (quit) | **q**uit |
| `:q!` | Salir sin guardar | quit **!** (forzar) |
| `:wq` | Guardar y salir | write + quit |
| `:x` | Guardar y salir (más corto) | e**x**it |
| `ZZ` | Guardar y salir desde Normal mode | (atajo rápido) |
| `ZQ` | Salir sin guardar desde Normal mode | |
| `:w archivo` | Guardar como "archivo" | write as |

```text
Flujo típico:

1. Editas tu archivo
2. :w        → guardas por seguridad
3. Sigues editando
4. :wq o :x  → guardas y sales

Si cometiste errores y no quieres guardar:
:q!  → sales sin guardar, el archivo queda como estaba
```

**Consejo**: Acostúmbrate a `:w` frecuentemente. Es como Ctrl+S pero sin sacar las manos de posición.

---

### 6. Cambiar Texto (Intro)

El comando `c` (change) es el más poderoso de Vim. Esta semana solo veremos lo básico:

| Comando | Acción |
|---------|--------|
| `cc` | Cambiar toda la línea |
| `C` | Cambiar desde cursor hasta fin de línea |
| `cw` | Cambiar palabra |
| `s` | Sustituir carácter (borra y entra a Insert) |
| `S` | Sustituir línea completa |

```text
cc sobre:  "línea antigua"
Resultado: |          ← línea vacía en Insert mode
Escribes:  "línea nueva" + Esc

cw sobre:  Hola |mundo cruel
Resultado: Hola | cruel (en Insert mode)
Escribes:  Hola planeta cruel
```

**El comando c será el protagonista de la Semana 2**, combinado con text objects y motions avanzados.

---

## 💡 Resumen de Edición

| Categoría | Comandos Clave |
|-----------|---------------|
| Insertar | `i` `a` `o` `I` `A` `O` |
| Eliminar | `x` `dd` `D` |
| Copiar/Pegar | `yy` `p` `P` |
| Deshacer | `u` `Ctrl-r` |
| Guardar/Salir | `:w` `:q` `:q!` `:wq` `:x` `ZZ` |

---

## ✅ Checklist de Verificación

- [ ] Entrar a Insert mode con i, a, o (los 3 más comunes) y volver con Esc
- [ ] Eliminar caracteres sueltos (x) y líneas enteras (dd)
- [ ] Copiar (yy) y pegar (p) líneas completas
- [ ] Mover líneas con ddp
- [ ] Deshacer cambios (u) y rehacer (Ctrl-r)
- [ ] Guardar (:w) y salir (:q) desde memoria muscular
- [ ] Usar :q! cuando cometí un error y no quiero guardar

---

## 🎮 Ejercicio Rápido

Crea un archivo `ejercicio.md` y practica esta secuencia 5 veces:

```text
1. i           → Insert mode
2. Escribe:    → "# Mi título\n\nContenido\n"
3. Esc         → Normal mode
4. gg          → inicio del archivo
5. o           → nueva línea abajo de "# Mi título"
6. Escribe:    → "Subtítulo"
7. Esc         → Normal mode
8. A           → final de la línea "Contenido"
9. Escribe:    → " adicional"
10. Esc        → Normal mode
11. :w         → guardar
12. :q         → salir
```

---

## ➡️ Siguiente

[05 - Configuración Inicial](05-configuracion-inicial.md)
