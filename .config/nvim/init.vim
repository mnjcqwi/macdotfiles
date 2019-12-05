"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						 Plugins                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'itchyny/vim-cursorword' do some practice, may useful in the future
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-clap'
" Plug 'Raimondi/delimitMate'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"						 Setting                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible  								    		" Enables us Vim specific features
set completeopt=longest,menuone,preview 					" completeopt setting 
set wildmenu                                                " example use case, :find [paths] click tab, it will show all the files under that paths
set wildmode=longest:full,full
set hidden 										          " Buffer should still exist if window is closed 
" disable some annoying backup features
set nobackup 										      " Don't create annoying backup files
set noswapfile
set nowritebackup
set scrolloff=6
set undofile
set undodir=~/.vim_undo
set undolevels=1000
set undoreload=10000
set history=10000
" Use absolute paths in sessions
" set sessionoptions-=curdir  not useful at this time
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set autoindent					" Enabile Autoindent

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set backspace=indent,eol,start  " Makes backspace key more powerful. :h 'backspace' for help
set nu
set cursorline
set incsearch                   " Shows the match while typing
set hlsearch
set laststatus=2 " 总是显示状态栏"
set noerrorbells                " No beeps
set ruler " 显示当前光标"
set showcmd                     " Show me what I'm typing
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" true color enable in neovim
if (has("termguicolors"))
  set termguicolors
endif

" color scheme
color dracula
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=' '
let g:python3_host_prog = '/usr/local/bin/python3'

" nomal mode move window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k

" insert mode and command mode move cursor
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" reset hightlight use esc
nnoremap <esc> :noh<return><esc>

" original omicompeletion close prefiew window
" this one is used by auto completion which provide by vim defualt
augroup complete
  autocmd!
  autocmd CompleteDone * pclose
augroup end

" remap buffer move keystroke
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bprevious<CR>
nnoremap <silent> [B :bprevious<CR>
nnoremap <silent> [B :bprevious<CR>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" change gk gj to j and k, now j, k move as edit display line not real line
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='dracula'
"show full path in the vim-airline
" let g:airline_section_c = '%F'
let g:airline#extensions#tabline#enabled = 1 "Show tabs if only one is enabled.
let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" vim-airline for coc
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree config
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>nv :NERDTreeFind<cr>
nmap <leader>ng :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$', '\.idea$'
            \ ]

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('js', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('java', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('python', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('go', 'Magenta', 'none', '#7FD5EA', '#151515')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" far vim config
set lazyredraw
set regexpengine=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tb :TagbarToggle<CR>
" following https://github.com/jstemmer/gotags to install gotags:withs
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" all errors put into quickfix
let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_def_mode = 'gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1

"let g:go_list_autoclose = 0

let g:go_highlight_debug = 1


function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" autocmd FileType go nmap <leader>gr  <Plug>(go-run)
" autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
" autocmd FileType go nmap <leader>gt  <Plug>(go-test)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" check json syntax
autocmd FileType json syntax match Comment +\/\/.\+$+
" automatically import the package for go 
augroup terminal
        autocmd!
        autocmd TermClose * if getline('$') == 'Exit 0' | close | endif
augroup end

" Use <Tab> and <S-Tab> to navigate the completion list

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" format the code when click <CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"gitgutter config
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" coc-list config
""""""""""""
"autocmd CursorHold * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

 """"""""""""""""""""""""""""""""""""""

 """""""""""""""""""""""""""""""""
 "            delimitMate        "
 """""""""""""""""""""""""""""""""
 "let b:delimitMate_matchpairs = "{:}"

 """"""""""""""""""""""""""""""""""""""""""""""""
 " FZF config
 """""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=* GGrep
	\ call fzf#vim#grep(
	\   'git grep --line-number '.shellescape(<q-args>), 0,
	\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')
  call setbufvar(buf, 'signcolumn', 'no')

  let height = float2nr(&lines/2)
  let width = &columns
  let row = &lines
  let col = &columns

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = &lines - 3
"   let width = float2nr(&columns - (&columns * 2 / 10))
"   let col = float2nr((&columns - width) / 2)

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': 1,
"         \ 'col': col,
"         \ 'width': width,
"         \ 'height': height
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction
