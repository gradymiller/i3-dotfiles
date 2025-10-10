" Basic Configurations/Styling
syntax on
set fillchars+=eob:\ " Must be before the colorscheme
colorscheme desert

" Make Normal background transparent
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermfg=NONE guifg=NONE
set cursorline " row highlighting
set cursorcolumn "column highlighting
set clipboard=unnamedplus " clipboard access
set showmatch
set lazyredraw
set termguicolors

" PEP8 standard setup
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent on
set autoindent
set smartindent

" relative line numbers except for current line
set number " show line number
set relativenumber " show relative num for non-current lines

" Searching Features
set ignorecase " case-insensitive search
set smartcase " case-sensitive if caps
set incsearch " highlight while typing
set hlsearch " highlight all matches

" Status Bar
set laststatus=2
set showcmd
set ruler
set showmode

" Setting Persistent undo
set undofile
set undodir=~/.vim/undodir

" Hide tilde at bottom of file and change color
