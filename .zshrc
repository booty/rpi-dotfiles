echo ".zshrc loading, bro"

# ----[ zsh ]----

# note: need to install!
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Enable Zsh's completion system
autoload -Uz compinit
compinit

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# zsh-syntax-highlighting (must be last)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf setup (if installed)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Ignore case when completing
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Group results by category
zstyle ':completion:*' group-name ''

# Format of completion listings
zstyle ':completion:*:descriptions' format '%%F{yellow}%%d%%f'
zstyle ':completion:*:messages' format '%%F{red}%%d%%f'

# Show completion menu
zstyle ':completion:*' menu select

z.up() {
  cd ~/.zsh/zsh-autosuggestions
  git pull
  cd ~/.zsh/zsh-syntax-highlighting
  git pull
}

# ----[ Zsh Prompt ]----

autoload -Uz vcs_info

# Show Git info
precmd() { vcs_info }

setopt PROMPT_SUBST

# Customize colors (you can tweak these to fit your style)
local user_color='%F{blue}'
local dir_color='%F{green}'
local branch_color='%F{yellow}'
local time_color='%F{cyan}'
local reset='%f'

# Enable Git info and format it
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "${branch_color}(%b)${reset}"

# Define the prompt
PROMPT='${user_color}%n@%m ${dir_color}%~ ${time_color}%* ${vcs_info_msg_0_}${reset} %# '

# Right prompt (optional, shows exit code if non-zero)
RPROMPT='%F{red}%?%f'

# ----[ Apt stuff ]----

a.up() {
  sudo apt update && \
  sudo apt upgrade -y && \
  sudo apt full-upgrade -y && \
  sudo apt autoremove -y && \
  sudo apt autoclean -y
}

# ----[ Hailo ]----

h.diag() {
  lspci | grep Hailo && \
  hailortcli fw-control identify
}

h.diagfull() {
  lspci | grep Hailo && \
  hailortcli fw-control identify && \
  gst-inspect-1.0 hailotools && \
  gst-inspect-1.0 hailo
}

# ----[ Git stuff ]----

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"

# ----[ Python stuff ]----

alias act="source venv/bin/activate"
alias deact="deactivate"
alias venv="python3 -m venv venv"

# ----[ Run stuff ]----

eval "$(zoxide init zsh)"

# ----[ Misc ]----

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

alias reload="source ~/.zshrc"

# ensure local binaries available?
export PATH="$HOME/.local/bin:$PATH"

# ----[ Things that were auto-added]