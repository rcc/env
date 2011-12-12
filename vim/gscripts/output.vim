menu Output.HTML :runtime! syntax/2html.vim<CR>
menu Output.HTML\ Light :set background=light<CR>:runtime! syntax/2html.vim<CR>:set background=dark<CR>:highlight Normal guifg=gray guibg=black<CR>
menu Output.PS :call Mkps()<CR>

function! Mkps()
    let psfile = printf("%s.ps",bufname("%"))
    execute 'hardcopy! > ' psfile
endfunction
