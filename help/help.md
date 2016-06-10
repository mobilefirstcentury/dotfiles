---- Help Guide ----
===================

[TODO]
  - tester [TMSU](http://tmsu.org/) pour créer un tag file system dédié à aux fichiers d'aide

How can you get help in most situations ?


help on dev documentation
-------------------------

### duckduckgo chrome
On DuckDuckGo you can perform a search on a specific source with the 'bang(!)' feature.

#### keyboard shortcuts
[TODO] 
  - ne garder ici que les shortcuts vraiments utiles.


Enter / l o    | go to the highlighted result, or use it right away to go to the first result
Ctrl Cmd+Enter | open a result in the background
d              | domain search (if a result is highlighted)
' / v          | open the highlighted result in a new window/tab. Since this uses JavaScript, you need to turn off pop-up blockers first.
← / →          | navigate instant answer tabs. When an instant answer is open, navigate within the instant answer.
↓ / j          | next search result
↑              | k — previous search result
/              | h — go to search box
s              | go to misspelling link (if any)
t              | go to top
m              | go to main results

#### bang search

###### normal seach in the browser

  $ ddg Lord of the Rings --search        # this is a normal duckduckgo search in the browser
  $ ddg Lord of the Rings -s              # this is a normal duckduckgo search in the browser

###### quick general answer
  ```sh
  # get a quick info
  $ ddg python virtualenv                    // will display short text definition if found
  
  # get the url of the information source
  $ ddg python virtualenv -u 

  # copy the first result of a search
  $ ddg paris - ul | pbcopy                  // 'u' gives the url, 'l' gives the first result
  ```

###### !bang search
  ```sh

  # lauch a !bang search on devdocs.io 
  $ ddg dev addeventlistener -b           # display a devdocs help in a new tab in i3 web workspace(3) 
  > <WIN+3>                               # switch to the help tab
  > <ctrl+w>                              # close help tab

  # Launch a search on Duck Duck Go in the browser

  $ ddg \!wfr Lord of the Rings --search        # here we include the bang tag in the search keywords as we would do on the browser
  $ ddg \!wfr Lord of the Rings -s              # here we include the bang tag in the search keywords as we would do on the browser
                                                # (don't forget to escape '!' otherwise it will be expanded by the shell)


  # short syntax for a bang search on wikipedia fr in the browser ('-b' stands for !bang and the first argument is the bang code)
  $ ddg wfr Lord of the Rings -b 

  # bang query on Wolfram Alpha in the browser
  $ ddg wa max of sin x  -b                             // open the browser on the wolfram result

  # bang search on Stack Overflow
  $ ddg so [node.js] invoke aws lambda from node -b      // open the browser on the stackoverflow results

  # bang search on npmsearch
  $ ddg npmsearch log -b      // open the browser on the npmsearch results
  ```

###### get json list
duckduckgo tries to return result list when it makes sense (aka 'instant answers')

  ```sh
  $ ddg simpons characters -j                      # returns a json list of simpsons characters
  ```

browse workstation wiki
------------------------
workstation comes with a comprehensive wiki in markdown format.

  $ ranger ~help/                                // ranger is a command line file browser
  # type <l> key to open a file
  # type <,+q> to return to ranger


browse devdocs
---------------
### what is it ?
[devdocs.com](http://www.devdocs.com) is searchable online developmentation 

### use
  [TODO] 
    - modifier la commande ci-dessous pour lancer devdocs dans le workspace 7 si 
    - **ou mieux** configurer i3 pour que devdocs soit lancé au démarrage dans le workspace 7
    - **ou encore mieux** configurer pm2 pour lancer la version docker de devdocs au démarrage (cf https://github.com/Thibaut/devdocs).

  # open a chrome browser on [devdocs.com](http://www.devdocs.com)
  $ google-chrome --app=http://www.devdocs.com 


browse dasht on the command line
--------------------------------

### what is it ?
dahst is a command line equivalent of devdocs.

### install
  # it is installed as an external package
  $ cd ~/packages/
  $ git clone https://github.com/sunaku/dasht.git 
  $ popd
  # it needs sqlite3
  $ sudo apt-get install sqlite3
  # ~/packages/dasht/bin is added to the the PATH (in ~/.zshrc)
  
### use 
#### install docsets
[TODO] 
  - comment spécifier des versions (Jquery 3 par exemple)
  - Créer un scratchpad i3 dédié à dasht
  - copy man in man dir (can be browsed [online](https://sunaku.github.io/dasht/man/))

  # get docsets list from [dash list](https://kapeli.com/dash#docsets)
  $ dasht-docsets-install css javascript html bash jquery --force 


#### ask for documentation
[TODO] compléter
  
  $ dasht


