# Installation
## Dependencies
Install dependencies for Arch linux: 
```
sudo pacman -S --needed base-devel git neovim luarocks 
```
## Remove cache
```
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```
## Clone config from github
```
git clone https://github.com/Psychopath21312/nvim-lua-backup.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
```
# Done! You can working
```
nvim
```


