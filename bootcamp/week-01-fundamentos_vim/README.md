# 🚀 Semana 1: Fundamentos de Vim

## 🎯 Objetivos de Aprendizaje

Al finalizar esta semana, serás capaz de:

- ✅ Entender la filosofía de edición modal de Vim
- ✅ Diferenciar entre Vim y Neovim y elegir el adecuado
- ✅ Dominar los 4 modos principales (Normal, Insert, Visual, Command-line)
- ✅ Moverte por un archivo sin usar las flechas (hjkl, w, b, e, 0, $, gg, G)
- ✅ Editar texto con i, a, o, x, dd, yy, p
- ✅ Guardar, salir y navegar la ayuda integrada (:w, :q, :help)
- ✅ Crear tu primer archivo de configuración (init.lua)

---

## 📚 Requisitos Previos

- **Neovim 0.10+** o **Vim 9.1+** instalado
- Terminal con soporte true color (Kitty, Alacritty, WezTerm, Windows Terminal)
- **Git** instalado y configurado
- Ganas de aprender a editar sin ratón

---

## 🗂️ Estructura de la Semana

```
week-01-fundamentos_vim/
├── README.md                      # Este archivo
├── rubrica-evaluacion.md          # Criterios de evaluación
├── 0-assets/                      # Diagramas y recursos visuales
├── 1-teoria/                      # Material teórico
│   ├── 01-por-que-vim.md
│   ├── 02-modos-de-vim.md
│   ├── 03-movimiento-basico.md
│   ├── 04-edicion-basica.md
│   └── 05-configuracion-inicial.md
├── 2-practicas/                   # Ejercicios guiados
│   ├── 01-ejercicio-vimtutor/
│   ├── 02-ejercicio-movimiento/
│   ├── 03-ejercicio-edicion/
│   └── 04-ejercicio-config/
├── 3-proyecto/                    # Proyecto semanal
│   └── starter/
├── 4-recursos/                    # Material adicional
│   ├── ebooks-free/
│   ├── videografia/
│   └── webgrafia/
└── 5-glosario/                    # Términos clave
    └── README.md
```

---

## 📝 Contenidos

### 1️⃣ Teoría (2 horas)

| Tema | Duración | Descripción |
|------|----------|-------------|
| [¿Por qué Vim?](1-teoria/01-por-que-vim.md) | 20 min | Historia, filosofía, Vim vs Neovim vs IDEs |
| [Modos de Vim](1-teoria/02-modos-de-vim.md) | 25 min | Normal, Insert, Visual, Command-line |
| [Movimiento Básico](1-teoria/03-movimiento-basico.md) | 30 min | hjkl, w/b/e, 0/$, gg/G, f/t |
| [Edición Básica](1-teoria/04-edicion-basica.md) | 25 min | i/a/o, x/dd/yy/p, u/Ctrl-r |
| [Configuración Inicial](1-teoria/05-configuracion-inicial.md) | 20 min | init.lua, opciones básicas, mappings |

### 2️⃣ Prácticas (3 horas)

| Ejercicio | Duración | Nivel | Objetivo |
|-----------|----------|-------|----------|
| vimtutor | 1h | Básico | Tutorial interactivo oficial |
| Movimiento | 45 min | Básico | Navegar sin flechas |
| Edición | 45 min | Básico | Crear y editar documentos |
| Configuración | 30 min | Básico | Primer init.lua |

### 3️⃣ Proyecto (3 horas)

**Primer Archivo de Configuración**

Crear un `init.lua` funcional con opciones esenciales y tus primeros mappings personalizados.

---

## ⏱️ Distribución del Tiempo (8 horas)

```
📖 Teoría:          2h  (25%)
💻 Prácticas:       3h  (37.5%)
🚀 Proyecto:        3h  (37.5%)
```

### Cronograma Sugerido

