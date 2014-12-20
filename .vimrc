" -- bootstrap -----------------------------------------------------------------

set encoding=utf-8  " set vim encoding to UTF-8
set nocompatible    " the future is now, use vim defaults instead of vi ones
set nomodeline      " disable mode lines (security measure)
set history=1000    " boost commands and search patterns history
set undolevels=1000 " boost undo levels

"if exists("+shellslash")
"  set shellslash    " expand filenames with forward slash
"endif

set timeoutlen=500      " time in milliseconds for a key sequence to complete
let mapleader=","       " change leader key to ,
let maplocalleader=","  " change local leader key to ,

" <leader>ev edits .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" <leader>sv sources .vimrc
"nnoremap <leader>sv :source $MYVIMRC<CR>:redraw<CR>:echo $MYVIMRC 'reloaded'<CR>


" -- backup and swap files -----------------------------------------------------

set backup      " enable backup files
set writebackup " enable backup files
set swapfile    " enable swap files (useful when loading huge files)

let s:vimdir=$HOME . "/.vim"
let &backupdir=s:vimdir . "/backup"  " backups location
let &directory=s:vimdir . "/tmp"     " swap location

if exists("*mkdir")
  if !isdirectory(s:vimdir)
    call mkdir(s:vimdir, "p")
  endif
  if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
  endif
  if !isdirectory(&directory)
    call mkdir(&directory, "p")
  endif
endif

set backupskip+=*.tmp " skip backup for *.tmp

if has("persistent_undo")
  let &undodir=&backupdir
  set undofile  " enable persistent undo
endif

let &viminfo=&viminfo . ",n" . s:vimdir . "/.viminfo" " viminfo location


" -- file type detection -------------------------------------------------------

filetype on         " /!\ doesn't play well with compatible mode
filetype plugin on  " trigger file type specific plugins
filetype indent on  " indent based on file type syntax


" -- command mode --------------------------------------------------------------

set wildmenu                    " enable tab completion menu
set wildmode=longest:full,full  " complete till longest common string, then full
set wildignore+=.git            " ignore the .git directory
set wildignore+=*.DS_Store      " ignore Mac finder/spotlight crap
if exists ("&wildignorecase")
  set wildignorecase
endif

" sudo then write
cabbrev w!! w !sudo tee % >/dev/null

" CTRL+A moves to start of line in command mode
cnoremap <C-a> <home>
" CTRL+E moves to end of line in command mode
cnoremap <C-e> <end>

" CTRL+C closes the command window
if has("autocmd")
  augroup command
    autocmd!
    autocmd CmdwinEnter * noremap <buffer> <silent> <C-c> <ESC>:q<CR>
  augroup END
endif

" -- display -------------------------------------------------------------------

set title       " change the terminal title
"set lazyredraw  " do not redraw when executing macros
set report=0    " always report changes
set cursorline  " highlight current line

"if has("autocmd")
"  augroup vim
"    autocmd!
"    autocmd filetype vim set textwidth=80
"  augroup END
"  augroup windows
"    autocmd!
"    autocmd VimResized * :wincmd = " resize splits when the window is resized
"  augroup END
"endif

if has("gui_running")
  set cursorcolumn  " highlight current column
endif

if exists("+relativenumber")
  if v:version >= 400
    set number
  endif
  set relativenumber  " show relative line numbers
  set numberwidth=3   " narrow number column
  " cycles between relative / absolute / no numbering
  if v:version >= 400
    function! RelativeNumberToggle()
      if (&number == 1 && &relativenumber == 1)
        set nonumber
        set relativenumber relativenumber?
      elseif (&number == 0 && &relativenumber == 1)
        set norelativenumber
        set number number?
      elseif (&number == 1 && &relativenumber == 0)
        set norelativenumber
        set nonumber number?
      else
        set number
        set relativenumber relativenumber?
      endif
    endfunc
  else
    function! RelativeNumberToggle()
      if (&relativenumber == 1)
        set number number?
      elseif (&number == 1)
        set nonumber number?
      else
        set relativenumber relativenumber?
      endif
    endfunc
  endif
  nnoremap <silent> <leader>n :call RelativeNumberToggle()<CR>
else                  " fallback
  set number          " show line numbers
  " inverts numbering
  nnoremap <silent> <leader>n :set number! number?<CR>
endif

