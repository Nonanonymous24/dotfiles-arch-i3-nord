set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Commenting out lines
Plugin 'tpope/vim-commentary'

" IndentLine
Plugin 'Yggdroot/indentLine'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Preview colors in source code while editing
Plugin 'ap/vim-css-color'

" Dracula theme
" Plugin 'dracula/vim', { 'name': 'dracula' }

" Nord theme
Plugin 'arcticicestudio/nord-vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Lightline
"Plugin 'itchyny/lightline.vim'


" YouCompleteMe
" Plugin 'ycm-core/YouCompleteMe'

" Polyglot
Plugin 'sheerun/vim-polyglot'

" Typescript
Plugin 'leafgarland/typescript-vim'

" Vim Manpage 
Plugin 'vim-utils/vim-man'

" For C++
Plugin 'lyuts/vim-rtags'

" Markdown
Plugin 'tpope/vim-markdown'

" Brackets
Plugin 'jiangmiao/auto-pairs'

" i3config syntax highlighting
Plugin 'mboughaba/i3config.vim'

" Commenter
" Plugin 'preservim/nerdcommenter'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set incsearch

"colorscheme dracula
colorscheme nord
set background=dark

" Airline config
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Background transparency
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE ctermfg=NONE

" Lightline config
"set laststatus=2
"let g:lightline = {'colorscheme': 'nord'}

" i3config plugin
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Nerd commenter settings
let g:NERDCreateDefaultMappings = 1 " Create default mappings
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments


