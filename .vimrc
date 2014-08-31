set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Bundle 'gmarik/Vundle.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'                
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'mattn/emmet-vim'                
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors' 
Bundle 'Blackrush/vim-gocode'
Bundle 'LaTeX-Box-Team/LaTeX-Box'

call vundle#end()

" Enable plugins
filetype plugin indent on

" Configure EasyMotion
" Use \w to jump to word
" Use \t to search character
let g:EasyMotion_leader_key = '<Leader>'

" Disable asking about ycm_extra_conf files
let g:ycm_confirm_extra_conf = 0


" Incrementally display search results
set incsearch

" Autodetect certain filetypes
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,Bufread *.ys set filetype=asm
au BufRead,BufNewFile *.txt setlocal textwidth=80

" Syntax highlighting
syntax on

" Set terminal colors
set t_Co=256
set t_ut=

" Make Vim use the X11 clipboard register
"set clipboard=unnamedplus

" Open new splits to right and bottom
set splitbelow
set splitright

" Configure indenting
set autoindent
set cindent

" Configure automatic text width (only if textwidth is set)
set fo+=t
" set textwidth=80

" Configure tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Extra keymaps 
imap ii <Esc> 

" Extra command maps
cmap w!! w !sudo tee > /dev/null %

" Configure Syntastic
let g:syntastic_c_checkers=['gcc']

" Enable syntax highlighting, numberings, and mouse selection
syntax enable
set number
" set mouse=a

" Set backgorund and theme
" https://github.com/tomasr/molokai
set background=dark
colorscheme jellybeans

" Configure the status bar (requires patched font)
" https://github.com/scotu/ubuntu-mono-powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Custom commands
" Compile and display latex using evince
command Latex execute "silent !pdflatex % > /dev/null && evince %:r.pdf > /dev/null 2>&1 &" | redraw!
map <F2> :Latex<CR>

" Set text wrapping to 80 characters and wrap


function! SetWrap(wrapColumns)
  set tw=80
  set formatoptions+=t
endfunction

" Trim unwanted whitespace
command TrimWhitespace execute ':%s/\s\+$//gc'

" Enable spell checking
" z= to show spelling suggestions
map <F3> :setlocal spell spelllang=en_us<CR>

" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
