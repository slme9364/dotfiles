#auto_color
autoload -Uz colors
colors

#bindkey = vim
bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#setopt
setopt correct
setopt re_match_pcre
setopt prompt_subst
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

#Prompt
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[purple]%}.%{$fg[purple]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
PROMPT2='[%n]> '
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

#Word_break_postion
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#zsh_completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#Version_controll_system_information
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}

add-zsh-hook precmd _update_vcs_info_msg
bindkey '^R' history-incremental-pattern-search-backward

#alias
alias rb='ruby'
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias -g L='| less'
alias -g G='| grep'
alias t='type'
alias c='clear'
alias e='exit'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias g++='g++ -std=c++14 -pthread'
alias mecab-c++='(){ g++ -std=c++14 $1 `mecab-config --cflags` `mecab-config --libs` }'
alias cv-c++='(){g++ -std=c++14 -ggdb `pkg-config --cflags opencv` $1 `pkg-config --libs opencv`}'
alias fuzzy-killer="ps axh -F | fzf | awk '{print \$2}' | xargs kill"
alias tmux-sb='tmux save-buffer - | pbcopy'
alias tmux-lb='pbpaste | tmux load-buffer -'

#method
chpwd() { ls }

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    #Only those that satisfy all of the following conditions are added to the history.
    [[ ${#line} -ge 5
        && ${cmd} != (l[sal]|lal)
        && ${cmd} != (cd)
        && ${cmd} != (man)
        && ${cmd} != (exit)
        && ${cmd} != (tmux-sb|tmux-lb)
    ]]
}

#rustup install
if [ ! -e $HOME"/.cargo" ]; then
  curl https://sh.rustup.rs -sSf | sh
fi

##zplug

#When you don't have zplug, you install'
if [ ! -e $HOME"/.zplug" ]; then
  curl -sL zplug.sh/installer | zsh
fi

source ~/.zplug/init.zsh

#Define plugins
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'felixr/docker-zsh-completion'
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf
zplug 'junegunn/fzf', as:command, use:bin/fzf-tmux
zplug 'b4b4r07/enhancd', use:init.sh
zplug 'k4rthik/git-cal', as:command
zplug 'zsh-users/zsh-syntax-highlighting', defer:3

#If Not installed plugins exist, you installed there.
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

#Automatic start tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

eval "$(rbenv init -)"
