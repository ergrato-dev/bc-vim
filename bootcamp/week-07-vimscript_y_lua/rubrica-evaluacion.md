# Rúbrica de Evaluación - Semana 7: Vimscript y Lua

## Evidencia de Conocimiento (30%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| vim.opt vs vim.g vs vim.bo | Diferencia los 4 ámbitos con ejemplos | Diferencia 3 | Diferencia 2 | No los diferencia |
| Augroup y autocmds | Explica el problema de autocmds duplicados y cómo augroup lo resuelve | Describe el concepto básico | Solo sabe crear autocmds | No sabe qué es un augroup |
| API de keymaps | Compara vim.keymap.set con :map, usa desc y opts | Usa set() sin opciones avanzadas | Usa :map desde Lua | No sabe crear mappings |

## Evidencia de Desempeño (40%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| User command en vivo | Crea comando funcional con argumentos en < 5 min | Crea comando funcional sin args | Completa con ayuda | No puede crear |
| Autocmd en vivo | Crea autocmd con augroup correctamente | Crea autocmd sin augroup | Completa con ayuda | No puede crear |

## Evidencia de Producto (30%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| Estructura modular | Exactamente la estructura propuesta, todos los archivos funcionales | Estructura similar con 80% de archivos | 50% de estructura | Sin estructura modular |
| Conversión Vimscript → Lua | Toda la configuración en Lua, sin vim.cmd innecesarios | Mayoría en Lua | Lua parcial con vim.cmd | Sin conversión |
| Keymaps con descripciones | Todos los mappings tienen desc para which-key | La mayoría con desc | Pocos con desc | Sin descripciones |
| Funciones de utilidad | 3+ funciones reutilizables en util/ | 1-2 funciones | Función básica | Sin funciones |
