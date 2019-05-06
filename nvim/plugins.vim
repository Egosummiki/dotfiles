" ----------- NeoBundle Plugins ------------

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'fatih/vim-go' 
NeoBundle 'ericcurtin/CurtineIncSw.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rstacruz/vim-fastunite'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'kaicataldo/material.vim'
NeoBundle 'xuhdev/vim-latex-live-preview'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sakhnik/nvim-gdb'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
" NeoBundle 'joshdick/onedark.vim'
NeoBundle 'kristijanhusak/vim-hybrid-material'
NeoBundle 'mboughaba/i3config.vim'
NeoBundle 'godlygeek/tabular'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" ------------------------------------------
