# Semana 4: Buffers, Ventanas y Pestañas

## 🎯 Objetivos

- Gestionar múltiples buffers: listar, cambiar, eliminar
- Trabajar con ventanas divididas (splits): crear, redimensionar, navegar
- Usar pestañas para organizar layouts de trabajo
- Navegar archivos con netrw (explorador integrado)
- Dominar el sistema de ayuda integrado `:help`

## 📖 Contenido

| Tema | Horas | Tipo |
|------|-------|------|
| Buffers: :ls, :b, :bd, :bn, :bp | 1.5h | Teoría + Práctica |
| Ventanas: splits horizontales y verticales | 2h | Teoría + Práctica |
| Navegación entre ventanas (Ctrl-w + hjkl) | 1h | Práctica |
| Pestañas: tabs vs buffers | 1h | Teoría + Práctica |
| netrw: explorador de archivos | 1h | Teoría + Práctica |
| :help: sistema de ayuda de Vim | 0.5h | Teoría |
| Evaluación | 1h | Evaluación |

## 🔑 Conceptos Clave

- **Buffer**: Archivo cargado en memoria. Puede no estar visible.
- **Window**: Vista (viewport) de un buffer. Un buffer puede estar en múltiples ventanas.
- **Tab**: Colección de ventanas. No es un buffer diferente, es un layout.
- **Buffer oculto (hidden)**: Buffer modificado pero no visible. Requiere `set hidden`.
- **netrw**: Explorador de archivos integrado. Se abre con `:Explore` o `:e .`

## 💻 Prácticas

1. **Buffer management**: Abrir 5 archivos, listarlos con :ls, cambiar entre ellos sin usar tabs
2. **Split navigation**: Abrir 4 archivos en 4 splits, navegar fluidamente con Ctrl-w hjkl
3. **Redimensionar**: Ajustar ventanas con Ctrl-w +/-/</> y Ctrl-w =
4. **Tab workflow**: Organizar código en tabs (modelos, vistas, controladores, tests)
5. **netrw**: Abrir proyecto grande, navegar, crear/renombrar/eliminar archivos desde netrw
6. **:help**: Buscar ayuda sobre `:set`, `'number'`, `CTRL-W`, `i_CTRL-R`

## 📦 Proyecto Semanal

Configura un "workspace de proyecto" con tu configuración de Vim/Neovim:

- Abre 3 archivos de código fuente en splits (código principal + tests + README)
- Crea una pestaña adicional con `:help` y netrw
- Configura mappings para navegar entre splits con Ctrl-hjkl (sin necesidad de Ctrl-w)
- Implementa navegación entre buffers con `<leader>bn` y `<leader>bp`

## 📝 Evaluación

### Evidencia de Conocimiento (30%)
- Diferencia entre buffer, window y tab
- Explica `set hidden` y por qué es importante
- Describe los comandos de netrw para crear/renombrar/eliminar archivos

### Evidencia de Desempeño (40%)
- Ejercicio: Configurar un workspace con 4 archivos en splits específicos
- Tiempo límite: 3 minutos

### Evidencia de Producto (30%)
- Configuración de navegación (mappings para splits, buffers, tabs)
- Screenshot del workspace organizado

## 📚 Recursos

- [Vim Buffers, Windows, and Tabs](https://vimhelp.org/windows.txt.html) — Documentación oficial
- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 11-13
- [How to Use Vim's Built-in File Explorer](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)

## 🔤 Glosario

| Término | Definición |
|---------|------------|
| **Buffer** | Representación en memoria de un archivo |
| **Window** | Vista de un buffer en pantalla |
| **Tab** | Colección de ventanas (layout) |
| **Split** | División de la pantalla en ventanas |
| **netrw** | Plugin integrado de Vim para explorar archivos |
| **hidden** | Opción que permite buffers ocultos sin guardar |
| **:ls** | Lista todos los buffers abiertos |
| **Ctrl-w** | Prefijo para comandos de ventana |
