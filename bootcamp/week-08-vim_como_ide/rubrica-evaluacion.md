# Rúbrica de Evaluación - Semana 8: Vim como IDE

## Evidencia de Conocimiento (30%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| LSP en Neovim | Explica protocolo, relación cliente-servidor, y configuración | Explica concepto y configuración | Describe vagamente | No sabe qué es |
| Fuentes de cmp | Describe LSP, buffer, path, snippets y cómo priorizarlas | Describe 3 fuentes | Describe 1-2 | No las conoce |
| Treesitter vs regex | Explica AST, consultas, y ventajas sobre regex | Describe la diferencia conceptual | Solo sabe que es "mejor" | No entiende la diferencia |

## Evidencia de Desempeño (40%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| Diagnosticar errores | Encuentra y corrige todos los errores usando LSP | Encuentra la mayoría | Encuentra con ayuda | No usa LSP |
| Go-to-definition / hover | Navega definiciones fluidamente, usa hover | Usa ambas features | Usa solo una | No usa |
| Autocompletado | Usa cmp efectivamente con todas las fuentes | Usa cmp con LSP+path | Solo usa autocompletado básico | No configurado |
| Refactor (rename) | Renombra variables con LSP rename correctamente | Renombra con error menor | Intenta sin éxito | No usa |

## Evidencia de Producto (30%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| Configuración LSP | Funciona con diagnóstico, hover, definition, rename | Funciona con 3/4 features | Funciona con 1-2 features | No funciona |
| Configuración cmp | 4 fuentes configuradas, icons, documentación | 3 fuentes | 2 fuentes | No funciona |
| Treesitter | Parsers instalados, folding, text objects aumentados | Parsers instalados, resaltado funcional | Solo parsers | No configurado |
| DAP | Debugger funcional con breakpoints y watch | Debugger funcional sin extras | Configurado pero no probado | No configurado |
| Snippets | 5+ snippets personalizados | 3-4 snippets | 1-2 snippets | Sin snippets |
