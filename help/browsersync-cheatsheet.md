---- Browsersync Command Line Usage ----
========================================


Install
-------

  ```sh
  $ npm install -g browser-sync  # install globally to access cli command
  # then in each project directory
  $ npm install browser-sync --save-dev  # install locally to require form gulp.js
  ```

Command line Use
----------------

### General command

  ```sh
  $ browser-sync start <options>
  ```

### Examples

#### Files Examples

  ```sh
  # Multiple Patterns
  $ browser-sync start --files "css/*.css, *.html"
  ```

#### Server Examples

  ```sh
  # Static server using current directory as the root
  $ browser-sync start --server

  # Static server using the 'app' directory as the root
  $ browser-sync start --server app
  ```

#### proxy Examples

  ```sh
  # Using a local.dev vhost
  $ browser-sync start --proxy

  # Using a local.dev vhost with PORT
  $ browser-sync start --proxy local.dev:8001

  # Using a localhost address
  $ browser-sync start --proxy localhost:8001

  # Using a localhost address in a sub-dir
  $ browser-sync start --proxy localhost:8080/site1
  ```

#### watching files + Server

  ```sh
  # Watch ALL CSS files for changes with a static server
  $ browser-sync start --files "app/css/*.css" --server

  # Watch ALL CSS files for changes with a static server
  # using "app" as the base directory
  $ browser-sync start --files "app/css/*.css" --server "app"
  ```


### start options

  --help                   Output usage information
  --version                Output the version number
  --browser                Choose which browser should be auto-opened
  --files                  File paths to watch
  --server                 Run a Local server (uses your cwd as the web root)
  --index                  Specify which file should be used as the index page
  --extensions             Specify file extension fallbacks
  --startPath              Specify the start path for the opened browser
  --https                  Enable SSL for local development
  --directory              Show a directory listing for the server
  --proxy                  Proxy an existing server
  --ws                     Proxy mode only - enable websocket proxying
  --xip                    Use xip.io domain routing
  --tunnel                 Use a public URL
  --open                   Choose which URL is auto-opened (local, external or tunnel)
  --config                 Specify a path to a bs-config.js file
  --host                   Specify a hostname to use
  --logLevel               Set the logger output level (silent, info or debug)
  --port                   Specify a port to use
  --reload-delay           Time in milliseconds to delay the reload event following file changes
  --reload-debounce        Restrict the frequency in which browser:reload events can be emitted to connected clients
  --ui-port                Specify a port for the UI to use
  --no-notify              Disable the notify element in browsers
  --no-open                Don't open a new browser window
  --no-online              Force offline usage
  --no-ui                  Don't start the user interface
  --no-ghost-mode          Disable Ghost Mode
  --no-inject-changes      Reload on every file change
  --no-reload-on-restart   Don't auto-reload all browsers following a restart


Use with gulp
-------------

### gulp.js

  ```js
  // require browser-sync module
  var gulp = require('gulp');
  var browserSync = require('browser-sync');
  
  // start the browser-sync micro web server
  gulp.task('browserSync', function() {
    browserSync({
      server: { baseDir: 'app' }, // 'app' is the base directory of source code 
    })
  });  

  // watch source code and reload browser on file change...
  gulp.task('watch', ['browserSync'], function (){
    gulp.watch('app/index.html', browserSync.reload);
    gulp.watch('app/saas/*.scss', ['sass']);  
    gulp.watch('app/js/*.js', browserSync.reload); 
  });

  gulp.task('sass', function() {
      return gulp.src('app/sass/*.scss')
          .pipe(sass())
          .pipe(gulp.dest('app/css'))
          .pipe(browserSync.stream());  // is this is equivalent to ` .pipe(browserSync.reload({stream: true}))` ?
  });
  ```

  
