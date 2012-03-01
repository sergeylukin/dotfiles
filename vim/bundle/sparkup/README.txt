Sparkup plugin for vim by rstacruz (http://github.com/rstacruz/sparkup), packaged to work with tpope's pathogen (http://www.vim.org/scripts/script.php?script_id=2332)

Install to .vim/ with git submodule add http://github.com/bingaman/vim-sparkup.git bundle/vim-sparkup

Assumes you're using pathogen already


Configuration
-------------

  g:sparkup (Default: 'sparkup') -
    Location of the sparkup executable. You shouldn't need to change this
    setting if you used the install option above.

  g:sparkupArgs (Default: '--no-last-newline') -
    Additional args passed to sparkup.

  g:sparkupExecuteMapping (Default: '<c-e>') -
    Mapping used to execute sparkup.

  g:sparkupNextMapping (Default: '<c-n>') -
    Mapping used to jump to the next empty tag/attribute.