| Día | Actividad | Tiempo |
|-----|-----------|--------|
| **Día 1** | Teoría: ¿Por qué Vim? + Modos | 1h |
| **Día 2** | Teoría: Movimiento + Edición | 1h |
| **Día 3** | Práctica: vimtutor completo | 1h |
| **Día 4** | Práctica: Movimiento + Edición | 1.5h |
| **Día 5** | Teoría + Práctica: Configuración | 1.5h |
| **Día 6** | Proyecto: init.lua personalizado | 2h |

---

## 📌 Entregable

**Proyecto: Primer init.lua funcional** con:

- Números de línea (`number` + `relativenumber`)
- Resaltado de sintaxis
- Tabulación configurada (4 espacios)
- Leader key mapeada a `<space>`
- Escape de Insert mode con `jk` o `jj`
- Navegación entre splits con Ctrl + hjkl (preparación)

---

## 🎓 Conceptos Clave

- **Edición Modal**: Piensa, luego ejecuta. No mezcles pensar con escribir.
- **Normal Mode**: Tu hogar. Siempre vuelve con `<Esc>`.
- **Insert Mode**: Solo para escribir texto nuevo. Sal cuanto antes.
- **hjkl**: Las flechas de Vim. Mantienen las manos en la fila home.
- **init.lua**: Archivo de configuración de Neovim en Lua.
- **.vimrc**: Archivo de configuración de Vim clásico.
- **Leader Key**: Tecla prefijo para tus atajos personalizados.

---

## 📚 Recursos Adicionales

### 📖 Lecturas Recomendadas

- [vimtutor](https://vimhelp.org/usr_01.txt.html) — Tutorial interactivo (viene con Vim)
- [Learn Vim (the Smart Way)](https://github.com/iggredible/Learn-Vim) — Capítulos 1-3
- [Practical Vim](https://pragprog.com/titles/dnvim2/) — Capítulos 1-2

### 🎥 Videos

- Ver carpeta [4-recursos/videografia/](4-recursos/videografia)

### 🔗 Enlaces Útiles

- Ver carpeta [4-recursos/webgrafia/](4-recursos/webgrafia)

---

## ✅ Checklist de Verificación

Antes de pasar a la Semana 2, asegúrate de:

- ☐ Completar vimtutor (`vimtutor` o `nvim +Tutor`)
- ☐ Moverte fluidamente con hjkl sin mirar el teclado
- ☐ Usar w, b, e para navegar palabras
- ☐ Entrar y salir de Insert mode correctamente (sin quedarte pegado)
- ☐ Guardar (:w), salir (:q) y forzar (:q!) desde memoria muscular
- ☐ Tener un init.lua funcional con al menos 8 opciones y 3 mappings
- ☐ Saber abrir :help y buscar un tema
- ☐ Alcanzar mínimo 70% en cada tipo de evidencia

---

## 🔗 Navegación

⬅️ **Anterior**: [Inicio del Bootcamp](../../README.md)
➡️ **Siguiente**: [Semana 2: Motions y Text Objects](../week-02-motions_y_text_objects/README.md)

---

## 💡 Consejos para Esta Semana

> ⌨️ **Desconecta las flechas**: Los primeros 2 días serán frustrantes. Es normal. El tercer día tu cerebro hará click.

> 🧠 **Modo Normal es tu hogar**: No te quedes en Insert mode "por si acaso". Edita, luego `<Esc>`. Siempre.

> 📖 **:help es tu amigo**: Vim tiene el mejor sistema de ayuda de cualquier software. Acostúmbrate a usarlo.

> 🎯 **Una cosa a la vez**: No intentes memorizar todo. Esta semana: muévete, edita, guarda. Lo demás vendrá después.

> 🐢 **Lento es rápido**: Ve despacio. La velocidad viene sola con la práctica. Forzarla genera malos hábitos.

---

**¡Bienvenido al mundo de Vim! 🚀**
*Esta es la primera semana de un viaje que transformará cómo editas texto para siempre*

[📖 Comenzar con Teoría](1-teoria/01-por-que-vim.md) • [💻 Ir a Prácticas](2-practicas/README.md) • [🚀 Ver Proyecto](3-proyecto/README.md)
