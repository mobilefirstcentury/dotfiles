ACK AIDE
=======

Presentation
===========

Ack is a replacement for grep for searching in source code.
It knows about filetypes and takes smart decision in what files and directories it searchs in.
It doesn't search in .git directory or in files and directories declared in .gitignore file.
It doesn't search neither in non code files (pdf, images, etc.), in backups files, etc.
As it knows about source code, you can filter your searchs by language by searching only in javascript files for instance.

Installation
===========

  sudo apt-get update
  sudo apt-get install ack-grep
  # if results that our screen, display in less
  echo '--pager=less -RFX' >> ~/.ackrc
  # Ne pas oublier de faire un alias pour ack -> ack-grep

Commandes
=========

ack --help-types -> displays all files types that ack knows about
ack -f | wc -l -> count source files
ack pattern -> returns lines of files containing the pattern 'pattern' in the current directory
ack -w pattern ->  returns lines of files containing THE WORD 'pattern' in the current directory
ack -w --python pattern -> returns lines of PYTHON files containing THE WORD 'pattern' in the current directory
ack -w --cc pattern -> returns lines of C files containing THE WORD 'pattern' in the current directory
ack -w --nocc pattern -> returns lines of all files EXCEPT C files containing THE WORD 'pattern' in the current directory
ack -w --markdown pattern -> returns lines of MARKDOWN files containing THE WORD 'pattern' in the current directory
ack -c pattern -> returns the number of lines containing 'pattern' in each file (files not containing 'pattern' will be returned with a count of 0)
ack -cl pattern -> returns the number of lines containing 'pattern' in each file (files not containing 'pattern' will not be returned)
ack -ch pattern -> returns the total number of lines containing 'pattern'
ack -w --column --python pattern -> return line and column of files containing 'pattern'
ack -w --python -B 5 pattern -> prints out lines matching the search 'pattern' with 5 preceding lines.
ack -w --python -A 2 pattern -> prints out lines matching the search 'pattern' with 5 succeeding lines.
ack -w --python -C 2 pattern -> prints out lines matching the search 'pattern' with 2 lines before and 2 lines after matching line
ack -f pattern -> prints only files containing match
ack -g pattern -> return files with 'pattern' somewhere in their path

