![Bootcamp Vim Zero to Hero](assets/bootcamp-header.svg)

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-lightgrey.svg)](LICENSE)
[![10 Weeks](https://img.shields.io/badge/weeks-10-yellow.svg)](#)
[![80 Hours](https://img.shields.io/badge/hours-80-orange.svg)](#)
[![Vim](https://img.shields.io/badge/Vim-019733?logo=vim&logoColor=white)](#)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white)](#)

[![Versión en Español](https://img.shields.io/badge/🇪🇸_Español-0969DA?style=for-the-badge&logoColor=white)](README.md)

---

## 📋 Description

Intensive **10-week (~2.5 months)** bootcamp focused on mastering **Vim/Neovim** as your primary development editor. Designed to take students from zero to **advanced Vim user**, with emphasis on efficient editing, customization, and professional workflows.

### 🎯 Objectives

Upon completion, students will be able to:

- ✅ Master Vim modes and the modal editing philosophy
- ✅ Navigate and edit text at professional speed without a mouse
- ✅ Apply motions, text objects, and operators as an editing language
- ✅ Manage buffers, windows, and tabs efficiently
- ✅ Use registers and macros to automate repetitive tasks
- ✅ Install and configure essential plugins with lazy.nvim
- ✅ Write Neovim configuration in Lua
- ✅ Transform Vim/Neovim into a full IDE (LSP, Treesitter, DAP)
- ✅ Optimize multi-file workflows with quickfix, arglist, and sessions
- ✅ Build a custom configuration from scratch

### 🚀 Why Vim?

> **Vim is a language for editing text** — It's not just an editor, it's a way of thinking about editing.

Vim has been the most efficient editor for developers for over 30 years. Its modal editing model allows you to manipulate text at the speed of thought. This bootcamp focuses on modern Vim/Neovim with Lua configuration, native LSP, and the current plugin ecosystem.

---

## 🗓️ Bootcamp Structure

| Stage | Weeks | Hours | Main Topics |
|-------|-------|-------|-------------|
| **Fundamentals** | 1-3 | 24h | Modes, movement, basic editing, text objects, operators |
| **Intermediate** | 4-6 | 24h | Buffers/windows, registers, macros, plugins |
| **Advanced** | 7-9 | 24h | Vimscript/Lua, LSP, Treesitter, multi-file workflows |
| **Production** | 10 | 8h | Final project: build your custom IDE |

**Total: 10 weeks** | **80 hours** of intensive training

---

## 📚 Weekly Content

Each week includes:

```
bootcamp/week-XX-topic/
├── README.md                 # Description and objectives
├── rubrica-evaluacion.md     # Evaluation criteria
├── 0-assets/                 # Images and diagrams
├── 1-teoria/                 # Theory material
├── 2-practicas/              # Guided exercises
├── 3-proyecto/               # Weekly project
├── 4-recursos/               # Additional resources
│   ├── ebooks-free/
│   ├── videografia/
│   └── webgrafia/
└── 5-glosario/               # Key terms
```

---

## 🛠️ Tech Stack

| Technology | Version | Usage |
|------------|---------|-------|
| Neovim | **0.10+** | Main editor (recommended) |
| Vim | **9.1+** | Compatible alternative |
| Lua | **5.1 (LuaJIT)** | Configuration language |
| lazy.nvim | **latest** | Plugin manager |
| Mason | **latest** | LSP/linter/formatter manager |
| Git | **2.40+** | Version control |

**Dev environment**: Neovim installed locally + Git

---

## 🚀 Quick Start

### Prerequisites

- **Neovim 0.10+** or **Vim 9.1+** installed
- **Git** for version control
- Modern terminal with true color support (Kitty, Alacritty, WezTerm, Windows Terminal)
- Nerd Font installed (for plugin icons)

### 1. Clone Repository

```bash
git clone https://github.com/ergrato-dev/bc-vim.git
cd bc-vim
```

### 2. Open in Neovim

```bash
nvim .
```

### 3. Go to Current Week

```bash
cd bootcamp/week-01-fundamentos_vim
```

### 4. Follow Instructions

Each week contains a `README.md` with detailed instructions.

---

## 📊 Learning Methodology

### Time Distribution (8h/week)

- **Theory**: 2 hours
- **Practice**: 3 hours
- **Project**: 3 hours

### Evaluation

Each week includes three evidence types:

1. **Knowledge 🧠** (30%): Command and concept quizzes
2. **Performance 💪** (40%): Practical editing exercises (VimGolf)
3. **Product 📦** (30%): Deliverables (configs, dotfiles, scripts)

**Passing criteria**: Minimum 70% in each evidence type

---

## ✍️ Example: The Vim Language

In Vim, editing text is like speaking a language:

```vim
" Delete a word:           dw   (delete word)
" Change inside quotes:    ci"  (change inside ")
" Delete until comma:      dt,  (delete till ,)
" Copy this paragraph:     yip  (yank inside paragraph)
" Paste below:             p    (paste)
```

**Verb + Noun = Action**. Once you internalize this language, text editing becomes instinctive.

---

## 📞 Support

- 💬 **Discussions**: [GitHub Discussions](https://github.com/ergrato-dev/bc-vim/discussions)
- 🐛 **Issues**: [GitHub Issues](https://github.com/ergrato-dev/bc-vim/issues)

---

## ⚠️ Disclaimer

This repository is an **educational** resource created for learning purposes. By using it, you agree to the following terms:

- **Educational use only**: Content, code examples, and projects are designed exclusively for teaching and learning.
- **No warranties**: Material is provided **"as is"**, without warranties of any kind.
- **Limitation of liability**: Authors and contributors are not responsible for data loss, damages, or any other harm derived from using this material.
- **Student responsibility**: Each student is responsible for their own configurations and development environments.

---

## 📄 License

This project is licensed under **[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)**.

**You may:** share and adapt the material, including creating educational forks.
**You may not:** use this material for commercial purposes.
**You must:** give appropriate credit and distribute adaptations under the same license.

See [LICENSE](LICENSE) for full text.

---

## 🏆 Acknowledgments

- [Bram Moolenaar](https://vim.org) — For creating Vim
- [Neovim Team](https://neovim.io) — For bringing Vim to the future
- [TJ DeVries](https://github.com/tjdevries) — For kickstart.nvim and community contributions
- [Folke Lemaitre](https://github.com/folke) — For lazy.nvim and the modern ecosystem
- [ThePrimeagen](https://github.com/ThePrimeagen) — For inspiring a generation of vimmers
- [VimTricks](https://vimtricks.com) — For daily tips
- [VimGolf](https://www.vimgolf.com) — For editing challenges

---

**🎓 Bootcamp Vim — Zero to Hero**
*From zero to Vim master in 10 weeks*

[Start Week 1](bootcamp/week-01-fundamentos_vim) • [Documentation](docs) • [Report Issue](https://github.com/ergrato-dev/bc-vim/issues)

Made with ❤️ for the developer community
