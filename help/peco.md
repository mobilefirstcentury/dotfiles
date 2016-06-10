--- PECO USER GUIDE ---
======================

[TODO]
  - document all use case from https://github.com/peco/peco (regex, case, etc)

what is it?
----------
Peco is an interactive files directorries filter.
Peco is usefull when we want to search interactively files or directories and process them.

use
---
typical use

  ```sh
  $ find . -name '*.md' |  peco | xargs vim 
  > enter query string and peco interactively filters the resutls
  > choose a file by typing enter
  > the file opens in vim

  $ find . -name '*.md' | peco --query cors | xargs vim
  > choose a file by typing enter
  > the file opens in vim

  # kills processes containing 'code'
  $ ps aux | peco --query code | awk '{ print $2 }' | xargs kill -9     
  > type <ctrl-space> to select multiple processes
  > type enter to kill selected processes

  ```
  
