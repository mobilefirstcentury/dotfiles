---- Python User Guide ----
===========================

[TODO]

  - automatiser la procédure 'Workstation Environment Installation' dans les dotfiles
  - informations sur `venv` le built-in module python3 qui implémente l'API virtualenv
  - est-ce que pip3 est installé par défaut sur Ubuntu 14.04 ? A priori OUI. A vérifier.
  

Best practices
--------------

### Workstation Environment Installation
  ```sh
  # python 2.7 et python 3.4 sont présinstallés sur Ubuntu 14.04
  $ sudo apt-get install python3-dev   # this package is needed for installing new python3 packages using pip
  $ pip install --user virtualenv
  $ pip insall --user virtualenvwrapper
  $ source ~/.local/bin/virtualenvwrapper.sh      # add this in ~/.zshrc
  $ PATH=$PATH:~/.local/bin                       # add this in ~/.zshrc
  $ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
  $ mkvirtualenv py3 -p `which python3`    # do this once to create an alternate 'global' python 3 environment stored in ~/.virtualenvs/py3
  ```

### Usage
  
#### local environment
[TODO] 
  - Modifier cd dans oh-my-zsh pour desactiver l'environnement quand on quitte le repertoire du projet (cd out)
  - En fait c'est assez facile à faire: si on ne trouve pas de fichier `.env` on appelle `deactivate`
  - Ecrire un script pour faire `mkproject <project-name> ` qui fasse: 
      ```sh
      + mkcd <project-name>
      + virtualenv env
      + echo "echo 'source ./env/bin/activate'" > .env 
      + source .env
      ```

For python development purpose, **create a local python environment in each project**:

  ```sh
   cd <project-dir>
  # create a local directory to hold local environment. By convention it's always named 'venv'
  $ virtualenv venv
  # create a `.env` file activating the directory so that activation can be automatically by autoenv each time we cd'in this project
  $ echo "echo 'source ./env/bin/activate'" > .env 
  $ source .env   # do the real activation the first time. 
  # each time will cd'in this environment will be activated
  # BUT we have to deactivate it if we cd out ...
  $ deactivate
  $ we can delete the environment simply by deleting the `venv` directory
  ```

#### Python 2 Global environment
  - C'est l'environment système par défaut de Ubuntu 14.04
  - C'est l'environment dans lequel on travail lorsqu'on utilise des programmes/scripts python externes

