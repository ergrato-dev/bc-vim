# 🎯 Proyecto Semana 09: Refactorización Multiarchivo

## 📋 Descripción

Realizarás una refactorización real en un proyecto de código usando todo el flujo avanzado: quickfix, arglist, sustituciones batch y fugitive.

---

## 🎯 Objetivos

- ✅ Buscar patrones en múltiples archivos con `:vimgrep`
- ✅ Analizar resultados con quickfix (`:copen`, `:cnext`)
- ✅ Sustituir con confirmación usando `:cfdo`
- ✅ Verificar cambios con segundo `:vimgrep`
- ✅ Versionar cambios con fugitive
- ✅ Documentar cada paso del flujo

---

## 📦 Requisitos Funcionales

### RF-01: Búsqueda Multiarchivo (20%)

Usa `:vimgrep` (o `:grep` con ripgrep) para encontrar todas las ocurrencias de un patrón en un proyecto. Documenta el comando y número de resultados.

### RF-02: Navegación Quickfix (15%)

Abre quickfix con `:copen`, navega con `:cnext`/`:cprev`. Muestra evidencia (captura).

### RF-03: Sustitución Batch (25%)

Usa `:cfdo %s/patrón/reemplazo/gc | update` con confirmación para reemplazar en todos los archivos afectados.

### RF-04: Verificación (15%)

Confirma que el cambio se aplicó correctamente con un segundo `:vimgrep`.

### RF-05: Versionado con Fugitive (15%)

Realiza commits atómicos con mensajes descriptivos usando `:Gcommit`.

### RF-06: Documentación (10%)

Documenta el flujo completo con comandos exactos y explicación de cada paso.

---

## 🏗️ Ejemplo: Refactorización en el Bootcamp

Si usas el bootcamp como proyecto de práctica:

```text
Tarea: Renombrar "NUEVO" → "COMPLETADO" en archivos de teoría

1. :vimgrep /NUEVO/gj bootcamp/**/*.md
   → X resultados en Y archivos

2. :copen → analizar

3. :cfdo %s/NUEVO/COMPLETADO/gc | update
   → confirmar cambios

4. :vimgrep /NUEVO/gj bootcamp/**/*.md
   → 0 resultados ✓

5. :Gstatus → revisar cambios
6. :Gcommit → "docs: completar marcadores de contenido"
```

---

## ✅ Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| **Búsqueda multiarchivo** (20%) | |
| :vimgrep o :grep correcto | 20 |
| **Navegación quickfix** (15%) | |
| :copen/:cnext usado y documentado | 15 |
| **Sustitución batch** (25%) | |
| :cfdo con /gc para confirmación | 15 |
| Cambios correctos en todos los archivos | 10 |
| **Verificación** (15%) | |
| Segundo :vimgrep confirmando 0 resultados | 15 |
| **Versionado** (15%) | |
| Commit descriptivo con :Gcommit | 15 |
| **Documentación** (10%) | |
| Flujo documentado paso a paso | 10 |
| **Total** | **100** |

---

## 📚 Recursos

- [Teoría: Quickfix y grep](../../1-teoria/01-quickfix-y-grep.md)
- [Teoría: Arglist y Batch](../../1-teoria/02-arglist-y-batch.md)
- [Teoría: Búsqueda y Reemplazo Avanzados](../../1-teoria/04-busqueda-y-reemplazo-avanzado.md)
- [Teoría: Fugitive Avanzado](../../1-teoria/05-fugitive-avanzado.md)

---

**Tiempo estimado:** 2 horas

[← Volver a Prácticas](../2-practicas/README.md) | [Volver a la Semana 09](../README.md)
