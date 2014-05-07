" Vim syntax file

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif
scriptencoding utf-8

" Commit line
syn match gitshowCommit		"^commit" contained
syn match gitshowCommitHash	"[0-9a-fA-F]\{40\}" contained
syn match gitshowCommitBranches	"(.*)" contained
syn region gitshowCommitRegion oneline start="^commit" end="$" contains=gitshowCommit,gitshowCommitHash,gitshowCommitBranches keepend

" Author and Date lines
syn match gitshowAuthor		"^Author:"
syn match gitshowDate		"^Date:"

syn match gitshowDiffTitle	"^diff .*"

syn match gitshowIndex		"^index .*"
syn match gitshowNewFile	"^new file .*"
syn match gitshowDeletedFile	"^deleted file .*"

syn match gitshowLine		"^@@.*@@" contained
syn region gitshowLineRegion oneline start="^@@" end="$" contains=gitshowLine keepend

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

hi gitshowComment		guifg=#000000 gui=bold guibg=#fffc38

hi def link gitshowCommit		Keyword
hi def link gitshowCommitHash		Constant
hi def link gitshowCommitBranches	String
hi def link gitshowAuthor		Keyword
hi def link gitshowDate			Keyword

hi def link gitshowDiffTitle		gitshowTitleWhite

hi def link gitshowIndex		gitshowTitleWhite
hi def link gitshowNewFile		gitshowTitleGreen
hi def link gitshowDeletedFile		gitshowTitleRed
hi def link gitshowFileA		gitshowTitleRed
hi def link gitshowFileB		gitshowTitleGreen

hi def link gitshowLine			gitshowMagentaBold
hi def link gitshowLineRegion		String

hi def link gitshowRemoved		gitshowRedNormal
hi def link gitshowAdded		gitshowGreenNormal

let b:current_syntax = "gitshow"

" vim: ts=8 sw=2
