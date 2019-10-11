" #Plugins
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'VundleVim/Vundle.vim'

" Liniting and Code Formatting
Plug 'w0rp/ale'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}

" Git
Plug 'tpope/vim-fugitive'

" Syntax Highlightning
Plug 'sheerun/vim-polyglot'
Plug 'Quramy/vim-js-pretty-template'

" Appearance and themes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

" Autocompletion & Intellisense
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install()}}

" Fuzzy Search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'lfv89/vim-interestingwords'
Plug 'scrooloose/nerdcommenter'


call plug#end()
