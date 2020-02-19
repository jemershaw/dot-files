" repo  : https://github.com/jemershaw/dotfiles/

"-- Support Local Enviroment --

"-- Plugin: Pathogen --
let g:pathogen_disabled = ['YouCompleteMe']

if v:version < '704'
  call add(g:pathogen_disabled, 'YouCompleteMe')
endif

execute pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype off

filetype plugin indent on


"-- General Settings--
set noerrorbells
set ruler
set number
set relativenumber
set backspace=indent,eol,start
set nocp
set laststatus=2
set encoding=utf-8
set wrap
set nohidden
set textwidth=79
set formatoptions=qrn1
set incsearch
set ignorecase
set smartcase
set hlsearch


"-- turn on syntax highlighting --
syntax on
set nocursorcolumn
set nocursorline

set background=dark

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

"-- Misc --
set esckeys
set pastetoggle=<F10>
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <TAB> >>
nnoremap <S-Tab> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
inoremap <S-TAB> <C-d>
nnoremap <esc><esc> :noh<return><esc>

"-- Tabbed Editing --
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>
"Switch between tabs by pressing Shift-Tab
"map <S-Tab> gt

"-- Map Leader --
let mapleader = ","

"-- Plugin: NerdTree --
map <C-\> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.retry']

"-- Plugin: Map tmux_navigator to custom commands --
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

"-- Plugin: ctrlp configuration --
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|local'
"-- https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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

" Clipboard fix for osx
set clipboard=unnamed

scriptencoding utf-8
set encoding=utf-8

if has("autocmd")
  " Jump to last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " I hate trailing spaces
  autocmd BufWritePre * :%s/\s\+$//e

  " git-hub set GIT_HUB_MES
  autocmd BufNewFile,BufRead GIT_HUB_EDIT_MSG set filetype=markdown

  " set setting filetypes
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags spell textwidth=80
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS sw=4 sts=4 et
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete sw=4 sts=4 et
  autocmd FileType yaml setlocal omnifunc=pythoncomplete#Complete sw=2 sts=2 et
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd BufNewFile,BufRead * if match(getline(1),"---") >= 0 | set filetype=yaml | endif
  autocmd BufNewFile,BufRead *.sls set filetype=yaml
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  " autocmd BufWritePost *.js call UpdateTags()
  autocmd FileType mail setlocal spell spelllang=en textwidth=72 wrapmargin=0 wrap
endif

let g:gist_post_private = 1

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }
call SourceIfExists("~/.vimrc.local")

function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction
function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction


" Ctags
set tags=./tags;,tags;
