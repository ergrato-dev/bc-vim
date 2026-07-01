# Videografía — Semana 06

Videos para ver el ecosistema de plugins de Neovim en acción: lazy.nvim, telescope, git integrado y optimización de arranque.

---

## Esenciales esta semana

### Neovim from Scratch (TJ DeVries)
- **URL**: https://www.youtube.com/playlist?list=PLGxiA7J0vUZxIDIUqQrPaLWJJIfGLIe2p
- **Cuándo verlo**: Después de `01-gestores-de-plugins.md` y `02-configuracion-modular-lazy.md`
- **Por qué**: Serie completa de configuración de Neovim desde cero por uno de los mantenedores del proyecto — muestra en vivo el bootstrap de un gestor de plugins y la organización modular en `lua/plugins/`.

### How I Setup Neovim (ThePrimeagen)
- **URL**: https://www.youtube.com/watch?v=w7i4amO_zaE
- **Cuándo verlo**: Después de `03-fuzzy-finder-y-file-tree.md`
- **Por qué**: Walkthrough real de configuración con telescope y file tree — ver las decisiones de un usuario avanzado ayuda a entender por qué cada plugin de esta semana resuelve un problema concreto.

### Neovim Plugin Deep Dive (Vimjoyer)
- **URL**: https://www.youtube.com/watch?v=6pAG3BHurdM
- **Cuándo verlo**: Como repaso general antes de `05-temas-y-optimizacion.md`
- **Por qué**: Recorre plugin por plugin con más profundidad de configuración que un tutorial introductorio — útil para revisar `opts` específicas antes del proyecto de la semana.

---

## Complementario

### Búsquedas recomendadas en YouTube esta semana

Los enlaces anteriores son estables, pero para profundizar en un plugin específico, estos términos encuentran contenido equivalente:

- **"lazy.nvim tutorial"** — bootstrap e instalación paso a paso, tema de `01-gestores-de-plugins.md`
- **"neovim lua plugin spec event keys cmd"** — estrategias de lazy-loading, tema de `02-configuracion-modular-lazy.md`
- **"telescope.nvim setup neovim"** — configuración de pickers y fzf-native, tema de `03-fuzzy-finder-y-file-tree.md`
- **"gitsigns.nvim tutorial"** — signos de git en el gutter y navegación de hunks, tema de `04-git-y-statusline.md`
- **"neovim startuptime optimization"** — perfilado y optimización de arranque, tema de `05-temas-y-optimizacion.md`

---

> Mira primero cómo alguien organiza su `lua/plugins/` en vivo antes de copiar una configuración ya hecha — la estructura modular tiene más sentido cuando ves el "por qué" de cada decisión, no solo el resultado final.
