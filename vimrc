"Pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim
source ~/dotfiles/vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect( '~/dotfiles/vim/bundle' )

syntax on
filetype plugin on
let mapleader = ' '
let maplocalleader = ','
let $MANPAGER=''

" Display "
colorscheme solarized
set background=dark

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

" Abbreviations "
" Typo correction
iab hten then
iab htne then
iab slef self
iab flase = false
iab fasle = false
iab moaidev ../moai-dev/vs2010/bin/win32/release/moai-untz

" Key Mappings "
" [ General ]
nnoremap <F2> :set background=light<CR>
nnoremap <F2><F2> :set background=dark<CR>
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
" Tlist
nnoremap <C-t><C-r> :TlistOpen<CR>
nnoremap <leader>r :highlight TagListFileName ctermg=none<CR>
nnoremap <C-t> :TlistToggle<CR>
nnoremap <F5> :echo Tlist_Get_Tagname_By_Line()<CR>
" NERDTree
nnoremap <C-n><C-b> :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <C-n><C-n> :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeClose<CR>
" window nav
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" Move current LINE up/down one line
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap <leader>, <<
nnoremap <leader>. >>
" Quick editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" [ Operator pending ]
onoremap <silent> in( :<C-u>normal! f(vi(<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>

" Auto commands
" Enter insert mode when editing new file.
augroup new_file
  autocmd!
  autocmd BufNewFile * :startinsert
augroup END
" Comment group
augroup comment_line
  autocmd!
  autocmd FileType lua nnoremap <buffer> <localleader>c I--<ESC>
  autocmd FileType lua nnoremap <buffer> <localleader>C I<ESC>xx
augroup END
" Autocomplete, lang spec.
augroup abbrev
  autocmd!
  autocmd FileType lua :iabbrev <buffer> func function ( ) end<left><left><left><left><left><left>
  autocmd FileType lua :iabbrev <buffer> iff if then end<left><left><left><left><left><left><left><left><left>
  autocmd FileType lua :iabbrev <buffer> fori for i in ipairs () do end<left><left><left><left><left><left><left><left>
  autocmd FileType lua :iabbrev <buffer> fork for k, v in pairs () do end<left><left><left><left><left><left><left><left>
augroup END
