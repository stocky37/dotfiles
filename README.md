# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Installation

### Prerequisites

Install GNU Stow:

```bash
# Fedora/RHEL
sudo dnf install stow

# Debian/Ubuntu
sudo apt install stow

# macOS
brew install stow
```

### Setup

Clone this repository:

```bash
git clone https://github.com/stocky37/dotfiles ~/.dotfiles/public
cd ~/.dotfiles/public
```

Stow all dotfiles:

```bash
stow --dotfiles -t ~ .
```

The `--dotfiles` flag converts `dot-` prefixes to `.` when creating symlinks, so `dot-gitconfig` becomes `~/.gitconfig`.

## What's Included

This repository contains configurations for:

- **Git** - `dot-gitconfig`, `dot-gitaliases`, `dot-gitmessage`, `dot-gitignore`
- **Shell** - Bash (`dot-bash_profile`, `dot-aliases`) and Zsh (`dot-zsh/`)
- **Zsh** - Modular configuration with antidote plugin manager
- **Vim** - `dot-vimrc`
- **Tmux** - `dot-tmux.conf` with version-specific configs in `dot-tmux/`
- **Terminal Emulators** - Alacritty and Kitty configs with Dracula theme
- **Starship** - Shell prompt configuration
- **Development Tools** - QMK, testcontainers
- **Scripts** - Custom utilities in `dot-bin/`

## Managing Dotfiles

### Add new dotfiles

1. Move the file/directory to this repository with a `dot-` prefix:
   ```bash
   mv ~/.myconfig ~/.dotfiles/public/dot-myconfig
   ```

2. Re-stow to create the symlink:
   ```bash
   cd ~/.dotfiles/public
   stow --dotfiles -R -t ~ .
   ```

### Remove dotfiles

Unstow to remove all symlinks:

```bash
cd ~/.dotfiles/public
stow --dotfiles -D -t ~ .
```

### Update after adding new files

When you add new files to the repository, re-stow to create symlinks:

```bash
cd ~/.dotfiles/public
stow --dotfiles -R -t ~ .
```

## Zsh Configuration

The Zsh configuration uses `ZDOTDIR=~/.zsh` for organization:

- `dot-zsh/dot-zshrc` → `~/.zsh/.zshrc` - Main configuration
- `dot-zsh/dot-zshenv` → `~/.zsh/.zshenv` - Environment variables
- `dot-zsh/zshrc.d/` - Modular configuration files
- `dot-zsh/functions/` - Custom functions
- `dot-zsh/zplugins` - Plugin definitions for antidote

Private and local overrides are supported via `.zshrc.private`, `.zshrc.local`, `.zshenv.private`, and `.zshenv.local` files.

## Private Dotfiles

Sensitive configuration is kept in a separate repository at `~/.dotfiles/private` and stowed independently.

## License

MIT - See [LICENSE](LICENSE)