set nolist                            " hide unprintable characters
if has("multi_byte")                  " if multi_byte is available,
  set listchars=eol:¬,tab:▸\ ,trail:⌴ " use pretty Unicode unprintable symbols
else                                  " otherwise,
  set listchars=eol:$,tab:>\ ,trail:. " use ASCII characters
endif

" temporarily disable unprintable characters when entering insert mode
if has("autocmd")
  augroup list
    autocmd!
    autocmd InsertEnter * let g:restorelist=&list | :set nolist
    autocmd InsertLeave * let &list=g:restorelist
  augroup END
endif

" inverts display of unprintable characters
nnoremap <silent> <leader>l :set list! list?<CR>

set noerrorbells      " shut up
set visualbell t_vb=  " use visual bell instead of error bell
set mousehide         " hide mouse pointer when typing

set showcmd     " show partial command line (default)
set cmdheight=1 " height of the command line

set shortmess=astT  " abbreviate messages
set shortmess+=I    " disable the welcome screen

if (&t_Co > 2 || has("gui_running")) && has("syntax")
   syntax on  " turn syntax highlighting on, when terminal has colors or in GUI
endif

"if has("gui_running") " GUI mode
"  set guioptions-=T   " remove useless toolbar
"  set guioptions+=c   " prefer console dialogs to popups
"endif

" ease reading in GUI mode by inserting space between lines
set linespace=2

