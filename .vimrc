syntax on
filetype plugin indent on
let mapleader = "-"
set cursorline
set expandtab
set hidden
set ignorecase
set incsearch
set noswapfile
set number relativenumber
set ruler
set smartcase
set softtabstop=4
set shiftwidth=4
set tabstop=8
try
  colorscheme base16-materia
  catch
endtry

hi CursorLine ctermbg=16
hi CursorLineNr ctermfg=black ctermbg=green
hi LineNr ctermfg=darkgrey ctermbg=16
hi StatusLine ctermfg=black ctermbg=green cterm=NONE
hi StatusLineNc ctermfg=green ctermbg=darkgrey cterm=NONE
hi VertSplit ctermfg=green ctermbg=green
hi Visual ctermbg=247
