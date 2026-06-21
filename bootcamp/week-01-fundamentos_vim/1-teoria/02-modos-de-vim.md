# 🎭 Modos de Vim

## 🎯 Objetivos

- Dominar los 4 modos principales de Vim y cuándo usar cada uno
- Transicionar fluidamente entre modos
- Entender el ciclo Normal → Insert → Esc como hábito fundamental
- Reconocer visualmente en qué modo te encuentras

---

## 📋 Contenido

### 1. Normal Mode (Modo Normal)

**Es tu hogar.** Es el modo por defecto. No escribes texto, ejecutas comandos.

```text
¿Cómo sabes que estás en Normal Mode?
→ El cursor es un bloque █
→ No ves "-- INSERT --" en la última línea
→ Las teclas ejecutan comandos, no escriben texto
```

**Accedes a Normal Mode desde cualquier otro modo presionando `<Esc>`** (o `Ctrl-[`).

Desde Normal Mode puedes:
- Moverte por el archivo (hjkl, w, b, etc.)
- Ejecutar operadores (d, c, y, etc.)
- Entrar a otros modos
- Ejecutar comandos con `:`

```text
Regla de oro: SIEMPRE vuelve a Normal Mode cuando termines de escribir.
Nunca te quedes en Insert mode "por si acaso".
```

---

### 2. Insert Mode (Modo Inserción)

**Solo para escribir texto nuevo.** Hay varias formas de entrar:

| Comando | Acción | Nemotecnia |
|---------|--------|------------|
| `i` | Insertar antes del cursor | **i**nsert |
| `I` | Insertar al inicio de la línea | **I**nsert al principio |
| `a` | Insertar después del cursor | **a**ppend |
| `A` | Insertar al final de la línea | **A**ppend al final |
| `o` | Abrir nueva línea abajo | **o**pen below |
| `O` | Abrir nueva línea arriba | **O**pen above |
| `s` | Sustituir carácter e insertar | **s**ubstitute |
| `S` | Sustituir toda la línea e insertar | **S**ubstitute line |
| `C` | Cambiar desde el cursor hasta fin de línea | **C**hange to end |

```text
Ejemplo práctico:
┌────────────────────────────────────────────┐
│ Texto inicial:  Hola mundo                 │
│                                              │
│ i → Hola |mundo    (insertar antes de m)    │
│ a → Hola m|undo    (insertar después de m)  │
│ I → |Hola mundo    (inicio de línea)        │
│ A → Hola mundo|    (final de línea)         │
│ o → Hola mundo     (nueva línea abajo)      │
│     |                                       │
└────────────────────────────────────────────┘
```

**Para salir de Insert Mode**: `<Esc>` o `Ctrl-[` o (si lo configuras) `jj`/`jk`.

---

### 3. Visual Mode (Modo Visual)

**Para seleccionar texto.** Similar a arrastrar con el ratón, pero con el teclado.

| Comando | Acción |
|---------|--------|
| `v` | Visual mode carácter a carácter |
| `V` | Visual mode línea a línea |
| `Ctrl-v` | Visual block mode (selección rectangular) |

```text
┌──────────────────────────────────────────────┐
│ Visual (v):                                   │
│   Hola [mundo] cruel ← selección carácter     │
│                                                │
│ Visual Line (V):                              │
│   [Hola mundo cruel] ← línea completa         │
│   [segunda línea]                             │
│                                                │
│ Visual Block (Ctrl-v):                        │
│   H[ola] mundo  ← bloque rectangular          │
│   A[dió]s mundo                               │
│   Ch[au]  mundo                               │
└──────────────────────────────────────────────┘
```

En Visual mode puedes:
- Extender la selección moviendo el cursor
- Aplicar operadores (d para eliminar, y para copiar, etc.)
- Ejecutar comandos con `:` (solo en las líneas seleccionadas)

**Esta semana**: Solo reconoce que existe. Lo practicaremos a fondo en la Semana 3.

---

### 4. Command-line Mode (Modo de Comandos)

**Para ejecutar comandos con `:`.** Es donde guardas, sales, buscas, configuras.

| Comando | Acción |
|---------|--------|
| `:w` | Guardar (write) |
| `:q` | Salir (quit) |
| `:q!` | Salir sin guardar |
| `:wq` o `:x` | Guardar y salir |
| `:help` | Abrir ayuda |
| `:e archivo` | Abrir archivo (edit) |
| `:set opcion` | Cambiar opción temporalmente |

```text
También accedes con:
→ / para buscar hacia adelante
→ ? para buscar hacia atrás
→ ! para ejecutar comandos de shell
```

---

### 5. El Ciclo Fundamental

```text
         ┌───────────────┐
         │               │
         ▼               │
    ┌─────────┐          │
    │ NORMAL  │──────────┼──── i, a, o, I, A, O ────┐
    │  MODE   │          │                           │
    └─────────┘          │                           ▼
         │               │                    ┌──────────┐
         │               │                    │ INSERT   │
    v, V │               │  :                 │ MODE     │
    Ctrl-v│              │                    └──────────┘
         ▼               │                         │
    ┌─────────┐          │                    Esc  │
    │ VISUAL  │──────────┼─────────────────────────┘
    │ MODE    │          │
    └─────────┘          │
         │               │
         │ Esc           │
         └───────────────┘

              ┌──────────┐
              │ COMMAND  │ ← :
              │ MODE     │ → Enter ejecuta, Esc cancela
              └──────────┘
```

**El hábito más importante de esta semana**:

```
Insertar texto → Esc → Insertar texto → Esc → Insertar texto → Esc
```

No:
```
Insertar texto... (quedarse 5 minutos en Insert mode) ... Esc
```

---

### 6. Cómo Saber en Qué Modo Estás

En Neovim, con configuración básica:

| Modo | Indicador visual |
|------|-----------------|
| Normal | Cursor bloque █, sin texto en barra de estado |
| Insert | Cursor línea \|, dice `-- INSERT --` |
| Visual | Texto resaltado, dice `-- VISUAL --` |
| Command | `:` en la última línea, cursor parpadea ahí |

**Consejo**: Si no estás seguro de en qué modo estás, presiona `<Esc>` dos veces. Esto siempre te lleva a Normal Mode.

---

## ✅ Checklist de Verificación

- [ ] Entrar a Insert mode con i, a, o (los 3 más comunes)
- [ ] Salir a Normal mode con `<Esc>` automáticamente después de escribir
- [ ] Abrir Visual mode con v y salir con `<Esc>`
- [ ] Ejecutar :w, :q, :q!, :wq desde memoria muscular
- [ ] Identificar visualmente en qué modo estoy en cada momento

---

## ➡️ Siguiente

[03 - Movimiento Básico](03-movimiento-basico.md)
