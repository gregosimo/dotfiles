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

Plug 'lervag/vimtex'

Plug 'neovim/nvim-lspconfig'

Plug 'folke/tokyonight.nvim'

call plug#end()
" NOTE: plug#end() automatically executes the following:
" filetype plugin indent on
" syntax enable

" Enable folding (Added by Gregory Simonian on March 12, 2022)
set foldmethod=marker
set foldlevel=99

" Expand tabs into spaces. I like it better that way (Added by Gregory
" Simonian on February 21, 2026)
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Set PEP8 indentation (Added by Gregory Simonian on March 12, 2022)

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
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

" VimTeX Configurations
" Select the viewer.
let g:vimtex_view_method = 'zathura'

" Select the LaTeX compiler.
let g:vimtex_compiler_method = 'latexmk'

" Select the local leader
" let maplocalleader = '\'

" Disable insert mode mapping.
" This is recommended since UltiSnips can do expansions.
" However, there is a way to integrate Ultisnips with vimTex under
" help:vimtex-imaps.
let g:vimtex_imaps_enabled = 0

" This is a very specific mapping for job hunting, but it is helpful for
" putting excerpts from job descriptions into a LaTeX file.
autocmd BufEnter main.tex inoremap jd % JOB DESCRIPTION: <C-R>+<CR>

" Some commands need lua commands, so load a lua file.
lua require('init')

" Set a new color scheme.
colorscheme tokyonight

" Quickly cycle between the unnamed register and system clipboard.
" Good for if you forgot to press "+ when cutting or copying.
nnoremap <Leader>c :let @z=@" \| let @"=@+ \| let @+=@z<CR>

" Don't need to put this, but just want to set it explicitly to add context.
" Right now I am doing spell-checking through harper. As a result, it does not
" need to be done through vim, so I am explicitly turning it off.
set nospell

" I am setting up a dictionary to look up words (NOTE: Need to install a
" wordlist in order for it to work).
set dictionary=/usr/share/dict/american-english

" I often want to copy-paste my resume into an LLM to get feedback. I will try
" to automate this by making a vim command that can locate the start and end
" of the text block and yank it to the clipboard register.
command ResumePaste /\\makecvtitle$/,/\\end{document}/-1y +

" Add some abbrevs for  commonly misspelled words
" Added by GRegory Simonian on June 22, 2026
abbrev teh the

" Add some audit formatting commands
command StackEdit %s/\\(\|\\)/\$/ge | %s/\\\[\|\\]/\$\$/ge
