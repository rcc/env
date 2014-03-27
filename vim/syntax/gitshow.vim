" Vim syntax file

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
scriptencoding utf-8

syn match gitshowCommit		"^commit [0-9a-fA-F]*"
syn match gitshowAuthor		"^Author: .*"
syn match gitshowDate		"^Date: .*"

syn match gitshowDiffTitle	"^diff .*"

syn match gitshowIndex		"^index .*"
syn match gitshowNewFile	"^new file .*"
syn match gitshowDeletedFile	"^deleted file .*"

syn match gitshowLine		"^@@.*@@$"

syn match gitshowRemoved	"^-.*"
syn match gitshowAdded		"^+.*"

syn match gitshowFileA		"^--- .*"
syn match gitshowFileB		"^+++ .*"

syn match gitshowFileB		"^+++ .*"

syn match gitshowComment	"^> .*"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi gitshowYellowNormal		guifg=#fcfc7a gui=none
hi gitshowTitleWhite		guifg=#f6f3e8 gui=bold guibg=#343434
hi gitshowTitleGreen		guifg=#cae682 gui=bold guibg=#343434
hi gitshowTitleRed		guifg=#e5786d gui=bold guibg=#343434
hi gitshowMagentaBold		guifg=#f793fc gui=bold
hi gitshowGreenNormal		guifg=#cae682 gui=none
hi gitshowRedNormal		guifg=#e5786d gui=none

hi gitshowComment		guifg=#93fffc gui=bold guibg=#343434

hi def link gitshowCommit	gitshowYellowNormal
hi def link gitshowAuthor	Normal
hi def link gitshowDate		Normal

hi def link gitshowDiffTitle	gitshowTitleWhite

hi def link gitshowIndex	gitshowTitleWhite
hi def link gitshowNewFile	gitshowTitleGreen
hi def link gitshowDeletedFile	gitshowTitleRed
hi def link gitshowFileA	gitshowTitleRed
hi def link gitshowFileB	gitshowTitleGreen

hi def link gitshowLine		gitshowMagentaBold

hi def link gitshowRemoved	gitshowRedNormal
hi def link gitshowAdded	gitshowGreenNormal

let b:current_syntax = "gitshow"

" vim: ts=8 sw=2
