# Quick Start

Install ZSH and OH-MY-ZSH (make sure to switch your default shell to ZSH using
`chsh -s /bin/zsh`).

..and then..

**Warning:** installation process may remove some of your files. Only install this
software at your own risk.

```html
curl -L https://github.com/sergeylukin/dotfiles/raw/master/tools/install.sh | bash
```

or

```html
wget --no-check-certificate https://github.com/sergeylukin/dotfiles/raw/master/tools/install.sh -O - | bash
```

Installation script installs only dotfiles for the components that are installed on
your system. Here is the full list of components:

- ZSH
- OH-MY-ZSH
- VIM
- GIT
- SCREEN
- TMUX
- [rainbarf for TMUX](https://github.com/creaktive/rainbarf)

`Git` configuration file is copied and not symlinked upon installation
because your name and email should be hardcoded there without changing
the dotfiles repo. So after pulling in new commits related to git
configuration I do `sh ~/.dotfiles/tools/setup.sh` which syncs
everything, including bringing in new git configuration file.

# Screenshots

Below are some screenshots of how your environment should look after setting
up the dotfiles. Make sure to apply Solarized theme to your terminal in order
to get similar effect.

## ZSH + GIT

![dotfiles](https://raw.github.com/sergeylukin/dotfiles/master/img/screen-zsh-git.jpg)

## VIM

- Run `:BundleInstall` the first time you open VIM to install all plugins

![dotfiles](https://raw.github.com/sergeylukin/dotfiles/master/img/screen-vim.jpg)

## Installation tips

#### Rainbarf for TMUX

On FreeBSD following works for me:

```
# cpan
cpan> force install App::rainbarf
```

On OS X just:

```
brew install rainbarf
```

## Font to use in terminal

- [Meslo Nerd Font
  patched](https://github.com/romkatv/powerlevel10k/blob/master/font.md)

- [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/releases)

- [Inconsolata](https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf)

- [Consolas](http://ikato.com/blog/how-to-install-consolas-font-on-mac-os-x.html)

## iTerm2

### Color scheme

Go to `iterm2` -> `Preferences` -> `Profiles` -> `Color Schemes`, import
scheme from `iterm/Dracula.itermcolors` and activate it

### TMUX integration

Go to `Preferences` -> `Profiles` -> `Advanced` -> `Semantic History`

and set `Run command...` - `/Users/{user}/.tmux/iterm_click_file_open_in_vim.sh \1 \2`

replace `{user}` with your user account name

![iterm2 tmux integration](https://raw.github.com/sergeylukin/dotfiles/master/img/iterm2-tmux.png)

Create a pane named `vimc`, run `vim` there and forget about it. When you click
on filepath, it's used to edit the file.

## CentOS server setup

On fresh CentOS machine I usually start by running following as `root` user.

Install binaries

```sh
# yum -y install zsh git cpan
# cpan -i App::rainbarf
```

Allow sudo for `wheel` users without password:

- run `visudo`

- comment out `%wheel ALL=(ALL) ALL` and uncomment `%wheel ALL=(ALL) NOPASSWD: ALL`

Create user for myself

```sh
# useradd USERNAME
# passwd USERNAME
Changing password for user USERNAME.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
# usermod -aG wheel USERNAME
# su USERNAME
# curl -L https://github.com/sergeylukin/dotfiles/raw/master/tools/install.sh | sh
```

Edit ~/.gitconfig and enter proper name and email in relevant fields.

Open `vim` and run `:BundleInstall`

```sh
# mkdir ~/.ssh && chmod 700 ~/.ssh && touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
```

Edit `~/.ssh/authorized_keys` and insert your remote PC public SSH key there without line breaks

## Installation for maintaners

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

```
cat ~/.ssh/id_*** | pbcopy
```

paste buffer in https://github.com/settings/ssh/new
