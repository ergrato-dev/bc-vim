# Semana 8: Vim como IDE

## 🎯 Objetivos

- Configurar LSP (Language Server Protocol) con nvim-lspconfig y mason.nvim
- Integrar autocompletado inteligente con nvim-cmp
- Configurar Treesitter para resaltado de sintaxis avanzado
- Instalar y usar un debugger con nvim-dap
- Integrar un terminal dentro de Neovim
- Configurar snippets con LuaSnip

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| LSP: concepto, mason.nvim, nvim-lspconfig | 2h | Teoría + Práctica |
| Autocompletado: nvim-cmp + fuentes | 2h | Teoría + Práctica |
| Treesitter: resaltado y text objects | 1.5h | Teoría + Práctica |
| Debugging: nvim-dap | 1h | Práctica |
| Terminal integrado | 0.5h | Práctica |
| Snippets: LuaSnip | 0.5h | Práctica |
| Evaluación | 0.5h | Evaluación |

## 🔑 Conceptos Clave

- **LSP (Language Server Protocol)**: Protocolo estándar para features de IDE (diagnóstico, autocompletado, go-to-def, hover, refactor)
- **mason.nvim**: Gestor de LSP servers, linters y formatters (como apt/pip para herramientas de desarrollo)
- **nvim-cmp**: Motor de autocompletado extensible con múltiples fuentes
- **Treesitter**: Parser incremental que entiende la sintaxis del código como un AST
- **nvim-dap**: Debug Adapter Protocol para debugging integrado
- **LuaSnip**: Motor de snippets en Lua con soporte para snippets dinámicos

## 💻 Prácticas

1. **LSP para Python/JS/Rust**: Instala y configura el language server de tu lenguaje
2. **Diagnósticos**: Lee y navega errores con `[d`/`]d`, corrige con code actions
3. **Autocompletado**: Configura buffer, path, LSP y snippets como fuentes de cmp
4. **Treesitter**: Instala parsers, nota la diferencia en resaltado de sintaxis
5. **Debugger**: Configura nvim-dap para Python, pon un breakpoint, inspecciona variables
6. **Terminal**: Abre terminal en split, ejecuta tests, copia salida al buffer
7. **Snippets**: Crea y usa snippets para estructuras comunes (if/for/func/class)

## 📦 Proyecto Semanal

Convierte tu configuración de Neovim en un IDE completo para un lenguaje específico (Python, JavaScript, Rust, Go, etc.):

- LSP: diagnósticos en tiempo real, hover, go-to-definition, rename
- Autocompletado: sugerencias contextuales de 4 fuentes
- Treesitter: resaltado, folding, text objects aumentados
- DAP: configuración de debugging con breakpoints y watch
- Terminal: flujo de edición + ejecución integrado
- Snippets: al menos 5 snippets personalizados para tu lenguaje

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Explica qué es LSP y cómo se relaciona con Neovim
- Describe las fuentes de autocompletado y cómo se integran en nvim-cmp
- Diferencia entre regex highlighting y Treesitter highlighting

### Evidencia de Desempeño (40%)
- Demostración: diagnosticar y corregir errores en un archivo de código usando solo herramientas IDE

### Evidencia de Producto (30%)
- Configuración de IDE completa y funcional para el lenguaje elegido
- Captura de pantalla mostrando: LSP diagnóstico, autocompletado, Treesitter, DAP

## 📚 Recursos

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — Configuraciones de LSP
- [mason.nvim](https://github.com/williamboman/mason.nvim) — Gestor de herramientas
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — Motor de autocompletado
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) — Debugger
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) — Snippets en Lua
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — Configuración de referencia

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **LSP** | Language Server Protocol: estándar para features de IDE |
| **mason** | Gestor de instalación de LSP servers, linters y formatters |
| **nvim-cmp** | Motor de autocompletado para Neovim |
| **Treesitter** | Biblioteca de parsing incremental para resaltado y análisis |
| **DAP** | Debug Adapter Protocol: estándar para debugging |
| **Snippet** | Plantilla de código expandible con tabstops |
| **Code action** | Refactorización automática sugerida por el LSP |
| **Hover** | Documentación flotante al pasar sobre un símbolo |
