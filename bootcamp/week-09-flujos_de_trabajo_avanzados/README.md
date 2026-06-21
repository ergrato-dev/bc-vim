# Semana 9: Flujos de Trabajo Avanzados

## 🎯 Objetivos

- Dominar la quickfix list y location list para operaciones multiarchivo
- Usar arglist para procesar conjuntos de archivos
- Ejecutar :grep, :vimgrep y :make desde Vim
- Gestionar sesiones para restaurar entornos de trabajo
- Dominar operaciones avanzadas de búsqueda y reemplazo
- Integrar Vim con Git de forma profunda con fugitive
- Usar edición remota con netrw scp://

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Quickfix list: :make, :grep, :vimgrep | 2h | Teoría + Práctica |
| Arglist: :args, :argdo | 1h | Teoría + Práctica |
| Location list | 0.5h | Teoría |
| Sesiones: :mksession, persistencia | 1h | Práctica |
| Búsqueda y reemplazo avanzados | 1.5h | Práctica |
| Fugitive avanzado: blame, diff, merge | 1h | Práctica |
| Edición remota y workflows de proyecto | 0.5h | Práctica |
| Evaluación | 0.5h | Evaluación |

## 🔑 Conceptos Clave

- **Quickfix list**: Lista global de ubicaciones (errores de compilación, resultados de grep)
- **Location list**: Similar a quickfix pero por ventana
- **Arglist**: Lista de archivos para operar con :argdo
- **:grep / :vimgrep**: Buscar patrones en múltiples archivos
- **:make**: Ejecutar compilación y poblar quickfix con errores
- **Sesión**: Snapshot del estado de Vim (buffers, ventanas, tabs, folds, etc.)
- **Fugitive**: Wrapper de git que mantiene la filosofía de Vim

## 💻 Prácticas

1. **Quickfix**: Busca todas las ocurrencias de una función en un proyecto, navega con :cnext/:cprev
2. **Arglist + argdo**: Renombra una variable en 20 archivos sin abrirlos manualmente
3. **Location list**: Busca errores específicos de un buffer sin contaminar quickfix global
4. **Sesiones**: Crea una sesión con 3 tabs y 12 splits, ciérralos y restáuralos
5. **Sustitución multiarchivo**: Usa :argdo %s/old/new/g | update para refactorizar
6. **Fugitive**: Haz git blame interactivo, navega commits, resuelve merge conflicts
7. **Edición remota**: Edita un archivo en un servidor remoto con `vim scp://user@host/path/file`

## 📦 Proyecto Semanal

Realiza una refactorización en un proyecto real de código abierto:

1. **Encuentra**: Usa :grep/:vimgrep para localizar todos los usos de un patrón
2. **Analiza**: Navega los resultados con quickfix (:copen, :cnext)
3. **Refactoriza**: Usa :argdo %s/old/new/gc para cambiar con confirmación
4. **Verifica**: Ejecuta tests con :make y corrige fallos desde quickfix
5. **Versiona**: Usa fugitive para hacer commits atómicos de los cambios
6. **Entrega**: Documenta cada paso del flujo con capturas de pantalla

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Diferencia entre quickfix list y location list
- Explica cómo usar :argdo para operaciones batch
- Describe el flujo completo de una refactorización con Vim

### Evidencia de Desempeño (40%)
- Ejercicio: Encuentra, analiza y corrige 5 errores en un proyecto usando quickfix + :make

### Evidencia de Producto (30%)
- Documentación del flujo de refactorización con capturas
- Commits en el repositorio de práctica mostrando los cambios

## 📚 Recursos

- [Vim Quickfix](https://vimhelp.org/quickfix.txt.html) — Documentación oficial
- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 17-20 (quickfix, arglist, grep)
- [vim-fugitive](https://github.com/tpope/vim-fugitive) — Git wrapper para Vim
- [Vimcasts: Fugitive](http://vimcasts.org/blog/2011/05/the-fugitive-series/) — Serie de screencasts

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Quickfix list** | Lista global de posiciones (errores, resultados de búsqueda) |
| **Location list** | Lista de posiciones asociada a una ventana específica |
| **Arglist** | Lista de archivos a procesar con :argdo |
| **:grep** | Buscar patrón en archivos usando grep externo |
| **:vimgrep** | Buscar patrón en archivos usando el motor interno de Vim |
| **:make** | Ejecutar :makeprg y poblar quickfix con errores |
| **:copen** | Abrir ventana de quickfix |
| **:cnext / :cprev** | Navegar al siguiente/anterior item en quickfix |
| **Session** | Archivo que guarda el estado de Vim para restaurarlo |
