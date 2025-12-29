# My Personal Configs for GNU/Linux and More

### TL,DR

This repo is used to store all my dotfiles for open source softwares e.g. Bash, Zsh, Neovim etc.

It includes the following config files for now:

1. Zsh: `.zshrc`
2. Neovim: `nvim/`

More configs will be added to this repo in future.

### For Each

Here shows their functions and the way to have them worked in your machine.

#### .zshrc

This `.zshrc` file enables:

- **Git Info Displays**. It displays:
    - Username, current working directory, and Git branch/status in the prompt.

- **Manual Plugin Control**. The following extensions are installed:
    - zsh-autosuggestions
    - zsh-syntax-highlighting

- **Command Completion**. It supports basic smart completion with case-insensitive matching.

- **Command Correction**. It supports basic automatic suggestion for mistyped commands.

- **Various System Variables**. It has set variables for:
    - CUDA
    - Ruby's `GEM_HOME`
    - Miniforge (use `conda-init` to enable in shell)

To use this, You need to have `zsh` installed at first. Use the commands below to install it based on your distro(s).

Arch Linux:

```bash
sudo pacman -Syu
sudo pacman -S zsh
```

Debian / Ubuntu:

```bash
sudo apt update && sudo apt upgrade
sudo apt install zsh
```

Then, you need to clone specific extensions from GitHub into directory `~/.zsh-plugins` to let the config work.

To clone them, use the following commands:

```bash
mkdir -p ~/.zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting
```

And, you need to clone this repo and link the `.zshrc` inside with `~/.zshrc`:

```bash
git clone https://github.com/xin1z/personal-config.git ~/personal-config
ln -s ~/personal-config/configs/.zshrc ~/.zshrc
```

Then, reload Zsh with:

```bash
source ~/.zshrc
```

Then, everything should work just fine.
