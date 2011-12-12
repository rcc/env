function! Bf(regname,fieldname,size,shift)

    " handle the tab style
    let num_col = 80 - (&shiftwidth * 2)
    if &expandtab
        let num_tabs = num_col
        let tab_char = " "
        let effective_shiftwidth = 1
    else
        let num_tabs = num_col / &shiftwidth
        let tab_char = "\t"
        let effective_shiftwidth = &shiftwidth
    endif

    " trim the field name
    let sreg = split(a:regname, "_")
    let sfield = split(a:fieldname, "_")
    let ii = 0
    while (get(sreg, ii, "") != "") && (get(sfield, ii, "") != "") && (sreg[ii] == sfield[ii])
        let ii = ii + 1
    endwhile
    let field = join(sfield[ii : -1], "_")
    if field != ""
        let field = "_" . field
    endif

    let shiftdef = "#define " . a:regname . field . "_SHIFT"
    let shifttabs = strlen(shiftdef) / effective_shiftwidth
    let sizedef = "#define " . a:regname . field . "_SIZE"
    let sizetabs = strlen(sizedef) / effective_shiftwidth

    " output the comment line
    let line = "/* " . a:regname . ":" . a:fieldname
    while strlen(line) < (num_col / 2)
        let line = line . " "
    endwhile
    let line = line . a:regname . field
    while strlen(line) < num_col
        let line = line . " "
    endwhile
    let line = line . "*/"
    let @@ = line
    normal p

    " output the size line
    let line = sizedef
    let ii = 0
    while ii < (num_tabs - sizetabs)
        let line = line . tab_char
        let ii = ii + 1
    endwhile
    let line = line . a:size . "\n"
    let @@ = line
    normal p

    " output the shift line
    let line = shiftdef
    let ii = 0
    while ii < (num_tabs - shifttabs)
        let line = line . tab_char
        let ii = ii + 1
    endwhile
    let line = line . a:shift . "\n"
    let @@ = line
    normal p

endfunction

function! MakeBF()
    normal 0d$
    let line = @@
    let cmd = system("awk 'BEGIN {FS=\"[ \t]+\";} {print \"call Bf(\\\"\" $1 \"\\\",\\\"\" $2 \"\\\",\" $3 \",\" $4 \")\";}'", line)
    execute cmd
endfunction

function! BfColon(regname,fieldname,size,shift)

    " handle the tab style
    let num_col = 80 - (((7 / &shiftwidth) + 1) * &shiftwidth)
    if &expandtab
        let num_tabs = num_col
        let tab_char = " "
        let effective_shiftwidth = 1
    else
        let num_tabs = num_col / &shiftwidth
        let tab_char = "\t"
        let effective_shiftwidth = &shiftwidth
    endif

    " trim the field name
    let sreg = split(a:regname, "_")
    let sfield = split(a:fieldname, "_")
    let ii = 0
    while (get(sreg, ii, "") != "") && (get(sfield, ii, "") != "") && (sreg[ii] == sfield[ii])
        let ii = ii + 1
    endwhile
    let field = join(sfield[ii : -1], "_")
    if field != ""
        let field = "_" . field
    endif

    let bfdef = "#define " . a:regname . field
    let bftabs = strlen(bfdef) / effective_shiftwidth

    let line = bfdef
    let ii = 0
    while ii < (num_tabs - bftabs)
        let line = line . tab_char
        let ii = ii + 1
    endwhile
    let line = line . a:size . " : " . a:shift
    let @@ = line
    normal p

endfunction

function! MakeBFColon()
    normal 0d$
    let line = @@
    let cmd = system("awk 'BEGIN {FS=\"[ \t]+\";} {print \"call BfColon(\\\"\" $1 \"\\\",\\\"\" $2 \"\\\",\" $3 \",\" $4 \")\";}'", line)
    execute cmd
endfunction
