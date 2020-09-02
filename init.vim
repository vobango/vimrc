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
set shiftwidth=2
set expandtab
set listchars=tab:\|\ 
set list
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
set showtabline=2

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
nnoremap <C-f> :GFiles<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

highlight ColorColumn ctermbg=lightgrey guibg=#32302f

" Exit insert mode with kj or jk
inoremap kj <Esc>
inoremap jk <Esc>

" Resize FZF window and show search/top result on top
let g:fzf_layout = {'window': {'width': 0.75, 'height': 0.75}}
let $FZF_DEFAULT_OPTS="--reverse"

" FZF-checkout shortcut
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gs :vertical G<CR>
nnoremap <leader>rg :Rg<CR>

" Move between buffers
nnoremap <C-j> :bprev<CR>
nnoremap <C-K> :bnext<CR>

" Remap Emmet leader key
let g:user_emmet_leader_key=','

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
