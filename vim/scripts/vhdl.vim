" Turn a component that is visually highlighted into an instantiation

function! MakeInst()
    '<,'>s/\(generic\|port\)[ \t]*(/\1 map(/ge
    '<,'>s/\(\([^ \t]*\)[ \t]*\):.*$/\1=> \2,/ge
    '<,'>s/\(component[ \t]\+\([^ \t]\+\)\)[ \t]\+is/\2_inst \1/ge
endfunction

" macros for arrows
imap <buffer> ,, <Space><=<Space>
imap <buffer> .. <Space>=><Space>
imap <buffer> ;sl std_logic;
imap <buffer> ;slv std_logic_vector(%%% downto %%%);<C-O>0;;
