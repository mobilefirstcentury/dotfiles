--- Gulp User Guide ---
=======================

What is Gulp ?
--------------
  Gulp is a javascript task runner to automate repetitive dev tasks : minification, compilation, unit testing, linting, etc.

Install
-------

  $ npm install -g gulp // global installation for glup cli command access
  // in each project
  $ npm install gulp --save-dev  // local installation as a dev dependency

Gulp Use
--------


#### gulp.task 
  **what is it?**
  defines a build task.

  **use**
  ```javascript
  gulp.task('taskName', function(){
    // task details...
  })
  ```
  or with task dependency management:
  ```javascript
  // 'previousTask' and 'otherPreviousTask' are executed before executing 'taskName'...
  gulp.task('taskName', ['previousTask', 'otherPreviousTask'], function(){
    // taskName details...
  })
  ```
  

  

  # run
  // from the project directory
  $ gulp run task-name  // or gulp task-name 

#### gulp.watch




Glup Plugins
-----------

### What are Gulp plugins ?
[TODO]

#### gulp-minify-html
  **what is it?**
  minifies html code

  **install**
  $ npm install gulp-minify-html

  **use**

    ```javascript
    // including plugins
    var gulp = require('gulp')
    , minifyHtml = require("gulp-minify-html");
    
    // task
    gulp.task('minify-html', function () {
        gulp.src('./*.html') // path to your files
        .pipe(minifyHtml())
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
    var gulp = require('gulp')
    , minifyCSS = require("gulp-minify-css");
    
    // task
    gulp.task('minify-css', function () {
        gulp.src('./css/*.css') // path to your files
        .pipe(minifyCSS())
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
    var gulp = require('gulp')
    , minifyJS = require("gulp-uglify");
    
    // task
    gulp.task('minify-js', function () {
        gulp.src('./js/*.js') // path to your files
        .pipe(minifyJS())
        .pipe(gulp.dest('./dist/js'));
    });
    ```

#### gulp-filelog
  **what is it ?**
  Helps debug file processing streams by printing context, file name and number of files.

  **install**
  $ npm install gulp-logfile --save-dev 

  **use**
    ```javascript 
    var gulp = require('gulp');
    var filelog = require('gulp-filelog');

    gulp.src('./src/*.ext')
        .pipe(filelog('mytag'))
        .pipe(gulp.dest('./dist'));
    ```

### gulp-sass
  **what is it ?**
  a node wrapper around the 'libsass' native library (not Ruby) that compiles sass files into css.
  
  **install**
  $ npm install gulp-sass --save-dev

  **use**

    ```javascript
    'use strict';

    var gulp = require('gulp');
    var sass = require('gulp-sass');

    gulp.task('sass', function () {
      return gulp.src('./sass/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest('./css'));
    });

    gulp.task('sass:watch', function () {
      return gulp.watch('./sass/**/*.scss', ['sass']);
    });
    ```

#### gulp-coffee
  **what is it?**
  compiles coffeescript

  **install**
  $ npm install gulp-uglify

  **use**

    ```javascript
    // including plugins
    var gulp = require('gulp')
    , minifyJS = require("gulp-uglify");
    
    // task
    gulp.task('minify-js', function () {
        gulp.src('./js/*.js') // path to your files
        .pipe(minifyJS())
        .pipe(gulp.dest('./dist/js'));
    });
    ```