if has("folding")
  set foldenable        " enable folding
  set foldmethod=syntax " fold based on syntax highlighting
  set foldlevelstart=99 " start editing with all folds open

  " toggle folds
  nnoremap <Space> za
  vnoremap <Space> za

  set foldtext=FoldText()
  function! FoldText()
    let l:lpadding = &fdc
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~ 'id=' ? 2 : 0

    if exists("+relativenumber")
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart) + strlen(v:foldstart - line('w0')), strlen(v:foldstart) + strlen(line('w$') - v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
endif

" highlight SCM merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" -- buffers -------------------------------------------------------------------

set nobomb            " don't clutter files with Unicode BOMs
set hidden            " enable switching between buffers without saving
set switchbuf=usetab  " switch to existing tab then window when switching buffer
set autoread          " auto read files changed only from the outside of ViM
if has("persistent_undo") && (&undofile)
  set autowriteall    " auto write changes if persistent undo is enabled
endif
set fsync             " sync after write
set confirm           " ask whether to save changed files

if has("autocmd")
  augroup trailing_spaces
    autocmd!
    "autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces before saving
  augroup END
  augroup restore_cursor
    " restore cursor position to last position upon file reopen
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  augroup END
endif

" cd to the directory of the current buffer
nnoremap <silent> <leader>cd :cd %:p:h<CR>

" switch between last two files
nnoremap <leader><Tab> <c-^>

" <leader>w writes the whole buffer to the current file
nnoremap <silent> <leader>w :w!<CR>
inoremap <silent> <leader>w <ESC>:w!<CR>

" <leader>W writes all buffers
nnoremap <silent> <leader>W :wa!<CR>
inoremap <silent> <leader>W <ESC>:wa!<CR>


" -- navigation ----------------------------------------------------------------

" move to first non-whitespace character of line (when not using mac keyboard)
noremap H ^
" move to end of line (when not using mac keyboard)
noremap L g_

" scroll slightly faster
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
map <C-Up> <C-y>
map <C-Down> <C-e>

set startofline " move to first non-blank of the line when using PageUp/PageDown

" scroll by visual lines, useful when wrapping is enabled
nnoremap j gj
nnoremap <Down> gj
nnoremap k gk
nnoremap <Up> gk

set scrolljump=1    " minimal number of lines to scroll vertically
set scrolloff=4     " number of lines to keep above and below the cursor
                    "   typing zz sets current line at the center of window
set sidescroll=1    " minimal number of columns to scroll horizontally
set sidescrolloff=4 " minimal number of columns to keep around the cursor

if has("vertsplit")
  " split current window vertically
  nnoremap <leader>_ <C-w>v<C-w>l
  set splitright  " when splitting vertically, split to the right
endif
if has("windows")
  " split current window horizontally
  nnoremap <leader>- <C-w>s
  set splitbelow  " when splitting horizontally, split below
endif

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""le code suivant produit un problème d'affichage quand on quitte vim: l'écran
""est mal effacé.
"" move cursor wihout leaving insert mode
" try
"   redir => s:backspace
"   silent! execute 'set ' 't_kb?'
"   redir END
"   if s:backspace !~ '\^H'
"     inoremap <C-h> <C-o>h
"     inoremap <C-j> <C-o>j
"     inoremap <C-k> <C-o>k
"     inoremap <C-l> <C-o>l
"   endif
" finally
"   redir END
" endtry
"
" switch between windows by hitting <Tab> twice
nnoremap <silent> <Tab><Tab> <C-w>w

" window resizing
map <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" <leader>q quits the current window
nnoremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <ESC>:q<CR>

" create a new tab
nnoremap <silent> <leader>t :tabnew<CR>

" next/previous buffer navigation
nnoremap <silent> <C-b> :bnext<CR>
nnoremap <silent> <S-b> :bprev<CR>

set whichwrap=b,s,<,> " allow cursor left/right key to wrap to the
                      " previous/next line
                      " omit [,] as we use virtual edit in insert mode

" disable arrow keys
 nnoremap <Left> :echo "arrow keys disabled, use h"<CR>
 nnoremap <Right> :echo "arrow keys disabled, use l"<CR>
 nnoremap <Up> :echo "arrow keys disabled, use k"<CR>
 nnoremap <Down> :echo "arrow keys disabled, use j"<CR>


" move to the position where the last change was made
noremap gI `.

" by default, 'a jumps to line marked with ma
" while `a jumps to line AND column marked with ma
" swap ' and `
nnoremap ' `
nnoremap ` '

" make arrow keys, home/end/pgup/pgdown, and function keys work when inside tmux
if exists('$TMUX') && (system("tmux show-options -wg xterm-keys | cut -d' ' -f2") =~ '^on')
  " tmux will send xterm-style keys when its xterm-keys option is on
  " add 'setw -g xterm-keys on' to your ~/.tmux.conf
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  execute "set <xHome>=\e[1;*H"
  execute "set <xEnd>=\e[1;*F"
  execute "set <Insert>=\e[2;*~"
  execute "set <Delete>=\e[3;*~"
  execute "set <PageUp>=\e[5;*~"
  execute "set <PageDown>=\e[6;*~"
  execute "set <xF1>=\e[1;*P"
  execute "set <xF2>=\e[1;*Q"
  execute "set <xF3>=\e[1;*R"
  execute "set <xF4>=\e[1;*S"
  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"
endif


" -- editing -------------------------------------------------------------------

set showmode      " always show the current editing mode
set nowrap        " don't wrap lines
set linebreak     " yet if enabled break at word boundaries

"if has("multi_byte")  " if multi_byte is available,
"  set showbreak=↪     " use pretty Unicode marker
"else                  " otherwise,
"  set showbreak=>     " use ASCII character
"endif

set nojoinspaces  " insert only one space after '.', '?', '!' when joining lines
set showmatch     " briefly jumps the cursor to the matching brace on insert
set matchtime=4   " blink matching braces for 0.4s

set matchpairs+=<:>         " make < and > match
runtime macros/matchit.vim  " enable extended % matching

set virtualedit=insert    " allow the cursor to go everywhere (insert)
set virtualedit+=onemore  " allow the cursor to go just past the end of line
set virtualedit+=block    " allow the cursor to go everywhere (visual block)

set backspace=indent,eol,start " allow backspacing over everything (insert)

set expandtab     " insert spaces instead of tab, CTRL-V+Tab inserts a real tab
set tabstop=2     " 1 tab == 2 spaces
set softtabstop=2 " number of columns used when hitting TAB in insert mode
set smarttab      " insert tabs on the start of a line according to shiftwidth

if has("autocmd")
  augroup makefile
    autocmd!
    " don't expand tab to space in Makefiles
    autocmd filetype make setlocal noexpandtab
  augroup END
endif

set autoindent    " enable autoindenting
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " indent with 2 spaces
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" Turn off automatic line breaking in html and css
au BufRead,BufNewFile *.html,*.css set textwidth=0

" Use two-space tabs for javascrit
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Ignore compiled python
set wildignore+=*.pyc


" make Y consistent with C and D by yanking up to end of line
noremap Y y$

" CTRL-S saves file
"nnoremap <C-s> :w<CR>

" inverts paste mode
nnoremap <silent> <leader>pp :set paste! paste?<CR>
" same in insert mode
set pastetoggle=<leader>pp

function! Preserve(command)
  let l:search=@/
  let l:line = line(".")
  let l:col = col(".")
  execute a:command
  let @/=l:search
  call cursor(l:line, l:col)
endfunction

" <leader>rt retabs the file, preserve cursor position
nnoremap <silent> <leader>rt :call Preserve(":retab")<CR>

" <leader>s removes trailing spaces
noremap <silent> <leader>s :call Preserve("%s/\\s\\+$//e")<CR>

" <leader>$ fixes mixed EOLs (^M)
noremap <silent> <leader>$ :call Preserve("%s/<C-V><CR>//e")<CR>

" use <leader>d to delete a line without adding it to the yanked stack
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" use <leader>c to replace text without yanking replaced text
nnoremap <silent> <leader>c "_c
vnoremap <silent> <leader>c "_c

" yank/paste to/from the OS clipboard
noremap <silent> <leader>y "+y
noremap <silent> <leader>Y "+Y
noremap <silent> <leader>p "+p
noremap <silent> <leader>P "+P

" paste without yanking replaced text in visual mode
vnoremap <silent> p "_dP
vnoremap <silent> P "_dp

" always share the OS clipboard
set clipboard=unnamed,unnamedplus

"Ctrl-c to copy in + buffer from visual mode
vmap <C-c> "+y

"Ctrl-p to paste from the + register in cmd mode
map <C-v> "+p

"Ctrl-p to paste from the + register while editing
imap <C-v> <esc><C-v>

"Ctrl-s to save file
map <C-s> <:><w>



" autofix typos
"iabbrev teh the

" reselect last selection after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <

" set cpoptions+=$  " display $ at the end of the replacement zone instead of
"                  " deleting text with 'cw' and alike

set formatoptions-=t  " don't auto-wrap text using textwidth
set formatoptions+=c  " auto-wrap comments using textwidth

set formatoptions+=r  " auto-insert current comment leader,  C-u to undo

" exit from insert mode without cursor movement
inoremap jk <ESC>`^

" quick insertion of newline in normal mode with <CR>
if has("autocmd")
  nnoremap <silent> <CR> :put=''<CR>
  augroup newline
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
  augroup END
endif

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" preserve cursor position when joining lines
nnoremap J :call Preserve("normal! J")<CR>

" split line and preserve cursor position
nnoremap S :call Preserve("normal! i\r")<CR>

" select what was just pasted
nnoremap <leader>v V`]

" <C-Space> triggers completion in insert mode
inoremap <C-Space> <C-P>
if !has("gui_running")
  inoremap <C-@> <C-P>
endif

set completeopt=longest,menuone,preview " better completion

" move current line down
noremap <silent>- :m+<CR>
" move current line up
noremap <silent>_ :m-2<CR>
" move visual selection down
vnoremap <silent>- :m '>+1<CR>gv=gv
" move visual selection up
vnoremap <silent>_ :m '<-2<CR>gv=gv

nnoremap Q <NOP>

" make dot work in visual mode
vnoremap . :normal .<CR>

" make v enter blockwise visual mode, and CTRL-V enter visual mode
"nnoremap v <C-V>
"nnoremap <C-V> v
"vnoremap v <C-V>
"vnoremap <C-V> v


" -- searching -----------------------------------------------------------------

set wrapscan    " wrap around when searching
set incsearch   " show match results while typing search pattern
if (&t_Co > 2 || has("gui_running"))
  set hlsearch  " highlight search terms
endif

" temporarily disable highlighting when entering insert mode
if has("autocmd")
  augroup hlsearch
    autocmd!
    autocmd InsertEnter * let g:restorehlsearch=&hlsearch | :set nohlsearch
    autocmd InsertLeave * let &hlsearch=g:restorehlsearch
  augroup END
endif
set ignorecase  " case insensitive search
set smartcase   " case insensitive only if search pattern is all lowercase
                "   (smartcase requires ignorecase)
set gdefault    " search/replace globally (on a line) by default

" temporarily disable search highlighting
nnoremap <silent> <leader><Space> :nohlsearch<CR>:match none<CR>:2match none<CR>:3match none<CR>

" highlight all instances of the current word where the cursor is positioned
nnoremap <silent> <leader>hs :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" use <leader>h1, <leader>h2, <leader>h3 to highlight words in different colors
nnoremap <silent> <leader>h1 :highlight Highlight1 ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow<CR> :execute 'match Highlight1 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>h2 :highlight Highlight2 ctermfg=0 ctermbg=51 guifg=Black guibg=Cyan<CR> :execute '2match Highlight2 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>h3 :highlight Highlight3 ctermfg=0 ctermbg=46 guifg=Black guibg=Green<CR> :execute '3match Highlight3 /\<<C-r><C-w>\>/'<cr>

" very magic search patterns
" everything but '0'-'9', 'a'-'z', 'A'-'Z' and '_' has a special meaning
"nnoremap / /\v
"vnoremap / /\v
"nnoremap ? ?\v
"vnoremap ? ?\v
"cnoremap %s/ %s/\v

" replace word under cursor
nnoremap <leader>; :%s/\<<C-r><C-w>\>//<Left>


function! BlinkMatch(t)
    let [l:bufnum, l:lnum, l:col, l:off] = getpos('.')
    let l:current = '\c\%#'.@/
    let l:highlight = matchadd('IncSearch', l:current, 1000)
    redraw
    exec 'sleep ' . float2nr(a:t * 1000) . 'm'
    call matchdelete(l:highlight)
    redraw
endfunction

" center screen on next/previous match, blink current match
noremap <silent> n nzzzv:call BlinkMatch(0.2)<CR>
noremap <silent> N Nzzzv:call BlinkMatch(0.2)<CR>


function! GetVisualSelection()
  let [l:l1, l:c1] = getpos("'<")[1:2]
  let [l:l2, l:c2] = getpos("'>")[1:2]
  let l:selection = getline(l:l1, l:l2)
  let l:selection[-1] = l:selection[-1][: l:c2 - 1]
  let l:selection[0] = l:selection[0][l:c1 - 1:]
  return join(l:selection, "\n")
endfunction

" search for visually selected areas
xnoremap * <ESC>/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR><CR>
xnoremap # <ESC>?<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR><CR>

" prepare search based on visually selected area
xnoremap / <ESC>/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR>

" prepare substitution based on visually selected area
xnoremap & <ESC>:%s/<C-r>=substitute(escape(GetVisualSelection(), '\/.*$^~[]'), "\n", '\\n', "g")<CR>/


" -- spell checking ------------------------------------------------------------


" qu'est ce que ça fait ?
"if has("autocmd")
"  augroup spell
"    autocmd!
"    "autocmd filetype vim setlocal spell " enabled when editing .vimrc
"  augroup END
"endif


"set nospell       " disabled by default


" Spell Check
let b:myLang=0
let g:myLangList=["nospell","en","fr"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F7> :call ToggleSpell()<CR>








" --user defined ---------------------------------------------------------------

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Mangement ===============

" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nono/vim-handlebars'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'alanctkc/vim-airline-powerbeans'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jnwhiteh/vim-golang'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tmhedberg/matchit'
Plugin 'voithos/vim-python-matchit'
Plugin 'justinmk/vim-sneak'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/ZoomWin'




if has('lua') && (v:version > 703 || v:version == 703 && has('patch885'))
    Plugin 'Shougo/neocomplete.vim'
else
    Plugin 'ervandew/supertab'
endif

"All of yours plugins must be added before the following line
call vundle#end() "required

" Turn filetype back on
filetype plugin indent on


" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Settings ================

" Enable neocomplete
let g:neocomplete#enable_at_startup = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Ignore gitignored files in CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Always populate loclists with syntastic
let g:syntastic_always_populate_loc_list = 1

" Use syntastic for flake8
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']

" Ignore angular directive errors
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Prevent run code plugin loading
let g:pymode_run = 0

" Prevent pylint plugin loading
let g:pymode_lint = 0

" Disable python folding
let g:pymode_folding = 0

" Disable default pymode python options
let g:pymode_options = 0

" Show status line for single windows
set laststatus=2

" Disable airline separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set airline theme
let g:airline_theme='powerbeans'

" Show json quotes
let g:vim_json_syntax_conceal = 0

" Expand current split to fullscren/restore split size
nmap <silent><leader>o :ZoomWin<CR>

" ==================== Colors ====================

" Use syntax highlighting and color scheme
syntax enable
set background=dark   "ajouté installation solarized
colorscheme solarized "ajouté pour installation solarized
"silent! colorscheme jellybeans



" Use 256 colors in color schemes
set t_Co=256
set term=screen-256color

" clear screen when vim exists ?
"set t_te= t_ti=
"au VimLeave * :!clear



" Ranger integration
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map <leader>r :call RangerChooser()<CR>
