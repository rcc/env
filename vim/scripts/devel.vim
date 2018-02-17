source $VIMRUNTIME/ftplugin/man.vim

" used for finding %%% which I use for fields
imap <buffer> ;; <Esc>/%%%<CR>c3l
nmap <buffer> ;; /%%%<CR>c3l

let NERDTreeIgnore = ['\.pyc$','cscope.files','cscope.out']
