if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlights
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

" Version control
Plug 'tpope/vim-fugitive'
Plug 'juneedahamed/svnj.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'zivyangll/git-blame.vim'

Plug 'jiangmiao/auto-pairs'

" fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Text editing
Plug 'machakann/vim-sandwich'
Plug 'unblevable/quick-scope'
Plug 'mattn/emmet-vim'

Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'

" :SudoWrite and :SudoEdit for privileged files
Plug 'tpope/vim-eunuch'

" HTTP requests in vim
Plug 'nicwest/vim-http'

" File browser
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" File formatter (does not do much?)
Plug 'sbdchd/neoformat'

Plug 'mhinz/vim-startify'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Show icons
Plug 'kyazdani42/nvim-web-devicons'

" Add more selectors for normal mode
Plug 'wellle/targets.vim'

" Show git modifications in the left gutter
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }

" Smooth scrolling
Plug 'karb94/neoscroll.nvim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Comment out selections
Plug 'tpope/vim-commentary'

" Cool bufferline
Plug 'akinsho/bufferline.nvim'

" LSP conf
Plug 'neovim/nvim-lspconfig'

" Code diagnostics
Plug 'folke/trouble.nvim', { 'branch': 'main' }

" Display colors of color codes in editor
Plug 'norcalli/nvim-colorizer.lua'

" Show markdown output in real time
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Co-pilot
Plug 'github/copilot.vim'

" Folding
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

" Themes
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'savq/melange'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'adigitoleo/vim-mellow', { 'tag': '*' }
Plug 'arcticicestudio/nord-vim', { 'branch': 'main' }
Plug 'rakr/vim-two-firewatch'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()
