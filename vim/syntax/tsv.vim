" Vim syntax file
" line format:
" Part_Number    Quantity    Price    Description    Mfg.    Mfg.#    Supplier
" Supplier#    # comments

syntax clear
syntax match tsvPartNum "^[^\t]\+" nextgroup=tsvQuantity skipwhite
syntax match tsvQuantity "\s[^\t]\+" nextgroup=tsvPrice skipwhite contained
syntax match tsvPrice "\s[^\t]\+" nextgroup=tsvDescription skipwhite contained 
syntax match tsvDescription "\s[^\t]\+" nextgroup=tsvMfg skipwhite contained 
syntax match tsvMfg "\s[^\t]\+" nextgroup=tsvMfgNum skipwhite contained 
syntax match tsvMfgNum "\s[^\t]\+" nextgroup=tsvSupp skipwhite contained 
syntax match tsvSupp "\s[^\t]\+" nextgroup=tsvSuppNum skipwhite contained 
syntax match tsvSuppNum "\s[^\t]\+" contained 
syntax match tsvCmnt "^\s*#.*"

if version >= 508 || !exists("did_tsv_syn_inits")
  if version < 508
    let did_tsv_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tsvPartNum             Statement
  HiLink tsvQuantity            Type
  HiLink tsvPrice               Special
  HiLink tsvDescription         String
  HiLink tsvMfg                 PreProc
  HiLink tsvMfgNum              NonText
  HiLink tsvSupp                PreProc
  HiLink tsvSuppNum             NonText
  HiLink tsvCmnt		        Comment

  delcommand HiLink
endif

let b:current_syntax = "tsv"

