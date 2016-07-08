set nocompatible
filetype off

"--- Plug plugins
call plug#begin('~/.vim/plugged')


Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'                
Plug 'neovimhaskell/haskell-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-templates'
Plug 'terryma/vim-multiple-cursors' 
"Plug 'lervag/vimtex'
"Plug 'itchyny/vim-haskell-indent'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'

" Plug 'tpope/vim-surround'
" Plug 'Blackrush/vim-gocode'


call plug#end()


" Enable plugins
filetype plugin indent on

"--- Plugin Configurations
" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Configure EasyMotion
" Use \w to jump to word
" Use \t to search character
let g:EasyMotion_leader_key = '<Leader>'

" Configure Ctrl+P to look for either git root or use current directory
" use ra if you want to look for git root
" use c if you only want directory of file
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = {
    \'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$',
    \'file': '\v\.(hi|db|dyn_hi|dyn_o|o|aux|log)$'}

" Airline symbols
let g:airline_powerline_fonts = 1

" EasyAlign
" Use ga to start align then type char
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Incrementally display search results
set incsearch
" Highlight search results
set hlsearch
" When searching try to be smart about cases
set smartcase
" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search
" Hide last search pattern with enter
nnoremap <CR> :noh<CR><CR>

" Turn magic on for regular expressions
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Autodetect certain filetypes
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,Bufread *.ys set filetype=asm
au BufRead,BufNewFile *.txt setlocal textwidth=79
au BufRead,BufNewFile *.tex setlocal textwidth=79
au BufNewFile,BufRead *.bit setlocal filetype=php

" Syntax highlighting
syntax on

" Set terminal colors
set t_Co=256
set t_ut=

" Sensible backspace
set backspace=2

" Make Vim use the X11 clipboard register
"set clipboard=unnamedplus
"
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Open new splits to right and bottom
set splitbelow
set splitright

" Configure indenting
set autoindent
"set smartindent
"set cindent

" Configure folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Configure automatic text width (only if textwidth is set)
set fo+=t

" Configure tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" haskell tabs
autocmd FileType haskell set tabstop=4
autocmd FileType haskell set shiftwidth=4
autocmd FileType haskell set softtabstop=4
autocmd FileType haskell retab

" Extra command maps
cmap w!! w !sudo tee > /dev/null %

" Enable syntax highlighting, relative numberings, and mouse selection
syntax enable
set relativenumber
set number
set mouse=a

" Set backgorund and theme
" https://github.com/tomasr/molokai
set background=dark
"colorscheme jellybeans
colorscheme wombat256mod

" Configure the status bar (requires patched font)
" https://github.com/scotu/ubuntu-mono-powerline
set laststatus=2
" let g:Powerline_symbols = 'fancy'

" Custom commands

" Set text wrapping to 80 characters and wrap
" Wrap with gq
function! SetWrap(wrapColumns)
  set tw=80
  set formatoptions+=t
endfunction

" Trim unwanted whitespace
command! TrimWhitespace execute ':%s/\s\+$//gc'

" Compile and display latex using evince
command! Latex execute "silent !pdflatex % > /dev/null && evince %:r.pdf > /dev/null 2>&1 &" | redraw!
map <F2> :Latex<CR>

" Toggle spell checking
" z= to show spelling suggestions
map <F3> :setlocal spell! spelllang=en_us<CR>

" Toggle paste mode
map <F4> :setlocal paste!<CR>

" Switching absolute and relative line numbers
map <F5> :call NumberToggle()<cr>

" Fast c/cpp to h/hpp switching
map <F6> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cpp,<CR>

" Live preview of markdown files
map gm :call LivedownPreview()<CR>

" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.db

" For finger fumbling (thanks rperce)
command! W w
command! Wq wq
command! WQ wq
command! Q q
command! Wa wa
command! WA wa

" Trim unwanted whitespace
command! TrimWhitespace execute ':%s/\s\+$//gc'

" Toggling of relative/absolute line numbers
function! NumberToggle() "{{{
	if exists('+relativenumber')
		:exec "setl rnu!"
	else
		setl nu! 
	endif
endf "}}}

" Enable persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Auto reload vimrc
"augroup reload_vimrc
"    autocmd!
"    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END
