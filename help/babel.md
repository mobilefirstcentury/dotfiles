---- Babel JS Transpiler Reading notes ----
============================================


Javascript history
---------------------

### Date of releases
 version                      | date | description
 --                           | ---  | ---
 livescript                   | 1995 | invention by Netscape navigator
 javascript                   | 1996 | renaming of livescript
 ECMAScript 1 (ES1)           | 1996 | standardisation of netscape's javascript
 ECMAScript 3 (ES3)           | 1999 | standardisation stalled from there with custom extensions by browser vendors
 ECMAScript 5 (ES5)           | 2009 | slowly adopted convergence standard. **As of 2015, Supported on all major browsers**.
 ES.Harmony (ES6)             | 2012 | Acceleration in features evolution with this major version (not yet finalised)
 ECMAScript 2015 (ES2015-ES6) | 2015 | **E2015-ES6 is officially published under ES2015 Name** New naming convention is based on year of release.
 ES2016 (ES7 or ES.Next)      | 2016 | New features and syntax. Scheduled for summer 2016.
 ECMAScript proposals         | 2017 | proposed features or syntaxes that may be included in the ECMAScript 2017 (Summer 2017?)

### Main features                                                                                                                                                         e
  [TODO] Read the [guide](https://github.com/thejameskyle/babel-handbook/blob/master/translations/fr/user-handbook.md)

What is Babel ?
---------------
  Babel transpiles JS2015(ES6) to ES5.
  **note** if writing npm module for publishing, best practice is to require 'babel-polyfill' as a peer dependency and document that the consuming app must require it

TODO
----
  - la déclaration de constantes avec 'const' fait bugger babel avec des valeurs fantômes même après avoir changé leur valeur dans le code


Babel Installation
------------------
**note**
  - babel-cli is installed gloabally for ease of prototyping
  - for any non-toy project it should be installed locally (and called through npm script )  


**note**
  - a warning message 'npm WARN install Couldn't install optional dependency: Unsupported' is displayed.
  - It's due to 'fsevents' dependency that is aimed to Mac and is not supported nor needed other platforms
  - it can be safely ignored

### Babel Modules
  Bable is comprised of 3 modules 

#### babel-cli
  the babel command line interface


  ```shell
  # global install for rapid prototyping
  $ npm install babel-cli -g

  # in each non toy project
  $ npm install babel-cli --save-dev
  ```

#### babel-core
  the babel compilator and the require hook.

  ```shell
  $ npm install babel-core --save-dev
  ```

#### Babel-polyfill
  polyfills certains ES6 built-ins (Map, Set, Promises, Generators)

  ```shell
  $ npm install babel-polyfill --save-dev
  ```

### Presets
  in Babel, each transform is a specific plugin that must be installed.
  presets are predefined collections of plugins.
  preset-stage-0 contains it's own plugins plus stage-1, stage-2 and stage-3 plugins
  
  **Presets Installation**
    
  ```sh
  $ npm install babel-preset-es2015 --save-dev              # ES6(ES2015)
  $ npm install babel-preset-react --save-dev               # React's JSX
  $ npm install babel-preset-stage-0 --save-dev             # ES7(ES2016)

  # Babel uses helper functions to do it's magic. By default those helpers are inlined at the top of each transpiled file
  # to avoid that we can install a special plugin and install the helpers as a seperate module
  $ npm install babel-plugin-transform-runtime --save-dev   # (optional) plugin to call external helper functions instead of inlining them 
  $ npm install babel-runtime --save                       # (optional) helper functions as a seperate module that will ship with the code
  ```
  **Currently recommended babel plugins Install**
    - babel-preset-es2015 
    - babel-preset-stage-0
    - babel-plugin-transform-runtime
    - babel-runtime

Babel Compilation
-----------------
  **notes** babel is installed locally for maximum project-by-project flexibility
 

### Presets (and plugins) activation

  **configuration in <path/to/project/dir>/.babelrc** (optional)

  ```javascript
  // if declared in .babelrc, one can ommit '--presets' options during compilation steps (see 'Babel Compilation' below)
  {
    "presets": ["es2015", "react"],       // this activates presets
    "plugins": [ "add-module-exports" ]  // this activates plugins 
  }
  ```
  
  **currently recommanded settings**
  ```js
  {
    "presets": ["es2015", "stage-0"],
    "plugins": ["babel-plugin-transform-runtime"]
  }
  ```


### Babel compilation with commande line

  This compiles from 'src' to 'lib' ('lib' should be in .gitignore and 'src' in .npmignore ...)

  ```
  $ ./node-modules/.bin/babel --presets es2015,stage-0 -d lib/ src/ 
  ```
  
  One can simply call `npm run compile` if 'compile' script is in package.json

  ```json
  "scripts": {
    "compile": "babel --presets es2015,stage-0 -d lib/ src/"
  }
  ```
  # or if presets are declared in .babelrc
  ```json
  "scripts": {
    "compile": "babel -d lib/ src/"
  }
  ```

### Babel compilation on npm publishing
   
  Babel compilation is done automagically before any 'npm publish' if the 'prepublish' script is in the package.json:

  ```javascript
  "scripts": {
    "compile": "babel --presets es2015,stage-0 -d lib/ src/"
    "prepublish" : "npm run compile"    #prepublish is executed automagically before a 'npm publish' ...
  }
  ```

babel-node
----------

**warning**
  - babel (and therefore babel-node) doesn't transpile required modules.
  - asof 2016/05 the best practice is to pre-transpile any es6 module before requiring it.

[TODO]
  - décider si on install ces presets et plugins dans ~/node_modules ... :
    + babel-preset-es2015
    + babel-preset-stage-0
    + babel-plugin-transform-object-rest-spread

### what is it?
------------
babel-node cli is an alternative to node cli.

### install
installed by babel-cli


### use
**warning** doesn't support ES6 module loading (ie. import style)

  ```sh
  # evaluate code
  $ babel-node  -e 'require("common/global"); echo("done")'  
  # compile and run code
  $ babel-node test     # code in 'test.js'
  # use debug mode
  $ babel-node --debug script.js # because of the '--' the second debug is a argument of script.js
  # use babel-node with application arguments
  $ babel-node --debug -- script.js --debug      # because of the '--' the second debug is a argument of script.js
  ```


babel playground
-----------------
You can ckeck babel transpiling on [babel online REPL](https://babeljs.io/repl/)

write ES6 modules
-----------------
**note** 
 - before publishing public npm modules make sure you've correctly set author information 
 - see [here](https://gist.github.com/coolaj86/1318304) for instructions
 - [TODO] configurer la workstation pour que l'autheur soit toujours MobileFirstCentury

### what is it?
  - document the creation of an ES6 npm module 
  - allows writing modules in ES6 but publishing them in their ES5 transpiled version
  - if the module transpiled use ES6 specific built-ins in the API it exposes, it must use polifylls (see polify entry in this doc)

### steps
1. mkcd <module-dir> && cd $\_
2. npm init -y   # to change the module name edit './package.json'
3. npm install --save-dev babel-cli@6 babel-preset-es2015@6    # install babel-cli and minimal preset specifying babel 6 version
4. mkdir src lib && cd src                                     # code is written in src/ and transpiled in lib/
                                                               # by convention lib is used for npm modules and dist is used in browser loading
5. write main code in ./src/index.js   
  - use standard ES5 export module syntax to allow commonjs importing of the module ( ie. require(...))
  - modules that will be used only in ES6 environment can use ES6 module export syntax 
6. create a build script in package.json
  ```json
  // in ./package.json
  "main": "./lib/index.js"                            
  "scripts": {
    "build": "babel src/ -d lib/",
    "prepublish": "npm run build"                     // repo will be automatically built on `npm publish`
    
  }                                      
  ```
7. create a ./.babelrc file
  ```json
  // in .babelrc
  {
    "presets": ["es2015"],
    "plugins": []
  }
  ```
8. npm run build                                               # call the npm build script
9. tell git to ignore dependency modules and transpiled code by creating a ".gitignore" file
 ```
 node_modules
 lib
 ```
10. tell npm to ignore source code by creating a '.npmignore' file
  # if .npmignore is absent npm will use .gitignore and transpiled code will not be pusblised !
  ```
  // in ./.npmignore
  src
  ```
11. npm publish ./                                            # publish!

polyfill
--------
[TODO] https://babeljs.io/docs/usage/polyfill/
