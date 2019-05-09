"Include local config of vimwiki
source ~/.vimrc-vimwiki

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set 'updatetime' to 5 seconds when in insert mode
au InsertEnter * let updaterestore = &updatetime | set updatetime=5000
au InsertLeave * let &updatetime = updaterestore

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

set noequalalways
set nocompatible
filetype plugin on

" {{{Setting up Vundle - the vim plugin manager
let installVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let installVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'       "Colorscheme
Plugin 'https://github.com/tpope/vim-fugitive'  "Git + Vim = true
Plugin 'tpope/vim-sensible'                     "Sensible vim
Plugin 'tpope/vim-surround'                     "Easy surrounding fixing
Plugin 'sjl/gundo.vim'                          "Visualization of Vim undo tree
Plugin 'Syntastic'                              "Syntax checker
Plugin 'vim-scripts/SQLComplete.vim'            "SQL syntax
Plugin 'lifepillar/pgsql.vim'                   "PSQL syntax
"Plugin 'StanAngeloff/php.vim'                   "PHP syntax
Plugin 'hail2u/vim-css3-syntax'                 "CSS syntax
Plugin 'RRethy/vim-illuminate'                  "Hilight keywords
Plugin 'Yggdroot/indentLine'                    "Indent help
" SnipMate and dependencies
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Plugin 'Valloric/YouCompleteMe' "YouCompleteMe autocomplete
Plugin 'vimwiki/vimwiki'
Plugin 'jeetsukumaran/vim-buffergator'          "Buffer lister
Plugin 'tpope/vim-commentary'                   "Commenting help

if installVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    :PluginInstall
endif
call vundle#end()
filetype plugin indent on
set nocp
"}}}

" Configure buffergator
nnoremap <leader>b :BufferGatorTabsOpen<CR>

" Enable syntax
if has("syntax")
  syntax on
endif

" Let .sql be interpreted as POSTGRESQL
let g:sql_type_default = 'pgsql'

" Snipmate mapping
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Settings for YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui=0

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Move a line of text using alt+[jk] or command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Auto read when a file is changed from the outside
set autoread

" F5 to visualize undo tree
nnoremap <F5> :GundoToggle<CR>

" Turn on the WiLd menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
j

" Ignore case when searching
set ignorecase

" Highlight search results and remove the highlight when pressing enter
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Fast make
nmap <leader>m :!make<cr>

" Wrap lines
set wrap

" Sets how many lines of history VIM has to remember
set history=700

" Enables mouse
set mouse=a

"Relative line numbers
set number relativenumber

" Enable clipboard
set clipboard=unnamedplus

" Auto copy text highlighted by mouse in Windows
set guioptions+=a

" Proper tab indent
set tabstop=4
set shiftwidth=4
set expandtab

" Auto indent
set ai

" Smart indent
set si

" Colorscheme and syntax highlighting
syntax enable
set term=screen-256color
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized"{{{"}}}

let g:Hexokinase_highlighters = ['virtual']


" Atomatic removal of trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Highlight redundant whitespaces
highlight RedundantWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match RedundantWhitespace /[^\t]\zs\t\+/
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Ctrl+C to copy to system clipboard. Only works if you have gVim/vim compiled with clipboard
vmap <C-c> "+y

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Control+F12 to build a ctags database for current directory
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Illuminate words config
let g:Illuminate_delay = 100
hi illuminatedWord cterm=underline gui=underline

"indentLine config
let g:indentLine_color_term = 234
let g:indentLine_char = '▏'

" Spaces as dots
set list
set lcs=space:•,tab:»_,extends:›,precedes:‹
highlight SpecialKey ctermfg=234 guifg=Black ctermbg=NONE guibg=NONE

"Folding
set foldmethod=marker
nnoremap <Space> za

function! NeatFoldText() "{{{1
    let line = ' ' . substitute(getline(v:foldstart), '\s*\/\/\s*\|\s*{\{3}\d\+\s*\|\s*{\s*\|\s*}\s*\|\s*\*\/\s*\|\s*\/\*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar,v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar,winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
"}}}

highlight Folded cterm=bold ctermfg=245 ctermbg=235
highlight FoldColumn cterm=italic ctermfg=0 ctermbg=235

"Background
highlight Normal ctermbg=NONE

