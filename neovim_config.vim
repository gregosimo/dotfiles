"DOTFILES
"This file goes to $XDG_CONFIG_HOME/neovim/init.vim
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'tmhedberg/SimpylFold'

Plug 'vim-scripts/indentpython.vim'

Plug 'Valloric/YouCompleteMe'

Plug 'vim-syntastic/syntastic'

Plug 'nvie/vim-flake8'

Plug 'jnurmine/Zenburn'

Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'

call plug#end()

" Enable folding (Added by Gregory Simonian on March 12, 2022)
set foldmethod=indent
set foldlevel=99

" Set PEP8 indentation (Added by Gregory Simonian on March 12, 2022)

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

" Flagging unnecessary whitespace (Added by Gregory Simonian on March 12, 2022)
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set UTF-8 (Added by Gregory Simonian on March 12, 2022) 
set encoding=utf-8

" Ensure YouCompleteMe Autocomplete window goes away once it's not needed 
" (Added by Gregory Simonian on March 12, 2022)
"
let g:ycm_autoclose_preview_window_after_completion=1

" Make syntax highlighting pretty.
let python_highlight_all=1
syntax on

" Enable line numbers (Added by Gregory Simonian on March 12, 2022)
set nu

" Access the system clipboard (Added by Gregory Simonian on March 12, 2022)
set clipboard=unnamed

" Enable ctags (Added by Gregory Simonian on June 21, 2022).
set tags=tags
