# zsh

**Install zsh**

```shell
sudo apt install zsh &&\
sudo usermod -s /bin/zsh $USER
```

**Install oh-my-zsh**

```shell
sudo apt install git &&\
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&\
zsh
```

**Install zsh exctensions**

Command syntax highlighting

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

Search command history

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions \
~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Spaceship prompt

```shell
git clone https://github.com/denysdovhan/spaceship-prompt.git \
"$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
"$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Install fonts

```shell
sudo apt install fonts-powerline fonts-firacode
sed -i -r 's/^ZSH_THEME=.*/ZSH_THEME=\"spaceship\"/g' ~/.zshrc
source ~/.zshrc
```

# tmux

**Install tmux**

```shell
sudo apt apt install tmux
```

**Install Tmux Plugin Manager**

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux
```

**Install plugins**

```shell
Press prefix + I (capital i, as in Install) to fetch the plugin.
```

**Uninstalling plugins**

```shell
Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
```

**Update plugin(s)**

```shell
Press prefix + alt + u.
```

# neovim

**Install neovim**

```shell
apt purge --auto-remove vim
apt install nevim
```

**Plugins**

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```shell
:so $MYVIMRC
:VundleInstall
```

```shell
cp -R .vim/bundle/gruvbox/colors ~/.config/nvim
```


