" Pathogen
execute pathogen#infect()

filetype plugin on
set incsearch
syntax on
set t_Co=256
set autoindent
set cindent

imap ii <Esc> 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'derekwyatt/vim-scala'

syntax enable
set number
set mouse=a
set background=dark
" colorscheme molokai
