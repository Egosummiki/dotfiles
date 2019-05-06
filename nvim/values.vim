let mapleader = ","

set encoding=UTF-8
set number relativenumber
set splitbelow
set splitright

" Sync clipboard with system
set clipboard=unnamed

" 256 colored themes
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

" Spaces not tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Bind uppercase commands
command WQ wq
command Wq wq
command W w
command Q q

" Project specific .nvimrc
set exrc
set secure

" Python configuration
" let g:python_host_prog = '/home/ego/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/home/ego/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
