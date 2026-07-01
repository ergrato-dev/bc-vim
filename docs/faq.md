# Preguntas Frecuentes (FAQ)

Respuestas a las dudas más comunes de estudiantes del Bootcamp Vim.

---

## Antes de empezar

### ¿Vim o Neovim? ¿Cuál instalo?

**Instala Neovim.** Salvo que tengas una razón específica para usar Vim clásico (servidor sin permisos, compatibilidad estricta), Neovim es la opción recomendada para este bootcamp:

- Configuración en Lua (más limpia que Vimscript)
- LSP nativo (Semanas 7–8)
- Ecosistema de plugins moderno (lazy.nvim, telescope, mason)
- Comunidad más activa en plugins nuevos

Vim 9.1+ es compatible con las primeras semanas, pero a partir de la Semana 7 necesitarás Neovim.

### ¿Puedo usar la extensión de Vim para VSCode en lugar de Vim real?

Sí, puedes usarla como complemento, pero **no como reemplazo del bootcamp**. La extensión VsCodeVim implementa motions y operadores básicos, pero no tiene:

- Buffers, splits y tabs reales de Vim
- Registros y macros completos
- LSP nativo, Treesitter o DAP
- Configuración en Lua

El objetivo del bootcamp es que domines Vim como editor independiente. Usar VSCode con la extensión puede ayudarte a practicar motions durante el trabajo, pero asegúrate de abrir también Neovim para los ejercicios.

### ¿Cuántas horas por semana necesito dedicar?

El bootcamp está diseñado para **8 horas por semana**:

| Actividad | Tiempo |
|-----------|--------|
| Teoría (5 archivos) | 2 horas |
| Prácticas (4 ejercicios) | 3 horas |
| Proyecto semanal | 3 horas |

Si tienes menos tiempo, puedes extender cada semana a 2 semanas reales. Lo importante es no saltarte los ejercicios prácticos — con Vim, la musculatura mental se construye con repetición.

---

## Uso básico

### ¡No puedo salir de Vim! ¿Cómo salgo?

Es el meme más famoso de la programación. Aquí las opciones:

```vim
:q          → salir (solo si no hay cambios sin guardar)
:q!         → salir descartando cambios
:wq         → guardar y salir
:x          → guardar y salir (solo si hubo cambios)
ZZ          → guardar y salir (atajo en Normal mode)
ZQ          → salir sin guardar (atajo en Normal mode)
```

Si estás en Insert mode y nada responde, presiona `<Esc>` primero para volver a Normal mode.

### ¿Por qué mis teclas no hacen lo que espero?

Asegúrate de estar en **Normal mode**. Vim tiene 4 modos principales y los comandos cambian completamente entre ellos. Regla de oro: **presiona `<Esc>` cuando tengas dudas** — siempre te lleva a Normal mode.

Para saber en qué modo estás, mira la esquina inferior izquierda:
- Sin texto / `NORMAL` → Normal mode
- `INSERT` → Insert mode
- `VISUAL` → Visual mode
- `:` → Command-line mode

### ¿Por qué hjkl en lugar de las flechas?

Las flechas funcionan perfectamente en Vim. Los usuarios experimentados usan hjkl porque mantienen las manos en la **fila home del teclado**, reduciendo el movimiento de manos. Después de 2–3 semanas de práctica, es más rápido y ergonómico. No te fuerces al principio — haz la transición gradualmente.

---

## Configuración y plugins

### ¿Dónde está el archivo de configuración de Neovim?

```bash
~/.config/nvim/init.lua          # Linux / macOS
%APPDATA%\nvim\init.lua           # Windows
```

Para abrirlo desde Neovim:
```vim
:e $MYVIMRC
```

### Un plugin no funciona después de instalarlo, ¿qué hago?

1. Ejecuta `:Lazy sync` para asegurarte de que el plugin está instalado
2. Reinicia Neovim completamente (`nvim` en nueva terminal)
3. Ejecuta `:checkhealth {plugin}` para ver diagnósticos
4. Lee el mensaje de error en la notificación de inicio
5. Revisa la documentación del plugin con `:help {nombre-plugin}`

