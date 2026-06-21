# Semana 2: Motions y Text Objects

## 🎯 Objetivos

- Dominar movimientos avanzados: f, t, F, T, /, ?, %, *, #
- Comprender y usar text objects: iw, i", i(, i{, aw, a", a(, a{
- Combinar operadores con motions: d/c/y + movimiento
- Usar el paradigma "operador + text object": ci", di(, ya{, etc.
- Navegar por archivos de código con saltos precisos

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| f, t, F, T: búsqueda en línea | 1h | Teoría + Práctica |
| / y ?: búsqueda en archivo | 1h | Teoría + Práctica |
| %, *, #: saltos contextuales | 0.5h | Teoría |
| Text objects (iw, aw, i(, a(, etc.) | 1.5h | Teoría + Práctica |
| Combinar operadores + text objects | 2h | Práctica |
| Vim como lenguaje: verbo + sustantivo | 1h | Teoría |
| Evaluación | 1h | Evaluación |

## 🔑 Conceptos Clave

- **f{char}**: Salta a la siguiente ocurrencia de {char} en la línea actual
- **t{char}**: Salta hasta justo antes de {char}
- **; y ,**: Repite el último f/t hacia adelante o atrás
- **Text objects**: Estructuras de texto delimitadas (palabras, comillas, paréntesis, etc.)
- **i vs a**: "inside" (dentro del delimitador) vs "around" (incluye delimitadores y espacios)

## 💻 Prácticas

1. **Drill f/t**: Archivo con caracteres repetidos, practica f{char} + ; para recorrer
2. **Código anidado**: Archivo JSON/HTML, practica ci(, di{, ya" en código anidado
3. **Edición de texto**: Corrige un archivo mal formateado usando solo operadores + text objects
4. **Búsqueda y navegación**: Encuentra y modifica todas las ocurrencias de una palabra con / y n/N

## 📦 Proyecto Semanal

Refactoriza un archivo de configuración (JSON, TOML o YAML) usando exclusivamente:

- ci" / ci( / ci{ para cambiar valores
- di( / di{ para eliminar bloques
- yap / yip para copiar secciones
- f/t + operador para ediciones en línea

Entrega: archivo original vs archivo editado + lista de comandos usados

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Cuestionario: diferencia entre f y t, i" y a", i( y a(
- Identifica el text object correcto para cada escenario

### Evidencia de Desempeño (40%)
- VimGolf: resolver 5 desafíos de edición en el menor número de pulsaciones

### Evidencia de Producto (30%)
- Archivo refactorizado correctamente usando la metodología solicitada
- Lista de comandos documentada con explicación

## 📚 Recursos

- [Vim Text Objects: The Definitive Guide](https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/)
- [VimGolf](https://www.vimgolf.com) — Desafíos de edición
- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 5-7
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/) — Capítulo 3

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Text object** | Unidad estructural de texto (palabra, bloque, tag, etc.) |
| **Motion** | Comando de movimiento del cursor |
| **Operator** | Comando que modifica texto (d, c, y, >, <, =, gu, gU) |
| **f{char}** | Find: salta a {char} en la línea actual |
| **t{char}** | Till: salta hasta antes de {char} |
| **iw** | Inner word: palabra sin espacios alrededor |
| **aw** | A word: palabra incluyendo espacio posterior |
| **i( / i{ / i[ / i"** | Inside: dentro del delimitador |
| **a( / a{ / a[ / a"** | Around: incluyendo delimitadores |
