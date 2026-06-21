# Semana 10: Proyecto Final

## 🎯 Objetivos

- Consolidar todos los conocimientos adquiridos en el bootcamp
- Construir una configuración de Neovim completa y personalizada desde cero
- Publicar los dotfiles en GitHub con documentación profesional
- Demostrar fluidez en la edición con Vim en un proyecto real
- Presentar y defender tu configuración ante pares

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Planificación de la configuración | 1h | Teoría |
| Desarrollo de la configuración | 4h | Proyecto |
| Documentación y publicación | 1.5h | Proyecto |
| Code review entre pares | 0.5h | Evaluación |
| Presentación final | 1h | Evaluación |

## 📦 Proyecto Final

Construye tu configuración de Neovim personalizada que incluya:

### Requisitos Mínimos (Aprobación 70%)

1. **Estructura modular**: init.lua + lua/ con separación por responsabilidades
2. **Gestor de plugins**: lazy.nvim con lazy-loading configurado
3. **LSP**: Al menos 2 language servers configurados con diagnóstico y autocompletado
4. **Apariencia**: Tema personalizado + statusline + file tree
5. **Git**: Integración con gitsigns y/o fugitive
6. **Keymappings**: Mappings personalizados documentados con descripciones
7. **README.md**: Documentación de instalación y uso en GitHub

### Requisitos Avanzados (Excelencia 100%)

8. **Snippets**: Al menos 10 snippets personalizados para tu lenguaje principal
9. **DAP**: Debugger configurado para tu lenguaje
10. **Treesitter**: Text objects y folding avanzados
11. **Tests**: Configuración para ejecutar tests desde Vim (neotest o similar)
12. **Formateo/Linting**: none-ls o conform.nvim + nvim-lint
13. **Sesiones**: Restauración automática de sesiones
14. **Autocomandos**: Al menos 3 autocmds útiles por filetype
15. **Telescope**: Al menos 5 pickers configurados con keybindings

### Rúbrica de Evaluación Final

| Criterio | Peso | Excelente (100%) | Bueno (80%) | Suficiente (60%) |
|----------|------|-------------------|-------------|-------------------|
| Funcionalidad | 30% | Todo funciona sin errores | 1-2 errores menores | Errores visibles |
| Modularidad | 15% | Estructura profesional con separación clara | Modular pero con acoplamiento | Sin modularidad |
| Plugins | 15% | 10+ plugins con lazy-loading | 7-9 plugins | 5-6 plugins |
| LSP/CMP | 15% | 3+ lenguajes, 4 fuentes cmp | 2 lenguajes, 3 fuentes | 1 lenguaje, 2 fuentes |
| Documentación | 10% | README detallado, screenshots, instrucciones | README funcional | README mínimo |
| Keymappings | 5% | Todos con desc, organizados por categoría | Mayoría con desc | Mappings sin documentar |
| Presentación | 10% | Demo fluido, explica decisiones de diseño | Demo funcional | Demo con titubeos |

## 🎓 Criterios de Graduación

Para obtener el certificado de finalización del bootcamp, debes cumplir:

1. **Asistencia**: 80% de las sesiones completadas
2. **Proyecto semanal**: 9 de 10 proyectos entregados
3. **Evaluaciones**: Promedio ≥ 70% en las 9 evaluaciones semanales
4. **Proyecto final**: ≥ 70% en la evaluación del proyecto final
5. **VimGolf**: Completar 20 desafíos de VimGolf con puntuación > promedio

## 📝 Entregables Finales

1. **Repositorio de dotfiles en GitHub**
   - URL: `github.com/tu-usuario/nvim`
   - README con instrucciones de instalación, screenshots y dependencias
   - Licencia (MIT o similar)

2. **Video demostración** (3-5 minutos)
   - Edición de código en un proyecto real
   - Uso de LSP, autocompletado, debugging
   - Navegación entre archivos con fuzzy finder
   - Operaciones de git desde Vim

3. **Documento de reflexión**
   - ¿Qué fue lo más difícil de aprender?
   - ¿Qué es lo que más usas en tu día a día?
   - ¿Qué te gustaría seguir explorando?

## 🏆 Proyectos de Ejemplo

- [LazyVim](https://github.com/LazyVim/LazyVim) — Distribución de Neovim
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — Configuración de inicio
- [NvChad](https://github.com/NvChad/NvChad) — Distribución con UI
- [AstroNvim](https://github.com/AstroNvim/AstroNvim) — Distribución comunitaria

## 📚 Recursos

- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) — Directorio de plugins
- [Neovim subreddit](https://reddit.com/r/neovim) — Comunidad
- [Neovim Discourse](https://neovim.discourse.group/) — Foro oficial
- [This Week in Neovim](https://this-week-in-neovim.org/) — Newsletter semanal

---

**🎉 ¡Has completado el Bootcamp Vim — Zero to Hero!**

Recuerda: Vim es un viaje de por vida. Sigue practicando, experimentando y compartiendo tus aprendizajes con la comunidad.
