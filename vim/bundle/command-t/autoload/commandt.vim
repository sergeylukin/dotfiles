" Copyright 2010-present Greg Hurrell. All rights reserved.
" Licensed under the terms of the BSD 2-clause license.

if exists('g:command_t_autoloaded') || &cp
  finish
endif
let g:command_t_autoloaded = 1

"
" Deprecated functions (to be removed in 3.0)
"
let s:deprecated = {
  \    "commandt#CommandTFlush": "commandt#Flush",
  \    "commandt#CommandTLoad": "commandt#Load",
  \    "commandt#CommandTShowBufferFinder": "commandt#BufferFinder",
  \    "commandt#CommandTShowFileFinder": "commandt#FileFinder",
  \    "commandt#CommandTShowJumpFinder": "commandt#JumpFinder",
  \    "commandt#CommandTShowMRUFinder": "commandt#MRUFinder",
  \    "commandt#CommandTShowTagFinder": "commandt#TagFinder",
  \    "CommandTAcceptSelection": "commandt#private#AcceptSelection",
  \    "CommandTAcceptSelectionSplit": "commandt#private#AcceptSelectionSplit",
  \    "CommandTAcceptSelectionTab": "commandt#private#AcceptSelectionTab",
  \    "CommandTAcceptSelectionVSplit": "commandt#private#AcceptSelectionVSplit",
  \    "CommandTBackspace": "commandt#private#Backspace",
  \    "CommandTCancel": "commandt#private#Cancel",
  \    "CommandTClear": "commandt#private#Clear",
  \    "CommandTClearPrevWord": "commandt#private#ClearPrevWord",
  \    "CommandTCursorEnd": "commandt#private#CursorEnd",
  \    "CommandTCursorLeft": "commandt#private#CursorLeft",
  \    "CommandTCursorRight": "commandt#private#CursorRight",
  \    "CommandTCursorStart": "commandt#private#CursorStart",
  \    "CommandTDelete": "commandt#private#Delete",
  \    "CommandTHandleKey": "commandt#private#HandleKey",
  \    "CommandTListMatches": "commandt#private#ListMatches",
  \    "CommandTQuickfix": "commandt#private#Quickfix",
  \    "CommandTRefresh": "commandt#private#Refresh",
  \    "CommandTSelectNext": "commandt#private#SelectNext",
  \    "CommandTSelectPrev": "commandt#private#SelectPrev",
  \    "CommandTToggleFocus": "commandt#private#ToggleFocus",
  \  }

for [old, new] in items(s:deprecated)
  execute
    \  "function! " . old . "(...) abort \n" .
    \  "  call inputsave()\n" .
    \  "  echohl ErroMsg\n" .
    \  "  let l:message = \"" . old . "() is deprecated: use " . new . "() instead\"\n" .
    \  "  call input(l:message . ' [press ENTER to continue]')\n" .
    \  "  echohl NONE\n" .
    \  "  call inputrestore()\n" .
    \  "  echo\n" .
    \  "  if len(a:000) == 0\n" .
    \  "    call " . new . "()\n" .
    \  "  else\n" .
    \  "    call call(\"" . new . "\", a:000)\n" .
    \  "  endif\n" .
    \  "endfunction"
endfor

"
" Functions
"

function! s:RubyWarning() abort
  echohl WarningMsg
  echo 'command-t.vim requires Vim to be compiled with Ruby support'
  echo 'For more information type:  :help command-t'
  echohl none
endfunction

function! commandt#BufferFinder() abort
  if has('ruby')
    ruby $command_t.show_buffer_finder
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#FileFinder(arg) abort
  if has('ruby')
    ruby $command_t.show_file_finder
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#JumpFinder() abort
  if has('ruby')
    ruby $command_t.show_jump_finder
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#MRUFinder() abort
  if has('ruby')
    ruby $command_t.show_mru_finder
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#TagFinder() abort
  if has('ruby')
    ruby $command_t.show_tag_finder
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#Flush() abort
  if has('ruby')
    ruby $command_t.flush
  else
    call s:RubyWarning()
  endif
endfunction

function! commandt#Load() abort
  if !has('ruby')
    call s:RubyWarning()
  endif
endfunction

" For possible use in status lines.
function! commandt#ActiveFinder() abort
  if has('ruby')
    ruby ::VIM::command "return '#{$command_t.active_finder}'"
  else
    return ''
  endif
endfunction

" For possible use in status lines.
function! commandt#Path() abort
  if has('ruby')
    ruby ::VIM::command "return '#{($command_t.path || '').gsub(/'/, "''")}'"
  else
    return ''
  endif
endfunction

" For possible use in status lines.
function! commandt#CheckBuffer(buffer_number) abort
  if has('ruby')
    execute 'ruby $command_t.return_is_own_buffer' a:buffer_number
  else
    return 0
  endif
endfunction

if !has('ruby')
  finish
endif

" note that we only start tracking buffers from first (autoloaded) use of Command-T
augroup CommandTMRUBuffer
  autocmd!
  autocmd BufEnter * ruby CommandT::MRU.touch
  autocmd BufDelete * ruby CommandT::MRU.delete
augroup END

ruby << EOF
  # require Ruby files
  begin
    require 'command-t'

    # Make sure we're running with the same version of Ruby that Command-T was
    # compiled with.
    patchlevel = defined?(RUBY_PATCHLEVEL) ? RUBY_PATCHLEVEL : nil
    if CommandT::Metadata::UNKNOWN == true || (
      CommandT::Metadata::EXPECTED_RUBY_VERSION == RUBY_VERSION &&
      CommandT::Metadata::EXPECTED_RUBY_PATCHLEVEL == patchlevel
    )
      require 'command-t/ext' # eager load, to catch compilation problems early
      $command_t = CommandT::Controller.new
    else
      $command_t = CommandT::Stub.new
    end
  rescue LoadError
    load_path_modified = false
    ::VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
      lib = "#{path}/ruby"
      if !$LOAD_PATH.include?(lib) && File.exist?(lib)
        $LOAD_PATH << lib
        load_path_modified = true
      end
    end
    retry if load_path_modified

    $command_t = CommandT::Stub.new
  end
EOF
