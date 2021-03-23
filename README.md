## My nord theme setup for i3 based on Arch Linux


# Details

- **OS**: [Arch Linux](https://archlinux.org/)
- **Kernel**: `linux`
- **WM**: [i3-gaps](https://github.com/Airblader/i3)
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://github.com/alacritty/alacritty)
- **Editor**: [Vim](https://www.vim.org/), [Atom](https://atom.io/)
- **Browser**: [Google Chrome](https://www.google.com/intl/en_in/chrome/), [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/)
- **File Manager**: [Ranger](https://github.com/ranger/ranger), [Thunar](https://docs.xfce.org/xfce/thunar/start)
- **Bar**: [Polybar](https://github.com/polybar/polybar)

# Installation

You can use the install script that I made. It creates a backup of your current config and just copies the files to the directories (no symlinks). 

Clone this repository with:

`git clone https://github.com/Nonanonymous24/dotfiles-arch-i3-nord.git`

For Arch Linux users, use the package lists provided in the `package_list` folder to install necessary packages:

```
cd dotfiles-arch-i3-nord.git/package_list/
sudo pacman -S --needed $(cat pacman_packages.txt)
yay -S $(cat aur_packages.txt)
```

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

``````
fish_update_completions
omf update
omf install agnoster
omf install thefuck
omf install weather
omf install fish-spec
omf install spark
omf install vundle
``````
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

4. [spicetify-cli](https://github.com/khanhas/spicetify-cli):

First, to apply spicetify to spotify, we need to get write permissions on spotify files:

```
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
```

To apply the spicetify theme:

```
spicetify apply
```

5. For polybar air quality index module:

Follow [this](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-airqualityindex)

6. betterlockscreen

I am using a fork of betterlockscreen. Run the following commands:

``````
git clone https://github.com/Nonanonymous24/betterlockscreen-12hr.git
cd betterlockscreen-12hr
``````

To set the wallpaper as lockscreen:

```
cd betterlockscreen
./betterlockscreen -u ~/Pictures/paul-gilmore-KT3WlrL_bsg-unsplash.jpg
```
Use Mod+Shift+X to lock desktop.

7. Setting the startpage and theme for chrome:

Open google chrome and go to chrome://extensions. Enable developer mode and click on load unpacked.

Navigate to `~/startpage_3/src` and click Open.

To set the theme, drop the `.crx` file in the same page on chrome and enable the extension.

8. Rofi theme:

After copying the config, copy the `nord.rasi` file in `/usr/share/rofi/themes` directory.

Then run `rofi-theme-selector` from the terminal, scroll down to nord and hit `Enter`.

You will get a preview of the theme. This theme has a dmenu-like positioning and I've been using it instead of dmenu as it is easy to run AppImages with rofi.

If you like the theme and want to set it as default, hit `Alt`+`a`. 
