---- Babel JS Transpiler Reading notes ----
============================================


### Javascript history

#### Date of releases
 version                      | date | description
 --                           | ---  | ---
 livescript                   | 1995 | invention by Netscape navigator
 javascript                   | 1996 | renaming of livescript
 ECMAScript 1 (ES1)           | 1996 | standardisation of netscape's javascript
 ECMAScript 3 (ES3)           | 1999 | standardisation stalled from there with custom extensions by browser vendors
 ECMAScript 5 (ES5)           | 2009 | slowly adopted convergence standard. ** As of 2015, Supported on all major browsers**.
 ES.Harmony (ES6)             | 2012 | Acceleration in features evolution with this major version (not yet finalised)
 ECMAScript 2015 (ES2015-ES6) | 2015 | E2015-ES6 is officially published under ES2015 Name. New naming convention is based on year of release.
 ES2016 (ES7 or ES.Next)      | 2016 | New features and syntax. Scheduled for summer 2016.
 ECMAScript proposals         | 2017 | proposed features or syntaxes that may be included in the ECMAScript 2017 (Summer 2017?)

#### Main features
  [TODO]

What is Babel ?
---------------
  Babel transpiles JS2015(ES6) to ES5.
  ** note ** if writing npm module for publishing, best practice is to require 'babel-polyfill' as a peer dependency and document that the consuming app must require it

Babel Installation
------------------

### Babel Modules
  Bable is comprised of 3 modules 

#### babel-cli
  the babel command line interface

  ```shell
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
  In Babel, each transform is a specific plugin that must be installed.
  Presets are predefined collections of plugins.
  
  **Presets Installation**
    
  ```
  $ npm install babel-preset-es2015 --save-dev   # ES6(ES2015)
  $ npm install babel-preset-react --save-dev    # React's JSX
  $ npm install babel-preset-stage-0 --save-dev  # ES7(ES2016)
  $ npm install babel-plugin-transform-runtime   # external helper functions
  ```


Babel Compilation
-----------------
  **notes** babel is installed locally for maximum project-by-project flexibility
 

### Presets (and plugins) activation

  **OPTIONAL & NOT RECOMMANDED : configuration in <path/to/project/dir>/.babelrc**

  ```javascript
  # if declared in babelrc, one can ommit '--presets' options during compilation steps (see 'Babel Compilation' below)
  {
    "presets": ["es2015", "react"]       // this activates presets
    "plugins": [ "add-module-exports" ]  // this activates plugins 
  }
  ```

### Babel compilation with commande line

  This compiles from 'src' to 'lib' ('lib' should be in .gitignore and 'src' in .npmignore ...)

  ```
  $ ./node-modules/.bin/babel --presets es2015,stage-0 -d lib/ src/ 
  ```
  
  One call simply call `npm run compile` if 'compile' script is in package.json

  ```javascript
  "scripts": {
    "compile": "babel --presets es2015,stage-0 -d lib/ src/"
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




