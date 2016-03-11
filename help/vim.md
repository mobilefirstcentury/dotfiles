AIDE COMMANDES VIM
===================

Aide
====
  <Ctrl-k>         -> calls man on the word under the cursor


Launch VIM
=========
  # From the command line
  $ vim <path-to-file> -> opens the file in vim
  $ vim <file-to-foler> -> opens the directory in ranger

splits
======
  :sp                                           -> open a filename in horizontal split
  :vsp                                          -> open filename in vertical split
  <Ctrl-W>S                                     -> horizontal splitting
  <Ctrl-W>V                                     -> for vertical splitting
  <Ctrl-W>Q                                     -> close one
  <Ctrl-W><Ctrl-W>                              -> switch between windows
  <Ctrl-W>j,k,h,l                               -> switch to adjacent window
  <Ctrl-W>J,K,H,L                               -> move current window
  <Ctrl-w>- , <Ctrl-w>+                         -> resize current window
  <Ctrl-w>                                      -> maximize current window
  <Ctrl-w>=                                     -> even split
  <Ctrl-w>R                                     -> Rotate windows
  <Ctrl-w>T                                     -> send windows in its own tab




Terminal
========
  :terminal -> open a new terminal in insert mode
  :term -> open a new terminal in insert mode
  `<ctrl-\><ctrl-n>`-> exit terminal mode
  ,e  -> exit terminal mode (mais il faut un mapping `tnoremap <Leader>e <C-\><C-n>` dans vimrc)
  i, a, A -> reenters terminal mode


Navigation
==========
,r     -> opens the file exploreri in the current directory (The file explorer is opened in a new tab)
,<Escape> -> closes the file explorer
Ctrl-o -> Jumps to last file opened
Ctrl-i -> Jumps forward after a Ctrl-o
Ctrl-^ -> Toogles between this file and the last file viewed

Edition 
====================

<escape>: normal mode
i: insert mode at the position of the cursor
a: insert mode at the position after the cursor
I: insert at the beginning of the line
A: insert at the end of the line
Ctrl-W: delete word left


Standard Commandes
==================
:w!! -> save as root
:sav <new-filename> -> save current file as <filename> and opens the new file



Formattage
==========

gq -> Assure le ligne wrapping de la ligne courrante. Lorsque une ligne est trop longue et nécessite de scroller, <gq> fait apparaître des retours à la ligne au 190ème charactere.
= -> indent la ligne courrante
= -> En visual mode, indent la selection courante
= -> Indente tout le document

Fonctions spéciales (via plugins)                                 
===============================

## Recherche de fichiers (Plugin CtrlP)
  + :CtrP filename     -> search filename
  + <ctrl-j>, <ctrl-k> -> navigate in search results
  + <escape>           -> quit search mod

## Commenting (Plugin tcomment)
  + gcc        -> comment/uncomment current line
  + gc         -> comment/uncomment  current selection
  + gc<motion> -> comment/uncomment till motion

## Wrapping (Plugin surround)
  + S"                   -> transforms Visually Selected in "Visually Selected"
  + cs"'                 -> transforms "Hello Word" in 'Hello Word'
  + cs"<p>               -> transforms "Hello Word" in <p>Hello Word</p>
  + cs"<p class="title"> -> transforms "Hello Word" in <p class="title">Hello Word</p>
  + ds"                  -> transforms "Hello Word" in Hello Word
  + dst                  -> transforms <p>Hello Word</p> in Hello Word
  + ysiw]                -> transforms "Hello Word" in "[Hello] Word"
  + ysiw[                -> transforms "Hello Word" in "[ Hello ] Word"
  + ysi"}                -> transforms "Hello Word" in "{Hello Word}"
  + ysa"}                -> transforms "Hello Word" in {"Hello Word"}
  + S<p>                 -> transforms Visually Selected in <p>Visually Selected</p>
  + S<p class="title">   -> transforms Visually Selected in <p class="title">Visually Selected</p>


## General Navigation (Plugin Unimpaired)
  [a       -> previous file
  ]a       -> next file
  [A       -> first file
  ]A       -> last file
  [b       -> previous buffer
  ]b       -> next buffer
  [B       -> first buffer
  ]B       -> last buffer
  [t       -> previous tab
  ]t       -> next tab
  [T       -> first tab
  ]T       -> last tab
  [<space> -> insert blank line above current one
  ]<space> -> insert blank line below current one
  [e       -> move current line up
  ]e       -> move current line down[q            -> previous error in QuickFix

  ]q       -> next error in QuickFix
  [Q       -> first error in QuickFix
  ]Q       -> last error in QuickFix
  [n       -> previous git conflict
  ]n       -> next git conflict

## matching navigation
// (plugin matchit)
  %               -> goto matching pair
// (plugin delimitMate)
  <Ctrl-g>g       -> jump out of bracket, quote, etc.


## advanced motion (plugin vim-sneak)
**note: can be used like a normal vim motion command**

  sab      -> move to next occurence of text "ab"
  ;        -> goto next match
  s        -> goto backward match
  n;       -> goto nth match
  s<enter> -> last search
  Sab      -> same as 's' but backward

  <ctrl-o> -> goto origin

  3dzqt    -> delete forward up to 3rd instance of text "qt"
  3dZqt    -> delete backward up to 3rd instance of text "qt"
  .        -> repeat last operation
  2.       -> repeat twice last operation
  4d;      -> delete up to 4th match
  gUz}     -> capitalize up to next }


