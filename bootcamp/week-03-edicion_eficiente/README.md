# Semana 3: Edición Eficiente

## 🎯 Objetivos

- Dominar el comando `.` (repetición) para multiplicar la eficiencia
- Usar Visual mode para selecciones complejas
- Aplicar marcas (marks) para navegación rápida entre puntos de interés
- Realizar sustituciones con `:s` y `:g`
- Ejecutar comandos de shell desde Vim con `:!` y `:r !`
- Dominar el comando de cambio de caso (gu, gU, ~)

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| El comando `.` (dot) | 1h | Teoría + Práctica |
| Visual mode (v, V, Ctrl-v) | 1.5h | Teoría + Práctica |
| Marcas (m{a-zA-Z}) | 1h | Teoría |
| Sustituciones (:s y :g) | 1.5h | Teoría + Práctica |
| Cambio de caso y filtros | 1h | Práctica |
| Comandos de shell (:!, :r !) | 1h | Teoría + Práctica |
| Evaluación | 1h | Evaluación |

## 🔑 Conceptos Clave

- **El comando `.`**: Repite el último cambio. Es la razón de ser de Vim.
- **Visual block mode (Ctrl-v)**: Selección rectangular para editar columnas
- **Marcas locales (a-z)**: Por archivo. Marcas globales (A-Z): Entre archivos
- **`:s/patrón/reemplazo/`**: Sustitución en la línea actual
- **`:%s/patrón/reemplazo/g`**: Sustitución en todo el archivo
- **`:g/patrón/comando`**: Ejecuta comando en líneas que coinciden con patrón

## 💻 Prácticas

1. **Dot command drill**: Repite ediciones con `.`, practica cambios que se puedan repetir
2. **Visual block**: Formatea columnas de datos CSV usando Ctrl-v + I / A
3. **Marcas**: Navega por un archivo de 1000 líneas usando marcas locales y globales
4. **Sustituciones**: Refactoriza nombres de variables en un archivo de código
5. **Comandos shell**: Inserta la salida de `ls`, `date`, `git log` en tu archivo

## 📦 Proyecto Semanal

Transforma un archivo de datos sin procesar (raw data) en un reporte markdown formateado usando:

- Visual block para alinear columnas
- `.` para repetir formateo
- `:s` y `:%s` para limpiar y normalizar datos
- `:r !` para insertar fecha del sistema y metadatos
- Marcas para navegar entre secciones del reporte

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Explica cómo funciona el comando `.` y por qué es el superpoder de Vim
- Diferencia entre `:%s/foo/bar/` y `:%s/foo/bar/g`
- Describe los 3 tipos de Visual mode y cuándo usar cada uno

### Evidencia de Desempeño (40%)
- Ejercicio: formatea una tabla CSV en markdown usando técnicas de esta semana

### Evidencia de Producto (30%)
- Reporte markdown formateado correctamente
- Documentación del flujo de trabajo usado

## 📚 Recursos

- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 8-12 (dot formula, visual mode)
- [Vim Regex](https://vimhelp.org/pattern.txt.html) — Documentación de expresiones regulares
- [VimGolf](https://www.vimgolf.com) — Desafíos de la categoría "repeat"

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Dot command** | `.`: repite el último cambio realizado |
| **Visual mode** | Modo para seleccionar texto (v=carácter, V=línea, Ctrl-v=bloque) |
| **Mark** | Posición guardada en el archivo para navegar rápidamente |
| **`:s`** | Comando de sustitución en la línea actual |
| **`:%s`** | Sustitución en todo el archivo |
| **`:g`** | Comando global: ejecuta acción en líneas que coinciden con patrón |
| **`:!`** | Ejecuta un comando de shell desde Vim |
| **`:r !`** | Inserta la salida de un comando de shell en el buffer |