### ¿Cómo desinstalo un plugin?

Elimina su entrada del archivo donde lo declaraste (normalmente en `lua/plugins/`), luego ejecuta `:Lazy clean` en Neovim.

---

## Problemas comunes

### Los iconos no se ven bien, aparecen cuadros o signos de interrogación

Tu terminal no tiene una **Nerd Font** configurada. Pasos:

1. Instala una Nerd Font (ver [docs/instalacion.md](instalacion.md#4-instalar-una-nerd-font))
2. En la configuración de tu terminal, selecciona esa fuente
3. Reinicia la terminal

### Los colores del tema no se ven correctamente

Neovim necesita true color activado. Añade esto a tu `init.lua`:

```lua
vim.opt.termguicolors = true
```

Y verifica que tu terminal soporta true color (ver [docs/instalacion.md](instalacion.md#3-terminal-con-true-color)).

### El LSP no se conecta al archivo que estoy editando

Verifica con `:LspInfo` qué servidores están activos. Causas comunes:

- El language server no está instalado → usa `:Mason` para instalarlo
- El archivo no tiene el `filetype` correcto → `:set filetype?`
- El servidor necesita que el archivo esté en un proyecto con su archivo de configuración (`pyproject.toml`, `package.json`, etc.)

### Neovim tarda mucho en arrancar

Usa `:Lazy profile` para ver qué plugins tardan más. Asegúrate de que todos los plugins no esenciales usen lazy-loading (opciones `event`, `cmd`, `keys` en su spec de lazy.nvim).

---

## Aprendizaje

### ¿Qué hago si me quedo atascado en un ejercicio?

1. Lee el README del ejercicio otra vez con calma
2. Busca el concepto en la teoría de esa semana (`1-teoria/`)
3. Consulta `:help {comando}` dentro de Neovim
4. Pregunta en [GitHub Discussions](https://github.com/ergrato-dev/bc-vim/discussions) — describe qué intentaste y qué pasó
5. Si es un bug del repositorio, abre un [Issue](https://github.com/ergrato-dev/bc-vim/issues)

### ¿Cuánto tiempo tarda en sentirse cómodo con Vim?

La curva de aprendizaje típica:

- **Semana 1–2**: Sentirte lento y frustrado es normal. Tu cerebro está aprendiendo un nuevo sistema motor.
- **Semana 3–4**: Los comandos básicos empiezan a ser instintivos.
- **Semana 5–6**: Notas que editas más rápido que antes.
- **Semana 7–10**: Empiezas a *pensar* en Vim antes de editar.

La mejora no es lineal — hay saltos. No te compares con otros, compárate con tu yo de la semana pasada.

### ¿Debería aprender Vimscript además de Lua?

Para este bootcamp, **Lua es suficiente**. Vimscript sigue siendo relevante para:

- Entender configuraciones antiguas que encuentres online
- Usar plugins legacy que no tienen versión Lua
- Escribir scripts portables que corran en Vim clásico

La Semana 7 introduce lo básico de Vimscript para que no seas un extraño cuando lo encuentres.

### ¿Vale la pena aprender Vim si ya soy muy productivo con mi editor actual?

Depende de tus objetivos. Vim tiene una ventaja específica: el **modelo de edición modal** te permite manipular texto con mucha menos fricción una vez lo interiorizas. Muchos desarrolladores lo describen como "aprender a pensar diferente sobre el texto".

Si ya tienes un flujo de trabajo muy establecido, la transición tiene un costo real. El bootcamp está diseñado para minimizarlo con una progresión deliberada, pero requiere inversión.

---

## Contribuir

### Encontré un error en el material, ¿cómo lo reporto?

Abre un [Issue en GitHub](https://github.com/ergrato-dev/bc-vim/issues) con:
- La semana y el archivo donde encontraste el error
- Qué dice actualmente y qué debería decir
- Si puedes, una Pull Request con la corrección

Ver [docs/contribucion.md](contribucion.md) para más detalles.
