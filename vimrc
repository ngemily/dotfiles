" {{{ Plugins
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" UI - panel appearance and navigation
Plug 'vim-airline/vim-airline-themes' " look prettier
Plug 'vim-airline/vim-airline'        " look pretty. be functional
Plug 'majutsushi/tagbar'              " ctags navigation
Plug 'airblade/vim-gitgutter'         " git gutter
Plug 'junegunn/fzf'                   " directory globbing
Plug 'junegunn/fzf.vim'               " directory globbing
Plug 'tpope/vim-vinegar'              " better netrw
Plug 'mhinz/vim-startify'             " sick startup screen
Plug 'ryanoasis/vim-devicons'         " pretty icons
Plug 'ngemily/vim-colors-solarized'
Plug 'junegunn/goyo.vim'

" Editing - text editing
Plug 'bogado/file-line'          " open file.cpp:101 the way you would expect
Plug 'tmhedberg/matchit'         " better <({[]})> support
Plug 'chaoren/vim-wordmotion'    " motions_within_words
Plug 'godlygeek/tabular'         " line things up vertically
Plug 'sjl/gundo.vim'             " navigate undo tree
Plug 'tpope/vim-commentary'      " toggle comment
Plug 'tpope/vim-repeat'          " smarter repeat
Plug 'tpope/vim-surround'        " easy surround
Plug 'tpope/vim-endwise'         " language aware complete 'end' after 'if'
Plug 'tpope/vim-unimpaired'      " sick mappings
Plug 'ngemily/vim-grep-operator' " list matches in the location list

" Syntax - highlight, completion, and checking
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-syntax-extra'

" Language specific
Plug 'ehamberg/vim-cute-python',     {'for' : 'python'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : 'markdown'}
Plug 'plasticboy/vim-markdown',      {'for' : 'markdown'}

" Integrated environment
Plug 'tpope/vim-dispatch'     " better :make integration
Plug 'tpope/vim-fugitive'     " git integration

call plug#end()
" }}}

" {{{ Set
" Leaders
let mapleader = ' '
let maplocalleader = '`'

" Pagers
let $MANPAGER=''
let $PAGER=''
let tex_flavor='latex'

" Filetype options
filetype plugin on
filetype indent on

" Syntax options
syntax on

" Colors
colorscheme solarized
set background=light
let g:solarized_hitrail = 1
set t_Co=256           " number of terminal colors

" Italic comments
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

" Terminal settings
set encoding=utf-8     " character encoding
set clipboard+=unnamed " enable yank to system clipboard

" Auto completion in command mode
set wildmenu
set wildmode=full

" Display
set ruler           " show position in file on status line
set number          " show line numbers
set relativenumber  " relative to current line number
set cursorline      " highlight the cursorline
set colorcolumn=+1  " highlight textwidth+1 column
set signcolumn=number " display signs in the number column
set listchars=eol:$,tab:\ ,trail:~,extends:>,precedes:<
set nowrap          " don't wrap long lines

" Windows and Buffers
set hidden         " keep buffers open, but hidden, when abandoned
set winminheight=0 " minimum window height
set laststatus=2   " status-line display mode [0-2]
set mouse=""       " turn off mouse mode

" Pattern Matching
set magic      " use magic matching
set incsearch  " show matches as pattern is being entered
set hlsearch   " highlight all matching expressions
set ignorecase " ignore case
set smartcase  " override ignore case if searching upper case

" Tabs and Spaces
set autoindent    " enter insert mode on new line with same indent level
set cindent       " smart indent for code blocks
set cinkeys-=0#   " don't do that annoying put # on column 0 thing
set expandtab     " enter tab key presses as spaces
set shiftwidth=4  " number of spaces for each step of auto-indent
set softtabstop=4 " number of spaces a tab counts for while editing
set tabstop=4     " number of spaces a tab counts for
set textwidth=80  " maximum line length

" Hardcopy (Note: Courier is the only font avaiable for printing to PS)
set printoptions+=number:y,paper:letter,left:0.25in,right:0.5,top:1in,bottom:1in
set printfont=courier:h9

" Undo files
set undofile
set undodir=$HOME/.vimundo

" Folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=10

set cpo+=J " for two space at end of sentence
set showmatch " show matching brace when inserted
set noshowmode " put a message stating editing mode
set noesckeys
set scrolloff=3

" }}}

" {{{ Key Mappings
" {{{ Windows and panes
" Pane sizing
nnoremap <leader>L <C-w>5>
nnoremap <leader>H <C-w>5<
nnoremap <leader>K <C-w>5-
nnoremap <leader>J <C-w>5+
nnoremap <C-J> <C-j>
" window nav
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" }}}

