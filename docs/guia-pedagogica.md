# Guía Pedagógica para Instructores

Orientaciones para impartir el Bootcamp Vim — Zero to Hero en formato presencial, online sincrónico o como material de autoestudio supervisado.

---

## Filosofía de Enseñanza

### Vim como lenguaje, no como lista de comandos

El error más común al enseñar Vim es presentarlo como una colección de atajos. Este bootcamp parte de una premisa diferente: **Vim es un lenguaje para editar texto**, con verbos (operadores), sustantivos (text objects y motions) y una gramática composable.

Cuando un estudiante interioriza `operador + motion`, puede componer comandos que nunca ha visto antes. `d3w`, `ci[`, `gUip` no son atajos memorizados — son frases en un idioma que el estudiante ya habla.

**Implicación pedagógica**: Enfatiza la gramática antes que los comandos específicos. Un estudiante que entiende `d + {motion}` tiene acceso a infinitas combinaciones.

### Práctica deliberada sobre lectura pasiva

La teoría de Vim no se convierte en habilidad sin práctica activa. El cerebro aprende la edición modal como aprende a escribir a máquina: mediante repetición hasta que el movimiento se vuelve automático.

- **Lectura sin práctica = pérdida de tiempo**
- **VimGolf no es un pasatiempo — es entrenamiento de fuerza**
- **Los Code Katas cronometrados crean urgencia que acelera la automatización**

**Implicación pedagógica**: Nunca dediques más del 25% de una sesión a teoría sin un ejercicio inmediato que aplique lo aprendido.

---

## Estructura de una Sesión Semanal (8 horas)

El material está diseñado para 8 horas semanales distribuidas así:

| Bloque | Duración | Actividad |
|--------|----------|-----------|
| Teoría | 2 horas | Leer `1-teoria/` + demostración en vivo |
| Prácticas guiadas | 3 horas | Ejercicios `2-practicas/` con acompañamiento |
| Proyecto semanal | 3 horas | `3-proyecto/` de forma autónoma o en parejas |

### Formato recomendado para grupo presencial / online sincrónico

**Hora 1–2 (Teoría)**
- El instructor hace una demostración en vivo de los conceptos clave (no leer el material en voz alta)
- Los estudiantes siguen en su propia terminal, reproduciéndolo en tiempo real
- Pausas cada 20 minutos para preguntas
- Objetivo: que nadie llegue a los ejercicios con dudas conceptuales

**Horas 3–5 (Prácticas)**
- Los estudiantes trabajan los 4 ejercicios de `2-practicas/`
- El instructor circula (presencial) o monitorea en canal de Discord/chat
- Ejercicio 1 y 2: individual; Ejercicio 3 y 4: en parejas (pair programming)
- Al finalizar cada ejercicio, el instructor muestra su solución para comparar enfoques

**Horas 6–8 (Proyecto)**
- Los estudiantes trabajan de forma autónoma
- El instructor está disponible para consultas pero no da pistas directas — formula preguntas guía
- Los últimos 30 minutos: cada estudiante muestra su proyecto (1–2 minutos por persona)
- Cierre: el instructor destaca los enfoques más elegantes vistos

---

## Estrategias Didácticas por Semana

### Semanas 1–2: Construcción de reflejos

El mayor obstáculo es la frustración de sentirse lento. Normalízalo explícitamente: *"Esta semana tu cerebro está reescribiendo cómo procesa la edición de texto. La lentitud es parte del aprendizaje."*

