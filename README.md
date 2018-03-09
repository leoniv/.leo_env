# Leo's env for work in console

It's personal settings. Forks repo and customize for self.

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
* [.bash_completion](./home/.bash_completion) - does't forget to include files
into your * `~/.bashrc` like:
```sh
. ~/.bash_completion/*
```

## Fonts

Install manually [fonts](./fonts)

## Vim settings

Some settings defined directly in [.vimrc](home/.vimrc). Other settings
grouped in a groups in [settings](home/.vim/settings) directory.

## Vim pugins

Plugins defined in [vundles](home/.vim/vundles/) directory and grouped in a
groups in the `group.vandle` files. Plugins settings defined in
`group.conf.vim` files.

## Installation

> Installation move old dotfiles and directories to `.filename.leo_env.origin`

    $cd ~ && git clone https://github.com/leoniv/.leo_env.git && cd .leo_env && ./install.rb

## Enjoy :)
