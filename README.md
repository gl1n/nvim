# nvim
自用nvim配置
- 使用lua进行配置
- 使用packer进行插件管理
- 使用coc管理lsp
## 使用方法
1. 根据[官方文档](https://github.com/neovim/neovim/wiki/Building-Neovim)安装nvim
2. 安装依赖
```bash
sudo apt install exuberant-ctags
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
# for c/cpp
sudo apt install clangd
```
3. 安装配置
```bash
rm -rf ~/.config/nvim
git clone https://github.com/gl1n/nvim.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```
