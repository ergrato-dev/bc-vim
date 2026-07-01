# 🎯 Proyecto Semana 08: IDE Completo para tu Lenguaje

## 📋 Descripción

Configurarás Neovim como un IDE completo para un lenguaje específico de tu elección (Python, JavaScript, Lua, Rust, Go, etc.), integrando LSP, autocompletado, Treesitter, debugging y snippets.

---

## 🎯 Objetivos

- ✅ LSP con diagnóstico en tiempo real, hover, go-to-definition, rename
- ✅ Autocompletado con 4 fuentes (LSP, buffer, path, snippets)
- ✅ Treesitter con resaltado semántico, text objects y folding
- ✅ DAP configurado para debugging con breakpoints
- ✅ Terminal integrado para ejecución
- ✅ 5+ snippets personalizados para tu lenguaje

---

## 📦 Requisitos Funcionales

### RF-01: LSP y Mason (25%)

- Language server instalado vía mason para tu lenguaje
- Diagnóstico en tiempo real funcional
- Keymaps: `gd` (definición), `K` (hover), `<leader>rn` (rename), `<leader>ca` (code action)
- `[d` / `]d` navegan errores

### RF-02: Autocompletado (20%)

- nvim-cmp con al menos 4 fuentes configuradas
- Íconos visibles en el menú
- Tab/S-Tab para navegar, Enter para aceptar
- Autocompletado en línea de comandos (`:`)

### RF-03: Treesitter (20%)

- Parsers instalados para tu lenguaje
- Resaltado semántico activo
- Text objects funcionales: `daf`, `cif`, `]f`, `[f`
- Folding estructural disponible

### RF-04: Debugging (15%)

- nvim-dap configurado para tu lenguaje
- Breakpoints funcionales
- Step over/into/out configurados
- nvim-dap-ui (opcional pero recomendado)

### RF-05: Terminal y Snippets (20%)

- Terminal integrado accesible con `<leader>tt`
- Atajo para ejecutar archivo actual: `<leader>tp`
- 5+ snippets personalizados en `lua/snippets/`
- Snippets con tabstops y placeholders

---

## 🏗️ Estructura del Proyecto

```
3-proyecto/
├── README.md                # Este archivo
├── starter/
│   └── ide-config.lua       # Ejemplo de configuración IDE
└── (tu entregable)
    └── screenshots/          # Capturas de tu IDE funcionando
```

---

## 📝 Instrucciones

### Paso 1: Elegir Lenguaje

Elige UN lenguaje para enfocarte. Recomendados: Python, JavaScript/TypeScript, Lua, Rust.

### Paso 2: Configurar Plugins

Implementa los plugins de esta semana en tu `lua/plugins/lsp.lua` (y `dap.lua`).

### Paso 3: Crear Snippets

Crea `lua/snippets/{lenguaje}.lua` con al menos 5 snippets.

### Paso 4: Verificar Funcionalidad

Crea un archivo de prueba en tu lenguaje y verifica:
- ¿LSP muestra errores?
- ¿Autocompletado sugiere?
- ¿Hover funciona?
- ¿Puedes debuggear?

### Paso 5: Documentar

Capturas de pantalla mostrando:
- Diagnósticos LSP en tiempo real
- Menú de autocompletado con íconos
- Treesitter resaltado + text objects
- DAP con breakpoint

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **LSP y Mason** (25%) | |
| Language server conectado y funcional | 10 |
| Diagnóstico en tiempo real | 5 |
| Keymaps LSP funcionales | 10 |
| **Autocompletado** (20%) | |
| 4 fuentes configuradas | 10 |
| Íconos y formato | 5 |
| Navegación con Tab | 5 |
| **Treesitter** (20%) | |
| Parsers instalados con resaltado | 10 |
| Text objects (daf, cif) | 5 |
| Navegación ( ]f, [f ) | 5 |
| **Debugging** (15%) | |
| DAP configurado con breakpoints | 10 |
| Step over/into funcional | 5 |
| **Terminal + Snippets** (20%) | |
| Terminal y ejecución | 10 |
| 5+ snippets personalizados | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: LSP y Mason](../1-teoria/01-lsp-mason.md)
- [Teoría: Autocompletado](../1-teoria/02-autocompletado-cmp.md)
- [Teoría: Treesitter](../1-teoria/03-treesitter.md)
- [Teoría: Debugging](../1-teoria/04-dap-debugging.md)
- [Teoría: Terminal y Snippets](../1-teoria/05-terminal-y-snippets.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 08](../README.md)
