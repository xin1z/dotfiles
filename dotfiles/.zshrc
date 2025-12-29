# Preventing Enter showed up when launching Gnome Terminal (Disabled cuz already switched to KDE)
# setopt NO_PROMPT_CR

# Basic Configuration

# Manual plugin directory
export ZSH_PLUGINS_DIR=~/.zsh-plugins

# Plugin Loading (with safety check)
[[ -f $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Command Completion
autoload -Uz compinit
compinit -C  # Avoid permission warnings, improve startup speed

# Completion menu
zstyle ':completion:*' menu select
# Smart matching: case-insensitive and handle underscore/hyphen
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*'

# Command Correction
setopt CORRECT
setopt CORRECT_ALL  # More strict correction

# Command History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY           # Share history across terminals
bindkey "^R" history-incremental-search-backward

# Auto cd
setopt AUTO_CD

# Git & VCS Configuration
autoload -Uz vcs_info

# Update Git status before each prompt
precmd() { vcs_info }

# Git info formatting
# %b = branch, %u = untracked files, %c = modified files
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'

# Prompt Configuration
setopt prompt_subst

# Prompt style: username|working directory$ + Git status
PROMPT='%F{green}%n%f|%F{cyan}%~%f${vcs_info_msg_0_} $ '

# CUDA Environment (optional)
#[[ -d /opt/cuda/bin ]] && export PATH=/opt/cuda/bin:$PATH
#[[ -d /opt/cuda/lib64 ]] && export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# Syntax highlighting custom highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Set Proxy for V2ray
export ALL_PROXY=127.0.0.1:10808

# Ruby-related Environment Variables
export GEM_HOME="$HOME/.gem/ruby/3.4.0"
export PATH="$GEM_HOME/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
function conda-init {
__conda_setup="$('/opt/miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniforge/etc/profile.d/conda.sh" ]; then
        . "/opt/miniforge/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniforge/bin:$PATH"
    fi
fi
unset __conda_setup
# Prevent using clear in miniforge when not activating any environment
export PATH=/usr/bin:/bin:$PATH
}
# <<< conda initialize <<<

