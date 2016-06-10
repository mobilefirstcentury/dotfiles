---- Jquery User Guide ----
===========================


jquery loading
-------------
1. init npm
  ```sh
  $ npm init -y
  ```
2. install jquery 
  ```sh
  $ npm install -D jquery
  ```
3. require jquery 
  ```js
  var $ = require('jquery')
  ```


selective module loading
------------------------
[TODO] lire [ici](http://developer.telerik.com/featured/jquery-using-only-what-you-need/) la liste des modules et leur utilisation.

Since Jquery 2.0 Jquery is organized in AMD modules.
As Webpack supports AMD module, we can load only part of the complete jquery lib.

0. init npm
  ```sh
  $ npm init -y
  ```
1. install webpack
  ```sh
  $ npm install webpack --save-dev              # next generation code bundler
  $ npm install webpack-dev-server --save-dev   # web dev server and hot reloader
  ```
2. install jquery 
  ```sh
  $ npm install jquery --save-dev
  ```

3. correct jquery BUG
  ```sh
  # as of Jquery 2.2.3 there's a bug in the repo folders that has to be corrected manually
  $ mkdir -p node_modules/jquery/external/sizzle
  $ cp -r node_modules/jquery/sizzle/dist node_modules/external/sizzle/
  ```
4. add webpack script in package.json
  ```json
  // in package.json
  // ...
  “scripts”: {
    //production only: npm run build to build production bundles
    “build”: “webpack --config webpack.config.prod.js”,    // webpack uses webpack.config.js by default
    //dev only: npm run dev to generate development bundles and run dev. server
    “dev”: “webpack-dev-server --inline --hot”  // will use webpack.config.js. 'hot' option forces partial reloads of modified components (aka 'Hot Module Reload' or HMR)
                                                // It not possible, 'inline' forces full page reload
  }
  ```
5. create a webpack.config.js file
  ```json
  // in webpack.config.js 
  module.exports = {
      entry: './app',
      output: {
          filename: 'bundle.js'
      },
      module: {
          loaders: [
          ]
      }
  }
  ```
5. create the app

  ```js
  // in app.js
  // import used jquery modules
  var $ = require('jquery/src/core')   // 'jquery/core' and 'jquery/init' are required
  require('jquery/src/core/init')
  require('jquery/src/manipulation')   // dom manipulation ?
  ```
  ```html
  <!-- in index.htmli -->
  <script type="text/javascript" src="bundle.js"></script>
  ```
6. run webpack
  ```sh
  # should generate bundle.js
  $ npm dev
  ```
7. open 'http://localhost:8080' (or http://localhost:8080/webpack-dev-server/' if live reload options are not set)
Any code modification will be live reloaded in the browser

[TODO] do we need to relaunch webpack-dev-server on webpack.config.js modification ?