##  advanced motion (plugin easymotion)
// Eliminer le plugin vim-sneak en configurant easymotion pour le 2-char.
// Pour l'instant vim-sneak est commmenté dans vimrc
// Configurer également easymotion pour remplacer totalement la recherche "/"
// d'une manière générale passer du temps à configurer ce plugin puissant!
  ,,w   -> display hints forward on all words (beginning of words). Hitting the hint's key jumps to position.
  ,,e   -> display hints forward on all words (end of words).  Hitting the hint's key jumps to position
  ,,b   -> display hints backward on all words (beginning of words).  Hitting the hint's key jumps to position
  ,,ge  -> display hints backward on all words (end of words).  Hitting the hint's key jumps to position


## Window Management
// (Plugin Maximizer)
  F3 -> Toggle maximize window


## Gist Management ( Plugin Gist-vim)
  :Gist -> create gist with content of current buffer (with default privacy mode)
  :Gist! -> create NEW gist with content of current buffer
  :Gist -p -> create private gist with content of current buffer
  :Gist -P -> create public gist with content of current buffer
  :'<,'>Gist -> Send current selection to Gist
  :Gist -l -> list my public Gists
  :Gist -l khalid -> list public gists of user khalid
  :Gist -e -> Edit current Gist
  :Gist -e foo -> Edit Gist named foo
  :Gist -s <description> -> post gist with description
  :Gist -d -> Delete Gist
  :Gist -f -> fork the current Gist
  :Gist -b -> open gist in browser

## Managing buffers
:ls          | List the current buffers (including their numbers).
:b <number>  | Display the buffer with the given number.
:b <partial> | Display the first buffer matching the partial name (or press Tab for name completion).
:bd          | Delete the current buffer; will fail if unsaved (nothing is deleted).
:bd!         | Delete the current buffer; will discard any changes (changes are lost).

## Pair selectin (plugin smartpairs)
// Allows the selection of the content of pairs (brackets, quotes, parenthesis, etc.)
// Using 'vv' and then 'v' should be enough most of the time.

  vv -> select content of nearest pair (excluding the pair character)
  viv -> select content of nearest pair (excluding the pair character) 
  vav -> select content of nearest pair (including the pair character)
  civ -> change the content of nearest pair (excluding the pair character)
  cav -> change the content of nearest pair (including the pair character)
  div -> delete the content of nearest pair (excluding the pair character)
  dav -> delete the content of nearest pair (including the pair character)
  yiv -> yank the content of nearest pair (excluding the pair character)
  yav -> yank the content of nearest pair (excluding the pair character)
  v   -> extends the selection 
  <ctrl-shift-v> -> cancels current selection

## Tables 
// Easy alignment in tabular data
  :Tab /,  -> aligns automagically the data separated by ',' (works with any other separating character)

## Markdown folding
  zi  -> enable/disable folding
  za  -> open/close current level
  zR  -> open all levels
  zM  -> close all levels
  zv  -> open level at cursor
  zMzv -> closes all folds except at cursor position

## URLs
  gx -> open browser on the url under the cursor

Shell command
=============
## Read in vim from a shell command
  # place the cursor at the desired destination
  :read !ls
## Read html from the clipboard and convert it to markdown on the fly
  # place the cursor at the desired destination
  :read !xclip clipboard -o | pandoc -f html -t markdown 



Troubleshoot
============
## Open vim in safe mode (ie without loading plugins or applying vimrc initialization)
  \vim -u NONE <filename>
