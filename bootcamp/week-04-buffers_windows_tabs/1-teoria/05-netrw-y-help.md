# 📂 netrw y :help — Explorador de Archivos y Sistema de Ayuda

## 🎯 Objetivos

- Navegar el sistema de archivos con netrw sin salir de Vim
- Crear, renombrar y eliminar archivos desde netrw
- Dominar el sistema de ayuda integrado `:help`
- Usar `:help` para encontrar cualquier opción, comando o tema

---

## 📋 Contenido

---

## PARTE 1: netrw — Explorador de Archivos

### 1. ¿Qué es netrw?

netrw es un plugin **incluido por defecto** en Vim/Neovim que permite explorar y gestionar archivos directamente desde el editor.

```text
NO necesitas instalar nada. Viene con Vim desde 1998.
```

### 2. Abrir netrw

```text
:Explore              → abre netrw en la ventana actual
:Ex                   → alias de :Explore
:Sexplore             → abre netrw en split horizontal
:Vexplore             → abre netrw en split vertical
:Texplore             → abre netrw en nueva pestaña
:Explore .            → abre el directorio actual
:Explore ~/.config    → abre un directorio específico
:e .                  → abre el directorio actual (otra forma)

:Lexplore             → abre netrw a la izquierda (vertical)
:Lex [ancho]          → abre netrw a la izquierda con ancho
```

**Desde Normal mode**:
```text
-                     → abre netrw en el directorio del archivo actual
```

---

### 3. Navegar en netrw

```text
Enter                 → abrir archivo/directorio
-                     → subir al directorio padre
u                     → subir al directorio padre (otra forma)
i                     → alternar estilo de listado (thin/long/wide/tree)
s                     → alternar orden (nombre/hora/tamaño)
r                     → invertir orden
gh                    → alternar mostrar/ocultar archivos ocultos
gn                    → ir al archivo bajo el cursor en split horizontal
<C-w>v                → abrir archivo en split vertical
<C-w>h                → abrir archivo en split horizontal
p                     → vista previa del archivo
P                     → abrir archivo en ventana anterior
```

**Estilos de listado (presiona `i`)**:
```text
thin:   archivo1.txt  archivo2.txt  archivo3.txt
long:   archivo1.txt    1234  15/01/2024
        archivo2.txt    5678  16/01/2024
wide:   archivo1.txt     archivo2.txt
        archivo3.txt     archivo4.txt
tree:   directorio/
        ├── archivo1.txt
        └── subdirectorio/
            └── archivo2.txt
```

---

### 4. Gestionar Archivos desde netrw

```text
%                    → crear nuevo archivo (pide nombre)
d                    → crear nuevo directorio
D                    → eliminar archivo/directorio (pide confirmación)
R                    → renombrar archivo/directorio
mt                   → marcar target para copiar/mover
mf                   → marcar archivo
mF                   → desmarcar todos
mc                   → copiar archivos marcados al target
mm                   → mover archivos marcados al target
mx                   → ejecutar comando externo sobre los marcados
mz                   → comprimir/descomprimir archivos marcados
```

```text
Flujo para copiar archivos:
1. Navega al archivo fuente → mf (marca)
2. Navega al directorio destino → mt (marca como target)
3. mc → copia (pide confirmación)

Flujo para mover:
1. mf en archivo fuente
2. mt en directorio destino
3. mm → mueve

Flujo para renombrar:
1. Cursor sobre archivo → R
2. Escribe el nuevo nombre → Enter
```

---

### 5. Marcadores (Bookmarks) en netrw

```text
mb                    → guardar marcador (bookmark)
mB                    → eliminar marcador
qb                    → listar marcadores
{num}qb               → listar información del marcador {num}
gb                    → ir al marcador guardado
```

**Marcadores de libro**:
```text
%                    → crear archivo en directorio actual
:help netrw-bookmark → documentación completa
```

---

### 6. Configuración de netrw

```lua
-- Quitar el banner de netrw (más limpio)
vim.g.netrw_banner = 0

-- Estilo de listado (0=thin, 1=long, 2=wide, 3=tree)
vim.g.netrw_liststyle = 3  -- estilo árbol

-- Abrir archivos en split vertical
vim.g.netrw_altv = 1

-- Ancho del explorador lateral
vim.g.netrw_winsize = 25

-- Ocultar archivos por patrón
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]] -- oculta dotfiles
vim.g.netrw_hide = 1

-- Usar el comando - para abrir netrw en el directorio del archivo
vim.keymap.set("n", "-", "<cmd>Explore<CR>", { desc = "Abrir netrw" })
```

---

## PARTE 2: `:help` — Sistema de Ayuda

### 7. ¿Por Qué `:help` es el Mejor Sistema de Ayuda?

Vim tiene documentación hipervinculada, navegable, con tags, y con ejemplos. Es como una wiki offline integrada.

