#/usr/bin/sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +"CocInstall coc-clangd coc-pyright" +qall
export GOPROXY=https://goproxy.cn && nvim +GoInstallBinaries
