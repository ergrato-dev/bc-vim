# 📝 Ejercicio 02: README y Screenshots

## 🎯 Objetivo

Crear un README profesional para tu configuración y tomar screenshots atractivos.

**Duración estimada:** 1 hora

---

## 📝 Instrucciones

### Paso 1: Estructura del README

```bash
cd ~/.config/nvim
nvim README.md
```

Usa la plantilla de la teoría [02-publicacion-dotfiles.md](../../1-teoria/02-publicacion-dotfiles.md).

### Paso 2: Contenido Mínimo

```text
☐ Título y descripción (1 línea)
☐ Características (lista con emojis)
☐ Requisitos previos (Neovim ≥ 0.9, git, ripgrep, Nerd Font)
☐ Instrucciones de instalación (Linux, macOS, Windows)
☐ Estructura de archivos (árbol)
☐ Atajos principales (tabla de 8-12 keymaps)
☐ Licencia (MIT recomendada)
```

### Paso 3: Tomar Screenshots

```bash
mkdir -p ~/.config/nvim/screenshots
```

Toma capturas de:

1. **Vista general**: editor con tema, lualine, código
2. **Autocompletado**: cmp con menú e íconos
3. **Búsqueda**: telescope find_files o live_grep
4. **File tree**: neo-tree con git status
5. **LSP hover**: K sobre una función mostrando documentación

Guarda como:
```
screenshots/overview.png
screenshots/cmp.png
screenshots/telescope.png
screenshots/neotree.png
screenshots/lsp-hover.png
```

### Paso 4: Insertar en README

```markdown
## 🎨 Screenshots

### Vista general
![Dashboard](./screenshots/overview.png)

### Autocompletado con nvim-cmp
![Autocompletado](./screenshots/cmp.png)
```

---

## 📊 Autoevaluación

| Pregunta | Sí | No |
|----------|----|----|
| ¿README tiene título y descripción? | | |
| ¿Instrucciones de instalación claras? | | |
| ¿Tabla de atajos principales? | | |
| ¿3+ screenshots? | | |
| ¿Licencia incluida? | | |

---

## 🔗 Navegación

[← Volver a Prácticas](../README.md) | [Siguiente: Demo y Grabación →](../03-ejercicio-demo/README.md)
