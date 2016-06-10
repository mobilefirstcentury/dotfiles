
Scratch: 
  - child_process
  - browser-sync
  - browserify
  - vinyl-source-stream


--- Gulp User Guide ---
=======================

[TODO]
------
Adapter les examples de code ci-dessous pour la structure de dossiers suivante:

  ```
  |- gulpfile.js
  |- node_modules/
  |- package.json
  |- dist  
  |- app/
      |- index.html
      |- images/
      |- css/
      |- sass/
      |- js/
      |- coffee/
  ```


What is Gulp ?
--------------
Gulp is a javascript task runner to automate repetitive dev tasks : minification, compilation, unit testing, linting, etc.


quick start
------------
**note** following example setup follows some best practices
```js
// including plugins
const gulp = require('gulp');

// this is a public task that can be called from external command
// default task builds on it
// it MUST be defined before default class
gulp.task('intermediate', gulp.series(clean, gulp.parallel(scripts, styles)));
gulp.task('intermediate').description = "This is an intermediate task of default"


// define default task
// it is executed by default by gulp
gulp.task('default', gulp.series(clean, gulp.parallel(scripts, styles), 'intermediate'));
gulp.task('default').description = "This is the default task and it does certain things";


// this is a public task that can be called from external command
// default task CAN'T build on it (because it is defined after the default task)
gulp.task('anothertask', gulp.series(clean, gulp.parallel(scripts, styles)));
gulp.task('anothertask').description = "This is an other task"

// these are 'private task' that can't be called directy from the command line
function styles() {...}
function scripts() {...}
function clean() {...}
```


Install
-------
**note** workstation comes with gulp 4

### Gulp 4
**note** 
  - Gulp 4 is not officially released but is already production-ready: This doc will assume the use of Gulp 4.
  - in the rest of this user guide we're only dealing with gulp 4

```sh
    $ npm install -g gulp-cli # gulp-cli supports gulp 3 and gulp 4
  $ npm install gulpjs/gulp#4.0 # global require installation (only from a directory without package.json)
  # then **only on non toy projects**, install in each project...
  $ npm install gulpjs/gulp#4.0 --save-dev  # local installation as a dev dependency
  ```

### Gulp 3.x
  ```sh
  $ npm install -g gulp # global installation for glup cli command access
  # then in each project...
  $ npm install gulp --save-dev  # local installation as a dev dependency
  ```

Gulp Use
--------

### task definition
**note** a task named 'default' will be be executed by simply running `gulp`

  ```js
  gulp.task('taskName', function(done){      // the done argument is required only is a callback is used to signal async completion (see below)          
    // task details...
    // don't forget to signal async completion (see below)
  })
  ```

### task management

#### asynchronous tasks
gulp must be notified when a task is over.
task implementaion must return a node stream, a promise, a child process  or use a callback


##### task returning a node stream
  ```js
  //  pipe constructs a node stream that is returned by our fonction
  gulp.task('somename', function() {
      return gulp.src('client/**/*.js')
          .pipe(minify())
          .pipe(gulp.dest('build'));
  });
  ```
##### task returning a promise
  ```js
  var promisedDel = require('promised-del');

  gulp.task('clean', function() {
      return promisedDel(['.build/']);
  });
  ```
##### task using a call back 
in an asynchronous task ....
  ```js
  var del = require('del');

  gulp.task('clean', function(done) {
      del(['.build/'], done);
  });
  ```
or in a synchronous task
  ```js
  gulp.task('sync', function(done) {
      // do something synchronous
      done()    // notify gulp that we're done.
  });
  ```

##### task returning a child process
  ```js
  var spawn = require('child_process').spawn;

  gulp.task('clean', function() {
    return spawn('rm', ['-rf', path.join(__dirname, 'build')]);
  });
  ```
#### orchestration
**note** 
  - gulp 4 offers `gulp.series()` and `gulp.parallel()` that allow build advanced task executions scenarii.
  - `series()` and `parallel()` arguments can be any number of functions (named or anonymous) or tasks (by task name string)

  ```js

  // we must define composed task **before** composing tasks
  // The tasks don't have any dependencies anymore
  gulp.task('styles', function(done) {...});      // the done argument is required only is a callback is used to signal async completion (see below)          
  gulp.task('scripts', function(done) {...});     // don't forget to signal async completion (see below)
  gulp.task('clean', function(done) {...});

  // Per default, start scripts and styles
  gulp.task('default', gulp.series('clean', gulp.parallel('scripts', 'styles'), function(done) {  // the done argument is required only is a callback is used to signal async completion (see below)          
      ...  // don't forget to signal async completion (see below)
    })
  );

  ```
