What's this?
==================================
This repository contains several utility and template file which I use while develop infrastructure in BDD way.

## Tools
The tools I use to do BDD-infra are

* [Vim](http://www.vim.org/)
  * [Shougo/unite.vim](https://github.com/Shougo/unite.vim)
  * [thinca/vim-localrc](https://github.com/thinca/vim-localrc)
  * [ujihisa/unite-rake](https://github.com/ujihisa/unite-rake)
  * [ujihisa/unite-rake](https://github.com/ujihisa/unite-rake)
  * [t9md/vim2tmux.vim](https://github.com/t9md/vim2tmux.vim)

* [tmux](http://tmux.sourceforge.net/)

* [rake](http://rake.rubyforge.org/)

* [cucumber](http://github.com/KieranP)
* [cucumber-nagios](http://auxesis.github.com/cucumber-nagios/)

* [Vagrant](http://vagrantup.com/)
* [t9md/vagrant-snap](https://github.com/t9md/vagrant-snap)

## Vim
To load `init.vimrc` from $PWD, set follwing code in `.vimrc`

    if filereadable("init.vimrc")
      call localrc#load('init.vimrc')
    endif

