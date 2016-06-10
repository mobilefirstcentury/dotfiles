---- Watching files User Guide ----
====================================

watch
-----

  # This will display the last tick of BITCOIN/USD every 5 seconds 
  $ watch -n 5 'curl -s "https://btc-e.com/api/3/ticker/btc_usd" | jformat "BTC: %{btc_usd.last}USD"'


entr
----

  # This watches for a entire directory and execute a javascript programe when something changes
  # [TODO] Parfois il faut sauver deux fois pour que ça marche. Pourquoi ? 
  # [TODO] Ecrire un wrapping script pour faciliter l'utilisation

  $ ls *.{css,js,html} | entr node template.js

  # clears screen and execute node on file change
  $ ls *.{html,css,js} | entr -r sh  -c 'clear; node app.js'

  # Launch a **server** and **kills** it and **reloads** it on file change
  $ ls *.js | entr -r node index.js
  $ ls *.{css,js,html} | entr node template.js
  
  # clears screen before running tests
  $ find src/ | entr -c ./test.sh

  # '/_' argument refers to the most recently modified file
  $ ls /tmp/my.sql | entr psql -f /_

  # [TODO] Faire marcher ça
  # A much simpler live reload... ( [reload-browser script](http://entrproject.org/scripts/reload-browser) must be installed)
  # It sends a keystroke to the open tab to force reload
  $ ls *.css *.html | entr reload-browser Firefox

  # Rebuild project when source files change
  $ find src | entr make


  # This instructs mupdf to reload pdf whenever it's updated
  $ ls *.pdf | entr pkill -HUP mupdf

  # Clear the screen and run tests
  $ ls *.py | entr sh -c 'clear; ./test.py'


  # Convert individual Markdown files to HTML if they're modified
  $ ls \*.md | entr +notify &
  $ while read F; do markdown2html $F; done; < notify

chokidar
-------

### what is it ?
  - chokidar-cli is based on chokidar which is a universally used node lib for watching files & directories
  - it thus can be used programatically in JS
  see [chokidar-cli](https://github.com/kimmobrunfeldt/chokidar-cli) for install and usage.

### usage
  ```sh
  $ chokidar '**/*.js' '**/*.less'
    -> change:test/dir/a.js
    -> change:test/dir/a.less
    -> add:test/b.js
    -> unlink:test/b.js

  $ chokidar '**/*.js' -c 'npm run build-js'
  $ chokidar '**/*.less' -c 'if [ "{event}" = "change" ]; then npm run build-less -- {path}; fi;'
  $ chokidar '**/*.md' -c 'if [ "{event}" = "change" ]; then pandoc -f markdown -t html -- {path}; fi;'

  # live markdown to html editing
  $ cd <dir>
  $ chokidar '**/*.md' -c 'if [ "{event}" = "change" ]; then pandoc -s -f markdown -t html5 -- {path} > index.html; fi;'
  $ live-server --browser=vimb
  ```

live-browser
-----------
**note**: as http-server has no live reloading capability we use live-server

  ```sh
  # vimb is a very lightweight browser 
  $ live-server dir --browser=vimb
  ```
