set nocompatible
filetype off

set number
" set relativenumber

syntax on
set mouse=a

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'Twinside/vim-haskellConceal'

" Railscasts
" Will be written in build.

Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'

"Beautifier
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'honza/vim-snippets'

"Haskell
Plugin 'travitch/hasksyn'

Plugin 'jiangmiao/auto-pairs'

"Shortcuts for beautifiers
autocmd FileType javascript noremap <buffer>  <Leader>f :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<cr>



"Powerline
Plugin 'Lokaltog/vim-powerline'
" Plugin 'Lokaltog/powerline'
let g:Powerline_symbols = 'compatible'
set laststatus=2
set t_Co=256


" NERDTree
Plugin 'scrooloose/nerdtree'
nmap <Leader>] :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowLineNumbers = 1

" CSScomb
Plugin 'miripiruni/CSScomb-for-Vim'

" Surround
Plugin 'tpope/vim-surround'

" CtrlP (Wow!)
Plugin 'kien/ctrlp.vim'


" SuperTab
Plugin 'ervandew/supertab'

Plugin 'morhetz/gruvbox'
colorscheme gruvbox

call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8

set autochdir
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

nmap <Tab> :CtrlPBuffer<CR>
map <C-h> :CtrlPLine<CR>

" Shift-tab
imap <S-Tab> <Esc><<i

" end


"for unhighlighing the selections
nmap <Leader>h :let @/=''<CR>

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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

"select all
nnoremap <Leader>a ggVG
"fix nerd tree separation misuse
nnoremap <Leader>l <Leader>[ && <Leader>q

"Fold everything according to syntax shortcut
nnoremap <F2> :set foldmethod=syntax<CR>

"Edit the vimrc file
nnoremap <Leader>r :tabnew<CR>:e ~/.vim/vimrc<CR>
"Reload vimrc
nnoremap <F5> :source ~/.vimrc<CR>

"New line before/after the current line without going into insert mode
nmap <F8> o<Esc>
nmap <F9> O<Esc>

"Select word
nnoremap <Leader>s vaw

"New Tab
nnoremap <Leader>n :tabnew<CR>

"Add comma at the end of the previous line
nnoremap <Leader>c k$a,<Esc>

"Paste mode toggle
set pastetoggle=<Leader>i

"j and k movement centers the cursor
nnoremap J jzz 
nnoremap K kzz 

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
