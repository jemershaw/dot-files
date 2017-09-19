" repo  : https://github.com/jemershaw/dotfiles/

"-- Support Local Enviroment --

"-- Plugin: Pathogen --
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype off 

filetype plugin indent on


"-- General Settings--
set noerrorbells
set ruler
set number
set backspace=indent,eol,start
set nocp
set laststatus=2
set encoding=utf-8
set wrap
set textwidth=79
set formatoptions=qrn1

"-- turn on syntax highlighting --
syntax on
set nocursorcolumn
set nocursorline

"-- dont save .netrwhist --
let g:netrw_dirhistmax=0

"-- Show commands in status --
set showcmd
set showmode

"-- Turn Off Swap Files --
set noswapfile
set nobackup
set nowb

"-- Indentation --
" set smartindent
set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"-- Tabbed Editing --
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>
"Switch between tabs by pressing Shift-Tab
map <S-Tab> gt

"-- Map Leader --
let mapleader = ","

"-- Plugin: NerdTree --
map <C-\> :NERDTreeToggle<CR>

"-- Plugin: Map tmux_navigator to custom commands --
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

"-- Plugin: git gutter configuration --
set updatetime=250

" Let airline tell me my status
set noshowmode
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0

"-- Show preview window below (Feels more like and IDE)
set splitbelow

" Support Ctrl+/ to comment line
imap <C-_> <esc>gcci
nmap <c-_> gcc
vmap <c-_> gcc

" Git Command 
map <c-S-a> <esc>:Gstatus<CR>
" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" Plugin: Vimux commands
" Prompt for a command to run map
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vm :VimuxPromptCommand("make ")<CR>

" Plugin: YCM
let g:ycm_filetype_blacklist = {}

" Plugin: ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
