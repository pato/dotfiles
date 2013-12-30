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

" Configure EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

filetype plugin indent on
set incsearch
syntax on
set t_Co=256
set t_ut=
set autoindent
set cindent

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Extra keymaps 
imap ii <Esc> 

syntax enable
set number
set mouse=a

" Set backgorund and theme
set background=dark
colorscheme molokai

" Configure the status bar (requires patched font)
set laststatus=2
let g:Powerline_symbols = 'fancy'
