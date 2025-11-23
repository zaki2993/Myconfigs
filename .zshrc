# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- Oh My Zsh core ----------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# keep syntax-highlighting LAST
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ---------- Quality of life ----------
# accept autosuggestion with Ctrl+L; move forward one word with Ctrl+Right
bindkey '^[f' forward-word

# sane history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# better completion
autoload -Uz compinit
compinit -u

# ls colors
export CLICOLOR=1

# editor
export EDITOR="nvim"

# PATH example (optional)
# export PATH="$HOME/.local/bin:$PATH"

# aliases
alias ll='ls -alF'
alias gs='git status'
alias gp='git push'
alias gl='git pull'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source <(fzf --zsh)
alias add-snaps='sudo grub-btrfsd --syslog /.snapshots & sleep 2 && sudo pkill -f grub-btrfsd && sudo grub-mkconfig -o /boot/grub/grub.cfg'
bindkey '^N' autosuggest-accept
# Remove the default clear-screen binding for Ctrl+L
bindkey -r '^l'
# open a file using fzf
alias vf='nvim $(find . -type f | fzf)'

# open a folder (project)
alias vp='nvim $(find . -type d | fzf)'

export CHROME_EXECUTABLE=$(which brave)
# Setting the Android SDK Path
export ANDROID_HOME=$HOME/Android/Sdk

# Adding the SDK tools to the PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH="$PATH:$HOME/flutter/bin"
