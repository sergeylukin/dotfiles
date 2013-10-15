" Vim syntax file
" Language:	    MQL4
" Maintainer:   phaubos <x3nox@free.fr>
" Last Change:	2012 October 15
" Based on C indent by Bram Moolenaar

" Only load indent if no other is loaded
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal cindent

let b:undo_indent = "setl cin<"
