" Vim configuration

set nocompatible                  " Must come first because it changes other options.
set nobackup                      " Don't make a backup before overwriting a file.

set t_Co=256                      " To enable 256 colors

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on filetype detection.

set expandtab                     " Expand tab to spaces
set shiftwidth=2                  " Auto indent by 2 spaces
set softtabstop=2                 " Set Tab to 2 spaces too

set title                         " Set terminal's title.
set background=dark

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you are in.

set ruler                         " Show cursor position.
set number                        " Show line numbers.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete menus as in bash.

set ignorecase                    " Case insensitive searching.
set smartcase                     " But case-sensitive if explession contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set autochdir                     " Change the current working directory on file opening.
set nomodeline                    " Security issue, turn in off

" Dvorak hjkl remap.
noremap d h
noremap h j
noremap t k
noremap n l

" Dvorak delete key remap
noremap e d
noremap E D

" Dvorak search (next, previous) remap
noremap l n
noremap L N

" Insert datetime
nnoremap <F5> i=======================<Enter><C-R>=strftime('%d.%m.%Y %H:%M %A')<CR><Enter>=======================<Esc>o<Esc>

" Remove whitespaces after last printable character
nnoremap <F6> ::%s/\s\+$//<Enter>

" Binary editing, source http://vim.wikia.com/wiki/Improved_hex_editing
command -bar Hexmode call ToggleHex()
nnoremap <C-H> :Hexmode<CR>

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    % ! xxd -g 1 -c 16
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    % ! xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

colorscheme slate

" Set StatusLine and overwrite the color from colorscheme:
" set statusline+=%F                " See full path of the current file
set laststatus=2                  " Displaying status line always
highlight StatusLine ctermbg=black ctermfg=red
