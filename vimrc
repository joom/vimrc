" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

nmap <Leader>op :PluginInstall<CR>

Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/Align'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'ap/vim-css-color'
Plugin 'valloric/MatchTagAlways'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/Gundo'

"Haskell
Plugin 'Twinside/vim-haskellConceal'
Plugin 'travitch/hasksyn'
Plugin 'scrooloose/syntastic'
Plugin 'lukerandall/haskellmode-vim'

Plugin 'jiangmiao/auto-pairs'

" Plugin 'Lokaltog/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'

"Split swap
Plugin 'wesQ3/vim-windowswap'

" CSScomb
Plugin 'miripiruni/CSScomb-for-Vim'

" Surround
Plugin 'tpope/vim-surround'

" CtrlP (Wow!)
Plugin 'kien/ctrlp.vim'

" SuperTab
Plugin 'ervandew/supertab'

Plugin 'vim-scripts/wombat256.vim'
Plugin 'amdt/vim-niji'
call vundle#end()            " required
" }}}

" Plugin Settings {{{
let g:niji_matching_filetypes = ['lisp', 'ruby', 'python', 'javascript', 'haskell', 'ocaml', 'sml']
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:windowswap_map_keys = 0 "prevent default bindings
" }}}

" Airline {{{
Plugin 'bling/vim-airline'
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

" Plugin 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256
" }}}

" NERDTree {{{
Plugin 'scrooloose/nerdtree'
let g:NERDTreeMapChangeRoot =  "`"

nmap <Leader>] :NERDTreeTabsToggle<CR>
nnoremap <Space>c :NERDTreeCWD<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
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
colorscheme gruvbox
set nocompatible
filetype off
set autochdir
set foldmethod=marker

set number

syntax on
set mouse=a

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
set wildignore=*.pyc
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
" EJS templates
autocmd BufRead,BufNewFile *.ejs set filetype=html
"Shortcuts for beautifiers
autocmd FileType javascript noremap <buffer>  <M-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <M-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <M-f> :call CSSBeautify()<cr>
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


function! TabSpace2()
  %s/\t/  /g
  return
endfunction
" }}}

" Some Useful Key Mappings {{{
nmap <silent> <leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>sw :call WindowSwap#EasyWindowSwap()<CR>
nmap <Leader>` :call WindowSwap#EasyWindowSwap()<CR><Leader>[:call WindowSwap#EasyWindowSwap()<CR>

"Split resize
nmap <Leader>9 :resize -10<CR>
nmap <Leader>0 :resize +10<CR>
nmap <Leader>- :vertical resize -5<CR>
nmap <Leader>= :vertical resize +5<CR>
nmap <Tab> :CtrlPBuffer<CR>
nmap <Leader>f :CtrlPLine<CR>

" Shift-tab
imap <S-Tab> <Esc><<i

" Mapping external keyboard movement keys
map <Home> <Esc>ggzz
map <End> <Esc>Gzz
map <PageUp> <Esc>10kzz
map <PageDown> <Esc>10jzz

map <Delete> x

"for unhighlighing the selections
nmap <C-x> :let @/=''<CR>

"split switch
nnoremap <Leader>[ <C-W>w
map <F1> <C-W><C-H>
map <F2> <C-W><C-J>
map <F3> <C-W><C-K>
map <F4> <C-W><C-L>

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
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>1q :q!<CR>
map <C-h> <Esc>gT
map <C-l> <Esc>gt

"select all
nmap <C-a> ggVG

"Edit the vimrc file
nmap <Leader>r :tabnew<CR>:e ~/.vim/vimrc<CR>
"Reload vimrc
nmap <F5> :source ~/.vimrc<CR>

"New line before/after the current line without going into insert mode
nmap <F8> o<Esc>
nmap <F9> O<Esc>

"New Tab
nmap <Leader>n :tabnew<CR>

"Add comma at the end of the previous line
nmap <Leader>c k$a,<Esc>

"Paste mode toggle
set pastetoggle=<Leader>i

"Keep selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" "Camel case motion (with shift)
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

"Commentary in normal mode
nmap gc Vgc<Esc>

"Add semicolon at the end of line
nmap ; $a;<Esc>

"Repeat last command
nmap !! :<Up><CR>
" }}}

"Creating new text objects {{{
Plugin 'kana/vim-textobj-user'
call textobj#user#plugin('php', {
\   'code': {
\     'pattern': ['<?php\>', '?>'],
\     'select-a': 'aP',
\     'select-i': 'iP',
\   },
\ })
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
