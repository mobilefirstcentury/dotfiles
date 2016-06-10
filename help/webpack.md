---- webpack user guide ----
============================

what is it ?
------------
  - webpack is an advanced code bundler & module loader for front end web projects
  - it will create bundles (js, css) and load them asynchrously at runtime
  - for simpler project it will suffice as a comprehensive build system.
  - for non-toy projects, we'll also use gulp for build orchestration

use
---
**note** 
  - for flexibility sake, we don't install webpack (and related tools and modules) globally


0. init npm 
  ```sh
  $ npm init -y
  ```
1. install webpack
  ```sh
  $ npm install webpack --save-dev              # next generation code bundler
  $ npm install webpack-dev-server --save-dev   # web dev server and hot reloader
  ```
3. add webpack script in package.json

  ```json
  // in package.json
  // ...

  "scripts": {
    //production only: npm run build to build production bundles
    "build": "webpack --config webpack.config.prod.js -p",    // webpack uses webpack.config.js by default. 
                                                              // '-p' options activates production optimization
    //dev only: npm run dev to generate development bundles and run dev. server
    "dev": "webpack-dev-server --inline --hot"  // will use webpack.config.js. 'hot' option forces partial reloads of modified components (aka 'Hot Module Reload' or HMR)
                                                // If not possible, 'inline' forces full page reload
  }
  ```
4. create '.babelrc' file
see '~help/babel.md'
  ```yaml
  {
  "presets": ["react", "es2015"]
  }
  ```

5. create a webpack.config.js file
[TODO] 
  - webpack-dev-server options ('hot', 'inline', etc) should be entered in 'wepack.config.js' file in a devServer key.
  - for unknown reasons it does'nt work so we enter them in package json
  - reference du BUG ??

[TODO] 
  - trouver comment compresser et uglifier en production 
  - regarder [uglifyJSPlugin](https://webpack.github.io/docs/list-of-plugins.html#uglifyjsplugin)
  - est-ce que l'option -p le fait ?

[TODO]
  - c'est pas sérieux d'inliner le css
  - la solution `extract-text-webpack-plugin` [webpack tuto](https://medium.com/@rajaraodv/webpack-the-confusing-parts-58712f8fcad9) est crado
 
  ```json
  // in webpack.config.js 
  module.exports = {
      entry: {
        "index": './app.js',
        "vendor": ['jquery', 'analytics.js']   // 'jquery' and 'analytics.js' are simply concatenated to produce 'vendor.js'
      },
      output: {
          output: '/dist',    // where to store bundles and index.html
          publicPath: 'http://<YOUR DISTRIBUTION SUBDOMAIN>.cloudfront.net',   // Used in production by some 'publicPath aware' loaders to rewrite local url to url pointing to CDN
          filename: "[name].js"   // will produce 'dist/index.js', 'dist/vendor.js' that we can link from html code
      },
      // css files are simly required in js code and will loaded by webpack at runtime
      module: {
          loaders: [
            { test: /\.png$/,                // simple regex to filter files
              loader: "url-loader?limit=1"   // In production, 'url-loader' will rewrite urls of assets to point to publicPath
                                             // 'url-loder' npm module must be locally installed as a dev-dependency
            },
            {
              test: /\.css$/,               // [TODO] c'est crado d'inliner le css
              loader: 'style!css'           // this calls 'css-loader' loader that loads css files and css dependencies ie. @import statements) into JSON
                                            // then it calls 'style-loader' that inlines the css in a style tag in html files
            },
            {
              test: /\.js$/,
              exclude: /(node_modules|bower_components)/      // exclude node_modules and bower components
              loader: 'babel'            // 'babel-loader' must be npm installed
            }
          ]
      },
      resolve: {
        extensions: [‘’, ‘.js’]          // allows to require js files without specifying extension
      }
  }
  ```
6. install loaders and plugins
  [TODO] faire de ceux qui seront installés par défaut
  ```sh
  // loaders and plugin to load depends on webpack.config.js 
  $ npm install --save-dev <...>
  ```

7. create the app
  ```js
  // in app.js
  var $ = require('jquery/src/core')   // 'jquery/core' and 'jquery/init' are required
  require('jquery/src/core/init')
  require('jquery/src/manipulation')   // si on a besoin de la dom manipulation 
  ```
  ```html
  <!-- in index.html -->
  <script type="text/javascript" src="app.js"></script>
  ```
6. run webpack
  ```sh
  # should generate bundle.js
  $ npm dev
  ```
7. open 'http://localhost:8080' (or http://localhost:8080/webpack-dev-server/' if live reload options are not set)
Any code modification will be live reloaded in the browser

[TODO] do we need to relaunch webpack-dev-server on webpack.config.js modification ?
