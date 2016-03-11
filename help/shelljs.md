---- Shell.js ----
===================

Shell scripting in Coffee JS
---------------------------
 - We can write shell scripts in coffee script (or in javascript) and use any of the available npm node modules.
 - Coffee scripts (or javascript) shell scripts are multi-plateform (unlike bash) and are powerfull due to a rich modules ecosystem.
 - Coffee Script uses less keystrokes than javascript so it's probably better to write coffee scritps than javascripts shell scripts.
 - We use ShellJS to have a "linux-like" system commands (cd, echo, etc.)
  

Installation 
------------
 + [ATTENTION]
   + Tant que la version disponible via npm n'intègre pas les 'pipe', il faut installer shelljs directement depuis github
     - npm install -g shelljs/shelljs 
     - cd ~ ; npm install shelljs/shelljs
   + So maintenace must be done manually by reinstalling shelljs globally and locally ...
 + Installation is a bit tricky: 
    - # install node js through NVM
    - # install shelljs module globally:
      $ npm install -g shelljs  # this allows the use of shelljs from the command line (no so usefull ...) 
    - # install shelljs locally in home directory (~):
      * # to have the possibility to 'require' a module from the code, it's must be a direct dependance: a global module can't be required but only called from the command line
      * # for some undocumented (?) reasons, if module is installed locally in the user's home directory (~): 
         + # a bunch of warnings are displayed as the home directory is not a node project directory
         + # the module becomes available for 'require' from anywhere ...
    - # install globally coffeejs
      $ npm insall -g coffeescript
   
