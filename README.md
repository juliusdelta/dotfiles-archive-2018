# My Dotfiles

## Overview

This is my general configuration for Emacs, Zsh, Vim, & Tmux. There's still a few bugs here and there I'm working out. Emacs is my daily driver, but I use Vim here and there if it's more convienent. Everything I use is based on the [Nord Color theme](https://github.com/arcticicestudio/nord) which is just awesome. I've tried to ensure the theme is consistent throughout all of these dotfiles. 

## Screenshots

![](https://i.imgur.com/EWkTSmm.png)
![](https://i.imgur.com/UwLlTEg.png)

## Details

### Emacs

I'm using Evil-mode to give Vim like behavior and keybindings. It's really a hybrid of several things. I'm using [Projectile](https://github.com/bbatsov/projectile), [Company Mode](http://company-mode.github.io/), [Smartparens](https://github.com/Fuco1/smartparens), [Org Mode](http://orgmode.org/), [Helm](https://github.com/emacs-helm/helm), & [Magit](https://magit.vc/) with a few other random packages. I'm also useing some evil-varients of some of these packages for ease of use. 

You'll notice my version of Emacs doesn't have a tool bar. This can be done by installing a special patched version of Emacs via Homebrew. You can find all the information on this [here](https://github.com/braham-snyder/GNU-Emacs-OS-X-no-title-bar).
### Zsh

I use [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) as my zshell. I really enjoy the majority of packages it comes with. I'm also using [PowerLevel 9k](https://github.com/bhilburn/powerlevel9k) as my theme. I also have vi-mode configured for it so I can keep my Vim keybindings. I also have a lot of aliases, that will probably be overridden by the `git` plugin but I haven't fixed that yet. There's also remenants of an old [fzf](https://github.com/junegunn/fzf) configuration attempt. I'll probably clean these out soon.

### Vim

I don't use Vim to often. My setup for it is vairly minimal. Almost everything is default. I have a weird bug where backspace doesn't work properly in `Insert` mode, so there's a single line in that to fix that.

### Tmux

I don't use Tmux too much anynmore. It's just on those days where I spend a lot of time running tests do I use it. Tmux leader is mapped to `C-b` which is just fine, as Ctrl has become apart of my pink's muscle memory.

## Todos

- [ ] Increase documentation
- [ ] Split up Emacs & Zsh configuration
- [ ] Refactor
- [ ] Remove fzf config

#### Disclaimer

Use at your own risk! I'm not responsible if you download these and something breaks :D

