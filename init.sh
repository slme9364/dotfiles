#bin/sh

if [[ -x $(which brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

mkdir -p ~/.config


if [[ -x $(which zsh) ]]; then
  brew install zsh
fi


if [ ! -e $HOME"/.zplug" ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

