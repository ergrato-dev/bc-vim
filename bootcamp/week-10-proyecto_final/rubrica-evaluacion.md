# Rúbrica de Evaluación - Semana 10: Proyecto Final

## Evaluación Integral del Bootcamp

### 1. Funcionalidad (30%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| LSP | 3+ lenguajes, diagnóstico, hover, definition, rename, code actions | 2 lenguajes con 4/5 features | 1 lenguaje con features básicos | No funciona |
| Autocompletado | 4 fuentes (LSP, buffer, path, snippets) con documentación | 3 fuentes | 2 fuentes | No configurado |
| Plugins | Todos cargan sin errores, lazy-loaded correctamente | 1-2 errores de carga | Errores visibles | Múltiples errores |
| Keymappings | Todos los mappings funcionan sin conflictos | 1-2 conflictos | Conflictos visibles | Mappings rotos |

### 2. Modularidad (15%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| Estructura de archivos | core/, plugins/, util/ bien separados | Separación parcial | 2-3 archivos | 1 archivo monolítico |
| Separación de responsabilidades | Cada archivo tiene un propósito claro | Mayoría bien separado | Mezcla de responsabilidades | Sin separación |

### 3. Plugins (15%)

| Criterio | Puntos |
|----------|--------|
| 10+ plugins con lazy-loading configurado | 100% |
| 8-9 plugins con lazy-loading | 80% |
| 6-7 plugins | 60% |
| < 6 plugins | 40% |

Bonus por diversidad: fuzzy finder, file tree, git, statusline, utilidades, UI, edición, LSP

### 4. LSP/CMP (15%)

| Criterio | Puntos |
|----------|--------|
| 3+ lenguajes, 4 fuentes cmp, mason configurado | 100% |
| 2 lenguajes, 3 fuentes cmp | 80% |
| 1 lenguaje, 2 fuentes cmp | 60% |
| Sin LSP o solo 1 fuente | 40% |

### 5. Documentación (10%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| README.md | Instrucciones claras, screenshots, dependencias, estructura explicada | Instrucciones funcionales | README mínimo | Sin README |
| Comentarios en código | Archivos clave comentados explicando decisiones | Algunos archivos comentados | Comentarios escasos | Sin comentarios |

### 6. Keymappings (5%)

| Criterio | Puntos |
|----------|--------|
| Todos con descripción, organizados por categoría, which-key | 100% |
| Mayoría con descripción, organizados | 80% |
| Mappings sin descripciones | 60% |
| Sin mappings personalizados | 0% |

### 7. Presentación (10%)

| Criterio | Excelente (100%) | Bueno (80%) | Suficiente (60%) | Insuficiente (0%) |
|----------|------------------|-------------|-------------------|--------------------|
| Demo en vivo | Fluido, muestra todas las features, explica decisiones | Demo funcional, cubre la mayoría | Demo con titubeos | No puede hacer demo |
| Reflexión | Responde las 3 preguntas con profundidad | Responde 2 | Responde 1 | No entregada |

## Cálculo de Nota Final

```
Nota Final = (Funcionalidad × 0.30) + (Modularidad × 0.15) + (Plugins × 0.15) +
             (LSP/CMP × 0.15) + (Documentación × 0.10) + (Keymappings × 0.05) +
             (Presentación × 0.10)
```

**Aprobación**: ≥ 70%
**Excelencia**: ≥ 90%
