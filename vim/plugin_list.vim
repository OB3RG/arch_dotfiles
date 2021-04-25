" #Plugins
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Language stuff
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plugin for typescript
Plug 'quramy/tsuquyomi'


" Elixir
"Plug 'elixir-editors/vim-elixir'
"Plug 'mhinz/vim-mix-format'

" Extensions
Plug 'tpope/vim-fugitive'

" Modifiers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Appearance and themes
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

" Autocompletion & Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
" CocInstall coc-json coc-tsserver
" CocInstall coc-elixir
" CocInstall coc-json

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'lilydjwg/colorizer'


call plug#end()
