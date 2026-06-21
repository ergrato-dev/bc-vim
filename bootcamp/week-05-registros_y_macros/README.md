# Semana 5: Registros y Macros

## 🎯 Objetivos

- Dominar los registros de Vim: `""`, `"0`, `"a`-`"z`, `:reg`
- Usar registros con nombre para almacenar y recuperar texto
- Grabar y ejecutar macros con q, @, @@
- Editar macros usando registros
- Crear macros recursivas y parametrizables
- Integrar con el registro del sistema (`+` / `*`)

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Registros: tipos, visualización (:reg) | 1h | Teoría |
| Registros con nombre ("a-"z) | 1h | Práctica |
| Macros: grabación (q), ejecución (@, @@) | 2h | Teoría + Práctica |
| Edición de macros via registros | 1h | Práctica |
| Macros recursivas | 1h | Práctica |
| Registro del sistema (+ y *) | 1h | Teoría + Práctica |
| Evaluación | 1h | Evaluación |

## 🔑 Conceptos Clave

- **Registro sin nombre (`""`)**: Último texto eliminado/copiado
- **Registro 0 (`"0`)**: Último texto copiado (yank). No se sobrescribe con delete.
- **Registros con nombre (`"a`-`"z`)**: Almacenamiento explícito. Mayúsculas para append.
- **Registro del sistema (`"+`, `"*`)**: Integración con el portapapeles del SO
- **Macro**: Secuencia de comandos grabada. Se almacena en un registro.
- **@@**: Repite la última macro ejecutada

## 💻 Prácticas

1. **Registro drill**: Copia 5 fragmentos de texto a registros a-e, pégalos en orden inverso
2. **Macro simple**: Graba y ejecuta una macro que transforma una línea CSV en JSON
3. **Macro en bloque**: Aplica una macro a 100 líneas con `:normal @q` o número + `@q`
4. **Editar macro**: Graba una macro, inspecciónala con `:reg q`, edítala y vuélvela a usar
5. **Macro recursiva**: Crea una macro que se llame a sí misma hasta encontrar EOF
6. **Portapapeles**: Copia y pega entre Vim y otras aplicaciones del sistema

## 📦 Proyecto Semanal

Automatiza la conversión de un archivo de log en formato legacy a JSON estructurado:

- Usa registros para almacenar patrones de reemplazo
- Graba macros para procesar cada tipo de línea del log
- Aplica macros en lote a todo el archivo
- Documenta cada macro con comentarios en el código

Archivo de entrada: `project/logs_raw.txt` → Archivo de salida: `project/logs_json.txt`

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Diferencia entre `""`, `"0` y `"a`
- Explica cómo funcionan las macros recursivas
- Describe la diferencia entre `"+` y `"*`

### Evidencia de Desempeño (40%)
- Procesa un archivo de 50 líneas con macros en batch

### Evidencia de Producto (30%)
- Archivo de logs convertido correctamente a JSON
- Macros documentadas en un archivo aparte

## 📚 Recursos

- [Vim Registers: The Good, the Bad, and the Ugly](https://www.brianstorti.com/vim-registers/)
- [Vim Macros: Record and Replay](https://vimhelp.org/repeat.txt.html#complex-repeat)
- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 14-16

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Register** | Espacio de almacenamiento nombrado para texto y comandos |
| **Unnamed register** | `""`: último texto yank/delete |
| **Yank register** | `"0`: último texto copiado explícitamente |
| **Named register** | `"a`-`"z`: registros para almacenamiento explícito |
| **System clipboard** | `"+`: portapapeles del sistema (selección) |
| **System selection** | `"*`: selección primaria (middle-click en Linux) |
| **Macro** | Secuencia de comandos grabada en un registro |
| **@@** | Repite la última macro ejecutada |
| **Recursive macro** | Macro que se llama a sí misma |
