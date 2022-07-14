#/usr/bin/sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
export GOPROXY=https://goproxy.cn
nvim +PackerSync #+GoInstallBinaries
