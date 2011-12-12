function! CCommentHeader(title)
	let endcol = 78
	let starcount = (endcol / 2) - (strlen(a:title) / 2) - 3
	if starcount < 0
		let starcount = 0
	endif
	let line = "/*"
	let ii = 0
	while ii < starcount
		let line = line . "*"
		let ii = ii + 1
	endwhile
	let line = line . " " . a:title . " "
	while strlen(line) < (endcol - 2)
		let line = line . "*"
	endwhile
	let line = line . "*/"
	let @@ = line
	normal p
endfunction

function! MakeCCommentHeader()
	normal 0d$
	let line = @@
	call CCommentHeader(line)
endfunction
