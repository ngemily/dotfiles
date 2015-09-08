syn sync lines=1000

syn match rptInfo "^ *Info[ ()0-9]*: .*$"
syn match rptWarn "^ *Warning[ ()0-9]*: .*"
syn match rptErr "^ *Error[ ()0-9]*: .*"
" Region is commented out.  If using it, the following 3 will need the
" keyword contained.
" It won't print alterate table colour if "\n" is omitted.
syn match rptTableLine "^+-[+-]\++$\n" nextgroup=rptTableContentOdd
syn match rptTableContentOdd "^;.*;$\n" nextgroup=rptTableContentEven
syn match rptTableContentEven "^;.*;$\n" nextgroup=rptTableContentOdd
" The following region definition makes VIM really slow, not sure why yet.
"syn region rptTable start="[^;]*$\n^+--\++$" end="^+-[+-]\++$\n^[^;]*" fold transparent contains=rptTableLine,rptTableContentOdd,rptTableContentEven

let b:current_syntax = "qii_rpt"
hi def link rptInfo function
hi def link rptErr statement
hi def link rptWarn comment
hi def link rptTableLine preproc
hi def link rptTableContentOdd function
hi def link rptTableContentEven comment
