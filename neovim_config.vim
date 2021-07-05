"DOTFILES
"This files goes to $XDG_HOME/

call plug#begin()

"SimpylFold allows Python folding to go along more smoothly.
Plug 'junegunn/vim-easy-align'

"indentpython makes function signatures work correctly
Plug 'vim-scripts/indentpython.vim'

"VimCompletesMe does pretty good autocomplete
Plug 'ackyshake/VimCompletesMe'

"Syntastic for syntax checking in Python
Plug 'nvie/vim-flake8'

Plug 'jnurmine/Zenburn'

Plug 'tpope/vim-fugitive'

call plug#end()
filetype plugin indent on

" Enable folding
set foldmethod=indent
set foldlevel=99

" Zenburn color scheme
colorscheme zenburn