#### Python 3 Global environment
  ```sh
  # 'py3', a global python3 environment has already be createed with: `$ mkvirtualenv py3 -p `which python3`
  # switch to py3:
  $ workon py3
  # switch back to normal (python 2.7) environment
  $ deactivate
  ```


Tools
-----

### Installation


Pip
---

### Installation
  ```sh
  # install with apt-get
  $ apt-get -y install python-pip
  $ pip -V  # check version installed (current installed version in Workstation is 1.5.4)

  # or 'manually'
  $ curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
  $ python get-pip.py
  $ pip -V  # check version installed

  # This installs pip3 as the global pip.
  # we don't do that until we decide to switch completely to a python3 global installation
  # install with apt-get
  $ apt-get -y install python3-pip
  $ pip -V  # check version installed
  # or 'manually'
  $ curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
  $ python3 get-pip.py
  ```


### Upgrade
  $ sudo pip install -U pip setuptools

### Usage
  ```sh
  $ pip install 'some-package'  # install 'some-package' from 'PyPi'(Python Package Index)
  $ pip install 'some-package==1.4' # install a specific version
  $ pip install 'some-package>=1,<2'  # install a version greater and/or lesser than a specified version
  $ pip install 'some-package~=1.4.2' # install a version compatible with a specified version
  $ pip install -U 'some-package' # upgrades some package
  $ pip install --user 'some-package' # installs some package in the current user's home (~/.local/)
  $ pip install -r requirements.txt # install a list of packages listed in requirements.txt file
  ```


Virtualenv
----------
virtualenv creates local python environments isolated from the global install

### installation
  ```sh
  # check that we're in the default system environment. [TODO] Comment on vérifie ? 
  $ pip install --user virtualenv   # installs virtualenv in the user's home directory (~/.local/). Prefered method.
  $ pip install virtualenv          # Alternative. installs virtualenv in the global site-package

  # [TODO] ce [blog](http://www.nerdyweekly.com/posts/virtualenwrapper-python2-python3/) affirme qu'il faut installer virtualenv via apt-get pour pouvoir l'utiliser avec python3 ...
  $ sudo pip uninstall virtualenv
  $ sudo apt-get install python-virtualenv
  ```

### usage

  ```sh
  $ cd my-project-folder
  $ virtualenv <env-name>           # creates a folder named <env-name> with executables needed to install others packages and run python code
  $ virtualenv -p /usr/bin/python2.7 <env-name>   # creates a folder named <env-name> with executables needed to install new packages and run code with interpreter in `/usr/bin/python2.7`
  $ virtualenv -p /usr/bin/python3 <env-name>   # creates a folder named <env-name> with executables needed to install new packages and run code with interpreter in `/usr/bin/python2.7`
  $ source <env-name>/bin/activate  # activate the virtual environment before using it
  $ pip install <package-name> # packages are installed locally and isolated from the global Python Installation
  $ pip freeze > requirements.txt  # creates a file `requirements.txt` with a list of installed packages
  $ pip install -r requirements.txt # recreates an environement with specified list of packages
  $ deactivate # deactivate the virtual environment to return to the default python environment (Global Installation)
  ```


Virtualenvwrapper
-----------------------
Wrapper around virtualenv that centralizes all environment in a unique folder for easier management

### Installation
  ```sh
  # first install virtualenv
  # check that we're in the default system environment. [TODO] Comment on vérifie ? 
  $ pip install --user virtualenvwrapper  # installs virtualenvwrapper in the user's home directory (~/.local/). Prefered method.
  $ pip install virtualenvwrapper  # Alternative. Install virtualenvwrapper on the Global Python Installation

  # this directory has to be created once
  $ mkdir ~dev/PyProjects   # projects created with `mkproject` are created here
  $ export PROJECT_HOME=~dev/PyProjects

  $ source ~/.local/bin/virtualenvwrapper.sh     # add this in ~/.zshrc
  $ source /usr/local/bin/virtualenvwrapper.sh   # add this in ~/.zshrc if virtualenvwrapper  been installed in global packages-site

  # [TODO] Verifier si c'est utile de déclarer ça: '$ VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3'
  ```

### Usage
  ```sh
  # create a new virtual environment 
  $ mkvirtualenv <env-name>  # creates a virtual environement in new <env-name> folder inside `WORKON_HOME`(~/.virtualenvs)
  # or with `/usr/bin/python3` interpreter
  $ mkvirtualenv <env-name> -p `which python3`  # creates a python3 virtual environment in new `$WORKON_HOME/<env-name>` (actual python version is given by `python3 -V`)

  # activate the new environment work 
  $ workon <env-name>  # activate <env-name> environment
  $ pip list   # lists packages availables in active environment
  $ lsvirtualenv # list all created environments
  $ workon  # this also list all created environments

  # deactivate the environment
  $ deactivate # before quitting project, deactivate current environment

  # clean up
  $ rmvirtualenv <env-name> # delete virtual environment <env-name>
  ```

Autoenv
-------
Autoenv automatgically activates environment when cd'ing in a directory containign a `.env` 

### Install
  ```sh
  $ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv 
  # with oh-my-zsh activation is done lazily, so no need for this ...
  # echo 'source ~/.autoenv/activate.sh' >> ~/.zshrc
  ```

### Usage
  ```sh
  $ create a `.env` file in the project directory
  # if using only virtualenv ...  (PREFERRED OPTION)
  $ echo "source <env-name>/bin/activate" > .env
  # of if you're also using virtualenvwrapper...   (ALTERNATIVE)
  # echo "workon <env-name>" > .env
  ```
