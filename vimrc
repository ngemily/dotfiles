" Vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" UI - panel appearance and navigation
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'

" Editing - text editing
Plugin 'sjl/gundo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs'

" Syntax - highlight, completion, and checking
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'nelstrom/vim-markdown-folding'

" Integrated environment
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" Global variables
let mapleader = '\'
let maplocalleader = '`'
let $MANPAGER=''
let tex_flavor='latex'

" Filetype options
filetype plugin on
filetype indent on

" Syntax options
syntax on

" Color scheme
colorscheme solarized

" Terminal settings
set encoding=utf-8     " character encoding
set t_Co=256           " number of terminal colors
set clipboard+=unnamed " enable yank to system clipboard

" Display
set ruler           " show position in file on status line
set number          " show line numbers
set relativenumber  " relative to current line number
set cursorline      " highlight the cursorline
set colorcolumn=+1  " highlight textwidth+1 column
set background=dark " set background light/dark
set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<

" Windows and Buffers
set hidden         " keep buffers open, but hidden, when abandoned
set winminheight=0 " minimum window height
set laststatus=2   " status-line display mode [0-2]
set mouse=a        " turn on mouse mode

" Pattern Matching
set magic      " use magic matching
set incsearch  " show matches as pattern is being entered
set hlsearch   " highlight all matching expressions
set ignorecase " ignore case
set smartcase  " override ignore case if searching upper case

" Tabs and Spaces
set autoindent    " enter insert mode on new line with same indent level
set smartindent   " smart indent for code blocks
set expandtab     " enter tab key presses as spaces
set shiftwidth=4  " number of spaces for each step of auto-indent
set softtabstop=4 " number of spaces a tab counts for while editing
set tabstop=4     " number of spaces a tab counts for
set textwidth=80  " maximum line length

" Undo files
if exists ("&undofile")
  set undofile
endif
if exists ("&undodir")
  set undodir=$HOME/.vimundo//
endif

" Folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=10

set cpo+=J " for two space at end of sentence
set showmatch " show matching brace when inserted
set noshowmode " put a message stating editing mode
set noesckeys
set scrolloff=3

" --------------
"  Key Mappings
" --------------
" Display count of current search
nnoremap <leader>C :%s///gn<cr>
" Search highlighted word
vnoremap ? y:let @/=@"<CR>:%s///gn<cr>
" Movement
nnoremap H 0w
vnoremap H 0w
nnoremap L $
vnoremap L $
" Pane sizing
nnoremap <leader>L <C-w>5>
nnoremap <leader>H <C-w>5<
nnoremap <leader>K <C-w>5-
nnoremap <leader>J <C-w>5+
nnoremap <C-J> <C-j>
" To upper case
inoremap <leader><C-u> <esc>viwUea
nnoremap <leader>u viwUe
"
nnoremap <silent> <leader>/ :let @/=""<CR>
nnoremap <F3> :ls!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>l :set list!<CR>
" window nav
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" Move line
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap <leader>, <<
nnoremap <leader>. >>
" Formatting
nnoremap Q gqip
vnoremap Q gq
" Quick editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" [ Insert mode ]
"imap <C-j> <Plug>IMAP_JumpForward
"imap <C-i> <Plug>Tex_InsertItemOnThisLine
"imap <C-b> <Plug>Tex_MathBF
"imap <C-c> <Plug>Tex_MathCal
"imap <C-l> <Plug>Tex_LeftRight
" [ Operator pending ]
onoremap <silent> in( :<C-u>normal! f(vi(<cr>
onoremap <silent> in{ :<C-u>normal! f{vi{<cr>
onoremap <silent> in[ :<C-u>normal! f[vi[<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
" Quick Search
vnorem // y/<c-r>"<cr>
" Change to directory of current file.
"nnoremap <leader>C :cd %:p:h<CR>:pwd<cr>

" --------------
"  Auto commands
" --------------
" Syntax group
augroup syntax
  autocmd!
  autocmd BufNewFile,BufRead *.io set filetype=io
  autocmd BufNewFile,BufRead *.cls set filetype=tex
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.sv set filetype=verilog
  autocmd BufNewFile,BufRead *.vh set filetype=verilog
  autocmd BufNewFile,BufRead *.vo set filetype=verilog
  autocmd BufNewFile,BufRead *.xxd set filetype=xxd
augroup END
" Whitespace management
augroup whitespace
  autocmd!
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab tw=0
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab tw=0
augroup END
augroup prose
    autocmd!
    autocmd FileType markdown set background=light
    autocmd FileType markdown set nonumber norelativenumber
augroup END
" Comment group
augroup comment_line
  autocmd!
  autocmd FileType lua nnoremap <buffer> <localleader>c I--<ESC>
  autocmd FileType c nnoremap <buffer> <localleader>c I//<ESC>
  autocmd FileType lua nnoremap <buffer> <localleader>C 0wxx
augroup END
" Completion group
augroup completion
  autocmd FileType python setl omnifunc=pythoncomplete#Complete
  autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
  autocmd FileType c setl omnifunc=ccomplete#Complete
  autocmd FileType ruby setl omnifunc=rubycomplete#Complete
augroup END
" Autocomplete, lang spec.
augroup abbrev
  autocmd!
  autocmd FileType lua :iabbrev <buffer> func function ( ) end
  autocmd FileType lua :iabbrev <buffer> iff if then end
  autocmd FileType lua :iabbrev <buffer> fori for i in ipairs () do end
  autocmd FileType lua :iabbrev <buffer> fork for k, v in pairs () do end
augroup END

" ---------
" Functions
function! ToggleBackground()
  if (&background == "light")
    set background=dark
  else
    set background=light
  endif
endfunction
command! Bg call ToggleBackground()

" Clean whitespace
function! Tidy()
    %s/\s\+$//
    write
endfunction
command! Tidy call Tidy()
nnoremap <F5> :call Tidy()<CR>

" Set ignore pattern for diff
function! IgnoreDiff(pattern)
    let opt = ""
    "if exists("g:diffignore") && g:diffignore != ""
    if a:pattern != ""
        let opt = "-I " . a:pattern . " "
    endif
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-b "
    endif
    silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
                \  " > " . v:fname_out
endfunction

command! IgnoreCommentDiff set diffexpr=IgnoreDiff('//') | diffupdate
command! ResetDiff set diffexpr= | diffupdate

" --------
" Commands
" --------
command! NoComment :%s/\v\/\*.+\*\///
command! TabWord :'<,'>Tabularize /\v^\s+\w+\s\zs

" ---------------
" Plugin Settings
" ---------------

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_theme = 'powerlineish'

" Tagbar
let g:tagbar_left = 1
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-k>'

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-l>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_warning_symbol = '>'
let g:ycm_always_populate_location_list = 1
