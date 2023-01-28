" GENERAL  ---------------------------------------------------------------- {{{

set tabstop=4 " tab to four spaces
set showcmd " show command
set number relativenumber "relative line numbering

" highlight search results, ingore case
set incsearch
set hlsearch
set ignorecase
set smartcase

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" use 'kj' as escape
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <C-C>

" disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" }}}
