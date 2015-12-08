Generic dotfiles for all MFC machines
====================================

Overview
--------

MFCWorkstation est une distribution mouse-less. Il est bien sûr possible d'utiliser la sousis mais la selection des logiciels 
ainsi que leur configuration est centrée autour de la console et des raccourcis clavier VIM.


Remarque preliminaire
---------------------

### Documentation 
Pour l'instant c'est un peu le bordel pour suivre les instructions d'install de la worstation. On a 6  fichiers !!!!
+ ~/Documents/_WORKSTATION/_INSTALL/initMFCWorkstation.2.0: Ce fichier est  un gros bordel pas propre: il faut absolument effacer tout les points qui ont déjà été portés dans les autres fichiers.
+ ~notes/workstation.md qui contient les modifs notées en live et qui devrait passer dans un le todo du repo github des dotfiles.
+ ~/dotfiles/README.md qui contient le todo du repo
+ ~/dotfiles/bootstrap.sh qui script les modifs pour une installation automatiques (A terme une grande partie du contenu des fichiers ci-dessus devraient être portée dans bootstrap.sh)
+ ~/Documents/_WORKSTATION/_INSTALL/setupUbuntu qui contient d'autres informations d'installation (!!)à
+ ~/Documents/_WORKSTATION/_TODO/debug.md qui contient les modifications en cours qui n'ont encore permit de résoudre un problème.




### Features


#### Copier/Coller
Vim offre de superbes fonctionnalités, est extremement personnalisable, est disponible sur toutes les machines unix, est utilisable en remote via un un lien ssh sur une ligne bas débit.
Vim serait un outil idéal pour le codeur s'il n'avait pas des problèmes incompréhensibles pour gérér ... le copier/coller!

La solution (partielle) retenue pour la MFCWorkstation est la suivante:
* contrairement à la tradition linux on fusionne la selection primaire et le clipboard. Cela permet de simplifier la compatibilité de Vim avec le reste du système.
* En dehors de VIM on utilisera CTL-C ou selection souris et CTL-V ou clic bouton du milieu pour copier/coller :
  * ** A noter ** pour synchroniser clipboard et primary dans toutes les applications on utilise xcmenu (un clipboard manager) que j'ai modifié le fichier config.h et recompilé pour obtenir le comportement voulu.
  * Xcmenu maintient un historique des clipboards (et selections) accessible via win+c depuis dmenu dans i3: on peut donc laisser les selections souris écraser le clipboard puisqu'on peut retrouver facilement la valeur du clipboard dans l'historique affiché par xcmenu.
* On utilisera également la souris : tout texte selectionné avec la souris se retrouve dans le clipboard.
* le terminal URxvt (dans lequel vit VIM) est configuré pour synchroniser clipboard et selection primaire
* on utilisera un manager de clipboard pour faire la même chose dans les autres applications X utilisées.
* Vim est également configuré pour synchroniser les registres "* (lié à la selection primaire système)  et "+ (lié au clipboard système).  
  * configuration:
    * set mouse=a
    * set clipboard=unnamed,unnamedplus,autoselect
  * Par contre Vim fait exception car on ne peut pas utiliser C-c/C-v pour copier/coller. Il faut avoir recours au jargon VIM: y et p.
  * De plus il y deux modes de selections à la souris dans VIM:
    * par défaut c'est VIM qui prend en charge les evenements souris et qui essaie de (mal) synchroniser les selections avec buffers internes et le système:
      * Immediatement après la selection, le texte selectionné est bien dans "* mais pas dans "+ :(
      * Par contre si on colle cette selection DANS VIM avec le bouton de milieu de la souris, alors le texte se retrouve aussi dans "+.
    * si on appuye sur Shift en faisant la selection souris, alors ce n'est pas VIM qui maître mais URxvt:
      * URxvt gère bien la synchronisation des buffers et le texte se retrouve bien dans le clipboard et la selection primaire,
      * par contre Urxvt ne connait pas le contenu de VIM est copie (entre autre) les numéros de lignes avec le texte ....

En résumé: même en simplifiant pour n'avoir qu'un seul buffer, on a des raccourcis clavier et, pire des comportements, qui ne sont pas uniformes sur toutes les applications :(

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

### Installation & Maintenance

#### Installation Machine virtuelle vagrant

    $ git clone https://github.com/mobilefirstcentury/dotfiles.git
    $ cd dotfiles
    $ vagrant up
    $ vagrant ssh

#### Installation permanente

    $ git clone https://github.com/alanctkc/dotfiles.git
    $ cd dotfiles
    $ ./bootstrap.sh

#### Options

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

#### Backups

By default, backups of your current dotfiles are created at `~/.filename.dotbackup`.

To delete the backups:

    $ ./bootstrap.sh --delete-backups

#### Updating

    $ ./bootstrap.sh --update

#### Software

##### Ubuntu

    $ sudo apt-get install git vim-nox zsh tmux i3 ranger python python-dev python-setuptools curl


##### Python tools

IPython is a fantastic python interactive shell, and flake8 lets vim show you where you're not adhering to python syntax or coding style.

    $ sudo easy_install pip
    $ sudo easy_install ipython
    $ sudo easy_install flake8


