"Pathogen
source ~/dotfiles/vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect( '~/.vim/bundle' )

syntax on
filetype plugin on
let mapleader = ' '
let maplocalleader = '`'
let $MANPAGER=''
let tex_flavor='latex'

" Display "
colorscheme solarized
if strftime("%H") < 17 && strftime("%H") > 7
  "set background=light
  set background=dark
else
  set background=dark
endif

" Set "
set magic
set ruler
set number
set hidden
set winminheight=0
set showmatch
set hlsearch
set ignorecase
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ruler
set textwidth=80
if exists ("&undofile")
  set undofile
endif
if exists ("&undodir")
  set undodir=$HOME/.vimundo//
endif
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<

" Key Mappings "
" [ General ]
nnoremap <leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>
inoremap jk <ESC>
vnoremap kl <ESC>
nnoremap H 0w
vnoremap H 0w
nnoremap L $
vnoremap L $
" To upper case 
inoremap <leader><C-u> <esc>viwUea
nnoremap <leader>u viwUe
" [ Normal mode ]
nnoremap / /\v
nnoremap <silent> <leader>/ :let @/=""<CR>
nnoremap <F3> :ls!<CR>
nnoremap <leader>w :w<CR>
nnoremap cF cwtrue<ESC>
nnoremap cT cwfalse<ESC>
nnoremap <leader>l :set list!<CR>
" Tlist
nnoremap <C-t><C-r> :TlistOpen<CR><C-c>
nnoremap <C-t> :TlistClose<CR>
nnoremap <leader>T :TToggle<CR><C-c>
nnoremap <F5> :echo Tlist_Get_Tagname_By_Line()<CR>
" NERDTree
nnoremap <silent> <C-n><C-b> :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <silent> <C-n><C-n> :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <silent> <C-n> :NERDTreeClose<CR>
" Gundo
nnoremap <leader>g :GundoToggle<CR><C-c>
" Fugitive
nnoremap <leader>G :Gstatus<CR>
nnoremap <leader>D :Gdiff<CR>
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
" Cutting lines
nnoremap Q gqip
vnoremap Q gq
" Quick editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" [ Operator pending ]
onoremap <silent> in( :<C-u>normal! f(vi(<cr>
onoremap <silent> in{ :<C-u>normal! f{vi{<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>

" Auto commands
" Syntax group
augroup syntax
  autocmd!
  autocmd BufNewFile,BufRead *.io set filetype=io
augroup END
" Enter insert mode when editing new file.
augroup new_file
  autocmd!
  autocmd BufNewFile * :startinsert
augroup END
" Comment group
augroup comment_line
  autocmd!
  autocmd FileType lua nnoremap <buffer> <localleader>c I--<ESC>
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

function! TaglistToggle()
  let winnum = bufwinnr(g:TagList_title)
  if winnum != -1
    TlistClose
  else
    TlistOpen
    if &background=="light"
      highlight MyTagListFileName ctermbg=none
      highlight MyTagListFileName ctermfg=magenta
    else
      highlight MyTagListFileName ctermbg=red
    endif
  endif
endfunction
command! TToggle call TaglistToggle()

" Commands
command! NoComment :%s/\v\/\*.+\*\///
command! TabWord :'<,'>Tabularize /\v^\s+\w+\s\zs

" Plugin options
let g:Powerline_symbols = 'unicode'
