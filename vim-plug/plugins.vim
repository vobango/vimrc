if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'stsewd/fzf-checkout.vim'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-rooter'
Plug 'unblevable/quick-scope'
Plug 'editorconfig/editorconfig-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-eunuch'
Plug 'juneedahamed/svnj.vim'
Plug 'nicwest/vim-http'
Plug 'zivyangll/git-blame.vim'
Plug 'sbdchd/neoformat'
Plug 'mhinz/vim-startify'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'marko-cerovac/material.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/twilight.nvim', { 'branch': 'main' }

call plug#end()
