AIDE COMMANDES VIM
===================


Aide
----
  <Ctrl-k>         -> calls man on the word under the cursor


Launch VIM
----------
  # From the command line
  $ vim <path-to-file> -> opens the file in vim
  $ vim <file-to-foler> -> opens the directory in ranger

Splits
------
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
--------
  :terminal -> open a new terminal in insert mode
  :term -> open a new terminal in insert mode
  `<ctrl-><ctrl-n>`-> exit terminal mode
  ,e  -> exit terminal mode (mais il faut un mapping `tnoremap <Leader>e <C-><C-n>` dans vimrc)
  i, a, A -> reenters terminal mode


Navigation
----------
,r     -> opens the file exploreri in the current directory (The file explorer is opened in a new tab)
,<Escape> -> closes the file explorer
Ctrl-o -> Jumps to last file opened
Ctrl-i -> Jumps forward after a Ctrl-o
Ctrl-^ -> Toogles between this file and the last file viewed
:cd <dir> -> working dirctory becomes <dir>
:cd %:h    -> working directory becomes directory of current file

Edition 
-------

<escape> : normal mode
i        : insert mode at the position of the cursor
a        : insert mode at the position after the cursor
I        : insert at the beginning of the line
A        : insert at the end of the line
Ctrl-W   : delete word left
v        : visual mode (aka horizontal selection)
V        : visual line mode (aka line section)
<Ctrl+q> : visual block mode (aka vertical selection)


Standard Commandes
-----------------
:w!! -> save as root
:sav <new-filename> -> save current file as <filename> and opens the new file


Search and replace
------------------

/wordz   : search and highlight 'wordz' 
/<regex> : search and highlight text matching the regex 
:s/<regex>/<formula>/g : Only First occurence of each line. Replaces text matching regex by content of 'formula' (formula can contain text and matching groups)
:s/<regex>/<formula>/c : With confirmation. Replaces text matching regex by content of 'formula' (formula can contain text and matching groups)
:%s/<regex>/<formula> : Entire file. replaces text matching regex by content of 'formula' (formula can contain text and matching groups)
:'<,'>s/<regex>/<formula> : Only current selection. Replaces text matching regex by content of 'formula' (formula can contain text and matching groups)