**deprecated** following  code is only valid with gulp 3. Use task orchestration (see above)

  ```js
  // 'previousTask' and 'otherPreviousTask' are executed before executing 'taskName'...
  gulp.task('taskName', ['previousTask', 'otherPreviousTask'], function(){          
    // taskName details...
  })
  ```

### run tasks

  ```sh
  # from the project directory
  $ gulp run taskName # runs 'taskName
  $ gulp taskName     # runs 'taskName'
  $ gulp              # runs 'default' task
  ```


#### gulp.watch
**what is it?**
launches automatically specified tasks on files modifications
use 'chokidar' under the hood

  ```js

  // WILL CHANGE TO:
  var watcher = gulp.watch('js/**/*.js' /* You can also pass options and/or a task function here */);
  watcher.on('all', function(event, path, stats) {
    console.log('File ' + path + ' was ' + event + ', running tasks...');
  });

  // OR LISTEN TO INDIVIDUAL EVENT TYPES
  watcher.on('change', function(path, stats) {
    console.log('File ' + path + ' was changed, running tasks...');
  });

  watcher.on('add', function(path) {
    console.log('File ' + path + ' was added, running tasks...');
  });

  watcher.on('unlink', function(path) {
    console.log('File ' + path + ' was removed, running tasks...');
  });
  ```

**deprected** only valid in gulp 3

  ```javascript
  // including plugins
  const gulp = require('gulp');

  // OLD VERSION
  gulp.watch('js/**/*.js', function(event) {
      console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
  });

  gulp.task('watch:coffee', function () {
      gulp.watch(['./coffee/*.coffee'], ['compile:coffee']);
  });
  ```


Glup Plugins
-------------

### What are Gulp plugins ?
[TODO]


#### gulp-filelog
**what is it ?**
Helps debug file processing streams by printing context, file name and number of files.

**install**
$ npm install gulp-logfile --save-dev 

**use**

  ```javascript 
  const gulp = require('gulp');
  const filelog = require('gulp-filelog');

  gulp.src('./src/*.ext')
      .pipe(filelog('mytag'))
      .pipe(gulp.dest('./dist'));
  ```


#### gulp-minify-html
**what is it?**
minifies html code

**install**
$ npm install gulp-minify-html

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , minifyHtml = require("gulp-minify-html");
  
  // task
  gulp.task('minify:html', function () {
      gulp.src('./*.html') // path to your files
      .pipe(filelog('minify:html'))
      .pipe(minifyHtml().on('error',minifyHtml.logError))
      .pipe(gulp.dest('./dist'));
  });
  ```
#### gulp-minify-css
**what is it?**
minifies css code

**install**
$ npm install gulp-minify-css

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , minifyCSS = require("gulp-minify-css");
  
  // task
  gulp.task('minify:css', function () {
      gulp.src('./css/*.css') // path to your files
      .pipe(filelog('minify:css'))
      .pipe(minifyCSS().on('error', minifyCSS.logError))
      .pipe(gulp.dest('./dist/css'));
  });
  ```
#### gulp-uglify
**what is it?**
minifies js code

**install**
$ npm install gulp-uglify

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , minifyJS = require("gulp-uglify");
  
  // task
  gulp.task('minify:js', function () {
      gulp.src('./js/*.js') // path to your files
      .pipe(filelog('minify:js'))
      .pipe(minifyJS().on('error', minifyJS.logError))
      .pipe(gulp.dest('./dist/js'));
  });
  ```


#### gulp-sass
**what is it ?**
a node wrapper around the 'libsass' native library (not Ruby) that compiles sass files into css.

**install**
$ npm install gulp-sass --save-dev

**use**

  ```javascript
  'use strict';

  const gulp = require('gulp');
  const sass = require('gulp-sass');

  gulp.task('compile:sass', function () {
    return gulp.src('./sass/**/*.scss')
      .pipe(filelog('compile:sass'))
      .pipe(sass().on('error', sass.logError))
      .pipe(gulp.dest('./css'));
  });

  gulp.task('watch:sass', function () {
    return gulp.watch('./sass/**/*.scss', ['sass']);
  });
  ```

#### gulp-coffee
**what is it?**
compiles coffeescript

**install**
$ npm install gulp-coffee

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , coffee = require("gulp-coffee");
  
  // task
  gulp.task('compile:coffee', function () {
      gulp.src('./coffee/*.coffee') // path to your files
      .pipe(filelog('compile:coffee'))
      .pipe(coffee().on('error', coffee.logError))
      .pipe(gulp.dest('./dist/js'));
  });
  ```

#### gulp-jshint
**what is it?**
checks js code quality

