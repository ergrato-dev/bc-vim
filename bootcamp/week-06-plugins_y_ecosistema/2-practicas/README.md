# 💪 Prácticas - Semana 06

## 🎯 Objetivo

Instalar y configurar el ecosistema de plugins: gestor lazy.nvim, fuzzy finder, file tree, git, statusline y tema.

---

## 📋 Lista de Ejercicios

| # | Ejercicio | Duración | Tema |
|---|-----------|----------|------|
| 1 | [Instalar lazy.nvim](01-ejercicio-lazy/) | 1h | Bootstrap, estructura modular, :Lazy |
| 2 | [Fuzzy Finder y File Tree](02-ejercicio-telescope-tree/) | 1h | telescope, neo-tree |
| 3 | [Git y Statusline](03-ejercicio-git-statusline/) | 45 min | gitsigns, fugitive, lualine |
| 4 | [Tema y which-key](04-ejercicio-tema-whichkey/) | 45 min | Colorschemes, which-key, optimización |

**Tiempo total estimado:** 3 horas 30 minutos

---

## 📖 Metodología

1. **Lee** las instrucciones
2. **Configura** los archivos en `~/.config/nvim/lua/plugins/`
3. **Ejecuta** `:Lazy sync` para instalar
4. **Prueba** cada plugin con los keymaps
5. **Verifica** que todo funciona

> 💡 **Importante**: Esta semana modificarás tu configuración real de Neovim. Haz backup si tienes algo valioso: `cp -r ~/.config/nvim ~/.config/nvim.backup`.

---

## ✅ Criterios de Completitud

- [ ] lazy.nvim bootstrap funcionando
- [ ] Estructura modular en `lua/plugins/`
- [ ] telescope busca archivos, texto y buffers
- [ ] neo-tree explora el proyecto
- [ ] gitsigns muestra cambios en gutter
- [ ] lualine muestra modo, rama y posición
- [ ] which-key muestra mappings disponibles

---

## 🚀 ¡Comienza!

1. [Ejercicio 01: Instalar lazy.nvim →](01-ejercicio-lazy/README.md)
