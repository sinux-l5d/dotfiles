# Sinux's dotfiles

My dotfiles are intended for my personal use and will unlikely be to your convenience.

## Usage

After `stow` and `make` are installed:

```bash
# Init 
# it has to be cloned in a subdirectory of $HOME
git clone git@github.com:sinux-l5d/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Link all config
make
make all

# Link specific config
make [directory...]
make zsh alacritty
```
