if [ -z $ZSH_ENV_LOADED ]; then
  export LANG=ja_JP.UTF-8
  export PATH=$PATH:$HOME/.cargo/bin:$HOME/.zplug/bin:$HOME/bin:$HOME/.rbenv/bin
  export ZSH_ENV_LOADED="1"
fi
