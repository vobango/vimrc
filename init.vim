source $HOME/.config/nvim/vim-plug/plugins.vim

nnoremap <SPACE> <Nop>
let mapleader=" "
let g:gruvbox_italic=1

colorscheme gruvbox
set hidden
set nowrap
set pumheight=10
set ruler
set mouse=a
set t_Co=256
set conceallevel=0
set tabstop=2
set smarttab
set smartindent
set autoindent
set laststatus=0
set number relativenumber
set cursorline
set background=dark
set noshowmode
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set formatoptions-=cro
set clipboard=unnamedplus
set colorcolumn=100

if (has("termguicolors"))
	set termguicolors
endif

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Shortcuts for FZF stuff
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>

highlight ColorColumn ctermbg=lightgrey guibg=#32302f

