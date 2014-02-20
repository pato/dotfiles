set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'                
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'mattn/emmet-vim'                
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors' 

" Configure EasyMotion
" Use \w to jump to word
" Use \t to search character
let g:EasyMotion_leader_key = '<Leader>'

" Enable filetype indent detection
filetype plugin indent on

" Incrementally display search results
set incsearch

" Syntax highlighting
syntax on

" Set terminal colors
set t_Co=256
set t_ut=

" Open new splits to right and bottom
set splitbelow
set splitright

" Configure indenting
set autoindent
set cindent

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Extra keymaps 
imap ii <Esc> 

" Configure Syntastic
let g:syntastic_c_checkers=['gcc']

" Enable syntax highlighting, numberings, and mouse selection
syntax enable
set number
set mouse=a

" Set backgorund and theme
set background=dark
colorscheme molokai

" Configure the status bar (requires patched font)
" https://github.com/scotu/ubuntu-mono-powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Custom commands
" Compile and display latex using evince
command Latex execute "silent !pdflatex % > /dev/null && evince %:r.pdf > /dev/null 2>&1 &" | redraw!
map <F2> :Latex<CR>

" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