**pro tip**
  regex formulas are hard to get right.
  1. write the regex in a search to check that it behaves as expected
  2. in normal mode, type </q> to enter search buffer
  3. in the search buffer select and yank the tested regex
  4. enter the begining of the search & replace command: <:%s/>  (dont't type <CR>)
  5. type <C-r""> to paste the regex formula  (only one quote)
  6. complete the comand by entering the formua


Formattage
----------

gq -> Assure le ligne wrapping de la ligne courrante. Lorsque une ligne est trop longue et nécessite de scroller, <gq> fait apparaître des retours à la ligne au 190ème charactere.
= -> indent la ligne courrante
= -> En visual mode, indent la selection courante
= -> Indente tout le document
Syntax Highlighting
--------------------

  :set syntax=html    // force syntax highlighting to html
  :set syntax=off     // deactivate syntax highlighting
  :set syntax=on      // activate syntax highlighting

Fonctions spéciales (via plugins)                                 
---------------------------------

### Recherche de fichiers (Plugin CtrlP)
  + :CtrP filename     -> search filename
  + <ctrl-j>, <ctrl-k> -> navigate in search results
  + <escape>           -> quit search mod

### Commenting (Plugin tcomment)
  + gcc        -> comment/uncomment current line
  + gc         -> comment/uncomment  current selection
  + gc<motion> -> comment/uncomment till motion

### Wrapping (Plugin surround)
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


### General Navigation (Plugin Unimpaired)
  [a       -> previous file
  ]a       -> next file
  [A       -> first file
  ]A       -> last file
  <C-b>    -> next buffer
  <C-S-b>  -> previous buffer
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

### matching navigation
// (plugin matchit)
  %               -> goto matching pair
// (plugin delimitMate)
  <Ctrl-g>g       -> jump out of bracket, quote, etc.


### advanced motion (plugin vim-sneak)
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


###  advanced motion (plugin easymotion)
// Eliminer le plugin vim-sneak en configurant easymotion pour le 2-char.
// Pour l'instant vim-sneak est commmenté dans vimrc
// Configurer également easymotion pour remplacer totalement la recherche "/"
// d'une manière générale passer du temps à configurer ce plugin puissant!
  ,,w   -> display hints forward on all words (beginning of words). Hitting the hint's key jumps to position.
  ,,e   -> display hints forward on all words (end of words).  Hitting the hint's key jumps to position
  ,,b   -> display hints backward on all words (beginning of words).  Hitting the hint's key jumps to position
  ,,ge  -> display hints backward on all words (end of words).  Hitting the hint's key jumps to position


### Window Management
// (Plugin Maximizer)
  F3 -> Toggle maximize window


### Gist Management ( Plugin Gist-vim)
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

### Managing buffers
:ls          | List the current buffers (including their numbers).
:b <number>  | Display the buffer with the given number.
:b <partial> | Display the first buffer matching the partial name (or press Tab for name completion).
:bd          | Delete the current buffer; will fail if unsaved (nothing is deleted).
:bd!         | Delete the current buffer; will discard any changes (changes are lost).

### Pair selectin (plugin smartpairs)
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

### Tables 
// Easy alignment in tabular data
  :Tab /,  -> aligns automagically the data separated by ',' (works with any other separating character)

### Markdown folding
  zi  -> enable/disable folding
  za  -> open/close current level
  zR  -> open all levels
  zM  -> close all levels
  zv  -> open level at cursor
  zMzv -> closes all folds except at cursor position

### URLs
  gx -> open browser on the url under the cursor

Shell command
--------------
### Read in vim from a shell command
  # place the cursor at the desired destination
  :read !ls
### Read html from the clipboard and convert it to markdown on the fly
  # place the cursor at the desired destination
  :read !xclip clipboard -o | pandoc -f html -t markdown 



Troubleshoot
------------
### Open vim in safe mode (ie without loading plugins or applying vimrc initialization)
  \vim -u NONE <filename>


---------------------------------------------------------------------------------------------------------


Intégrer ce qui suit
===================


Help
----

-   :help        | Load help.
-   :help j      | Get help on the 'j' command.
-   :help :split | Get help on the ':split' command.
-   :help z*     | Get help for all commands that start with 'z'.
-   <C-]>        | Go to the definition/tag under the cursor.
-   <C-o>        | Go back one page in the help system.
-   <C-i>        | Go forward one page in the help system.

Undo and redo
-------------

-   u     | Undo.
-   <C-r> | Redo.
-   :redo | Redo (alternate form).

Movement: Lines
---------------

-   0   | Jump to beginning of the current line.
-   ^   | Jump to first non-space character on the current line.
-   $   | Jump to end of the current line.
-   gg  | Jump to the first line in the file.
-   G   | Jump to the last line in the file.
-   47G | Jump to line 47.
-   :47 | Jump to line 47 (alternate form).

Movement: Characters
--------------------

-   f *[char]*  | Jump to next occurrence of *[char]*.
-   3f *[char]* | Jump to third occurrence of *[char]*.
-   F *[char]*  | Jump to previous occurrence of *[char]*.
-   t *[char]*  | Jump to one character before the next occurrence of *[char]*.
-   T *[char]*  | Jump to one character after the previous occurrence of *[char]*.
-   ;           | Repeat last f/F/t/T movement.
-   ,           | Repeat last f/F/t/T movement in the opposite direction.

Movement: Words and text
------------------------

-   w | Jump to beginning of next word.
-   W | Jump to beginning of next WORD (string of non-blank characters).
-   e | Jump to next end of word.
-   E | Jump to next end of WORD.
-   b | Jump back to beginning of previous word.
-   B | Jump back to beginning of previous WORD.
-   ( | Jump back to beginning of previous sentence.
-   ) | Jump to beginning of next sentence.
-   { | Jump back to beginning of previous paragraph.
-   } | Jump to beginning of next paragraph.

Movement: Code
--------------

