function! SVNalldiff()
	tabnew
    exe "read ! svn diff"
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
	set filetype=diff
endfunction

function! SVNstatus()
	tabnew
    exe "read ! svn status"
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
endfunction

function! SVNfilediff(filename)
	new
    exe "read ! svn diff " . a:filename
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
	set filetype=diff
endfunction

function! SVNcurrentfilediff()
    let fn = expand("%")
	call SVNfilediff(fn)
endfunction

function! SVNcursorfilediff()
	let fn = expand("<cfile>")
	call SVNfilediff(fn)
endfunction

function! SVNlog()
	tabnew
    exe "read ! svn log --stop-on-copy -l 100"
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
endfunction

function! SVNshow(object)
	new
    exe "read ! svn log -v --diff -" . a:object
    normal ggdd
    set buftype=nofile
    setlocal noswapfile
    setlocal bufhidden=delete
	set filetype=diff
endfunction

function! SVNshowundercursor()
	let object = expand("<cword>")
	call SVNshow(object)
endfunction
