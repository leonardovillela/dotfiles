# Dotfiles

My personal dotfiles managed with [chezmoi](https://chezmoi.io/).

## Install

```bash
chezmoi init --apply leonardovillela/dotfiles
```

## What's Included

### Shell
- **zsh** with oh-my-zsh, autosuggestions, completions, and syntax highlighting
- **starship** prompt
- **atuin** for shell history
- **fzf** with tokyonight theme
- **aliases** for common commands

### Terminal Tools
- **neovim** with LazyVim
- **tmux** with gpakosz config
- **lazygit** with delta integration and tokyonight theme
- **bat**, **eza**, **ripgrep**, **jq**, **fzf**
- **git-delta** for beautiful diffs

### Git
- **git-town** for branch management
- **gh** CLI

### Apps (macOS)
- Ghostty, Raycast, Rectangle, Obsidian, Spotify, VS Code, Bitwarden, etc.

## Structure

```
.
├── dot_config/
│   ├── ghostty/       # Terminal config
│   ├── lazygit/       # Lazygit + delta + tokyonight
│   ├── nvim/          # Neovim/LazyVim
│   └── opencode/      # OpenCode AI config
├── dot_zshrc          # Zsh configuration
├── dot_tmux.conf.local# Tmux customization
├── dot_gitconfig      # Git configuration
├── dot_aliases.sh     # Shell aliases
├── private_dot_ssh/   # SSH config
└── .chezmoiscripts/   # Setup scripts
```
