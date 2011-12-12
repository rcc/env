function Read_binfile()
    %!xxd -g 1
endfunction

function Write_binfile()
    %!xxd -r
endfunction

if has("autocmd")

    autocmd BufRead *.bin   call Read_binfile()
    autocmd BufWrite *.bin   call Write_binfile()

endif
