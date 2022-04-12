" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')
"Find sintax errors
    Plug 'maxmellon/vim-jsx-pretty'
"COC 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Arquivos
    Plug 'preservim/nerdtree'
"Rainbow bracket
    Plug 'frazrepo/vim-rainbow'
"Lightline
    Plug 'itchyny/lightline.vim'
"Autocomplete
    Plug 'davidhalter/jedi-vim'
"Automaticly close bracket
    Plug 'jiangmiao/auto-pairs'
"Autosave
    Plug 'Pocco81/AutoSave.nvim'
"Tabs
    Plug 'pacha/vem-tabline'
" Switch to the begining and the end of a block by pressing %
    Plug 'tmhedberg/matchit'
" Git integration
    Plug 'tpope/vim-fugitive'
"Nvim theme
    Plug 'ayu-theme/ayu-vim' 
"Terminal
    Plug 'kassio/neoterm'
call plug#end()


