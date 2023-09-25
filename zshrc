autoload -U colors && colors
PS1="  %B%{$fg[yellow]%}%~%{$reset_color%} 
    >>>%b "

bindkey -v

function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
    RPS1="%B%{$fg[red]%}[N]%b"
    ;;
    $ZVM_MODE_INSERT)
    RPS1="%B%{$fg[green]%}[I]%b"
    ;;
    $ZVM_MODE_VISUAL)
    RPS1="%B%{$fg[magenta]%}[V]%b"
    ;;
    $ZVM_MODE_VISUAL_LINE)
    RPS1="%B%{$fg[magenta]%}[V]%b"
    ;;
    $ZVM_MODE_REPLACE)
    RPS1="%B%{$fg[magenta]%}[V]%b"
    ;;
  esac
}

RPROMPT="$RPS1"

export KEYTIMEOUT=1

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:*:*:*:descriptions' format '%F{red}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{blue}-- no matches found --%f'
zstyle ':completion:*' group-name ''

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

source /home/justzs/.local/state/bash/bash_aliases
source /home/justzs/.local/state/bash/env
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'

PATH="$PATH:/usr/lib/node_modules/npm/bin/node-gyp-bin:/home/justzs/node_modules/.bin:/usr/bin:/home/node_modules/.bin:/node_modules/.bin:/usr/lib/node_modules/npm/node_modules/@npmcli/run-script/lib/node-gyp-bin:/home/justzs/.cargo/bin:/home/justzs/.local/bin:/home/justzs/.config/emacs/bin:/home/justzs/.local/share/npm/bin:/home/justzs/.local/bin:/home/justzs/.config/cargo/bin:/home/justzs/.config/emacs/bin:/home/justzs/.local/bin/scripts/:/home/justzs/.config/deno/bin/"

(cat ~/.cache/wal/sequences &)

bindkey '^F' end-of-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete
