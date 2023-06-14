" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/kip/.vim
set rtp+=~/.vim
call vundle#begin()
Plugin 'gmarik/vundle'

nmap <Leader>op :PluginInstall<CR>
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tikhomirov/vim-glsl'
Plugin 'bkad/CamelCaseMotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'joom/vim-commentary'
Plugin 'vim-scripts/Align'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/Gundo'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'ConradIrwin/vim-bracketed-paste'
" Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-dispatch'

Plugin 'godlygeek/csapprox'
"Color Schemes

Plugin 'moll/vim-bbye'
call vundle#end()            " required
" }}}

" Plugin Settings {{{
set conceallevel=0
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|agdai\|bak\|ibc\|elc\|\.hi\|\.o\|\.dyn_o\|\.dyn_hi'
let g:ctrlp_working_path_mode = 0
nmap <C-x><C-f> <C-p>
nmap <C-j> jzz
nmap <C-k> kzz
nmap <Leader>g <C-p>
let g:agda_extraincpaths = ["/Users/joomy/Library/agda-stdlib/src"]
let g:surround_113 = "``\r''" " surround with LaTeX quotes
let g:surround_98 = "\\begin{}\r\\end{}" " surround with LaTeX blocks

let g:turkish_deasciifier_path = 'deasciify'
vmap <Space>tr :<c-u>call Turkish_Deasciify()<CR>
vmap <Space>rt :<c-u>call Turkish_Asciify()<CR>
nnoremap <Leader><BS> :Bdelete<CR> " backspace
" nnoremap <Leader><BS> :Bdelete<CR>:q<CR>
map <Space>p :RainbowParentheses!!<CR>

nmap <Leader>hj <Plug>GitGutterNextHunk
nmap <Leader>hk <Plug>GitGutterPrevHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
" <Leader>hs stages hunk, <Leader>hu undoes hunk

autocmd FileType tex setlocal commentstring=%\ %s
autocmd FileType coq setlocal commentstring=(*\ %s\ *)
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)
" }}}

" Airline {{{
set noshowmode
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set laststatus=2
set t_Co=256
syntax on
" }}}

" NERDTree {{{
Plugin 'scrooloose/nerdtree'
let g:NERDTreeMapChangeRoot =  "`"

nmap <Leader>] :NERDTreeTabsToggle<CR>
nnoremap <Space>c :NERDTreeCWD<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\.elc$', '\.ibc$', '\.agdai$', '\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 25

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
" }}}

" General {{{
if has("gui_running")
  set guifont=Iosevka\ Light:h17
  set columnspace=-1
endif
set ttyfast
" set ttymouse=xterm2
" set ttyscroll=3
set lazyredraw
" set colorcolumn=79
set wildmenu
set wildmode=list:longest,full
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
colorscheme gruvbox

set nocompatible
filetype off
" set autochdir
set foldmethod=marker
set linebreak
let g:tex_conceal = ""

set number

syntax on
set mouse=a
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8

set autoindent
set smartindent
set cindent
set background=dark
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildignore=*.pyc,*.agdai,*.elc,*.vo,*.glob
set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set undolevels=1000
set noswapfile
set nobackup
set number
set linespace=3
set backspace=indent,eol,start

" Omni
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd VimEnter * wincmd w
autocmd BufRead,BufNewFile *.p set filetype=rust
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.lagda set filetype=tex
autocmd BufRead,BufNewFile *.v set filetype=coq
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile *.spacemacs,*.emacs set filetype=lisp
autocmd BufRead,BufNewFile *.kl set filetype=racket
autocmd BufRead,BufNewFile *.ml4 set filetype=ocaml
"Shortcuts for beautifiers
autocmd FileType javascript noremap <buffer>  <Space>f :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Space>f :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Space>f :call CSSBeautify()<cr>
" Remove trailing whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e
nmap <Leader>ts :%s/\s\+$//e
" }}}

" Some Useful Key Mappings {{{
nmap <Space>d "=strftime("%c")<CR>P

nmap <Leader>m :Make!<CR>
nmap ge viegw
"
"Set ft
nmap <Space>ft :set ft=
vmap $ g_

nmap EE :tabdo e!<CR>

nmap <silent> <leader>u :GundoToggle<CR>

"Vim Shell
nmap <Space>s :VimShell<CR>
"Git status (vim-fugitive)
nmap <Space>g :Gstatus<CR>

"Deletes unused buffers
nmap <Space>w :Wipeout<CR>

nmap <Space>rl :set invrightleft<CR>

"ghc-mod
" vmap <Space>t :<c-u>GhcModType<CR>
" nmap <Space>t :GhcModType<CR>
" nmap <Space>T :GhcModTypeClear<CR>
" nmap <Space>i :GhcModTypeInsert<CR>
" nmap <Space>c :GhcModCheck<CR>
" nmap <Leader>L :GhcModLint<CR>

" emacs-follow-mode functionality
nmap <silent> <Leader>ef :vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>

"Split resize and swap
nmap <Leader>9 :resize -10<CR>
nmap <Leader>0 :resize +10<CR>
nmap <Leader>- :vertical resize -5<CR>
nmap <Leader>= :vertical resize +5<CR>
nmap <Tab> :CtrlPBuffer<CR>
nmap <Leader>f :CtrlPLine<CR>

" Shift-tab
imap <S-Tab> <Esc><<i

"for unhighlighing the selections
nmap <Space>sc :let @/=''<CR>

"split switch
nnoremap <Leader>[ <C-W>w

"System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"Keep the cursor in the same place after yank
vmap y ygv<Esc>

"save and exit shortcut
nmap <Leader><Leader> :w<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>wq :w\|bd<CR>
nmap <Leader>1q :q!<CR>
map <Space>h <Esc>gT
map <Space>l <Esc>gt
nmap tg gT

"Edit the vimrc file
nmap <Leader>rr :tabnew<CR>:e ~/.vim/vimrc<CR>
nmap <Leader>ll :tabdo e<CR>
"Reload vimrc
nmap <F5> :source ~/.vimrc<CR>

"New Tab
nmap <Leader>n :tabnew<CR>

"Paste mode toggle
set pastetoggle=<F5><F5>

"Keep selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" "Camel case motion (with shift)
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
" }}}

"Creating new text objects {{{
Plugin 'kana/vim-textobj-user'
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction
" }}}

" Useful functions {{{
function! NiceVimGrep()
  let lookfor = input('vimgrep /')
  execute "vimgrep /" . lookfor . "/j **"
  cw
endfunction
nmap <Space>gr :call NiceVimGrep()<CR>

" convert rows of numbers or text (as if pasted from excel column) to an array
function! ToArrayFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I["
    silent execute "normal $xa]"
endfunction
command! -range ToArray <line1>,<line2> call ToArrayFunction()

" }}}

" Git commands {{{
set shell=bash
nnoremap <leader>z :vsplit<CR><C-w>w:terminal<CR>source $HOME/.bash_profile<CR>clear<CR>
if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif
" }}}

" Kinesis Advantage {{{
nmap <Enter> \
vmap <Enter> \
nmap \<Enter> :w<CR>
nmap <Enter><Enter> :w<CR>
vmap <Enter><Enter> :w<CR>
nnoremap <BS> <C-w>w
nmap <Space>] :NERDTreeTabsToggle<CR>
nmap <Space>rst :NERDTreeTabsToggle<CR>:NERDTreeTabsToggle<CR>
" }}}

" Typos {{{
command WQ wq
command Wq wq
command W w
command Q q
map Q <Nop>
" }}}

" Rust {{{
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
let g:LanguageClient_useVirtualText = "All"
" let g:LanguageClient_useVirtualText = "Diagnostics"
hi virtualTexthl ctermbg=gray
hi Todo ctermbg=gray
hi LanguageClientInfoSign ctermbg=gray
hi LanguageClientInfo ctermbg=gray
hi LanguageClientWarningSign ctermbg=208
hi LanguageClientWarning ctermbg=208
hi LanguageClientWarning ctermfg=235
hi LanguageClientError ctermbg=167
hi LanguageClientErrorSign ctermbg=167
hi LanguageClientError ctermfg=235
hi LanguageClientCodeLens ctermbg=208
hi LanguageClientCodeLens ctermfg=236
nnoremap <Leader>t :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>h :call LanguageClient#handleCodeLensAction()<CR>
nnoremap <Leader>ft :call LanguageClient#textDocument_formatting()<CR>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}}
