# Guía de Contribución

¡Gracias por querer mejorar el Bootcamp Vim! Este documento explica cómo reportar errores, proponer mejoras y enviar Pull Requests.

---

## Código de Conducta

Todas las contribuciones deben seguir el [Código de Conducta](../CODE_OF_CONDUCT.md). Las contribuciones irrespetuosas o fuera del alcance serán cerradas sin discusión.

---

## ¿Qué tipos de contribución aceptamos?

| Tipo | Bienvenido |
|------|-----------|
| Corrección de errores tipográficos | ✅ |
| Corrección de comandos de Vim incorrectos | ✅ |
| Mejora de explicaciones existentes | ✅ |
| Nuevos ejercicios dentro de una semana existente | ✅ previa discusión |
| Nuevos recursos en `4-recursos/` | ✅ |
| Adición de entradas al glosario | ✅ |
| Nuevas semanas o reestructuración del currículo | 🔶 solo con issue previo |
| Cambios estéticos sin impacto pedagógico | ❌ |
| Traducciones (más idiomas) | 🔶 consultar primero |

---

## Reportar un Error

1. Busca primero en [Issues existentes](https://github.com/ergrato-dev/bc-vim/issues) para evitar duplicados
2. Abre un nuevo issue usando la plantilla "Bug / Error de contenido"
3. Incluye:
   - **Archivo exacto**: `bootcamp/week-03-edicion_eficiente/1-teoria/02-visual-modes.md`
   - **Qué dice actualmente**: cita textual
   - **Qué debería decir**: la corrección propuesta
   - **Por qué es un error**: si no es obvio, explícalo brevemente

---

## Proponer una Mejora

1. Abre un issue describiendo la mejora antes de implementarla
2. Espera feedback — algunas mejoras pueden estar ya en progreso o fuera del alcance del bootcamp
3. Una vez aprobada la idea, procede con la Pull Request

---

## Enviar una Pull Request

### 1. Fork y clone

```bash
git clone https://github.com/TU-USUARIO/bc-vim.git
cd bc-vim
git checkout -b mejora/descripcion-corta
```

### 2. Convenciones de naming

Sigue las convenciones existentes al crear o modificar archivos:

**Semanas**
```
bootcamp/week-XX-nombre_en_snake_case/
```
Ejemplo: `week-07-vimscript_y_lua`

**Secciones dentro de cada semana**
```
0-assets/     → imágenes y diagramas
1-teoria/     → material teórico
2-practicas/  → ejercicios guiados
3-proyecto/   → proyecto semanal
4-recursos/   → recursos externos
5-glosario/   → términos clave
```

**Archivos de teoría**
```
01-nombre-del-tema.md
02-otro-tema.md
```
Numerados con dos dígitos, nombres en kebab-case, en español.

**Ejercicios**
```
2-practicas/01-nombre-ejercicio/README.md
2-practicas/02-otro-ejercicio/README.md
```

### 3. Convenciones de Markdown

- Usa `#` para el título principal (uno por archivo)
- Usa `##` para secciones, `###` para subsecciones
- Los bloques de código deben tener su lenguaje especificado:

```markdown
\`\`\`vim
:w
\`\`\`

\`\`\`lua
vim.opt.number = true
\`\`\`

\`\`\`bash
nvim --version
\`\`\`
```

- Los comandos de Vim en línea van entre backticks: `:w`, `ciw`, `<leader>ff`
- Las rutas de archivo van en código: `bootcamp/week-01/README.md`
- Usa el español como idioma principal del contenido

### 4. Estructura de un ejercicio

Cada ejercicio en `2-practicas/` debe tener un `README.md` con esta estructura:

```markdown
# Ejercicio N: Nombre del Ejercicio

## Objetivo

Una frase clara de qué aprenderá el estudiante.

## Instrucciones

Pasos numerados, uno a uno.

## Criterios de Éxito

- [ ] El estudiante puede hacer X
- [ ] El resultado tiene la forma Y
- [ ] Tiempo estimado: N minutos

## Notas

Pistas opcionales o contexto adicional.
```

### 5. Commit y PR

Sigue el formato [Conventional Commits](https://www.conventionalcommits.org/) en inglés:

```
docs(week-03): fix incorrect range syntax in substitutions
feat(week-05): add macro exercise for log formatting
fix(week-08): correct lspconfig setup example for pyright
```

Abre la PR con:
- Título descriptivo
- Referencia al issue relacionado (`Closes #123`)
- Descripción de qué cambiaste y por qué

---

## Flujo de Revisión

1. Un maintainer revisará la PR en un plazo de 7 días
2. Puede haber solicitudes de cambios — respóndelas en la misma PR
3. Una vez aprobada, el maintainer hace el merge

Las PRs sin actividad durante 30 días se cierran automáticamente.

---

## Preguntas

Para preguntas sobre el proceso de contribución, usa [GitHub Discussions](https://github.com/ergrato-dev/bc-vim/discussions) con la categoría "Contributing".
