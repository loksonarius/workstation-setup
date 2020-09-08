" Plugin installtions
call plug#begin('~/.local/share/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'dag/vim-fish'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

" Use system clipboard provider
set clipboard+=unnamedplus

" Show line numbers (absolute and relative)
set number
set relativenumber

" Show 80 char line
set textwidth=80
set colorcolumn=+1

" Don't line-wrap
set nowrap

" Automatic indentation on
set smartindent
set autoindent

" Use 2-space softtabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Enable block folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Keep backup and swap files in separate directory
set backup
set udf
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set udir=~/.config/nvim/tmp/undo//

" Colorscheme theme management
set background = "light"
set termguicolors
set bg=light

function! ToggleLightDark()
  if &bg ==# "light"
    echom "set bg=dark"
    set bg=dark
    " colorscheme solarized8_dark
  else
    echom "set bg=light"
    set bg=light
    " colorscheme solarized8_dark
  endif
endfunction
nnoremap <C-c> :call ToggleLightDark()<CR>

" Hide current mode -- displayed by lightline plugin
set noshowmode
" Set lightline colorscheme
let g:lightline = { 'colorscheme': 'solarized' }

" Add directory change mapping to change dir to that of the current buffer
nnoremap <leader>cd :cd %:p:h<CR>

" Configure LSP Client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'go': ['gopls'],
    \ 'python': ['pyls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

nmap <F5> <Plug>(lcn-menu)
" Auto-format on save
autocmd BufWritePre *.* :call LanguageClient#textDocument_formatting_sync()
" Map bindings for LSP functions
nmap <silent> <Plug>(lcn-hover)
nmap <silent>d <Plug>(lcn-definition)
nmap <silent>f <Plug>(lcn-format)
nmap <silent>i <Plug>(lcn-implementation)
nmap <silent>r <Plug>(lcn-rename)
nmap <silent>t <Plug>(lcn-type-definition)
nmap <silent>u <Plug>(lcn-references)

" Configure MUcomplete
set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
