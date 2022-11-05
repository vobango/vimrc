source $HOME/.config/nvim/vim-plug/plugins.vim

nnoremap <SPACE> <Nop>
let mapleader=" "

" Color scheme
set t_Co=256
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
au Colorscheme * highlight Comment cterm=italic gui=italic
" highlight ColorColumn ctermbg=lightgrey
" Always set scheme as the last thing!
colorscheme tokyonight-moon

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
set nowritebackup
set updatetime=300 " write swap file to disk after 300 ms
set timeoutlen=500 " wait 500 ms to complete a mapped sequence
set formatoptions-=cro
set clipboard+=unnamedplus " allow pasting from external keyboard
" set colorcolumn=120 " display a colored line at 120 characters
set scrolloff=8 " keep cursor 8 lines from top/bottom when scrolling
set incsearch " highlight text while writing search string
set virtualedit=all " move cursor past the last char on the line
set signcolumn=yes

" Always create split windows to the right or below
set splitbelow
set splitright

" Copy/paste from/to system clipboard
function! ClipBoardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipBoardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipBoardYank()<CR>
nnoremap <silent> p p:call ClipBoardPaste()<CR>

" Insert blank line below or above the current line
nnoremap <silent><leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

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

highlight QuickScopePrimary guibg='#00a7aF' guifg='#ffffff' ctermfg=155 cterm=underline
highlight QuickScopeSecondary guibg='#038726' guifg='#ffffff' ctermfg=81 cterm=underline

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
nnoremap <leader>s :w<CR>

" Git stuff
" git-blame hotkey
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>
nnoremap <leader>p :Git pull --recurse-submodules<CR>
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
nnoremap Y y$

" Move selected lines in visual mode and indent on the go
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Telescope stuff
lua << EOF
require('telescope').setup({
defaults = {
  file_ignore_patterns = { ".git", "node_modules" },
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
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>tt :Telescope lsp_code_actions<CR>

lua << EOF
local function lineCount()
  return vim.api.nvim_buf_line_count(0)
end

require('gitsigns').setup()
require('neoscroll').setup()
require('colorizer').setup()
require('lualine').setup({
  sections = {
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        file_status = false,
        path = 2
      }
    },
    lualine_x = {},
    lualine_y = {'location', lineCount},
    lualine_z = {}
  }
})
require("bufferline").setup()
EOF

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

" Toggle file browser
nnoremap <leader>v <cmd>CHADopen<cr>

" CoC stuff
nmap <leader>fq <Plug>(coc-fix-current)
nmap <leader>a <Plug>(coc-codeaction)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
