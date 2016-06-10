---- Nodejs Debugging User Guide ----
====================================


debug tools
----------

### noode

[TODO] 
  - Réécrire le script ~/.scripts/noode en shelljs
  - ES6 bug
    - check if the tool still works when we upgrade node to 6.0
    - if ok change the alias accordingly 
  - Extend features
    - on peut récupérer des bonnes idées de [Nesh](http://danielgtaylor.github.io/nesh/) ?
    - est-ce qu'on peut utiliser [ce code source](https://github.com/jeffandersen/repl-require/blob/master/bin/noder) qui permet de loader dynamiquemnet un directory de modules ? 
  

#### what is it ?
  - noode is a workstation script wrapping [node-repl](https://github.com/maxogden/node-repl) tool **with the '--harmony' flag set**
  - noode executes a node application while opening a repl in the execution context of the app
  - this is really usefull for rapidely hacking an app
  - detailed explications [here](http://maxogden.com/node-repl.html)

#### install

  ```sh
  # install node-repl module
  $ npm install -g node-repl
  # install noode script and noode.init.js initialisation file in ~/.scripts (should be installed with workstation dotfiles)
  # review initialization code in ~/.scripts/noode.init.js (by default requires 'common/global' module)
```

#### use
  ```sh
  # use instead of node to execute an app
  # usually the app will require 'commmon/global' to ease hacking  during dev
  $ noode app.js
  # hack in the repl 
  #   $ __.drop([1,2,3])
  #   -> [2,3]
  ```

  ```sh
  # use instead of node without any app
  # in that case ~/scripts/noode.init.js initalization code is executed
  # this initialization will load 'common/global' 
  $ noode 
  # hack in the repl 
  #   $ __.drop([1,2,3])
  #   -> [2,3]
  ```


### denode
[TODO]
  - comprendre quelles sont options de node utilisée par défaut par denode (à priori '--harmony' mais je n'en suis pas sûr)
  - comment changer ces options ?

#### what is it?
An alternative to node-inspector with better performance and enhanced features
  - lauched time is must faster than node-inspector
  - it is compatible with ES6 by default (same compatibily than 'node --harmony' ?)  

#### install
  $ npm install -g denode

#### use
1. enter 'debugger;' on first line of the entry script :
  - but after the 'use strict'; declaration
  - naming this script something other thann 'index.js' may help to retrieve in denode
2. denode <entry js file>  // this will lauch the Electron app 
3. if the debugger is not paused on the 'debugger;' mark:
  - click on 'sources' tab
  - enter 'Ctrl+R' 
4. if the <entry js file> is not displayed
  - enter 'Ctrl+O' and the file name
  - or enter 'Ctrl+P' and the file name
5. use the normal chrome dev tools command to debug the app
6. quit with:
  - 'Ctrl+q' on the X app
  - or 'Ctrl+Shift+C' on the command line terminal 


### vscode
see ~help/vscode.md

### node-inspector
[TODO]
  - trouver le moyen de faire marcher node-inspector avec du code ES6 
	- vérifier si c'est vraiment instable comme certains commentaires le disent

#### what is it ?
tool to debug node applications in chrome dev tools.

#### install
  $ npm install -g node-inspector
  
#### use

  $ node-debug app.js    // will open a dev tools only chrome session
  # use chrome dev tools normally



### experimental tools

#### iron-node
[TODO]
  - j'ai dû désinstaller à cause de ce [bug](https://github.com/s-a/iron-node/issues/104)
  - réinstaller et tester.
  - vérifier que ES6 est supporté sans avoir besoin de babel en indiquant l'option '--harmony' dans [AppData](https://github.com/s-a/iron-node/blob/master/docs/CONFIGURATION.md#v8-flags)
  - vérifier si on a besoin d'utiliser les sources map et si c'est le cas vérifier que les sources map sont supportés :
    + voir [issue](https://github.com/s-a/iron-node/issues/54)


#### babel-node-debug
[TODO]
  - J'ai un bug(?) avec les 'rest parameters' de ES6 (cad function(...args){})
	- j'ai fais le test avec un projet vierge ne contenant que le fichier baberc. Faire un test avec un vrai projet babel avant de conclure
  - lien possible avec cet [issue](https://github.com/CrabDude/babel-node-debug/issues/8)

**note** 
  - officially [recommande](http://babeljs.io/docs/setup/#installation) by babel 
  - **but** to avoid dependency hell, it **may** be better to use vanilla node-inspector with proper babel project scaffolding ...

##### what is it?
version babel de node-inspector

##### install
see [babel-node-debuh](https://github.com/crabdude/babel-node-debug)

##### use
see [babel-node-debuh](https://github.com/crabdude/babel-node-debug)


#### replad
[TODO] 
  - regarde de près [replad](https://github.com/thlorenz/replpad)
  - A priori permet de construire un environnement de debug basé sur la ligne de commande


#### node-vim-debugger
[TODO]
  - does not work with neovim: check status of [this issue](https://github.com/sidorares/node-vim-debugger/issues/40)

##### what is it ?
  vim embedded debugger

internal projects
------------------

### smart logging
#### what is it?
**beware** highly experimental && work in progress 

we want to develop a node module that can 'smartify' development logs:
  - logs are in a pretty printed JSON format (or better in YAML format?)
  - the structure of the JSON file reflects the 'structure' of the execution path
  - the state of the objects is also logged in JSON format

#### state of development
  - pour l'instant je n'ai pas encore de module npm
  - j'insère au besoin ce code 'quick & dirty' à base de console.log


#### possibles evolutions
  - la librairie fournit un function smartlog ayant pour arguments
    + info: string
    + {name: log}: un objet nommé à logger
    + d'autres objects nommer à logger
  - smartlog construit un object de la forme: {stack: function-name, stack:function-name, stack:function-name, info: info, name: log, name:log}
  - pour constuire cet object smartlog parse le résultat de (new Error().stack)
  - la librairie écrit dans un fichier logs.json
  - au moment de l'analyse on utilise:
    + un outil qui fait un 'group-by' sur le JSON
    + un prettifier
    + un outil d'exploration (Extension Chrome 'Json viewer' ?)

                                            
#### use

##### death code
  On s'assure que la structure JSON du log se clôt de manière valide même en cas de mort subite.
  ```js
  // on utilise 'jprichardson/node-death'
  var onDeath = require('death')

  // we want  our logs to be a json file
  console.log('{')
  onDeath(function(signal,err){
      console.log('"signal": ' , '"'+signal+'"\n}')
  })
  ```

##### logging code
[TODO] 
  - Ecrire quand même dans un fichier spécial ça doit pas être très dur 
  - Debugger ce code

  ```js
    // on utilise 'Canop/JSON.prune'
    var prune = require('json-prune')
    function smartlog(info, log){
        var toLog = (new Error()).stack
        // add the info at then end of toLog
        // add the log object at then end of toLog
        ...
        var logLine = JSON.stringify(JSON.parse(prune(toLog, { 
          prunedString: '{}',            // pruned nodes are indicated by '{}' symbol 
          arrayMaxLength:5               // we don't want loo long arrays
        })), null, '\t')                 // pretty print with a tab
        console.log(products,',\n')
    }
  ```

general libraries  
-----------------

### visionmedia/debug

[TODO]
  - apparemment il y a un problème lorsque on execute du code serveur dans un browser (avec un debug tool par exemple)
  - le contexte des console.log utilisés par la librairie n'est alors pas le bon.
  - Apparemment on peut le régler en faisant quelque chose comme 'process.stdout.write = console.log.bind(console);' (see [issue](https://github.com/s-a/iron-node/issues/30))

#### what is it?
log debug messages whith possibility to activate or desactivate specific messages types at runtime
**note** we'll use this library by default in all our projects

#### install
  $ npm install debug

#### uses
see [debu](https://github.com/visionmedia/debug)

#### code time

  ```js
  // in app.js
  var debug = require('debug')('error')
    , info = require('debug')('info')
    , name = 'My App';


  info('go ...')
  debug('booting %s', name);
```
#### runtime
  $ DEBUG=error,info node app.js

### node-bunyan
#### what is it?
simple, fast and very popular logging module for node.js

#### install
see [github](https://github.com/trentm/node-bunyan)

#### features 
able to pretty print json structured logs

#### use
see [github](https://github.com/trentm/node-bunyan)


general tools
--------------
### James
#### what is it?
 [James](https://github.com/james-proxy/james) is an HTTP proxy and monitor for viewing and debugging request made form the browser

