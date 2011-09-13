"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set showmatch

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set autochdir   "always go to working file directory

"this is for saving when I forgot to sudo
cmap w!! %!sudo tee > /dev/null % 

"some stuff to get the mouse working
set mouse=a
set clipboard+=unnamed  " Yanks go on clipboard instead.

"The statusline has a lot of functions, so I split it in another file
source ~/.vim/statusline.vim

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches


if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=80 "A new function, great for PEP-8
endif

"indent settings
set shiftwidth=4
"set softtabstop=4
set ts=4
set expandtab
set autoindent

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
syntax on

"tell the term has 256 colors
set t_Co=256

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
    let g:CSApprox_loaded = 1
endif

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
 
" This makes VIM check automatically if the buffer has been updated
au CursorHold * checktime


" ======================================================================
" ============               VUNDLE                 ====================
" ======================================================================

set rtp+=~/.vim/vundle.git/

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle "https://github.com/majutsushi/tagbar.git" 
"Better than TagList
Bundle "https://github.com/scrooloose/nerdtree.git" 
"File tree browser
Bundle "https://github.com/orestis/pysmell.git" 
"Python syntax checker
Bundle "https://github.com/msanders/snipmate.vim.git" 
Bundle "https://github.com/tpope/vim-surround.git" 
"Better HTML Tag surround
Bundle "https://github.com/tpope/vim-markdown.git" 
"markdown syntax... DUH
Bundle "https://github.com/tpope/vim-fugitive.git" 
"git wrapper
Bundle "git://github.com/scrooloose/syntastic.git" 
"syntax checker
Bundle "git://github.com/vim-scripts/tComment.git"
Bundle "git://github.com/sjl/gundo.vim.git"
Bundle "git://github.com/Raimondi/delimitMate.git"
Bundle "git://github.com/sjl/gundo.vim.git"
Bundle "CSApprox"
Bundle "git://github.com/ervandew/supertab.git"
Bundle "calendar.vim"

" Snipmate
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/honza/snipmate-snippets.git"
Bundle "git://github.com/garbas/vim-snipmate.git"


 " Brief help
 "
 " :BundleInstall  - install bundles (won't update installed)
 " :BundleInstall! - update if installed
 "
 " :Bundles foo    - search for foo
 " :Bundles! foo   - refresh cached list and search for foo
 "
 " :BundleClean    - confirm removal of unused bundles
 " :BundleClean!   - remove without confirmation
 "
 " see :h vundle for more details
 " or wiki for FAQ
 " Note: comments after Bundle command are not allowed..
