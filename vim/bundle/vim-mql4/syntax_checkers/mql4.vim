" File:         mql4.vim
" Description:  MQL4 syntax checking plugin for syntastic.vim
" Maintener:    phaubos <x3nox@free.fr>
" Last Change:  2012 October 31
"
" Metalang compiler needs the full path for stdlib.mqh, stderror.mqh, and
" WinUser32.mqh files. Add the full path to your .vimrc with the variable 
" g:syntastic_mql4_compiler_path. For example:
"
"   let g:syntastic_mql4_compiler_path = 'C:\"Program Files (x86)\MT4\"'
"
" If the name of your Metatrader 4 compiler differs from metalang, use the
" variable g:syntastic_mql4_compiler_executable. For example:
"
"   let g:syntastic_mql4_compiler_executable = mymetalang

if exists("loaded_mql4_syntax_checker")
    finish
endif
let loaded_mql4_syntax_checker = 1

if !exists("g:syntastic_mql4_compiler_path")
    finish
endif

if !exists("g:syntastic_mql4_compiler_executable")
    let g:syntastic_mql4_compiler_executable = 'metalang'
endif

function! SyntaxCheckers_mql4_GetLocList()
    let makeprg = g:syntastic_mql4_compiler_path . g:syntastic_mql4_compiler_executable . ' ' . shellescape(expand('%'))

    let errorformat = '%\\d%\\+;%\\d%\\+;%f;%l:%c;%m'

    return SyntasticMake({ 'makeprg': makeprg,
                         \ 'errorformat': errorformat })
endfunction