-   %  | Jump between opening/closing braces, brackets, parentheses, etc.
-   [[ | Jump to previous function.
-   ]] | Jump to next function.
-   [{ | Jump to beginning of current block.
-   ]} | Jump to end of current block.

Search
------

-   /  |  Search.
-   ?  |  Search backwards.
-   n  |  Jump to next match.
-   N  |  Jump to next match, moving in the opposite direction.
-   *  |  Search for current word under the cursor.
-   #  |  Search for current word under the cursor, moving backwards.

Repetition
----------

-   .    | Repeat last command.
-   23dd | Delete 23 lines.
-   5j   | Jump down 5 lines.
-   qa   | Start recording keystrokes to the 'a' register.
-   q    | Stop recording.
-   @a   | Execute the contents of the 'a' register (playing back the keystrokes—a macro, effectively).
-   4@a  | Execute the contents of the 'a' register 4 times.

Replace
-------

-   :%s/search/replace/g                               | Replace all instances of 'search' with 'replace' throughout the whole file.
-   :5,10s/search/replace/g                            | Replace all instances of 'search' with 'replace' from line 5 to line 10.
-   :g/foo/ s/bar/BAR/g                                | On lines that match the regex /foo/, replace 'bar' with 'BAR'.
-   :vimgrep /^h5/ *.html                              | Find lines that start with 'h5' in all HTML files in the current directory. Matches show up in the quickfix list.
-   :cn                                                | Move to next entry in the quickfix list.
-   :cp                                                | Move to previous entry in the quickfix list.

Insert mode
-----------

-   i  |  Go into insert mode before the character under the cursor.
-   I  |  Jump to beginning of the current line and enter insert mode.
-   a  |  Go into insert mode after the character under the cursor.
-   A  |  Jump to end of the current line and enter insert mode.
-   o  |  Add a blank line after current line and enter insert mode on that line.
-   O  |  Add a blank line before current line and enter insert mode on that line.

Deleting text
-------------

