# Guía de Instalación

Requisitos técnicos para el Bootcamp Vim — Zero to Hero.

---

## Requisitos Mínimos

| Herramienta | Versión mínima | Uso |
|-------------|---------------|-----|
| Neovim | **0.10+** | Editor principal (recomendado) |
| Git | **2.40+** | Control de versiones |
| Terminal con true color | — | Soporte 24-bit para temas |
| Nerd Font | cualquiera | Iconos en plugins |

> Vim 9.1+ es compatible hasta la Semana 6. A partir de la Semana 7 (Lua, LSP, plugins) se requiere **Neovim**.

---

## 1. Instalar Neovim

### Linux

**Ubuntu / Debian**
```bash
# Opción 1: repositorios del sistema (puede ser versión antigua)
sudo apt update && sudo apt install neovim

# Opción 2: AppImage (siempre última versión estable)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
```

**Fedora**
```bash
sudo dnf install neovim
```

**Arch Linux**
```bash
sudo pacman -S neovim
```

**Snap (universal)**
```bash
sudo snap install nvim --classic
```

### macOS

```bash
# Con Homebrew (recomendado)
brew install neovim

# Con MacPorts
sudo port install neovim
```

### Windows

```powershell
# Con winget
winget install Neovim.Neovim

# Con Chocolatey
choco install neovim

# Con Scoop
scoop install neovim
```

También puedes descargar el instalador `.msi` desde [github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases).

### Verificar instalación

```bash
nvim --version
# Debe mostrar: NVIM v0.10.x o superior
```

---

## 2. Instalar Git

### Linux

```bash
# Ubuntu / Debian
sudo apt install git

# Fedora
sudo dnf install git

# Arch
sudo pacman -S git
```

### macOS

```bash
# Con Homebrew
brew install git

# Git viene incluido con Xcode Command Line Tools
xcode-select --install
```

### Windows

Descarga el instalador desde [git-scm.com](https://git-scm.com/download/win) o:

```powershell
winget install Git.Git
```

### Verificar instalación

```bash
git --version
# Debe mostrar: git version 2.40.x o superior
```

---

## 3. Terminal con True Color

Neovim necesita una terminal con soporte de color de 24 bits para mostrar temas correctamente.

### Terminales recomendadas

| Terminal | Sistema | Notas |
|----------|---------|-------|
| [Kitty](https://sw.kovidgoyal.net/kitty/) | Linux / macOS | Muy rápida, GPU-accelerated |
| [Alacritty](https://alacritty.org/) | Linux / macOS / Win | Mínima, rápida |
| [WezTerm](https://wezfurlong.org/wezterm/) | Linux / macOS / Win | Muy configurable |
| [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal) | Windows | Viene con Windows 11 |
| [iTerm2](https://iterm2.com/) | macOS | Clásica y completa |

### Verificar true color

```bash
curl -s https://raw.githubusercontent.com/stark/Color-Scripts/master/color-scripts/colors | bash
# Debe mostrar un degradado suave. Si ves bloques, tu terminal no soporta true color.
```

---

## 4. Instalar una Nerd Font

Los plugins de interfaz (lualine, neo-tree, telescope) usan iconos de [Nerd Fonts](https://www.nerdfonts.com/).

### Fuente recomendada: JetBrainsMono Nerd Font

**Linux / macOS**
```bash
# Con Homebrew (macOS)
brew install --cask font-jetbrains-mono-nerd-font

# Manual (Linux / macOS)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -LO "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
unzip JetBrainsMono.zip
fc-cache -fv
```

**Windows**

Descarga `JetBrainsMono.zip` desde [nerdfonts.com](https://www.nerdfonts.com/font-downloads), extrae y haz clic derecho en cada `.ttf` → "Instalar para todos los usuarios".

Después de instalar, configura tu terminal para usar la fuente `JetBrainsMono Nerd Font`.

---

## 5. Herramientas opcionales (se usan desde la Semana 6)

### ripgrep — búsqueda ultrarrápida en telescope

```bash
# Linux
sudo apt install ripgrep          # Ubuntu/Debian
sudo dnf install ripgrep          # Fedora
sudo pacman -S ripgrep            # Arch

# macOS
brew install ripgrep

# Windows
winget install BurntSushi.ripgrep.MSVC
```

### fd — navegador de archivos en telescope

```bash
# Linux
sudo apt install fd-find          # Ubuntu/Debian (binario: fdfind)
sudo dnf install fd-find          # Fedora
sudo pacman -S fd                 # Arch

# macOS
brew install fd

# Windows
winget install sharkdp.fd
```

### Node.js — requerido por algunos LSP servers (Semana 8)

```bash
# Con nvm (recomendado)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts

# macOS con Homebrew
brew install node

# Windows
winget install OpenJS.NodeJS.LTS
```

---

## Checklist de Verificación

Ejecuta estos comandos antes de empezar la Semana 1:

```bash
# Neovim
nvim --version | head -1
# → NVIM v0.10.x

# Git
git --version
# → git version 2.40.x

# Verificar true color en terminal
echo "\e[38;2;255;0;0mRojo\e[0m \e[38;2;0;255;0mVerde\e[0m \e[38;2;0;0;255mAzul\e[0m"
# → Debe mostrar texto en rojo, verde y azul
```

- [ ] `nvim --version` muestra 0.10 o superior
- [ ] `git --version` muestra 2.40 o superior
- [ ] La terminal muestra colores correctamente
- [ ] La Nerd Font está instalada y visible en la terminal
- [ ] (Semana 6+) `rg --version` funciona