```text
:help                 → índice general de ayuda
:help {tema}          → ayuda sobre {tema}
:help :set            → ayuda sobre el comando :set
:help 'number'        → ayuda sobre la opción number
:help CTRL-W          → ayuda sobre Ctrl-w
:help i_CTRL-R        → ayuda sobre Ctrl-r en Insert mode
:help v_o             → ayuda sobre 'o' en Visual mode
:help /pattern        → ayuda sobre búsqueda
:help motion.txt      → documentación de motions
```

---

### 8. Navegar en :help

```text
Ctrl-]                → seguir enlace (tag) bajo el cursor
Ctrl-t / Ctrl-o       → volver atrás
:help {tag}           → saltar a un tag específico
/patrón               → buscar dentro del documento de ayuda
q                     → cerrar ventana de ayuda
```

```text
La ayuda se abre en una ventana nueva.
Puedes tratarla como cualquier buffer:
- Buscar con /
- Navegar con hjkl
- Seguir enlaces con Ctrl-]
```

---

### 9. Sintaxis de Tags de Ayuda

```text
Los tags tienen formato especial entre | o *:

|:set|                 → referencia al comando :set
|'number'|             → referencia a la opción number (con comillas)
|i_CTRL-R|             → referencia a Ctrl-R en Insert mode
|c_CTRL-R|             → referencia a Ctrl-R en Command-line mode
|v_o|                  → referencia a 'o' en Visual mode
|motion.txt|           → archivo de documentación
|usr_01.txt|           → manual de usuario, capítulo 1
```

**Regla de tags**:
```text
Prefijo    Modo
────────────────
(sin)      Normal mode
v_         Visual mode
i_         Insert mode
c_         Command-line mode
t_         Terminal mode
```

---

### 10. Búsquedas Útiles en :help

```text
:help CTRL-W            → todos los comandos de ventana
:help windows.txt       → documentación completa de ventanas
:help netrw             → documentación completa de netrw
:help quickref          → referencia rápida de comandos
:help tips              → tips y trucos
:help change.txt        → documentación de cambios
:help pattern.txt       → documentación de patrones (regex)
:help options           → todas las opciones
:help vim-differences   → diferencias Vim vs Vi
```

---

### 11. Trucos de :help

```text
:help {comando}         → ayuda sobre comando :{comando}
:helpgrep {patrón}      → buscar {patrón} en TODA la documentación
:cwindow                → abrir resultados de :helpgrep
:K                      → buscar palabra bajo el cursor en la ayuda (Normal mode)
```

```text
Ejemplo — buscar documentación sobre autocomandos:
:helpgrep autocommand
:cwindow
→ navegas los resultados y saltas a cada uno
```

**Mapping útil**:
```lua
-- Abrir ayuda con <leader>h
vim.keymap.set("n", "<leader>h", "<cmd>help<Space>", { desc = "Abrir ayuda" })
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────┐
│ NETRW                                               │
│                                                     │
│ :Explore / :Ex     → abrir explorador               │
│ :Vexplore / :Vex   → split vertical                 │
│ :Sexplore / :Sex   → split horizontal               │
│ -                  → explorador dir actual          │
│ %                  → crear archivo                  │
│ d                  → crear directorio               │
│ D                  → eliminar                       │
│ R                  → renombrar                      │
│ i                  → cambiar estilo                 │
│                                                     │
│ :HELP                                               │
│                                                     │
│ :help {tema}       → buscar ayuda                   │
│ Ctrl-]             → seguir enlace                  │
│ Ctrl-t             → volver atrás                   │
│ :helpgrep {patrón} → buscar en toda la ayuda        │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Abro netrw con `:Explore` o `:e .`
- [ ] Navego directorios con Enter y `-` (subir)
- [ ] Cambio estilo de listado con `i`
- [ ] Creo, renombro y elimino archivos desde netrw (`%`, `R`, `D`)
- [ ] Uso `:help` para consultar comandos y opciones
- [ ] Sigo enlaces en :help con `Ctrl-]` y vuelvo con `Ctrl-t`
- [ ] Busco en la documentación con `:helpgrep`
- [ ] Tengo configurado netrw con estilo árbol y sin banner

---

## 🎮 Ejercicio Rápido

```text
1. :Explore               → abre netrw en el directorio actual
2. Navega con hjkl y Enter
3. i i i                  → cambia estilos (thin → long → wide → tree)
4. d                      → crea un directorio "prueba"
5. %                      → crea un archivo "test.txt" dentro
6. R                      → renombra "test.txt" a "demo.txt"
7. D                      → elimina "demo.txt" (confirma)
8. -                      → navega al directorio padre

9. :help windows.txt      → abre ayuda de ventanas
10. /resize               → busca "resize" en la ayuda
11. Ctrl-]                → sigue el enlace bajo el cursor
12. Ctrl-t                → vuelve atrás
13. :q                    → cierra la ayuda
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [💻 Ir a Prácticas](../2-practicas/README.md)