- Usa **vimtutor** al inicio de la Semana 1 (`:Tutor` en Neovim)
- VimGolf básico: [vimgolf.com](https://www.vimgolf.com) — empieza con desafíos de 3–5 movimientos
- Prohíbe las flechas del teclado en clase durante la Semana 1 y 2 (de forma juguetona, no autoritaria)

### Semanas 3–5: Automatización del pensamiento

Aquí los estudiantes pasan de "sé que existe este comando" a "lo uso sin pensar". El Dot Command (`.`) y las macros son los multiplicadores de fuerza más importantes.

- **Ejercicio de kata**: Abre el mismo archivo de prueba, realiza la misma edición de 5 formas diferentes y mide qué es más rápido
- Code review de dotfiles entre compañeros: ¿quién tiene el mapping más útil de la semana?

### Semanas 6–7: Introducción a la personalización

El plugin manager y la configuración en Lua pueden intimidar. El objetivo no es que los estudiantes entiendan cada línea de código — es que puedan **modificar y extender** una configuración existente.

- Comienza con el starter de `3-proyecto/` en lugar de desde cero
- Enfatiza: "no copies configs de internet sin entender cada línea"
- La Semana 6 es un buen momento para un Code Review colectivo de `init.lua`

### Semanas 8–9: Vim como entorno profesional

El LSP y los flujos multiarchivo son las semanas más exigentes técnicamente. Algunos estudiantes pueden necesitar más tiempo.

- Recuerda que el LSP falla a menudo por problemas del entorno (Node.js no instalado, falta de permisos) — ten una guía de diagnóstico lista
- Sesión de pair programming en Semana 9 para refactorización multiarchivo

### Semana 10: Presentación y comunidad

El proyecto final es una oportunidad de consolidación y orgullo. Una demo de configuración bien documentada en GitHub es un entregable concreto para el portfolio.

- Anima a los estudiantes a publicar en r/neovim o la comunidad de Neovim en Discord
- Organiza una presentación de dotfiles de 5 minutos por estudiante

---

## Evaluación con la Rúbrica

Cada semana tiene un `rubrica-evaluacion.md` con tres tipos de evidencia:

### Conocimiento (30%) — Lo que el estudiante sabe

Cuestionarios orales o escritos sobre los conceptos de la semana. No se trata de memorización ciega, sino de demostrar comprensión:

- "¿Cuál es la diferencia entre `iw` y `aw`?"
- "¿Por qué usarías `"0p` en lugar de `p`?"

**Qué observar**: El estudiante debe poder explicar el concepto con sus propias palabras, no recitar una definición.

### Desempeño (40%) — Lo que el estudiante hace

Ejercicios prácticos de edición evaluados en tiempo real:

- VimGolf: el estudiante resuelve un desafío y comparte el número de movimientos
- Live coding: edita un archivo de prueba mientras el instructor observa
- Screen sharing en sesiones online

**Qué observar**: Fluidez, uso de Text Objects, ausencia de movimientos innecesarios, uso del Dot Command.

### Producto (30%) — Lo que el estudiante entrega

Entregables concretos: configuraciones, dotfiles, proyectos.

**Qué observar**: Funcionalidad completa según los requisitos del proyecto, código Lua legible, uso de convenciones del proyecto, documentación básica.

### Criterio de aprobación

**Mínimo 70% en cada tipo de evidencia.** Un estudiante que saca 100% en conocimiento pero 50% en desempeño no aprueba la semana.

---

## Adaptaciones para Autoestudio

Si el estudiante avanza solo, sin instructor:

1. **Lleva un diario de aprendizaje**: Una nota diaria de qué aprendió, qué fue difícil y qué descubrió por su cuenta
2. **Sigue el tiempo**: No saltarse los 30 minutos de ejercicio por leer más teoría
3. **Usa GitHub Discussions** del repositorio para preguntar y compartir avances
4. **VimGolf diario**: Un desafío por día, aunque sea de 5 minutos
5. **Ritmo recomendado**: 1 semana del bootcamp = 1–2 semanas calendario

---

## Recursos para Instructores

- **Practical Vim** (Drew Neil) — La biblia de Vim; útil para profundizar en cualquier concepto
- **Learn Vimscript the Hard Way** (Steve Losh) — Para entender Vimscript antes de enseñarlo
- **TJ DeVries en YouTube** — Demostraciones en vivo de workflows de Neovim
- **ThePrimeagen en YouTube** — Inspiración y técnica de Vim para desarrolladores modernos
- **VimGolf** ([vimgolf.com](https://www.vimgolf.com)) — Para preparar ejercicios de desempeño
