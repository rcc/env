function! P4edit()
    let fn = expand("%")
    let res = system("p4 edit " . fn)
    setlocal noreadonly
endfunction

function! P4revert()
    let fn = expand("%")
    setlocal autoread
    let res = system("p4 revert " . fn)
    checktime
    setlocal noautoread
endfunction

function! P4log()
    let fn = expand("%")
    new
    exe "read ! p4 changelists -l " . fn
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
endfunction

function! P4diff()
    diffthis
    let fn = expand("%")
    let tmpfn = tempname()
    let res = system("P4DIFF='diff' p4 diff '" . fn . "#head' | awk '{if(NR > 1) print $0;}' | patch -R -o " . tmpfn . " " . fn)
    vert new
    exe "edit " tmpfn
    diffthis
    "set buftype=nofile
    setlocal noswapfile
    if has("gui")
        set columns=165
    endif
    wincmd =
endfunction

function! P4opened()
    if &modified
        echo "Current Buffer Is Modified!"
        return
    endif
    new
    only
    let @@ = "*** Checked Out Files: (gf will open file under cursor)"
    normal p
    read ! p4 opened | sed -e "s;^//;${p4rootpath}/${p4workspace}/;" -e 's/\(\#[0-9]*\) / \1 /'
    normal gg
    set buftype=nowrite
    setlocal noswapfile
    setlocal bufhidden=delete
endfunction

function! P4write()
    call P4edit()
    write
endfunction

command Pfw call P4write()

function! P4udiff(...)
    new
    exe "read ! P4DIFF=\"diff -uwp\" p4 diff " . join(a:000, ' ')
    normal ggdd
    set buftype=nowrite
    setlocal noswapfile
    setlocal bufhidden=delete
    filetype detect
endfunction

function! P4blame()
    let fn = expand("%")
    if &modified
        echo "Current Buffer Is Modified!"
        return
    endif
    new
    only
    exe "read ! p4 annotate -i -q -db " . fn
    normal ggdd
    set buftype=nowrite
    setlocal noswapfile
    setlocal bufhidden=delete
endfunction

function! P4describe(cl)
	new
    exe "read ! p4 describe -du -db " . a:cl
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
	set filetype=diff
endfunction

function! P4describeundercursor()
	let cl = expand("<cword>")
	call P4describe(cl)
endfunction
