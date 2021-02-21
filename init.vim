source $HOME/.config/nvim/vim-plug/plugins.vim

nnoremap <SPACE> <Nop>
let mapleader=" "

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
set clipboard+=unnamedplus
set colorcolumn=120
set showtabline=2
" Always create split windows to the right or below
set splitbelow
set splitright
" Allow project specific vimrc
set exrc
set secure

if (has("termguicolors"))
  set termguicolors
endif

" Copy/paste from/to system clipboard
function! ClipBoardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipBoardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipBoardYank()<CR>
vnoremap <silent> d d:call ClipBoardYank()<CR>
nnoremap <silent> p :call ClipBoardPaste()<CR>p

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
nnoremap <leader>gc :GBranches<CR>
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

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" exclude filenames from Rg search
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'), <bang>0) 

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" General Vim shortcuts
nnoremap <leader>w :w<CR>

" Vim-LSP Flow support
if executable('flow')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow',
        \ 'cmd': {server_info->['flow', 'lsp', '--from', 'vim-lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

" git-blame hotkey
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>

" Delete buffer shortcut
nnoremap <leader>d :bd<CR>

" Un-highlight search shortcut
nnoremap <leader>h :noh<CR>
