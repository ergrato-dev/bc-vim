# 🎨 Ejercicio 04: Tema y which-key

## 🎯 Objetivo

Configurar un colorscheme profesional y which-key.nvim para descubrir mappings. Medir y optimizar tiempo de inicio.

**Duración estimada:** 45 minutos

---

## 📝 Instrucciones

### Paso 1: Instalar which-key

```bash
nvim ~/.config/nvim/lua/plugins/tools.lua
```

Añadir:

```lua
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "Find / Telescope" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffers" },
      { "<leader>w", group = "Window" },
      { "<leader>e", group = "Explorador" },
    },
  },
}
```

### Paso 2: Explorar Temas Alternativos

Añade un segundo tema en `lua/plugins/ui.lua`:

```lua
{
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,       -- no cargar al inicio
  opts = {
    flavour = "mocha",
    integrations = {
      telescope = true,
      lualine = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- NO aplicar al inicio, solo instalar
  end,
}
```

### Paso 3: Instalar

```text
:Lazy sync
```

---

## 🎮 Ejercicios

### Ejercicio A: which-key en Acción

```text
1. Presiona <leader>      → espera 500ms
   which-key muestra menú con grupos:
   f → Find/Telescope
   g → Git
   b → Buffers
   w → Window
   e → Explorador

2. Presiona <leader>f     → muestra sub-mappings:
   f → Archivos
   g → Grep
   b → Buffers
   h → Ayuda
   r → Recientes
   s → Palabra

3. Presiona cualquier otra tecla para cancelar
```

### Ejercicio B: Cambiar Tema

```text
1. :colorscheme catppuccin   → cambia a catppuccin
2. :colorscheme onedark       → vuelve a onedark

3. <leader>fh                 → Telescope help_tags
4. Escribe: colorscheme       → busca documentación
5. Explora temas disponibles en la ayuda
```

### Ejercicio C: Medir Tiempo de Inicio

```bash
# Medir tiempo de inicio
nvim --startuptime /tmp/nvim-startup.log +q

# Abrir el log
nvim /tmp/nvim-startup.log

# Buscar los plugins que más tardan:
G                → final del archivo
/-----            → buscar separadores de sección
```

```text
Dentro del log:
Las primeras columnas muestran tiempo en ms.
Busca líneas con nombres de plugins.
Ordena mentalmente los que más tardan.
```

### Ejercicio D: Perfilado con :Lazy

```text
1. :Lazy profile      → perfil de carga de plugins
2. Revisa la columna "Time" → plugins más lentos
3. Identifica:
   - ¿Hay algún plugin que tarde > 50ms?
   - ¿Podrías cambiar su evento de carga?
```

### Ejercicio E: Optimizar si es Necesario

```text
Si tu tiempo de inicio es > 200ms:

1. Identifica plugins con lazy = false
   ¿Realmente necesitan cargar al inicio?
   - Tema: SÍ (necesita lazy = false)
   - lualine: SÍ
   - Los demás: probablemente NO

2. Cambia event:
   event = "VeryLazy" en lugar de lazy = false (si no es esencial)

3. Usa cmd/keys:
   cmd = { "Comando" } para plugins que solo usas bajo demanda

4. Si instalaste muchos plugins explorando:
   enabled = false en los que no uses
```

### Ejercicio F: Lockfile

```bash
# Verifica que lazy-lock.json existe
ls -la ~/.config/nvim/lazy-lock.json

# Si tienes tus dotfiles en git:
cd ~/.config/nvim
git add lazy-lock.json
git commit -m "nvim: bloquear versiones de plugins"
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿which-key muestra menú al presionar <leader>? | | |
| ¿Los mappings están agrupados por categoría? | | |
| ¿Probaste al menos 2 temas? | | |
| ¿Mediste tiempo de inicio con --startuptime? | | |
| ¿Usaste :Lazy profile? | | |
| ¿lazy-lock.json está commiteado? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [🚀 Ir al Proyecto](../../3-proyecto/README.md)
