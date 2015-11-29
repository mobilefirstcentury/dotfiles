Generic dotfiles for all MFC machines
====================================

Overview
--------

This is a complete development configuration using git, vim, tmux, i3, and bash or zsh. 




### Features

#### Shell aliases
- `gst` - git status
- `gad` - git add
- `gbr` - git branch
- `gcm` - git commit
- `gdi` - git diff
- `gdt` - git difftool
- `gco` - git checkout
- `glo` - pretty git log
- `gpv` - switch to previous git branch
- `to` - create tmux session named after current directory
- `to [name]` - create tmux session with name
- `ta [name]` - attach to tmux session, with tab completion
- `tl` - list tmux sessions
- `mkve [name]` - make a new virtualenv
- `wo [name]` - work on a virtualenv, with tab completion
- `py` - python
- `ipy` - ipython
- `fl` - flake8
- `rn` - ranger
- `xf` - extract various archive file types

#### Vim plugins

- [vundle](https://github.com/gmarik/vundle) - vim plugin manager
- [ctrlp](https://github.com/kien/ctrlp.vim) - quickly call files into buffers
- [vim-handlebars](https://github.com/nono/vim-handlebars) - handlebars template compatibility and syntax
- [vim-jinja2-syntax](https://github.com/Glench/Vim-Jinja2-Syntax) - jinja2 template compatibility and syntax
- [python-mode](https://github.com/klen/python-mode) - python niceties, wrapping, etc
- [syntastic](https://github.com/scrooloose/syntastic) - syntax and coding convention checker
- [tcomment_vim](https://github.com/tomtom/tcomment_vim) - easy comment/uncomment
- [vim-airline](https://github.com/bling/vim-airline) - pretty status bar
- [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako) - mako template compatibility and syntax
- [vim-colorschemes](https://github.com/flazz/vim-colorschemes) - lots of color options
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - git branches and features
- [vim-golang](https://github.com/jnwhiteh/vim-golang) - Go compatibility and syntax
- [vim-less](https://github.com/groenewege/vim-less) - LESS compatibility and syntax
- [vim-surround](https://github.com/tpope/vim-surround) - surround text motion
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired) - useful extra motions
- [matchit](https://github.com/tmhedberg/matchit) - use % to jump around html and other extras
- [python-matchit](https://github.com/voithos/vim-python-matchit) - use % to jump around python code
- [vim-sneak](https://github.com/justinmk/vim-sneak) - quickly jump to characters
- [emmet-vim](https://github.com/mattn/emmet-vim) - html expansion from selectors
- [jedi-vim](https://github.com/davidhalter/jedi-vim) - python autocomplete and function prototypes
- [neocomplete](https://github.com/Shougo/neocomplete.vim) - miscellaenous autocomplete

## Installation Machine virtuelle vagrant

    $ git clone https://github.com/mobilefirstcentury/dotfiles.git
    $ cd dotfiles
    $ vagrant up
    $ vagrant ssh

## Installation permanente

    $ git clone https://github.com/alanctkc/dotfiles.git
    $ cd dotfiles
    $ ./bootstrap.sh

### Options

`--git-name "[name]"` - Specify the full user.name for git configuration  
`--git-email [email] ` - Specify the full user.email for git configuration  
`--no-virtualenv` - Exclude virtualenvwrapper installation (using virtualenv-burrito)  
`--no-bash` - Exclude bash configuration  
`--no-zsh` - Exclude zsh configuration  
`--no-git` - Exclude git configuration  
`--no-i3` - Exclude i3 configuration  
`--no-vim` - Exclude vim configuration  
`--no-tmux` - Exclude tmux configuration  
`--no-ipython` - Exclude ipython configuration  

### Backups

By default, backups of your current dotfiles are created at `~/.filename.dotbackup`.

To delete the backups:

    $ ./bootstrap.sh --delete-backups

### Updating

    $ ./bootstrap.sh --update

## Software

### Ubuntu

    $ sudo apt-get install git vim-nox zsh tmux i3 ranger python python-dev python-setuptools curl


### Python tools

IPython is a fantastic python interactive shell, and flake8 lets vim show you where you're not adhering to python syntax or coding style.

    $ sudo easy_install pip
    $ sudo easy_install ipython
    $ sudo easy_install flake8


TODO 
------


### Vagrant 
+ pour valider, tester bootstrap sur une machine vierge dans vagrant.
+ faire marcher le fichier Vagrant file pour une installation directe avec vagrant up


# Autostart Ubuntu. Faire les actions suivantes dans un autostart pour Ubuntu

# I - On est obligé de faire cette modif pour permettre de lancer I3 sur VT8 depuis Ubuntu, 
# Sinon on a un message d'erreur. Bien sur on s'assure que l'ajout n'est fait qu'une fois.
[[ ! -n $(grep "\[MFC" /etc/X11/Xwrapper.config) ]] && {
cat >> /etc/X11/Xwrapper.config << EOL
# [MFC DOTFILES] Modification pour permettre la lancement d'une session sur VT8 depuis Ubuntu.
allowed_users=anybody
# [MFC FIN MODIF]
EOL 
}


# II Transferer le code qui lance startx en VT pour Ubuntu dans un autostart 
# Code est pour l'instant dans .zlogin qui n'est pas lancé sur Ubuntu



# Install Tree
sudo apt-get install tree

# Install Vundle
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

# Modifications sur bootstrap.sh
 eliminer l'installation des plugins vundle (Indiquer dans un Readme qu'il faut lancer Vim puis faire ":PluginInstall" après l'execution de bootstrap.sh
 créer le lien .oh-my-zsh (vérifier d'abord pourquoi ce n'est pas fait de base)

#Install Conky
$ sudo apt-get install conky-all
$ chmod +x /home/rachid/dotfiles/.i3/conky/conky-i3bar

# install i3 
$ sudo apt-get install
# Verifier que les dépendances i3lock et i3status i3bar sont bien installées

# Install autojump 
# Sinon ça provoque une erreur dans zshrc (en relation avec oh-my-zsh où ce plugin est déclaré)
$ sudo apt-get install autojump
 
#Install feh
sudo apt-get install feh

# Adapter le mapping clavier 
 - swapper caps lock et escape 
    Pour Ubuntu (Session X), il faut créer le fichier ~/.config/autostart/.desktop.(cf http://askubuntu.com/questions/598195/how-to-add-a-script-to-startup-applications-from-the-command-line)
    Pour les consoles virtuelles (Debian):
        A
        * modifier le fichier  /etc/default/keyboard (privilege admin)  (cf  http://www.emacswiki.org/emacs/MovingTheCtrlKey)
        * $sudo dpkg-reconfigure -phigh console-setup 

 - swapper left control et left shift : ??


