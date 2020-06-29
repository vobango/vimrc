source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/themes/airline.vim

syntax enable
colorscheme night-owl
set hidden
set nowrap
set pumheight=10
set ruler
set cmdheight=2
set mouse=a
set t_Co=256
set conceallevel=0
set tabstop=2
set showtabline=2
set smarttab
set smartindent
set autoindent
set laststatus=0
set number relativenumber
set cursorline
set background=dark
set showtabline=2
set noshowmode
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set formatoptions-=cro
set clipboard=unnamedplus
set colorcolumn=100
highlight ColorColumn ctermbg=lightgrey guibg=wheat1
highlight Comment cterm=italic

if (has("termguicolors"))
	set termguicolors
endif
