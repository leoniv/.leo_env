# Leo's env for working in terminal

It's personal settings! Forks repo and customize for self.

## Installation

> Installation move old dotfiles and directories to `.filename.leo_env.origin`

    $cd ~ && git clone https://github.com/leoniv/.leo_env.git && cd .leo_env && ./install.rb

### Vim

For all functionality require `Vim` with `+ruby, +lua, +python` etc. Check
your vim:

     $vim --version

If require to build Vim from sources. Building
[shell script](https://gist.github.com/erickpatrick/5e0923d3645eaf4056b6b9fee4c91e2f)
for example.

### Fonts

Install [fonts](./fonts) manually.

### Solarized terminal require!

* `mytty` - configured automatically in `.minttyrc`
* `xterm` - exec `xrdb -merge ~/.Xresources`
* `gnome-terminal` - look [gnome-terminal-colors-solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized)

## Dotfiles

**Imported dotfiles**

* [.ctags](./home/.ctags) - ctags customize
* [.gemrc](./home/.gemrc) - gem defaults
* [.gitconfig](./home/.gitconfig) - global git config. Be careful this file
contain `[user]` section with owner's personal name and e-mail!
* [.gitignore](./home/.gitignore) - global git ignore
* [.inputrc](./home/.inputrc) - bash vim like input mode
* [.minttyrc](./home/.minttyrc) - settings for cygwin terminal `mintty` with
dark solarized color scheme
* [.vim](./home/.vim) - vim config directory
* [.vimrc](./home/.vimrc) - vim config file
* [.bash_completion.d](./home/.bash_completion.d) - does't forget to include files
into your * `~/.bashrc` like:
```sh
. ~/.bash_completion.d/*
```
* [.Xresources](home/.Xresources) - solarized theme for xterm

## Vim settings

Some settings defined directly in [.vimrc](home/.vimrc). Other settings
grouped in a groups in [settings](home/.vim/settings) directory.

## Vim pugins

Plugins defined in [vundles](home/.vim/vundles/) directory and grouped in a
groups in the `group.vandle` files. Plugins settings defined in
`group.conf.vim` files.

## Enjoy :)
