:syntax on
:set number
map <C-n> :NERDTreeToggle<CR>
highlight nonText ctermbg=NONE
set backspace=indent,eol,start

call plug#begin('~/.vim/plugins_by_vimplug')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-rails'
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme nord
set guifont=SourceCodePro\ 13
set shiftwidth=2
