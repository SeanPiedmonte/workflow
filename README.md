# workflow

My Linux development environment: a keyboard-driven setup built around Hyprland, tmux and Neovim. Everything here is plain config files, with no install framework.

| Directory | Tool | Installs to |
|---|---|---|
| `nvim/` | [Neovim](https://neovim.io) | `~/.config/nvim` |
| `tmux/` | [tmux](https://github.com/tmux/tmux) | `~/.tmux.conf` |
| `hypr/` | [Hyprland](https://hyprland.org) + hyprpaper | `~/.config/hypr` |
| `waybar/` | [Waybar](https://github.com/Alexays/Waybar) | `~/.config/waybar` |
| `.bashrc` | bash | `~/.bashrc` |

## Install

Back up anything you already have at these paths first, then symlink:

```bash
git clone https://github.com/SeanPiedmonte/workflow.git ~/workflow
ln -s ~/workflow/nvim ~/.config/nvim
ln -s ~/workflow/hypr ~/.config/hypr
ln -s ~/workflow/waybar ~/.config/waybar
ln -s ~/workflow/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/workflow/.bashrc ~/.bashrc
```

Open `nvim` once and [lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself and installs every plugin. Mason then installs the language servers.

### Machine-specific values to change

- `hypr/hyprland.conf`: the two `monitor=` lines describe my displays (a 4K panel and a 1440p/240 Hz panel). Replace them with your own outputs from `hyprctl monitors`.
- `hypr/hyprpaper.conf`: the wallpaper path points at an image in my home directory that is not in this repo.
- `tmux/.tmux.conf`: `default-shell` is `/usr/bin/bash`.
- `.bashrc`: sets `CC`, `CFLAGS` and `LDLIBS` for C coursework and sources `~/.cargo/env`.

## Neovim

Leader is `Space`. Plugins are managed by lazy.nvim, one file per plugin under `nvim/lua/piedmonte/lazy/`.

| Plugin | Purpose |
|---|---|
| telescope.nvim | Fuzzy finding for files, git files and grep |
| harpoon | Jump between a handful of pinned files |
| nvim-lspconfig + mason | Language servers: `lua_ls`, `rust_analyzer`, `clangd`, `gopls`, `pyright`, `eslint`, `protols`, `postgres_lsp` |
| nvim-cmp + LuaSnip | Completion and snippets |
| nvim-treesitter | Syntax highlighting |
| vim-fugitive | Git from inside the editor |
| undotree | Visual undo history (persistent undo is on) |
| todo-comments.nvim | Highlight `TODO` / `FIXME` comments |
| fidget.nvim | LSP progress indicator |
| vim-moonfly-colors | Colour scheme |

Editor defaults: relative line numbers, 4-space indentation, no line wrap, no swap files, an 80-column guide, and 8 lines of scroll padding.

### Key bindings

| Keys | Action |
|---|---|
| `<leader>pv` | Open the file explorer |
| `<leader>pf` / `Ctrl-p` | Find files / find git-tracked files |
| `<leader>ps` | Grep the project for a string |
| `<leader>a` | Add the current file to harpoon |
| `Ctrl-e` | Toggle the harpoon menu |
| `Ctrl-h` `Ctrl-t` `Ctrl-n` `Ctrl-s` | Jump to harpoon file 1–4 |
| `<leader>g` | Open fugitive; `gs` status, `gc` commit, `gp` push, `gl` pull, `ga` add file, `gA` add all |
| `<leader>u` | Toggle undotree |
| `<leader>f` | Format the buffer with the language server |
| `<leader>dd` | List all diagnostics in Telescope |
| `<leader>y` / `<leader>Y` | Yank to the system clipboard |
| `<leader>p` (visual) | Paste over a selection without losing the register |
| `<leader>s` | Search and replace the word under the cursor |
| `J` / `K` (visual) | Move the selected lines down / up |
| `<leader>x` | Make the current file executable |
| `<leader>ee` | Insert a Go `if err != nil` block |

## tmux

Prefix is `Ctrl-a` rather than the default `Ctrl-b`.

| Keys (after prefix) | Action |
|---|---|
| `c` | New window |
| `s` / `v` | Split the pane top-bottom / side by side |
| `h` `j` `k` `l` | Move between panes |
| `b` | Previous window |
| `w` | List windows |
| `Ctrl-d` | Detach |
| `a` | Send a literal `Ctrl-a` |

Mouse support and vi copy-mode keys are on. The status bar shows the session and host on the left and a clock updated every second on the right.

## Hyprland

The modifier is `Super`. Defaults: `alacritty` terminal, `thunar` file manager, `vivaldi` browser and `wofi` launcher. Waybar and hyprpaper start with the session.

| Keys | Action |
|---|---|
| `Super+T` | Terminal |
| `Super+B` | Browser |
| `Super+F` | File manager |
| `Super+R` | App launcher |
| `Super+C` | Close the focused window |
| `Super+V` | Toggle floating |
| `Super+h/j/k/l` | Move focus |
| `Super+1…9` | Switch workspace |
| `Super+Shift+1…9` | Move the window to a workspace |
| `Super+M` | Toggle the scratchpad workspace |
| `Super+Shift+M` | Send the window to the scratchpad |
| `Super+E` | Exit Hyprland |

Media, volume and brightness keys are bound through `wpctl`, `playerctl` and `brightnessctl`.

## Waybar

A top bar with Hyprland workspaces on the left, a clock in the centre, and the tray, CPU and memory on the right. `style.css` is the active theme; `style.css-2` is an alternative kept for reference.

## Requirements

Neovim 0.10 or newer, tmux, git, a C compiler (treesitter builds its parsers), and [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope's grep. For the desktop: Hyprland, hyprpaper, Waybar, wofi, alacritty, plus `wpctl`, `playerctl` and `brightnessctl` for the media keys.
