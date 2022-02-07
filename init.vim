source $HOME/.config/nvim/vim-plug/plugins.vim

nnoremap <SPACE> <Nop>
let mapleader=" "

let g:material_style = 'palenight'
let g:airline_theme = 'base16_material_palenight'
colorscheme material
if (has("termguicolors"))
  set termguicolors
endif
set t_Co=256

set hidden " hide unsaved changes when buffer is unloaded
set nowrap " do not wrap lines that are longer than window width
set pumheight=10 " popupmenu items shown in autocomplete window
set mouse=a " enable mouse support in all modes
set tabstop=2 " 1 tab === 2 spaces
set smartindent " smart autoindent on new line
set shiftwidth=2 " number of spaces for each indent
set expandtab " replace tabs with spaces
set laststatus=0 " never show status line for last window
set number relativenumber " show current line number and display relative distance from current line
set cursorline " highlight line under cursor
set nobackup " do not create backup files when overwriting
set updatetime=300 " write swap file to disk after 300 ms
set timeoutlen=500 " wait 500 ms to complete a mapped sequence
set formatoptions-=cro
set clipboard+=unnamedplus " allow pasting from external keyboard
set colorcolumn=120 " display a colored line at 120 characters"
highlight ColorColumn ctermbg=lightgrey guibg=#32302f
set showtabline=2 " always show line with tab page labels
set scrolloff=8 " keep cursor 8 lines from top/bottom when scrolling
set incsearch " highlight text while writing search string

" Always create split windows to the right or below
set splitbelow
set splitright

" Allow project specific vimrc
set exrc
set secure

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

" Insert blank line below or above the current line
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" scroll through autocomplete menu with tab / shift-tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Exit insert mode with kj or jk
inoremap kj <Esc>
inoremap jk <Esc>

" Move between buffers
nnoremap <C-j> :bprev<CR>
nnoremap <C-K> :bnext<CR>

" Remap Emmet leader key
let g:user_emmet_leader_key='<C-m>'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

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

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" General Vim shortcuts
nnoremap <leader>w :w<CR>

" Git stuff
" git-blame hotkey
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>
nnoremap <leader>p :Git pull --recourse-submodules<CR>
nnoremap <leader>us :Git submodule foreach git pull origin master<CR>
nnoremap <leader>gc :Telescope git_branches<CR>
" FZF-checkout shortcut
nnoremap <leader>gs :vertical G<CR>

" Delete buffer shortcut
nnoremap <leader>d :bd<CR>

" Un-highlight search shortcut
nnoremap <leader>h :noh<CR>

" Startify settings
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1

" Quickfix list shortcuts
nnoremap <leader>qo :copen<CR>
nnoremap <leader>ql :cclose<CR>
nnoremap <leader>qk :cnext<CR>
nnoremap <leader>qj :cprev<CR>

" Keep 'next' centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z
nnoremap Y y$

" Move selected lines in visual mode and indent on the go
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Telescope stuff
lua << EOF
require('telescope').setup({
defaults = {
  layout_strategy = 'vertical',
  layout_config = {
    vertical = {
      mirror = true
      }
    },
  sorting_strategy = "ascending"
  },
pickers = {
  find_files = {
    hidden = true
    },
  file_browser = {
    hidden = true
    }
  }
})
EOF

nnoremap <leader>rg :Telescope live_grep<CR>
nnoremap <leader>fs :Telescope grep_string<CR>
nnoremap <leader>fb :Telescope file_browser<CR>
nnoremap <C-f> :Telescope find_files<CR>

lua << EOF
  require("twilight").setup()
EOF
