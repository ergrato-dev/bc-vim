# 📋 Registro del Sistema y Portapapeles

## 🎯 Objetivos

- Entender `"+` (clipboard) y `"*` (primary selection) y su diferencia
- Copiar y pegar entre Vim y otras aplicaciones del sistema
- Configurar Vim para usar el portapapeles del sistema por defecto
- Resolver problemas comunes de clipboard en diferentes plataformas

---

## 📋 Contenido

### 1. `"+` vs `"*`: La Diferencia

En sistemas X11 (Linux), existen dos "portapapeles":

```text
"+  → CLIPBOARD (Ctrl+C / Ctrl+V tradicional)
"*  → PRIMARY selection (seleccionar con ratón + botón central)

Windows / macOS:
"+  = "*  → ambos apuntan al mismo portapapeles del sistema
```

```text
Ejemplo en Linux:

1. Seleccionas texto con el ratón en Firefox → va a "*
2. Ctrl+C en Firefox → va a "+

En Vim:
"*p  → pega lo seleccionado con ratón (PRIMARY)
"+p  → pega lo copiado con Ctrl+C (CLIPBOARD)
```

---

### 2. Usar el Portapapeles del Sistema

```text
"+yy       → copia línea al portapapeles del sistema (Ctrl+C)
"+dd       → corta línea al portapapeles del sistema
"+p        → pega desde portapapeles del sistema (Ctrl+V)
"+P        → pega antes del cursor

"*yy       → copia a selección primaria
"*p        → pega desde selección primaria
```

```text
Ejemplo — copiar código de Vim a navegador:
1. "+yip     → copia párrafo al clipboard del sistema
2. Alt+Tab   → cambia a navegador
3. Ctrl+V    → pega en el navegador
```

```text
Ejemplo — pegar texto del navegador a Vim:
1. Seleccionas en navegador, Ctrl+C
2. Alt+Tab a Vim
3. "+P       → pega el texto EN Vim (usa +, no *)
```

---

### 3. Verificar Soporte de Clipboard

```text
:checkhealth provider      → en Neovim
:echo has('clipboard')     → en Vim/Neovim
:version                   → busca "+clipboard" o "-clipboard"

Si ves "-clipboard", Vim se compiló sin soporte.
Si ves "+clipboard", tienes soporte.
```

```bash
# Neovim: verificar con healthcheck
nvim +"checkhealth provider" +q

# Vim: verificar
vim --version | grep clipboard
```

**Soluciones si no hay soporte**:
```bash
# Linux: instalar Vim con soporte de X11
sudo apt install vim-gtk3        # Debian/Ubuntu
sudo pacman -S gvim              # Arch
brew install vim                 # macOS (ya incluye soporte)

# O usar Neovim (casi siempre incluye soporte)
```

---

### 4. Configurar portapapeles como Default

```lua
-- Usar el portapapeles del sistema por defecto
vim.opt.clipboard = "unnamedplus"  -- usa "+ (clipboard del sistema)

-- Ahora y, d, p usan "+ automáticamente:
-- yiw → copia palabra al portapapeles del sistema
-- dd  → corta línea al portapapeles del sistema
-- p   → pega desde portapapeles del sistema
```

```lua
-- Alternativa: usar unnamed (más limitado)
vim.opt.clipboard = "unnamed"      -- usa "* (solo funciona en X11)

-- Usar ambos:
vim.opt.clipboard = "unnamed,unnamedplus"
```

**Precaución**: Con `unnamedplus`, cada `x` y `dd` sobrescribe tu portapapeles del sistema. Puede ser molesto si copiaste algo importante fuera de Vim.

```lua
-- Solución: solo yank al sistema, delete al "" local
-- Esto requiere no usar unnamedplus y hacer mapeos manuales:
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copiar al sistema" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copiar selección al sistema" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Pegar del sistema" })
```

---

### 5. Otros Registros de Sistema

