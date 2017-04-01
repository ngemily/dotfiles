" {{{ Plugin
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'


" UI - panel appearance and navigation
Plugin 'vim-airline/vim-airline-themes' " look prettier
Plugin 'bling/vim-airline'      " look pretty. be functional
Plugin 'airblade/vim-gitgutter' " git gutter
Plugin 'majutsushi/tagbar'      " ctags navigation
Plugin 'kien/ctrlp.vim'         " directory globbing
Plugin 'tpope/vim-vinegar'      " better netrw
Plugin 'mtth/scratch.vim'       " easy scratch windows

" Editing - text editing
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
Plugin 'sjl/gundo.vim'          " navigate undo tree
if has('python') || has('python3')
    Plugin 'SirVer/ultisnips'   " snippets
endif
Plugin 'tpope/vim-commentary'   " toggle comment
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'     " easy surround
Plugin 'tpope/vim-endwise'      " syntactic construct endings
Plugin 'tpope/vim-unimpaired'   " sick mappings
Plugin 'godlygeek/tabular'      " line things up vertically
Plugin 'bogado/file-line'       " open file.cpp:101 the way you would expect

" Syntax - highlight, completion, and checking
if has('python3')
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'scrooloose/syntastic'
Plugin 'ehamberg/vim-cute-python'

" Integrated environment
Plugin 'tpope/vim-dispatch'     " better :make integration
Plugin 'tpope/vim-fugitive'     " git integration

" Vim development
Plugin 'kana/vim-vspec'         " VimScript unit testing

call vundle#end()
" }}}

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

" Colors
" let g:solarized_hitrail = 1
colorscheme solarized
set t_Co=256           " number of terminal colors
highlight CursorLineNr ctermbg=7

" {{{ Set
" Terminal settings
set encoding=utf-8     " character encoding
set clipboard+=unnamed " enable yank to system clipboard

" Display
set ruler           " show position in file on status line
set number          " show line numbers
set relativenumber  " relative to current line number
set cursorline      " highlight the cursorline
set colorcolumn=+1  " highlight textwidth+1 column
set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<
set nowrap          " don't wrap long lines
source ~/.vim_bg

" Windows and Buffers
set hidden         " keep buffers open, but hidden, when abandoned
set winminheight=0 " minimum window height
set laststatus=2   " status-line display mode [0-2]

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

" }}}

" {{{ Key Mappings
" {{{ hjkl related movements
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
" window nav
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" }}}

" {{{ Bookmarks - for convenient editing of frequent files
" Quick editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" {{{ Editing - modifies text
" Formatting lines
nnoremap Q gqip
vnoremap Q gq
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

" Change to directory of current file.
"nnoremap <leader>C :cd %:p:h<CR>:pwd<cr>

" }}}

" {{{ Auto commands
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

" {{{ Netrw
let g:netrw_altv=1              " v opens in new vertical split on the right
let g:netrw_liststyle=3
let g:netrw_banner=0            " suppress banner
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}}

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

" {{{ Signify
let g:signify_vcs_list = [ 'perforce', 'git' ]
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
" }}}

" {{{ YouCompleteMe
" Map useful commands
" y=ycm, g=go, x=thing
map yG :YcmCompleter GoTo<CR>
map ygi :YcmCompleter GoToInclude<CR>
" y=ycm, o=obtain, x=thing
map yod :YcmCompleter GetDoc<CR>
map yop :YcmCompleter GetParent<CR>
map yot :YcmCompleter GetType<CR>

" colours
highlight link YcmErrorSign CursorLineNr

" Point to the configuration file.  Alternatively, always copy this file to your
" source code directory to avoid using a global file.
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0

" Show gutter symbols at erroneous lines.
let g:ycm_show_diagnostics_ui = 1

" For debug.  If you are running into an errors, or there are no completions
" available, set these and run :YcmDebugInfo.  This will write some logs and
" show you where they are.
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_use_vim_stdout = 0

let g:ycm_register_as_syntastic_checker = 0
" }}}

" {{{ UltiSnips
let g:UltiSnipsExpandTrigger = '<c-t>'
let g:UltiSnipsJumpForwardTrigger = '<c-t>' " can't use <c-n>, conflicts with ycm
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
" }}}

" {{{ Syntastic
" Plugin settings
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["cpp"] 
    \ }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1

highlight link SyntasticErrorSign CursorLineNr
highlight link SyntasticWarningSign CursorLineNr

" Python
let g:syntastic_python_checkers = ['python']

" Perl settings
let g:syntastic_enable_perl_checkers = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
" }}}

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

" {{{ vp4
let g:vp4_perforce_executable = 'p4'
let g:vp4_allow_open_depot_file=1
" }}}

" {{{ Ctrl-P
let g:ctrlp_max_files = 1000
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}}

" Gundo
nnoremap cog :GundoToggle<CR><C-c>

" Fugitive
"nnoremap <leader>G :Gstatus<CR>
"nnoremap <leader>D :Gdiff<CR>

" {{{ Commentary plugin comment string
augroup commentary
    autocmd!
    autocmd FileType dot,c,cpp,cs,java setlocal commentstring=//\ %s
    autocmd FileType verilog,verilog_systemverilog setlocal commentstring=//\ %s
    autocmd FileType gdb,awk,csv,sdc,cmake setlocal commentstring=\#\ %s
augroup END
" }}}

" }}}

" vim: foldenable foldmethod=marker
