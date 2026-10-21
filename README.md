# Dotfiles

Personal dotfiles managed with [doot](https://github.com/pol-rivero/doot).

## Installation

### Prerequisites

Download and install doot:

```bash
# Download doot binary for Linux
curl -LO https://github.com/pol-rivero/doot/releases/download/0.7.0/doot-linux-x86_64
chmod +x doot-linux-x86_64
sudo mv doot-linux-x86_64 /usr/local/bin/doot
```

For other platforms, see the [doot releases page](https://github.com/pol-rivero/doot/releases).

### Setup

Clone this repository:

```bash
git clone https://github.com/stocky37/dotfiles ~/.dotfiles/public
cd ~/.dotfiles/public
```

Install all dotfiles (create symlinks):

```bash
doot
```

This will create symlinks from your home directory to files in this repository. Thanks to doot's `implicit_dot` feature, files are stored without leading dots in the repository but are symlinked with dots in your home directory.

## How It Works

### Implicit Dot Behavior

Doot automatically adds a `.` prefix to root-level items when creating symlinks to `$HOME`:

- `gitconfig` in the repo → `~/.gitconfig` in your home
- `config/` in the repo → `~/.config/` in your home
- `zsh/` in the repo → `~/.zsh/` in your home

**Exception**: `bin/` is configured to not get a dot prefix:
- `bin/` in the repo → `~/bin/` in your home (no dot)

This keeps the repository clean and files visible (not hidden) while maintaining the correct structure in your home directory.

### Configuration

The `doot/config.toml` file controls how doot operates:
- `implicit_dot = true` - Automatically prefix root-level items with `.`
- `implicit_dot_ignore = ["bin"]` - Don't prefix `bin/` directory
- `exclude_files` - Patterns for files to ignore (like `.git/`, `LICENSE`, `README.md`)
- `include_files` - Override exclusions for specific files (like `zsh/.zshrc`)

## What's Included

This repository contains configurations for:

- **Git** - `gitconfig`, `gitaliases`, `gitmessage`, `gitignore`
- **Shell** - Bash (`bash_profile`, `aliases`) and Zsh (`zsh/`)
- **Zsh** - Modular configuration with antidote plugin manager
  - `zsh/.zshrc` - Main configuration
  - `zsh/.zshenv` - Environment variables
  - `zsh/zshrc.d/` - Modular configuration files
  - `zsh/functions/` - Custom functions
  - `zsh/zplugins` - Plugin definitions for antidote
- **Vim** - `vimrc`
- **Tmux** - `tmux.conf` with version-specific configs in `tmux/`
- **Terminal Emulators** - Alacritty and Kitty configs with Dracula theme
- **Starship** - Shell prompt configuration in `config/starship.toml`
- **Development Tools** - QMK, testcontainers
- **Scripts** - Custom utilities in `bin/`

## Managing Dotfiles

### Add new dotfiles

Use doot to add a file from your home directory:

```bash
doot add ~/.some-config-file
```

This will:
1. Move the file from your home directory to the dotfiles repository
2. Replace it with a symlink
3. Preserve the directory structure

Then commit the changes:

```bash
git add .
git commit -m "Add some-config-file"
git push
```

### Update symlinks after changes

After pulling changes or manually adding/removing files in the repository:

```bash
doot
```

This recreates symlinks based on the current repository state.

### Remove dotfiles

To remove a dotfile:

1. Delete the file from the repository
2. Run `doot` to remove the symlink
3. Commit the change

## Zsh Configuration

The Zsh configuration uses `ZDOTDIR=~/.zsh` for organization:

- `zsh/.zshrc` → `~/.zsh/.zshrc` - Main configuration
- `zsh/.zshenv` → `~/.zsh/.zshenv` - Environment variables
- `zsh/zshrc.d/` - Modular configuration files loaded automatically
- `zsh/functions/` - Custom functions
- `zsh/zplugins` - Plugin definitions for antidote

### Private and Local Overrides

The zsh configuration supports private and local overrides via:
- `.zshrc.private` - Private shell configuration (not in this repo)
- `.zshrc.local` - Machine-specific shell configuration
- `.zshenv.private` - Private environment variables
- `.zshenv.local` - Machine-specific environment variables

These files are sourced automatically if they exist.

## Private Dotfiles

Sensitive configuration is kept in a separate repository at `~/.dotfiles/private` and managed with doot independently.

To set up:

```bash
cd ~/.dotfiles/private
doot
```

## Advantages of doot

- **Clean repository**: Files stored without leading dots, visible in file managers and GitHub
- **No hooks needed**: Handles dotted files in subdirectories natively
- **Host-specific configs**: Built-in support for per-machine overrides via `[hosts]` in config.toml
- **Modern tooling**: Active development, good performance
- **Explicit configuration**: Clear TOML config file
- **Simple workflow**: Just run `doot` to update symlinks

## License

MIT - See [LICENSE](LICENSE)
