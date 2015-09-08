if exists(':TlistOpen')
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

    nnoremap <C-t><C-r> :TlistOpen<CR><C-c>
    nnoremap <C-t> :TlistClose<CR>
    nnoremap <leader>T :TToggle<CR><C-c>
    nnoremap <F5> :echo Tlist_Get_Tagname_By_Line()<CR>
endif
