## My nord theme setup for i3 based on Arch Linux
*(Also, sorry I couldn't come up with a better name)*

# Details

- **OS**: [Arch Linux](https://archlinux.org/)
- **Kernel**: `linux-lts`
- **WM**: [i3-gaps](https://github.com/Airblader/i3)
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://github.com/alacritty/alacritty)
- **Editor**: [Vim](https://www.vim.org/), [Atom](https://atom.io/)
- **Browser**: [Google Chrome](https://www.google.com/intl/en_in/chrome/), [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/)
- **File Manager**: [Ranger](https://github.com/ranger/ranger), [Thunar](https://docs.xfce.org/xfce/thunar/start)
- **Bar**: [Polybar](https://github.com/polybar/polybar)
- **GTK Theme**: Nordic

# Installation

Clone this repository with:

`git clone https://github.com/Nonanonymous24/dotfiles-arch-i3-nord.git`

For Arch Linux users, use the package lists provided in the `package_list` folder to install necessary packages:

`cd dotfiles-arch-i3-nord.git/package_list/`
`sudo pacman -S --needed $(cat pacman_packages.txt)`
`yay -S $(cat aur_packages.txt)`

Note: The package list is very extensive, so I would suggest to edit it accordingly.

After installing packages, open a file manager of your choice and manually replace your configuration files with the one in the repository (I will try and make a script for this, but for now, this is the only way)
All directories inside the `.config` directory in this repo should be replaced with corresponding directories in your `~/.config/` directory. Rest of the files should be put in your `~` directory. 
Go ahead and make a backup of your original configuration before replacing them.

After replacing the files, following are the tasks to be done:

1. [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish):

To install and configure `omf` identical to mine, do the following from `~`:

```
git clone https://github.com/oh-my-fish/oh-my-fish
cd oh-my-fish
bin/install --offline
```

Restart your terminal and run the following commands:

```
fish_update_completions
omf update
omf install agnoster
```

2. [tpm](https://github.com/tmux-plugins/tpm):

To install tpm:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux source ~/.tmux.conf
```

Type in Prefix+`I` ('Ctrl+b' 'Shift+i' in most cases) to reload your tmux configuration.

3. Vim Plugins:

For installing Vundle:

```
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

For installing all plugins:

```
vim .vimrc
```

Run `:PluginInstall` to install all plugins. 
If you want to install YouCompleteMe (commented out) correctly, run the following from your `~`:

```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

4. [spicetify-cli](https://github.com/khanhas/spicetify-cli):

First, to apply spicetify to spotify, we need to get write permission on spotify files:

```
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
```

To apply the spicetify theme:

```
spicetify apply
```