Additionnal Modules
------------------
### yamljs 
  + [Github repo](https://github.com/jeremyfa/yaml.js)
  + usefull to convert yaml files or strings to native objects or to json
  + $ npm install -g yamljs # for command line use
  + $ cd ~ ; npm install yamljs  # for shell script use with require from anywhere 
  

Command line Shell Scripting
---------------------------
### shexec 
  + Very simple shell script installed in ~/scripts that automatically requires shelljs and executes arguments as coffee script code if arguments are given or otherwise exectutes code from stdin 
  + Exemple use: 
    `
    $ shexec "echo file for file in ls '*.js'" 
      # or (only for most simple cases ...)
      $ shexec echo file for file in ls \'*.js\'
    $ shexec "ages = max:10, shella:9, bob:7; echo \"#{child} is #{age}\" for child, age of ages"
    $ echo "echo \"random = #{Math.random 1}\"" | shexec "echo 'done'"
    $ shexec                                                                                                                                                        ~downloads  
      for num in [0...10]
        echo "text#{num} content"
          .to "text#{num}.txt"
      ^D
    `

Script writing
--------------
  1. write script with coffee shebang and require shelljs. Example: 

  `
      #!/usr/bin/env coffee

      require 'shelljs/global'

      if not which 'git'
        echo 'Sorry, this script requires git'
        exit 1

      # Copy files to release dir
      rm '-rf', 'out/Release'
      cp '-R', 'stuff/', 'out/Release'

      # Replace macros in each .js file
      cd 'lib'
      for file in ls '*.js'
        sed '-i', 'BUILD_VERSION', 'v0.1.2', file
        sed '-i', /^.*REMOVE_THIS_LINE.*$/, '', file
        sed '-i', /.*REPLACE_LINE_WITH_MACRO.*\n/, cat('macro.js'), file
      cd '..'

      # Run external tool synchronously
      if (exec 'git commit -am "Auto-commit"').code != 0
        echo 'Error: Git commit failed'
        exit 1
  `
  2. save the file without extension
  3. change execution mode of the script: chmod +x new-script
  4. move the file in ~/scripts to have it in the PATH
  5. enjoy!


Best practices
--------------
  - Installing every module needed by scripts in home directory would not be feasible as it would be generate version conflicts among the scripts
  - So we would install in home directory only very basic and important modules
  - MOST scripts would be created in their own directory under ~/scripts :
    + symbolic link would be created from '~/scripts' to '~/scripts/script-folder/script-name.js'
    + all dependencies would be installed locally in the script folder

Require
--------

    # global require
    require 'shelljs/global'
    echo 'hello world'

    # or local require ...
    shell = require 'shelljs'
    shell.echo 'hello world'


Reference
---------
  - All commands run synchronously, unless otherwise stated.
  - We use shelljs with coffeescript to save keystrokes: feel free to use javascript like parenthesis to remove ambiguity in the code.

### cd 'dir'
  Changes to directory `dir` for the duration of the script. Changes to home directory if no argument is supplied.


### pwd()
  Returns the current directory.


### ls [options,] [path, ...]
### ls [options,] path_array
  Returns array of files in the given path, or in current directory if no path provided.

  **options**
  ```
  ls '-R'  # recursive
  ls '-A'  # all files (include files beginning with `.`, except for `.` and `..`)
  ls '-d'  # list directories themselves, not their contents
  ls '-l'  # list objects representing each file, each with fields containing `ls -l` output fields. 
  ```

  **examples**
  ```
  ls 'projs/*.js'
  ls '-R', '/users/me', '/tmp'
  ls '-R', ['/users/me', '/tmp'] // same as above
  ls '-l', 'file.txt' // { name: 'file.txt', mode: 33188, nlink: 1, ...}
  ```

### find path [, path ...])
### find path_array

Returns array of all files (however deep) in the given paths.
The main difference from `ls('-R', path)` is that the resulting file names include the base directories, e.g. `lib/resources/file1` instead of just `file1`.


  **examples**
  ```
  find 'src', 'lib';
  find ['src', 'lib']; // same as above
  # retrieve js files with a regex
  find '.'
    .filter (file)->
      file.match /\.js$/
  # again with a one-liner
  print file for file in find '.' when file.match /\.js$/
  ```

### cp [options,] source [, source ...], dest
### cp [options,] source_array, dest 
  Copies files. The wildcard `*` is accepted.

  **options**
  ```
  cp '-f'  # force (default behavior)
  cp '-n' # no-clobber
  cp '-r', cp '-R' # recursive
  ```

  **examples**
  ```
  cp 'file1', 'dir1'
  cp '-R', 'path/to/dir/', '~/newCopy/'
  cp '-Rf', '/tmp/*', '/usr/local/*', '/home/tmp'
  cp '-Rf', ['/tmp/*', '/usr/local/*'], '/home/tmp' // same as above
  ```

### rm [options,] file [, file ...] 
### rm [options,] file_array 
  Removes files. The wildcard `*` is accepted.

**options**
rm '-f' # force
rm '-r', rm '-R'# recursive

**examples**

  ```
  rm '-rf', '/tmp/*'
  rm 'some_file.txt', 'another_file.txt'
  rm ['some_file.txt', 'another_file.txt'] // same as above
  ```

### mv [options ,] source [, source ...], dest' 
### mv [options ,] source_array, dest' 
  Moves files. The wildcard `*` is accepted.

**options**
`-f`: force (default behavior)
`-n`: no-clobber

**examples**
  ```
  mv '-n', 'file', 'dir/'  
  mv 'file1', 'file2', 'dir/'  
  mv ['file1', 'file2'], 'dir/'   // same as above
  ```

### mkdir [options,] dir [, dir ...] 
### mkdir [options,] dir_array 

  Creates directories.

**options**
`mkdir '-p'`  # full path (will create intermediate dirs if necessary)

**examples**

  ```javascript
  mkdir '-p', '/tmp/a/b/c/d', '/tmp/e/f/g'  
  mkdir '-p', ['/tmp/a/b/c/d', '/tmp/e/f/g']   // same as above
  ```


### test expression 
  Evaluates expression using the available primaries and returns corresponding value.

**options**
  ```
  test '-b', 'path' # true if path is a block device
  test '-c', 'path' # true if path is a character device
  test '-d', 'path' # true if path is a directory
  test '-e', 'path' # true if path exists
  test '-f', 'path' # true if path is a regular file
  test '-L', 'path' # true if path is a symbolic link
  test '-p', 'path' # true if path is a pipe (FIFO)
  test '-S', 'path' # true if path is a socket
  ```

**examples**
  ```
  if  test '-d', path  then  /* do something with dir */  
  if not test '-f', path  continue  // skip if it's a regular file
  ```



### cat file [, file ...] 
### cat file_array 

  Returns a string containing the given file, or a concatenated string containing the files if more than one file is given (a new line character is introduced between each file). 
  Wildcard `*` accepted.

**examples**

  ```
  str = cat 'file*.txt'  
  str = cat 'file1', 'file2'  
  str = cat ['file1', 'file2']   // same as above
  cat 'input.txt'
    .to 'output.txt'
  (cat 'input.txt').to 'output.txt'
  ```

### 'string'.to file 
  Analogous to the redirection operator `>` in Unix, but works with ShellStrings (such as those returned by `cat`, `grep`, etc). 
  Like Unix redirections, `to` will overwrite any existing file.

**examples**

  ```
  cat 'input.txt' 
    .to 'output.txt'  
  ```

### 'string'.toEnd file 
  Analogous to the redirect-and-append operator `>>` in Unix, but works with ShellStrings (such as those returned by `cat`, `grep`, etc).

**examples**

  ```
  cat 'input.txt' 
    .toEnd 'output.txt'  
  ```


### sed [options,] search_regex, replacement, file [, file ...] 
### sed [options,] search_regex, replacement, file_array 
  Reads an input string from `files` and performs a JavaScript `replace()` on the input using the given search regex and replacement string or function.
  Returns the new string after replacement.

**options**

 `sed '-i'`: Replace contents of 'file' in-place. _Note that no backups will be created!_

**examples**

  ```
  sed '-i', 'PROGRAM_VERSION', 'v0.1.3', 'source.js'  
  sed /.*DELETE_THIS_LINE.*\n/, '', 'source.js'  
  ```

### grep [options,] regex_filter, file [, file ...] 
### grep [options,] regex_filter, file_array 
  Reads input string from given files and returns a string containing all lines of the file that match the given `regex_filter`.
  Wildcard `*` accepted.

**options**
  `grep '-v'`: Inverse the sense of the regex and print the lines not matching the criteria.
  `grep '-l'`: Print only filenames of matching "files"

**examples**
  ```
  grep '-v', 'GLOBAL_VARIABLE', '*.js'  
  grep 'GLOBAL_VARIABLE', '*.js'  
  ```

### which command 
  Searches for `command` in the system's PATH.
  On Windows, this uses the `PATHEXT` variable to append the extension if it's not already executable.
  Returns string containing the absolute path to the command.

**examples**
  ```
  nodeExec = which 'node'  
  ```



### echo string [, string ...] 
  Prints string to stdout, and returns string with additional utility methods like `.to()`.

**examples**
  ```
  echo 'hello world'  
  str = echo 'hello world'  
  echo 'temperature = ', temp
  echo "temperature = #{temp}"
  # Now the classic echo ... >> ...
  echo "this is nice"
    .toend "myfile.txt"
  ```



### pushd [options,] [dir   '-N'   '+N'] 
Save the current directory on the top of the directory stack and then cd to `dir`.
With no arguments, pushd exchanges the top two directories.
Returns an array of paths in the stack.

**options**
  `pushd '-n'`: Suppresses the normal change of directory when adding directories to the stack, so that only the stack is manipulated.
  `pushd 'dir'`: Makes the current working directory be the top of the stack, and then executes the equivalent of `cd dir`.
  `pushd '+N'`: Brings the Nth directory (counting from the left of the list printed by dirs, starting with zero) to the top of the list by rotating the stack.
  `pushd '-N'`: Brings the Nth directory (counting from the right of the list printed by dirs, starting with zero) to the top of the list by rotating the stack.

**examples**
  ```
  // with curent directory '/usr'
  pushd '/etc'   // Returns /etc /usr
  pushd '+1'     // Returns /usr /etc
  ```

### popd [options,] ['-N'   '+N'] 
  When no arguments are given, popd removes the top directory from the stack and performs a cd to the new top directory.
  The elements are numbered from 0 starting at the first directory listed with dirs; i.e., popd is equivalent to popd +0.
  Returns an array of paths in the stack.

**options**
  `popd '-n'`: Suppresses the normal change of directory when removing directories from the stack, so that only the stack is manipulated.
  `popd '+N'`: Removes the Nth directory (counting from the left of the list printed by dirs), starting with zero.
  `popd '-N'`: Removes the Nth directory (counting from the right of the list printed by dirs), starting with zero.

**examples**
  ```
  echo process.cwd()     // '/usr'
  pushd '/etc'         // '/etc /usr'
  echo process.cwd()     // '/etc'
  popd()                 // '/usr'
  echo process.cwd()     // '/usr'
  ```

### dirs [options   '+N'   '-N'] 
  Display the list of currently remembered directories.
  Returns an array of paths in the stack, or a single path if +N or -N was specified.

**options**
  `dirs -c`: Clears the directory stack by deleting all of the elements.
  `dirs '+N'`: Displays the Nth directory (counting from the left of the list printed by dirs when invoked without options), starting with zero.
  `dirs '-N'`: Displays the Nth directory (counting from the right of the list printed by dirs when invoked without options), starting with zero.


### ln [options,] source, dest 
  Links source to dest. Use -f to force the link, should dest already exist.

**options**
  `ln '-s'`: symlink
  `ln '-f'`: force

**examples
  ```
  ln 'file', 'newlink'  
  ln '-sf', 'file', 'existing'  
  ```

### exit code 
  Exits the current process with the given exit code.

### env['VAR_NAME']
  Object containing environment variables (both getter and setter). Shortcut to process.env.

### exec command [, options] [, callback] 
  Executes the given `command` _synchronously_, unless otherwise specified.
  When in synchronous mode returns the object `{ code:..., stdout:... , stderr:... }`, containing the program's `stdout`, `stderr`, and its exit `code`.
  Otherwise returns the child process object, and the `callback` gets the arguments `(code, stdout, stderr)`.
  **note** sync exec is not optimized, use async for heavy process exec ...

**options**
  + any option available for nodejs's `chidl_process.exec` is accepted
  + options listed below are false by default

`exec async:true`: Asynchronous execution. If a callback is provided, it will be set to `true`, regardless of the passed value.
`exec silent:true`: Do not echo program output to console.

**examples**
  ```
  version = exec 'node --version', silent:true 
    .stdout 
  echo version

  exec 'some_long_running_process', (code, stdout, stderr) ->
    echo 'Exit code: ', code  
    echo 'Program output: ', stdout  
    echo 'Program stderr: ', stderr[TODO] on peut utiliser simplement async: true ?

  child = exec 'some_long_running_process', async:true  
  child.stdout.on 'data', (data) ->
    /* ... do something with data ... */

  ```


### chmod octal_mode || octal_string, file 
### chmod symbolic_mode, file 
  Alters the permissions of a file or directory by either specifying the absolute permissions in octal form or expressing the changes in symbols.
  This command tries to mimic the POSIX behavior as much as possible.

  Notable exceptions:
    + In symbolic modes, 'a-r' and '-r' are identical.  No consideration is given to the umask.
    + There is no "quiet" option since default behavior is to run silent.

**options**
  `chmod '-v'`: output a diagnostic for every file processed
  `chmod '-c'`: like verbose but report only when a change is made
  `chmod '-R'`: change files and directories recursively

**examples**
  ```
  chmod 755, '/Users/brandon'  
  chmod '755', '/Users/brandon'   // same as above
  chmod 'u+x', '/Users/brandon'  
  ```

### touch [options,] file [, file ...] 
### touch [options,] file_array 
  Update the access and modification times of each FILE to the current time.
  A FILE argument that does not exist is created empty, unless -c is supplied.

**options**
  `touch '-a'`      : Change only the access time
  `touch '-c'`      : Do not create any files
  `touch '-m'`      : Change only the modification time
  `touch '-d DATE'` : Parse DATE and use it instead of current time
  `touch '-r FILE'` : Use FILE's times instead of current time

**examples**
  ```
  touch 'source.js'  
  touch '-c', '/path/to/some/dir/source.js'  
  # [TODO] Here coffee script literal object notation would be ambiguous ...
  touch { '-r': FILE }, '/path/to/some/dir/source.js'  
  ```



### set options 
  Sets global configuration variables

**options**
  `set '+/-e'`: exit upon error (`config.fatal`)
  `set '+/-v'`: verbose: show all commands (`config.verbose`)
  `set '+/-f'`: disable filename expansion (globbing)

**examples**
  ```
  set '-e'   // exit upon first error
  set '+e'   // this undoes a "set '-e' "
  ```

### tempdir()
  Searches and returns string containing a writeable, platform-dependent temporary directory.

**examples**
  ```
  tmp = tempdir() // "/tmp" for most *nix platforms
  ```



### error()
  Tests if error occurred in the last command. Returns `null` if no error occurred, otherwise returns string explaining the error


### ShellString str 
  Turns a regular string into a string-like object similar to what each command returns.
  This has special methods, like `.to()` and `.toEnd()`

**examples**
  ```
  foo = ShellString 'hello world'  
  ```

### Pipes
  Commands can send their output to another command in a pipe-like fashion.
  `sed`, `grep`, `cat`, `exec`, `to`, and `toEnd` can appear on the right-hand side of a pipe. Pipes can be chained.

** examples**
  ```
  grep 'foo', 'file1.txt', 'file2.txt'
    .sed /o/g, 'a' 
      .to 'output.txt'  
  echo 'files with o\'s in the name:\n' + ls().grep 'o'   
  cat 'test.js' 
    .exec 'node'   // pipe to exec   call
  ```

## Configuration
Suppresses all command output if `true`, except for `echo()` calls.
Default is `false`.

### config.silent

**examples**
  ```
  sh = require 'shelljs' 
  silentState = sh.config.silent // save old silent state
  sh.config.silent = true;
  /* ... */
  sh.config.silent = silentState; // restore old silent state
  ```

### config.fatal
  If `true` the script will throw a Javascript error when any shell.js command encounters an error.
  Default is `false`.
  This is analogous to Bash's `set -e`

**examples**
  ```
  require 'shelljs/global' 
  config.fatal = true; // or set '-e' 
  cp 'this_file_does_not_exist', '/dev/null'  // throws Error here
  /* more commands... */
  ```


### config.verbose
Will print each command as follows:

  ```
  cd dir/
  ls subdir/
  ```

**examples**
  ```
  config.verbose = true; // or set '-v' 
  cd 'dir/' 
  ls 'subdir/' 
  ```

Make
----
  # to run `all`:
    `$ node make`
  # to run target `docs`
    `$ node make docs`
  # to run target `task` with arguments
    `$ node make task -- arg1 arg2`

    ```
    require 'shelljs/make'

    target.all = ->
      target.bundle()
      target.docs()

    target.task = (args)->
    // args contains a array of options values

    target.bundle = ->
      cd __dirname
      mkdir 'build'
      cd 'lib'
      (cat '*.js').to '../build/output.js'

    target.docs = ->
      cd __dirname
      mkdir 'docs'
      cd 'lib'
      for file in ls '*.js'
        text = grep '//@', file     # extract special comments
        text.replace '//@', ''      # remove comment tags
        text.to 'docs/my_docs.md'
    ```