-   x           | Delete the character under the cursor.
-   dw          | Delete from the cursor to the beginning of the next word.
-   dd          | Delete the current line.
-   D           | Delete from cursor position to the end of the current line.
-   dt *[char]* | Delete from cursor position to *[char]*. (Also works with f.)
-   d)          | Delete from cursor position to the beginning of the next sentence.
-   d}          | Delete from cursor position to the end of the paragraph.
-   di(         | Delete inside parentheses. (You can be anywhere inside them.)
-   da<         | Delete around angle brackets.
-   dit         | Delete inside tag. (Meaning, delete what's between the opening and closing tags.)

Changing text
-------------

-   J           | Join line (pull the next line up after the end of the current line).
-   ~          | Toggle the case (upper/lower) of the character under the cursor.
-   u           | In visual mode: change selected text to lowercase.
-   U           | In visual mode: change selected text to uppercase.
-   r *[char]*  | Replace character under cursor with *[char]*.
-   R           | Enter overtype mode.
-   cw          | Change from the cursor to the beginning of the next word (delete to that point and enter insert mode).
-   c)          | Change from cursor position to the beginning of the next sentence.
-   c}          | Change from cursor position to the end of the paragraph.
-   ci"         | Change inside quotes (not including quotes).
-   ca"         | Change around quotes (including quotes).
-   cit         | Change inside tag contents (between opening and closing tags).
-   cat         | Change a tag's contents (includes opening/closing tags).
-   cis         | Change inside sentence (doesn’t include space after period).
-   cas         | Change a sentence (includes space after period).
-   cip         | Change inside paragraph (doesn’t include blank line).
-   cap         | Change a paragraph (includes blank line).
-   ci<        | Change inside tag name (between opening and closing angle brackets).
-   ca<        | Change a tag name (includes brackets).
-   ci(         | Change inside parentheses.
-   ci{         | Change inside curly braces.
-   ci[         | Change inside square brackets.
-   C           | Delete the rest of the line and enter insert mode.
-   ct *[char]* | Change from cursor position to *[char]*.

Indenting text
--------------

-   >>  | Indent current line.
-   <<  | Dedent current line.
-   >   | In visual mode: Indent selected lines.
-   <   | In visual mode: Dedent selected lines.
-   >aB | Indent current block (defined by curly braces).
-   >ap | Indent current paragraph.
-   >i{ | Indent inside current set of curly braces.
-   =   | In visual mode: Reformat selected text.

Selecting text and cut/copy/paste
---------------------------------

-   v     | Enter visual select (by character).
-   V     | Enter visual select (by line).
-   <C-v>  | Enter visual select (by column).
-   gv    | Re-select last selected area.
-   y     | In visual mode: Yank (copy) selected text to the unnamed register (the clipboard).
-   "+y   | In visual mode: Yank selected text to system clipboard.
-   yy    | Yank current line.
-   yw    | Yank from the cursor to the beginning of the next word.
-   yip   | Yank inside paragraph.
-   yas   | Yank a sentence.
-   yi<   | Yank inside angle brackets.
-   p     | Put (paste) text from the unnamed register.
-   P     | Put text from the unnamed register before the cursor.
-   <C-r>" | In insert mode: Put from the unnamed register.
-   "ayy  | Yank current line to the 'a' register. (:help registers for a list of registers.)
-   "ap   | Put from the 'a' register.

Files and directories
---------------------

-   :e!         | Reload current file, abandoning any changes.
-   :r *[file]* | Insert the contents of *[file]*.
-   :r !date    | Insert the results from the Unix `date` command.
-   :pwd        | Echo current working directory to status line.
-   :cd *[dir]* | Change current working directory to *[dir]*.

Buffers
-------

-   :ls    | List open buffers.
-   :buf 2 | Switch to buffer #2.
-   :bn    | Switch to next buffer.
-   :bp    | Switch to previous buffer.
-   :bd    | Close current buffer.

Windows
-------

-   :split          | Split window (one window on top of the other).
-   :vsplit         | Split window (one window next to the other).
-   :split *[file]* | Split window and open *[file]* in the new window.
-   :close          | Close current window.
-   :only           | Close every window except for the current one.
-   <C-w> h          | Move focus to the window to the left.
-   <C-w> j          | Move focus to the window underneath.
-   <C-w> k          | Move focus to the window above.
-   <C-w> l          | Move focus to the window to the right.
-   <C-w> w          | Move focus to the window below/right of the current one.
-   <C-w> W          | Move focus to the window above/left of the current one.

Tabs
----

-   :tabe          | Open a new tab.
-   :tabe *[file]* | Open a new tab with *[file]*.
-   :tabc          | Close current tab.
-   gt             | Move to next tab.
-   gT             | Move to previous tab.

Scrolling
---------

-   H  | Jump to the high part of the screen.
-   M  | Jump to the middle part of the screen.
-   L  | Jump to the low part of the screen.
-   zt | Scroll so the current line is at the top of the screen.
-   zz | Scroll so the current line is in the middle of the screen.
-   zb | Scroll so the current line is at the bottom of the screen.

Folding
-------

-   :fold | In visual mode: Fold selected lines.
-   3zF   | Fold 3 lines.
-   zo    | Open current fold under the cursor.
-   zc    | Close current fold under the cursor.
-   za    | Toggle current fold under the cursor.
-   zR    | Open all folds.
-   zM    | Close all folds.
-   zd    | Delete fold under the cursor. (Leaves text intact, just removes fold.)

Autocompletion
--------------

-   <C-n>      | Autocomplete current word. Also moves forward through autocomplete list.
-   <C-p>      | Move backward through autocomplete list.
-   <C-x> <C-o> | Omnicomplete. See `:help omnifunc`

Bookmarks and history
---------------------

-   ma | Set current position as mark 'a' (any lowercase letter will do).
-   `a | Jump to mark 'a'. (The first character is a backtick, left of the '1' on your keyboard.)
-   g; | Go back to the last place you edited. (You can do it multiple times in a row.)

Mapping keys
------------

-   :map          | List all mapped keys.
-   :imap         | List all mapped keys for insert mode.
-   :nmap         | List all mapped keys for normal mode.
-   :imap jj Esc> | Map 'jj' in insert mode to do the same as the escape key.
-   :map ,c >>    | Map ',c' to indent the current line.

Useful options
--------------

-   :syntax on                   | Turn on syntax highlighting.
-   :set number                  | Turn on line numbers.
-   :set wrap                    | Wraps lines. (`:set nowrap` turns it off.)
-   :set incsearch               | Show matches as you search rather than waiting for you to hit Enter.
-   :set ignorecase smartcase    | When searching, ignore case unless you type a capital, in which case it’ll match case (smartcase).
-   :set pastetoggle=F5>         | Sets paste toggle to the F5 key, so you can paste text without the indentation going berserk.
-   :abbr teh the                | Add an abbreviation, so when you type 'teh', it changes it to 'the'.
-   :abbr em@ my.email@gmail.com | Another type of abbreviation, to save keystrokes (like TextExpander).

Miscellaneous
-------------

-   :sort                                                              | Sort selected text.
-   :%sort                                                             | Sort the whole file.
-   :1,10sort                                                          | Sort the first ten lines of the file.
-   :!sort -n                                                          | Sort selected text using the external Unix `sort` command with the `-n` option.
-   :%!uniq                                                            | Run the whole file through the external `uniq` command.
-   vimdiff *[file1]* *[file2]*                                        | Diff *[file1]* and *[file2]* using synchronized split windows.
-   ]c                                                                 | In vimdiff mode, move to next line with differences.
-   [c                                                                 | In vimdiff mode, move to previous line with differences.
-   vim + *[file]*                                                     | Open *[file]* in Vim and jump to the end of the file.
-   vim +21 *[file]*                                                   | Open *[file]* in Vim and jump to line 21.
-   [i                                                                 | Show (in the status line) the first line containing the word under the cursor.
-   [I                                                                 | Show (in the status line) all lines containing the word under the cursor.
-   :g/pattern/                                                        | Show (in the status line) all lines that match the regex `/pattern/`.
-   :e scp://username@server//path/to/file                             | Open a remote file over SSH.
-   :au! BufNewFile,BufRead *.php set filetype=php.html.javascript.css | When you open or create a .php file, set the filetype to include HTML, JS, and CSS (for good syntax highlighting).
-   :iab expr> dts strftime("%-d %b %Y (%a)")                          | Make it so typing 'dts' followed by a space will insert the current date.

Cool plugins
------------

-   [Vundle](https://github.com/gmarik/Vundle.vim)    | An autoinstaller for Vim plugins. Indispensable.
-   [UltiSnips](https://github.com/SirVer/ultisnips)  | Enables snippets (fast entry for boilerplate text).
-   [LustyJuggler](https://github.com/sjbach/lusty)   | A buffer explorer.
-   [CtrlP](https://github.com/kien/ctrlp.vim)        | A fuzzy file/buffer finder.
-   [Airline](https://github.com/bling/vim-airline)   | A better status line.
-   [Surround](https://github.com/tpope/vim-surround) | Adds extra commands for working with quotes, parentheses, brackets, and more.

Sample .vimrc files
-------------------

-   [Ben’s  | .vimrc](http://github.com/bencrowder/dotfiles/blob/master/vimrc)
-   [Chad’s | .vimrc](http://github.com/chadgh/configs-utils/blob/master/dotfiles/vimrc)

More reading
------------

-   [Seven habits of effective text              | editing](http://www.moolenaar.net/habits.html)
-   [100 Vim commands every programmer should    | know](http://www.catswhocode.com/blog/100-vim-commands-every-programmer-should-know)
-   [Power Vim usage: Tips & Tricks for Everyday | Editing](http://www.ukuug.org/events/linux2004/programme/paper-SMyers/Linux_2004_slides/vim_tips/)
-   [Two decades of productivity: Vim’s 20th     | anniversary](http://arstechnica.com/information-technology/2011/11/two-decades-of-productivity-vims-20th-anniversary/)
-   [VimGolf](http://vimgolf.com/)               | [Vimcasts](http://vimcasts.org/episodes/archive)