```text
"~    → registro de "drop" (arrastrar y soltar texto en Vim GUI)
".    → último texto insertado (útil para repetir inserciones)
"=    → registro de expresión (evalúa expresiones Vimscript/Lua)
```

```text
Registro de expresión "=:
1. En Insert mode: Ctrl-r =
2. Escribe: 2+2
3. Enter → inserta "4"

Otros ejemplos de expresión:
Ctrl-r = system('date')    → inserta salida de comando (Neovim)
Ctrl-r = expand('%:p')     → inserta ruta completa del archivo
```

---

### 6. Interacción con el Sistema Operativo

#### Linux (X11/Wayland)

```bash
# Si el clipboard no funciona en Wayland:
sudo apt install wl-clipboard    # Wayland clipboard tools

# En Neovim, asegúrate de tener:
# xclip o xsel (X11) o wl-copy/wl-paste (Wayland)
```

#### macOS

```lua
-- Generalmente funciona out-of-the-box
-- Si tienes problemas:
vim.opt.clipboard = "unnamedplus"
```

#### Windows

```lua
-- Funciona nativamente en la mayoría de casos
-- Clipboard = "+ (ya es el default en Windows para muchas builds)
```

#### WSL (Windows Subsystem for Linux)

```bash
# Necesitas un bridge entre WSL y Windows clipboard
# Opción 1: win32yank
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
unzip /tmp/win32yank.zip -d ~/bin/win32yank

# Opción 2: Neovim + win32yank automático
# en init.lua:
vim.g.clipboard = {
  name = 'win32yank-wsl',
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
}
```

---

### 7. Pequeño Registro de Delete (`"-`)

Registro especial para deletes de menos de una línea:

```text
x       → carácter va a "" y a "-
d w     → palabra va a "" y a "-
D       → desde cursor a fin de línea → "" y "-

Pero:
d d     → línea completa → va a "" y a "1 (no a "-)
d 3 j   → 3 líneas → va a "" y a "1 (no a "-)
```

```text
"-p     → pega el último "pequeño delete"
        → útil si hiciste x y luego un delete grande,
          pero quieres recuperar ese carácter
```

---

## 💡 Resumen

```text
┌─────────────────────────────────────────────────────┐
│ PORTAPAPELES DEL SISTEMA                              │
│                                                       │
│ "+  → clipboard (Ctrl+C / Ctrl+V)                    │
│ "*  → primary selection (selección ratón)            │
│                                                       │
│ vim.opt.clipboard = "unnamedplus"                    │
│   → conecta "" con "+ (y/d/p usan sistema)           │
│                                                       │
│ "+y{motion}  → copiar al sistema                     │
│ "+p          → pegar del sistema                     │
│ :checkhealth → verificar soporte                     │
│ :echo has('clipboard') → 1 = soportado              │
└─────────────────────────────────────────────────────┘
```

---

## ✅ Checklist de Verificación

- [ ] Entiendo la diferencia entre `"+` y `"*` en Linux
- [ ] Copio texto de Vim a otras aplicaciones con `"+y`
- [ ] Pego texto de otras aplicaciones a Vim con `"+p`
- [ ] Verifiqué `:echo has('clipboard')` da 1
- [ ] Configuré clipboard (opcional) con `unnamedplus`
- [ ] Usé `Ctrl-r +` en Insert mode para pegar del sistema

---

## 🎮 Ejercicio Rápido

```text
1. Abre Vim
2. "+yip           → copia un párrafo al portapapeles
3. Alt+Tab a un navegador o editor de texto
4. Ctrl+V          → verifica que se pegó
5. Copia texto del navegador (Ctrl+C)
6. Alt+Tab a Vim
7. "+p             → verifica que se pega el texto externo
8. "*yip           → copia a primary selection
9. En Linux: botón central del ratón en otra app
   → verifica que se pega lo copiado
```

---

## ➡️ Siguiente

[03 - Macros: Grabación y Ejecución](03-macros-grabacion.md)
