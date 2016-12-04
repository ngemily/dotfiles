" Vimgrep the last search pattern in the current file
nnoremap <leader>v :call <SID>VimgrepOpen()<cr>

function! s:VimgrepOpen()
    let pattern = @/

    silent execute "vimgrep! " . shellescape(pattern) . " %"
    redraw!
    copen

endfunction

" Grep Operator
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    redraw!
    copen

    let @@ = saved_unnamed_register
endfunction
