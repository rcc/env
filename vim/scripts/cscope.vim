function! ConfigCScope()
	if has("cscope")
		set nocsverb
		set cscopetag
		set csto=0

		if filereadable("cscope.out")
			cscope add cscope.out
		elseif filereadable($CSCOPE_DB)
			cscope add "$CSCOPE_DB" "$CSCOPE_DB_PREPATH"
		endif

		set csverb

		"set cscopequickfix=s-,c-,d-,i-,t-,e-

		nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
		nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
		nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
		nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
		"nmap <C-\>s :tab split<CR>:cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
		"nmap <C-\>g :tab split<CR>:cs find g <C-R>=expand("<cword>")<CR><CR>
		"nmap <C-\>c :tab split<CR>:cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
		"nmap <C-\>t :tab split<CR>:cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
		"nmap <C-\>e :tab split<CR>:cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
		"nmap <C-\>f :tab split<CR>:cs find f <C-R>=expand("<cfile>")<CR><CR>
		"nmap <C-\>i :tab split<CR>:cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
		"nmap <C-\>d :tab split<CR>:cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
	endif
endfunction
