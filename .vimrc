set nocompatible
filetype off

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

" Configure EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

filetype plugin indent on
set incsearch
syntax on
set t_Co=256
set t_ut=
set autoindent
set cindent

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

imap ii <Esc> 


syntax enable
set number
set mouse=a
set background=dark
colorscheme molokai


