# ~/.zshrc

# If not running interactively, don't do anything 
[[ $- != *i* ]] && return 

# Core Aliases 
alias ls='ls --color=auto' 
alias grep='grep --color=auto' 

# Initialize the completion system 
autoload -Uz compinit 
compinit 

# Enable a modern, scrollable completion menu
zstyle ':completion:*' menu select 

# Case-insensitive matching (type lowercase, match uppercase) 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 

# Use caching so completions for large packages load instantly 
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' cache-path ~/.zsh-cache 

# Load the interactive tab menu plugin (from AUR)
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# Add an inline preview window for files and directories (uses 'ls')
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview '[[ -d $realpath ]] && ls --color=always $realpath || cat $realpath'

# Enable zsh auto suggestions 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Replicate Fish behavior: Accept suggestion with Right Arrow key
bindkey '^[[C' forward-word

# Enable syntax highlighting (Must be loaded before customizing its styles)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom Syntax Colors (Forces everything to flat white, removes underlines)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=white,none'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=white,nonee'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white,none'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white,none'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=white,none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'

# Custom Prompt 
# PS1='%F{cyan}[%n@%m %1~]%f%F{white,bold}%#%f '   # default
# PS1='%F{250}%n%f %F{245}%~%f %F{cyan}❯❯%f '      # user-based
PS1='%F{250}%m%f %F{245}%~%f %F{cyan}❯❯%f '      # host-based

# Delete key fix bind
bindkey "\e[3~" delete-char

# Adds your local binary folder to the front of shell search list
export PATH="$HOME/.local/bin:$PATH"

# System Info Display
fastfetch 

# Alias
alias root='sudo -i'
alias fetch='fastfetch'
alias npp='notepad-plus-plus-linux'

# List all apps using expac
alias expac-list-apps='expac -H M "%m %n" | sort -h'
alias clickon="input-remapper-control --command autoload"
alias clickoff="input-remapper-control --command stop-all"




