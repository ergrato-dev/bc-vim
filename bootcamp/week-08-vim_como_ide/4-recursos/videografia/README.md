# Videografía — Semana 08

Videos para ver LSP, mason.nvim, autocompletado, Treesitter y debugging en acción, configurando Neovim como un IDE completo.

---

## Esenciales esta semana

### Neovim IDE Setup (ThePrimeagen)
- **URL**: https://www.youtube.com/watch?v=w7i4amO_zaE
- **Cuándo verlo**: Antes de empezar `01-lsp-mason.md`
- **Por qué**: Walkthrough completo de cómo convertir Neovim en un IDE — instala y conecta LSP, mason.nvim y autocompletado en vivo, dando contexto de conjunto antes de entrar en el detalle de cada plugin.

### LSP Explained (TJ DeVries)
- **URL**: https://www.youtube.com/playlist?list=PLGxiA7J0vUZxIDIUqQrPaLWJJIfGLIe2p
- **Cuándo verlo**: Durante `01-lsp-mason.md`
- **Por qué**: Serie desde cero de uno de los mantenedores de Neovim, explicando el protocolo LSP y su integración nativa — útil para entender qué hace `nvim-lspconfig` por debajo antes de tocar los keymaps.

### nvim-dap Setup (Vimjoyer)
- **URL**: https://www.youtube.com/watch?v=0moS8UHUPGc
- **Cuándo verlo**: Junto con `04-dap-debugging.md`
- **Por qué**: Tutorial de configuración de nvim-dap y nvim-dap-ui paso a paso — refuerza el flujo de breakpoint → continue → step over/into/out del tema de debugging.

---

## Complementario

### Búsquedas recomendadas en YouTube esta semana

Los enlaces anteriores son estables, pero para profundizar en un tema específico, estos términos encuentran contenido equivalente:

- **"nvim-cmp setup tutorial"** — fuentes de autocompletado y personalización del menú, tema de `02-autocompletado-cmp.md`
- **"nvim-treesitter textobjects tutorial"** — text objects y folding basados en AST, tema de `03-treesitter.md`
- **"luasnip custom snippets tutorial"** — creación de snippets con tabstops, tema de `05-terminal-y-snippets.md`
- **"neovim terminal integrado tutorial"** — flujos de trabajo con `:term`, tema de `05-terminal-y-snippets.md`

---

> Mira primero un walkthrough de configuración completa (IDE Setup) antes de profundizar plugin por plugin — ver cómo LSP, cmp, Treesitter y DAP se conectan entre sí ayuda a entender por qué cada pieza existe antes de configurarla en aislamiento.
