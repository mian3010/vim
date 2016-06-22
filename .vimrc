" Enable pathogen.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enable specific settings for specific files for both standard and
" indentation 
filetype plugin indent on
" Enable syntax highlighting
syntax on
" Disable VIM compatibility mode
set nocp
" Number of spaces that a <Tab> in the file counts for.
set tabstop=2
" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=2
" Use the appropriate number of spaces to insert a <Tab>. 
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on. To insert a real tab when
" 'expandtab' is on, use CTRL-V <Tab>.
set expandtab
" When on, a <Tab> in front of a line inserts blanks 
" according to 'shiftwidth'. 'tabstop' is used in other
" places. A <BS> will delete a 'shiftwidth' worth of space
" at the start of the line.
set smarttab
" Show (partial) command in status line. 
set showcmd
" Show line numbers.
set number
" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with
" 'matchtime'.
set showmatch
" When there is a previous search pattern, highlight all 
" its matches.
set hlsearch
" While typing a search command, show immediately where the 
" so far typed pattern matches.
set incsearch
" Ignore case in search patterns. 
set ignorecase
" Override the 'ignorecase' option if the search pattern 
" contains upper case characters.
set smartcase
" Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.
set backspace=2
" Copy indent from current line when starting a new line 
" (typing <CR> in Insert mode or when using the "o" or "O"
" command).
set autoindent
" Do not wrap code-lines automatically
set textwidth=80
set linebreak
set wrapmargin=0
" Set vim tmp-files to be stored in a common location
set directory=~/.vimtmp
" Show when the line wraps
let &showbreak='  ^ '
set cpo+=n
" Setup information at the bottom of VIM
set viminfo='20,<1000,s10,h
" Show tabs and spaces at end of lines.
set list listchars=tab:\ \ ,trail:·

let g:syntastic_php_phpcs_args = ' --standard=Drupal --extensions=php,module,inc,install,test,profile,theme'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

let g:vdebug_options = {}
let g:vdebug_options['path_maps'] = {
  \"/dr_vagrant/checkouts/loc1.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox/checkouts/loc1.drupal.dr.dk",
  \"/dr_vagrant/checkouts/loc2.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox/checkouts/loc2.drupal.dr.dk",
  \"/dr_vagrant/checkouts/loc1.box2.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox_2/checkouts/loc1.box2.drupal.dr.dk",
  \"/dr_vagrant/checkouts/loc2.box2.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox_2/checkouts/loc2.box2.drupal.dr.dk",
  \"/dr_vagrant/checkouts/loc1.box3.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox_3/checkouts/loc1.box3.drupal.dr.dk",
  \"/dr_vagrant/checkouts/loc2.box3.drupal.dr.dk": "/home/michael/git/drupal-vagrantbox_3/checkouts/loc2.box3.drupal.dr.dk",
  \"/var/www/ereolen.dk": "/home/michael/git/ereolen.dk",
  \"/var/www/anywear": "/home/michael/git/anywear"
\}
