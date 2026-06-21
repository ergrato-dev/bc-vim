# 🌐 Comunidad y Próximos Pasos

## 🎯 Objetivos

- Conocer los recursos de la comunidad Neovim/Vim
- Saber dónde buscar ayuda, inspiración y novedades
- Trazar una ruta de aprendizaje post-bootcamp
- Mantener tu configuración viva y en evolución

---

## 📋 Contenido

### 1. Dónde Seguir Aprendiendo

**Documentación oficial**:
```text
:help → tu mejor amigo (siempre)
https://neovim.io/doc/user/ → documentación web
https://vimhelp.org/ → documentación de Vim
```

**Libros**:
```text
Practical Vim (2nd Edition) — Drew Neil
  → El libro canónico. Léelo completo.

Learning Vimscript the Hard Way — Steve Losh
  → Para cuando necesites Vimscript legacy.
```

**Newsletters**:
```text
This Week in Neovim — https://this-week-in-neovim.org
  → Resumen semanal de novedades, plugins y tips
```

---

### 2. Comunidad

**Reddit**:
```text
r/neovim → https://reddit.com/r/neovim
  → La comunidad más activa. Configs, plugins, preguntas.

r/vim → https://reddit.com/r/vim
  → Para Vim clásico.
```

**Discourse**:
```text
https://neovim.discourse.group
  → Foro oficial. Discusiones técnicas y desarrollo.
```

**GitHub**:
```text
https://github.com/neovim/neovim
  → Reporta bugs, contribuye al core

https://github.com/rockerBOO/awesome-neovim
  → Directorio curado de plugins, configs y recursos
```

**Discord / Matrix**:
```text
Neovim Discord → comunidad activa de chat
Neovim Matrix → #neovim:matrix.org
```

---

### 3. Configuraciones de Referencia

Estudia estas configuraciones para aprender patrones y técnicas:

```text
kickstart.nvim:
https://github.com/nvim-lua/kickstart.nvim
  → Configuración mínima monolítica. Ideal para entender lo básico.

LazyVim:
https://github.com/LazyVim/LazyVim
  → Distribución completa con lazy.nvim. Modular, bien documentada.

NvChad:
https://github.com/NvChad/NvChad
  → Distribución con UI pulida. Muchos plugins, buena estética.

AstroNvim:
https://github.com/AstroNvim/AstroNvim
  → Comunidad grande. Modular y extensible.

LunarVim:
https://github.com/LunarVim/LunarVim
  → Configuración con capa de abstracción propia.
```

**Qué aprender de cada una**:
- Cómo estructuran los archivos
- Qué plugins eligen y por qué
- Cómo configuran el lazy-loading
- Patrones de keymaps y autocmds

---

### 4. Próximas Herramientas para Explorar

**Plugins populares que podrías añadir**:
```text
Oil.nvim     → navegar archivos como si fueran texto
Harpoon      → saltar entre archivos frecuentes rápidamente
Trouble      → panel de diagnóstico avanzado
Diffview     → diff visual interactivo
Neogit       → interfaz git estilo Magit (Emacs)
Noice        → reemplazar UI de mensajes y comandos
Notify       → notificaciones estilizadas
Indent-blankline → guías de indentación
Mini.nvim    → colección de módulos independientes
```

**Áreas para profundizar**:
```text
Lua plugin development → crea tu propio plugin
Treesitter queries     → escribe queries de resaltado
LSP avanzado           → configuración por proyecto (.luarc.json)
DAP debugging          → debugging condicional, attach remoto
Testing (neotest)      → ejecutar tests desde Vim
Formateo (conform.nvim) → formateo asíncrono avanzado
```

---

### 5. Mantener tu Configuración Viva

**Ciclo de mantenimiento**:

```text
SEMANAL:
  :Lazy update → actualizar plugins
  :checkhealth → verificar salud del sistema

MENSUAL:
  Revisar awesome-neovim por nuevos plugins
  Leer This Week in Neovim
  Purgar plugins que no usas

TRIMESTRAL:
  Revisar tu estructura ¿sigue teniendo sentido?
  Refactorizar secciones que crecieron demasiado
  Actualizar README con nuevos screenshots
```

**Regla de oro de la configuración**:
```text
"Tu configuración debe resolver tus problemas, no crearlos."

Si pasas más tiempo configurando que programando,
algo está mal. Reduce. Simplifica.
```

---

### 6. Contribuir al Ecosistema

```text
Reportar bugs:
  → Encuentras un error en un plugin → GitHub Issues

Mejorar documentación:
  → Wiki de plugins, :help, READMEs

Compartir snippets:
  → r/neovim, tu blog, tu gist

Crear un plugin:
  → Identifica un problema que tengas
  → Resuélvelo con Lua
  → Publícalo. Aunque sea pequeño.
```

---

### 7. El Viaje Continúa

```text
┌─────────────────────────────────────────────────────────┐
│                                                          │
│   Semana 1: "¿Por qué no puedo usar las flechas?"       │
│   Semana 5: "¡Automaticé 100 líneas con una macro!"     │
│   Semana 8: "Mi editor ahora es un IDE completo"        │
│   Semana 10: "Publiqué mi configuración en GitHub"     │
│                                                          │
│   mañana:     editas más rápido que antes               │
│   próximo mes: encuentras un plugin que te cambia la     │
│               vida y lo agregas                         │
│   próximo año: quizás creas tu propio plugin             │
│                                                          │
│   Vim es un viaje, no un destino.                        │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

---

### 8. Cápsula del Tiempo

Guarda este mensaje para tu yo del futuro:

```text
Hoy, [fecha], completé el Bootcamp Vim Zero to Hero.

En 10 semanas pasé de no saber salir de Vim a construir
mi propio IDE personalizado.

Mi comando favorito es: [tu comando]
Mi plugin favorito es: [tu plugin]
Lo que más me costó fue: [tu desafío]

Dentro de 6 meses, vuelve a leer esto. ¿Sigues usando Vim?
¿Qué ha cambiado en tu configuración? ¿Qué has aprendido?

— [Tu nombre], [fecha]
```

---

## 🎉 ¡Felicidades!

Has completado un viaje de 10 semanas que pocos terminan. Desde no saber cómo salir de Vim (`:q!`) hasta configurar tu propio IDE completo con LSP, debugging y publicación en GitHub.

```text
Lo que sabes ahora:
✓ Editar a velocidad de pensamiento (motions, text objects)
✓ Automatizar tareas repetitivas (macros, registros)
✓ Navegar proyectos complejos (splits, buffers, tabs, telescope)
✓ Configurar Neovim en Lua (modular, lazy-loading)
✓ Construir un IDE profesional (LSP, cmp, Treesitter, DAP)
✓ Procesar archivos en lote (quickfix, arglist, :cfdo)
✓ Gestionar git desde Vim (fugitive, gitsigns)
✓ Compartir tu configuración (GitHub, documentación)

Lo que viene:
→ Practicar, practicar, practicar
→ Personalizar, iterar, mejorar
→ Ayudar a otros en su viaje Vim
```

---

## ➡️ Continuar

[📖 Volver al README de la Semana](../README.md) • [🚀 Ir al Proyecto Final](../3-proyecto/README.md)
