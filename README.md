# Installation
## Dependencies
for arch: 
```sudo pacman -S --needed luarocks neovim git```
## optional but recommended
```
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```
## Required
```
git clone https://github.com/Psychopath21312/nvim-lua-backup.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
```
# Start Neovim 
```
nvim
```

# Basic usage
## visual selection + gc  -- comments
## space + o -- neotree focus
## space + e -- neotree toggle
## space + t -- toggle terminal
## more keymaps in ~/.config/nvim/lua/config/keymaps.lua
