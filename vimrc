syntax on
colorscheme github
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=5
let javaScript_fold=1
set textwidth=0
"set foldclose=all

" nice status in the ruler
set ruler
set laststatus=2

" tabs -> spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" turn mouse on
" set mouse=a

" space = pagedown, - = pageup
noremap <Space> <PageDown>
noremap - <PageUp>

" auto-save buffer as you jump between them
set autowrite

" ack integration
set grepprg=ack\ -a

" remap'd keys
map <Tab> <C-W>w
nnoremap <F5><F5> :set invhls hls?<CR>    " use f5f5 to toggle search hilight
nnoremap <F4><F4> :set invwrap wrap?<CR>  " use f4f4 to toggle wordwrap
nnoremap <F2><F2> :vsplit<CR>
vmap c :TC<CR><F5><F5>

function RubyEndToken ()
  let current_line = getline( '.' )
  let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
  let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
  let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

  if match(current_line, braces_at_end) >= 0
    return "\<CR>}\<C-O>O" 
  elseif match(current_line, stuff_without_do) >= 0
    return "\<CR>end\<C-O>O" 
  elseif match(current_line, with_do) >= 0
    return "\<CR>end\<C-O>O" 
  else
    return "\<CR>" 
  endif
endfunction

au FileType ruby imap <buffer> <CR> <C-R>=RubyEndToken()<CR>

fun! Replace() 
  let s:word = input("Replace " . expand('<cword>') . " with:") 
  :exe 'bufdo! %s/' . expand('<cword>') . '/' . s:word . '/ge' 
  :unlet! s:word 
endfun 

map \r :call Replace()<CR> 

" backup to ~/.tmp
set backup
set backupdir=$HOME/.tmp
set writebackup

" no swap file
set noswapfile

" misc
set si
set nohls
set incsearch
set showcmd
set nowrap
syntax match Error "\s\+$"

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" :alias
com VR :vertical resize 80
:command -bar -nargs=1 OpenURL :!open <args>
:command W w
:command Wq wq
:command Wa wa
:command Q q

" iabbrevs
iabbrev ARB ActiveRecord::Base
iabbrev uts Unit tested: self \n Code reviewed: 

"nmap <C-T> /^ *def</C-T>  
"nmap <D-T> :e **/</D-T>

au BufNewFile,BufRead *.god setfiletype ruby
au BufNewFile,BufRead *.treetop setfiletype ruby
au BufNewFile,BufRead *.rl setfiletype ragel
au BufNewFile,BufRead *.io setfiletype io

au FileType javascript imap <c-t> console.log()<esc>i
au FileType javascript iabbrev functino function
au FileType javascript imap <c-a> alert()<esc>i
au FileType javascript setl nocindent
au FileType javascript inoremap <buffer> $r return

au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>

"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"Highlight current
"set cursorline

function! PlainTextFold()
  setlocal foldmethod=expr 
  setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum)) 
  set foldtext=getline(v:foldstart) 
  set fillchars=fold:\ "(there's a space after that \) 
endfunction

au FileType plaintext call PlainTextFold()
au FileType yaml call PlainTextFold()

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" colorz
"hi Comment	term=bold		ctermfg=DarkCyan		guifg=#80a0ff
hi Comment	ctermfg=DarkMagenta