" {{{ Editing - modifies text
" To upper case
inoremap <leader><C-u> <esc>viwUea
nnoremap <leader>u viwUe
" Change in's
onoremap <silent> in( :<C-u>normal! f(vi(<cr>
onoremap <silent> in{ :<C-u>normal! f{vi{<cr>
onoremap <silent> in[ :<C-u>normal! f[vi[<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
" Move line
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap <leader>, <<
nnoremap <leader>. >>
" }}}

" {{{ Search
" Clear current search
nnoremap <silent> <leader>/ :let @/=""<CR>
" Display count of current search
nnoremap <leader>C :%s///gn<cr>
" Search for the currently selected text
vnoremap ? y:let @/=@"<CR>:%s///gn<cr>
" Like good 'ol '*' and '#', but escape special chars
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}

" {{{ Command mode
cnoremap <c-p> <up>
cnoremap <c-n> <down>
" }}}
" }}}

" {{{ Filetype settings
" {{{ Filetype group
augroup syntax
  autocmd!
  autocmd BufNewFile,BufRead *.io set filetype=io
  autocmd BufNewFile,BufRead *.func set filetype=sh
  autocmd BufNewFile,BufRead *.exports set filetype=sh
  autocmd BufNewFile,BufRead *.aliases set filetype=sh
  autocmd BufNewFile,BufRead *.zsh-theme set filetype=sh
  autocmd BufNewFile,BufRead *.vo set filetype=verilog
  autocmd BufNewFile,BufRead *.vt set filetype=verilog
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead README set filetype=markdown
augroup END
" }}}
" {{{ Makefile file type options
augroup make
  autocmd!
  autocmd FileType make setl noexpandtab
augroup END
" }}}
" }}}

" {{{ Functions
" {{{ Clean whitespace
function! Tidy()
    %s/\s\+$//
    write
endfunction
command! Tidy call Tidy()
" }}}
" {{{ Claim write permission
function! g:ChmodOnWrite()
    if v:cmdbang
        let do_edit = input('claim write permission? [y/n]')
        if do_edit ==? 'y'
            silent !chmod u+w %
        endif
    endif
endfunction
augroup permissions
    autocmd!
    autocmd BufWrite * call g:ChmodOnWrite()
augroup END
" }}}

" {{{ Set ignore pattern for diff
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
" }}}

" }}}

" {{{ Plugin Settings

" {{{ Airline
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
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" {{{ ALE
let g:ale_echo_msg_format = '[%linter%] %s'

" Airline
let g:airline#extensions#ale#error_symbol='✘ '
let g:airline#extensions#ale#warning_symbol='⚠ '
" }}}
"
" {{{ CoC
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> cD :call <SID>show_documentation()<CR>

augroup coc
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json,cpp setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Format whole file
command! -nargs=0 Format :call CocAction('format')

set shortmess+=aFc
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag_raw(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" }}}

" {{{ Commentary plugin comment string
augroup commentary
    autocmd!
    autocmd FileType dot,c,cpp,cs,java setlocal commentstring=//\ %s
    autocmd FileType verilog,verilog_systemverilog setlocal commentstring=//\ %s
    autocmd FileType gdb,awk,csv,sdc,cmake setlocal commentstring=\#\ %s
augroup END
" }}}

" {{{ FZF
let g:fzf_command_prefix = 'Fzf'

" act like ctrl-p in sublime text
nnoremap <c-p> :FZF<CR>

nnoremap <c-b> :FzfBuffers<CR>
nnoremap <c-f> :FzfBLines<CR>
" nnoremap <c-m> :FzfMarks<CR>

" Like <c-f>, which goes opens the command-line window, use a command mode map
" to enable fuzzy finding through the command history.
cnoremap <silent> <c-t> FzfHistory:<CR>
" Unclear how to make a search mode map, use normal mode map instead.
" Unfortunately, this is not consistent with the map for FzfHistory:
" <c-/> is also not possible, as only ASCII printable characters may be mapped.
nnoremap <c-s> :FzfHistory/<cr>
" }}}

" {{{ Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
" }}}

" {{{ Startify
nnoremap tos :Startify<CR>

" startify mappings, do not use these letters for bookmarks!
"   q - quit
"   e - empty buffer
"   i - empty buffer in insert mode
"   [bsvt] - marks for {same, split, vsplit, tab}

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_list_order = [
        \ ['Sessions'], 'sessions',
        \ ['MRU'], 'files',
        \ ['MRU Directory'], 'dir',
        \ ['Bookmarks'], 'bookmarks',
        \ ['Commands'], 'commands',
        \ ]

" bookmarks, list of {'<key>' : 'path'} dicts
let g:startify_files_number = 20
let g:startify_bookmarks = [
        \ { 'C': '$HOME/.vimrc'},
        \ ]

let g:startify_fortune_use_unicode = 1
let g:startify_disable_at_vimenter = 0
" }}}
"
" {{{ Tagbar
nnoremap cot :TagbarToggle<CR>

let g:tagbar_left = 1
let g:tagbar_width = 60
let g:tagbar_autofocus = 1

let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }

" }}}

" {{{ Word motion
let g:wordmotion_prefix = '<Space>'
" }}}

" }}}

" vim: foldenable foldmethod=marker