**install**
$ npm install gulp-jshint

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , jsLint = require("gulp-jhint");
  
  // task
  gulp.task('hint:js', function () {
      gulp.src('./js/*.js') // path to your files
      .pipe(filelog('hint:js'))
      .pipe(jsLint().on('error', jsLint.logError))
      .pipe(gulp.dest('./dist/js'));
  });
  ```

#### gulp-coffeelint
**what is it?**
checks coffeescript code quality

**install**
$ npm install gulp-coffeelint

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , coffeeLint = require("gulp-coffeelint");
  
  // task
  gulp.task('hint:coffee', function () {
      gulp.src('./coffee/*.coffee') // path to your files
      .pipe(filelog('hint:coffee'))
      .pipe(coffeeLint().on('error', coffeeLint.logError))
      .pipe(gulp.dest('./dist/js'));
  });
  ```

#### gulp-rename


**what is it?**
 renames files on the fly

**install**

  $ npm install gulp-rename

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , rename = require('gulp-rename')
  , coffee = require("gulp-coffee");
  
  // task
  gulp.task('rename', function () {
      gulp.src('./CoffeeScript/one.coffee') // path to your file
      .pipe(coffee())  // compile coffeeScript
      .pipe(rename('renamed.js')) // rename into "renamed.js" (original name "one.js")
      .pipe(gulp.dest('./dist/js'));
  });
  ```

#### gulp-concatenate

**what is it?**
 concatenates files on the fly

**install**
  $ npm install gulp-concat

  **use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , concat = require("gulp-concat");
  
  // task
  gulp.task('concat', function () {
      gulp.src('./JavaScript/*.js') // path to your files
      .pipe(concat('concat.js'))  // concat and name it "concat.js"
      .pipe(gulp.dest('path/to/destination'));
  });
  ```

#### gulp-header
 
**what is it?**
 adds header information to the sources

**install**
$ npm install gulp-header

**use**

  ```javascript
  // including plugins
  const gulp = require('gulp')
  , fs = require('fs')
  , concat = require("gulp-concat")
  , header = require("gulp-header");
  
  // functions
  
  // Get version using NodeJs file system
  const getVersion = function () {
      return fs.readFileSync('Version');
  };
  
  // Get copyright using NodeJs file system
  const getCopyright = function () {
      return fs.readFileSync('Copyright');
  };
  
  // task
  gulp.task('concat-copyright-version', function () {
      gulp.src('./JavaScript/*.js')
      .pipe(concat('concat-copyright-version.js')) // concat and name it "concat-copyright-version.js"
      .pipe(header(getCopyrightVersion(), {version: getVersion()}))
      .pipe(gulp.dest('path/to/destination'));
  });    
  ```
 
#### autoprefixer 

**what is it?**
[PostCSS](https://github.com/postcss/postcss) plugin to parse CSS and add vendor prefixes to CSS rules using values from Can I Use.

**install**
  $  npm install gulp-postCSS 
  # [TODO] Install autoprefixer ?

**use**
_note_ : all [postCSS plugins](https://github.com/postcss/postcss#plugins) can be combined

Sourcemaps can be used implicitely (since Gulp 4):
_hack_ : for that to work, you must `npm install --save-dev git://github.com/wearefractal/vinyl-fs` from `./node_modules/gulp/`

  ```js
  var gulp        = require('gulp');
  var less        = require('gulp-less');
  var minify      = require('gulp-minify-css');
  var prefix      = require('gulp-autoprefixer');

  gulp.task('styles', function() {
    return gulp.src('main.less', { sourcemaps: true })
      .pipe(less())
      .pipe(minify())
      .pipe(prefix())
      .pipe(gulp.dest('dist/styles'));
  });
  ```

or explicitly :

  ```javascript
  gulp.task('css', function () {
      var postcss    = require('gulp-postcss');
      var sourcemaps = require('gulp-sourcemaps');
      var autoprefixer = require('autoprefixer')

      return gulp.src('src/**/*.css')
          .pipe( sourcemaps.init() )
          .pipe( postcss([ autoprefixer({ browsers: ['last 2 versions'] }) ]))
          .pipe( sourcemaps.write('.') )
          .pipe( gulp.dest('build/') );
  });
  ```

#### gulp-sourcemaps

**what is it?**
When source is pre-processed, this inserts special marks allowing debuging.

**install**
  $ npm install gulp-sourcemaps

**use**

```js
# plugins used between sourcemaps.init and sourcemaps.write must be compatible withh sourcemaps. 
# a list of compatible plugins can be found [here](https://github.com/floridoo/gulp-sourcemaps/wiki/Plugins-with-gulp-sourcemaps-support).
var gulp = require('gulp');
var plugin1 = require('gulp-plugin1');
var plugin2 = require('gulp-plugin2');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('javascript', function() {
  gulp.src('src/**/*.js')
    .pipe(sourcemaps.init())
      .pipe(plugin1())
      .pipe(plugin2())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('dist'));
});
```

gulp commands
-------------

command  | description
--- | ---
gulp --tasks | prints a tree of tasks tasks defined in './gulpfile.js'

