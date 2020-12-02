if [ -z $ZSH_ENV_LOADED ]; then
  export LANG=ja_JP.UTF-8
  export ZSH_ENV_LOADED="1"
  export LSCOLORS=gxfxcxdxbxegedabagacad

  export PATH=$PATH:$HOME/.zplug/bin:$HOME/bin
  export PATH="$HOME/.goenv/shims:$HOME/.rbenv/shims"
  export PATH="/usr/local/opt/gettext/bin:$PATH"
  export PATH="$HOME/.goenv/bin:$PATH"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$GOPATH/bin:$PATH"
  export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
  export PATH="$PATH:$HOME/local/bin"
  export PATH="$PATH:/usr/local/bin"
  export PATH="$PATH:$HOME/go/1.14.2/bin"
  export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

  export NVM_DIR="$HOME/.nvm"
  export PATH="$NVM_DIR/versions/node/v12.4.0/bin:$PATH"
  export MANPATH="$NVM_DIR/versions/node/v12.4.0/share/man:$MANPATH"
  export NODE_PATH="$NVM_DIR/versions/node/v12.4.0/lib/node_modules"
fi
zmodload zsh/zprof && zprof > /dev/null 2>&1
