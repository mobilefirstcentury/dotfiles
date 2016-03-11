" Vim script that turns Vim into a personal wiki
" Maintainer:	Daniel Choi <dhchoi@gmail.com>
" License: MIT License (c) 2011 Daniel Choi

if exists("g:SoyWikiStarterLoaded") || &cp || version < 700
  finish
endif
let g:SoyWikiStarterLoaded = 1


func! Soywiki()
  source /home/rachid/.gem/ruby/2.1.3/gems/soywiki-0.9.8.3/lib/soywiki.vim
endfunc

command! -bar -nargs=0 Soywiki :call Soywiki()

