Quick Start
===========

Install ZSH and OH-MY-ZSH (make sure to switch your default shell to ZSH using
`chsh -s /bin/zsh`).

..and then..

**Warning:** installation process may remove some of your files. Only install this
software at your own risk.

``` html
curl -L https://github.com/sergeylukin/dotfiles/raw/master/tools/install.sh | sh
```

or

``` html
wget --no-check-certificate https://github.com/sergeylukin/dotfiles/raw/master/tools/install.sh -O - | sh
```

Installation script installs only dotfiles for the components that are installed on
your system. Here is the full list of components:

* ZSH
* OH-MY-ZSH
* VIM
* GIT
* SCREEN
* TMUX
* [rainbarf for TMUX](https://github.com/creaktive/rainbarf)

Screenshots
===========

Below are some screenshots of how your environment should look after setting
up the dotfiles. Make sure to apply Solarized theme to your terminal in order
to get similar effect.

ZSH + GIT
----------

![dotfiles](https://raw.github.com/sergeylukin/dotfiles/master/img/screen-zsh-git.jpg)

VIM
---

![dotfiles](https://raw.github.com/sergeylukin/dotfiles/master/img/screen-vim.jpg)

Installation tips
-----------------

#### Rainbarf for TMUX

On FreeBSD following works for me:

```
# cpan
cpan> force install App::rainbarf
```
