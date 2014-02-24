function! Gitalldiff()
	tabnew
	exe "read ! git diff"
	normal ggdd
	set buftype=nofile
	setlocal noswapfile
	setlocal bufhidden=delete
	set filetype=diff
endfunction

function! Gitstatus()
	tabnew
	exe "read ! git status"
	normal ggdd
	set buftype=nofile
	setlocal noswapfile
	setlocal bufhidden=delete
endfunction

function! Gitfilediff(filename)
	new
	exe "read ! git diff " . a:filename
	normal ggdd
	set buftype=nofile
	setlocal noswapfile
	setlocal bufhidden=delete
	set filetype=diff
endfunction

function! Gitcurrentfilediff()
	let fn = expand("%")
	call Gitfilediff(fn)
endfunction

function! Gitcursorfilediff()
	let fn = expand("<cfile>")
	call Gitfilediff(fn)
endfunction

function! Gitlog()
	tabnew
	exe "read ! git log --decorate -n 100"
	normal ggdd
	set buftype=nofile
	setlocal noswapfile
	setlocal bufhidden=delete
endfunction

function! Gitshow(object)
	new
	exe "read ! git show " . a:object
	normal ggdd
	set buftype=nofile
	setlocal noswapfile
	setlocal bufhidden=delete
	set filetype=diff
endfunction

function! Gitshowundercursor()
	let object = expand("<cword>")
	call Gitshow(object)
endfunction

function! Gitblame()
	let fn = expand("%")
	if &modified
		echo "Current Buffer Is Modified!"
		return
	endif
	" Set options for main source window
	setlocal nowrap
	setlocal scrollbind
	setlocal cursorbind
	setlocal nofoldenable
	" Create new vertical window to left
	vertical topleft new
	vertical resize 40
	" Read in git blame output for file
	exe "read ! git blame " . fn
	" Goto top and delete first line which is blank
	normal ggdd
	" Set options for blame window
	setlocal nowrap
	setlocal scrollbind
	setlocal cursorbind
	setlocal nofoldenable
	" Set options for blame buffer
	set buftype=nowrite
	setlocal noswapfile
	setlocal bufhidden=delete
endfunction
