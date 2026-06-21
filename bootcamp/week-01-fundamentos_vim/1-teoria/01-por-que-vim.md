# 🤔 ¿Por qué Vim?

## 🎯 Objetivos

- Entender la historia y filosofía detrás de Vim
- Diferenciar entre Vim y Neovim
- Comprender por qué Vim sigue siendo relevante en 2026
- Conocer las ventajas de la edición modal sobre los editores tradicionales

---

## 📋 Contenido

### 1. Una Breve Historia

Vim (Vi IMproved) fue creado por **Bram Moolenaar** en 1991, basado en el editor **vi** de Bill Joy (1976). Lo que empezó como un clon mejorado del editor estándar de Unix se convirtió en uno de los editores más longevos e influyentes de la historia del software.

```text
1976 — vi (Bill Joy, BSD Unix)
1991 — Vim 1.0 (Bram Moolenaar, Amiga)
2006 — Vim 7.0 (pestañas, autocompletado, spell check)
2014 — Neovim (fork moderno con arquitectura extensible)
2023 — Neovim 0.9 (LSP nativo, Lua como lenguaje de config)
2025 — Neovim 0.10+ (mejoras en rendimiento y API)
```

Bram Moolenaar falleció en 2023, pero su legado vive en millones de desarrolladores y en la comunidad de código abierto.

---

### 2. La Filosofía de la Edición Modal

La mayoría de los editores funcionan en **modo inserción continua**: escribes texto, y para cualquier otra acción usas combinaciones de teclas (Ctrl+C, Ctrl+V, Ctrl+Z...) o el ratón.

Vim introduce un concepto radicalmente diferente: **la edición modal**.

```text
┌─────────────────────────────────────────────────┐
│                                                 │
│   NORMAL          INSERT          VISUAL        │
│   (navegar)  ←→  (escribir)  ←→  (seleccionar) │
│      ↑               ↑               ↑          │
│      └─────── Esc ───┴─────── Esc ───┘          │
│                                                 │
│              COMMAND-LINE (:)                    │
│              (ejecutar comandos)                 │
│                                                 │
└─────────────────────────────────────────────────┘
```

**La idea central**: Pasas ~80% del tiempo leyendo/navegando código y ~20% escribiendo. Los editores tradicionales te mantienen en "modo escritura" todo el tiempo. Vim te da un modo optimizado para cada tarea.

> "Vim is a language for editing text. When you learn the language, editing becomes instinctive."

---

### 3. Vim vs Neovim

| Característica | Vim | Neovim |
|---------------|-----|--------|
| Lenguaje de configuración | Vimscript | Lua (principal) |
| LSP nativo | ❌ (requiere plugins) | ✅ (nvim 0.5+) |
| Treesitter nativo | ❌ | ✅ |
| API externa | Limitada | RPC completa |
| Terminal integrado | Básico (`:term`) | Avanzado (buffer terminal) |
| Comunidad | Mantenimiento | Activa, crecimiento rápido |
| Compatibilidad | 100% config legacy | 99% compatible |

**Recomendación para este bootcamp**: Neovim 0.10+. Si estás en un entorno donde solo hay Vim disponible, el 95% de lo que aprenderás aplica igual.

---

### 4. ¿Por qué Vim en 2026?

#### Ventajas competitivas reales:

**Velocidad de edición** — Una vez interiorizado, editas a la velocidad del pensamiento:
```text
"Cambiar el contenido de estas comillas dobles"
Cursor en cualquier parte de "texto antiguo" → ci"
Escribes: texto nuevo → Esc
3 teclas + el nuevo texto. Sin ratón, sin seleccionar.
```

**Ergonomía** — Sin ratón = menos tensión en muñeca y hombro. Menos lesiones RSI a largo plazo.

**Ubicuidad** — Vim está en cada servidor Linux, cada Mac, cada contenedor Docker. Saber Vim significa poder editar en cualquier entorno.

**Personalización extrema** — Tu editor se adapta a ti, no al revés. Cada tecla hace exactamente lo que tú quieres.

**Longevidad del conocimiento** — Lo que aprendes hoy funcionará igual en 10 años. No depende de interfaces gráficas ni versiones de framework.

#### Lo que NO es Vim:

- ❌ No es un IDE completo out-of-the-box (lo convertiremos en uno en la Semana 8)
- ❌ No es "más rápido" que VS Code en la primera semana (la curva es real)
- ❌ No es para todo el mundo (pero los que se quedan, no vuelven)

---

### 5. La Curva de Aprendizaje

```text
Productividad
    ↑
    │                    ┌────────────────── Vim
    │                   ╱
    │                  ╱
    │                 ╱
    │    ────────────●────────────────────── Editores tradicionales
    │              ╱
    │             ╱
    │            ╱
    │           ●
    │          ↑
    │     "El valle de la
    │      desesperación"
    └──────────────────────────────────────────→ Tiempo
         Semana 1-2    Semana 3-4    Mes 2-3
```

**Semana 1-2**: Frustración. Todo es más lento. "¿Por qué estoy haciendo esto?"
**Semana 3-4**: Los movimientos empiezan a ser automáticos. hjkl ya no requiere pensar.
**Mes 2-3**: Tu velocidad de edición iguala a tu editor anterior.
**Mes 4+**: Lo superas. Y no quieres volver.

Nuestro bootcamp está diseñado para acompañarte en cada etapa.

---

### 6. El "Vim Way"

Es una filosofía de trabajo, no solo un conjunto de comandos:

1. **No repitas acciones** — Si haces algo más de 2 veces, busca una forma mejor
2. **Un comando, una acción** — Los comandos de Vim son atómicos y combinables
3. **Normal mode es el default** — Solo Insert mode cuando escribes texto nuevo
4. **Usa el lenguaje de Vim** — Verbo + Sustantivo = Acción (d + w = delete word)
5. **Mantén las manos en el teclado** — Cada vez que tocas el ratón pierdes contexto y tiempo

---

## ✅ Checklist de Verificación

- [ ] Entiendo la diferencia entre los 4 modos de Vim
- [ ] Sé diferenciar entre Vim y Neovim
- [ ] Comprendo por qué la edición modal es más eficiente
- [ ] Conozco la historia básica de Vim (vi → Vim → Neovim)
- [ ] Estoy mentalmente preparado para la curva de aprendizaje

---

## ➡️ Siguiente

[02 - Modos de Vim](02-modos-de-vim.md)
