# dotfiles

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

Install powerline fonts

```shell
sudo apt install fonts-powerline
```

Change ZSH_THEME string to ZSH_THEME="spaceship" in ~/.zshrc

```shell
source ~/.zshrc
```




