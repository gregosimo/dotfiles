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

" Plug 'tmhedberg/SimpylFold'

" Plug 'vim-scripts/indentpython.vim'

" Plug 'Valloric/YouCompleteMe'

" Plug 'vim-syntastic/syntastic'

" Plug 'nvie/vim-flake8'

" Plug 'jnurmine/Zenburn'

" Plug 'kien/ctrlp.vim'

" Plug 'tpope/vim-fugitive'

" Plug 'vim-airline/vim-airline'

Plug 'SirVer/ultisnips'

Plug 'lervag/vimtex', { 'tag': 'v2.15'}

call plug#end()

" Enable folding (Added by Gregory Simonian on March 12, 2022)
set foldmethod=indent
set foldlevel=99

" Expand tabs into spaces. I like it better that way (Added by Gregory
" Simonian on February 21, 2026)
set tabstop=4
set softtabstop=4
set expandtab

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

" UltiSnips configuration. (Added by Gregory Simonian on November 11, 2025)
let g:UltiSnipsExpandOrJumpTrigger	= '<tab>'
let g:UltiSnipsJumpBackwardTrigger	= '<s-tab>'
let g:UltiSnipsSnippetDirectories 	= [$HOME.'/.config/nvim/MySnippets']
let g:UltiSnipsEditSplit="vertical"

" Turn on filetype info (Added by Gregory Simonian on January 14, 2026).
" filetype plugin indent on
" Actually, I think this is unnecessary because of vim-plug

" Set the minimum window width to be 80. This means that when a window is
" active, it will expand to be a minimum size of 80. When it is no longer
" active, it will shrink back down.
set winwidth=80
