# My Personal Configs for GNU/Linux and More

### TL,DR

This repo is used to store all my dotfiles for open source softwares e.g. Bash, Zsh, Neovim etc.

It includes the following config files for now:

1. Zsh: `.zshrc`
2. Neovim: `nvim/`

More configs will be added to this repo in future.

### For Each

Here shows their functions and the way to have them worked in your GNU/Linux machine(s):

#### .zshrc

This `.zshrc` file supports various features:

- **Git Info**: Displays username, current working directory, and Git branch/status in the prompt.

- **Plugin Support**:
    - It manage the following plugins manually, which means if you want to add more plugins, you should modify the `.zshrc` file yourself.
        - zsh-autosuggestions: Suggests commands as you type.
        - zsh-syntax-highlighting: Highlights commands syntax for better visibility.

- **Command Completion**: 
    - Smart completion with case-insensitive matching.
    - Supports `_` and `-` as interchangeable.

- **Command Correction**
  - Automatically suggests corrections for mistyped commands.
  - Strict mode enabled for all commands.

- **History & Navigation**
  - Shared history across multiple terminals.
  - Incremental search using `Ctrl+R`.
  - Auto `cd` into directories by typing the name.

- **Development Environment**
  - Optional CUDA environment variables.
  - Ruby setup with `GEM_HOME`.
  - Conda environment auto-initialization.

- **Proxy Configuration**
  - V2ray proxy setup for all applications (`ALL_PROXY=127.0.0.1:10808`).

If you don't need some of those features, edit `.zshrc` and add `#` in front of the designated line(s).

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
