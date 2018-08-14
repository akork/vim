" {{{ look

syntax enable
if !has('nvim')
		set term=xterm-256color
		set t_Co=256
endif
let base16colorspace=256
set background=dark
colo evening
hi Normal ctermbg=NONE
hi nonText ctermbg=NONE
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=gray
hi Folded ctermfg=lightgray ctermbg=NONE
hi Visual ctermbg=238
hi MatchParen ctermbg=57
hi ColorColumn ctermbg=234
hi NonText ctermbg=234
"hi CursorLine gui=underline cterm=underline ctermfg=242 ctermbg=238
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

call matchadd('ColorColumn', '\%81v', 100)
let &colorcolumn=join(range(81,999),",")

" match highlight
set hlsearch

" line & column
set ruler
set title titlestring= "damian conway"

" }}}
" {{{ feel

filetype plugin indent on

set fdm=marker

cabbrev beh belowright help
cabbrev te terminal

set hidden | " hide unsaved
"set backspace=indent,eol,start | " no backspace restriction
set whichwrap=h,l,>,< | " move to next line
set timeoutlen=500 ttimeoutlen=20

set iskeyword-=_

", autoreload changed files
set autoread
"au CursorHold * checktime

set laststatus=2 | " statusline always
set showcmd | " pressed keys in bottom-right corner
set switchbuf=useopen | " switch to already visible window
set incsearch | " live highlight

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set list | " display unprintable characters
set listchars=tab:\ \ ,trail:␣
set showbreak=\ ↪\ 
let mapleader = ","

set ignorecase
set smartcase

 " autocompletion
set wildmode=longest,list,full
set wildmenu
set wildcharm=<Tab>

set scrolloff=10

" }}}
" keymap {{{

" source
noremap	<c-^> :w<cr>:so %<cr>
noremap	[{ :w<cr>:so %<cr>

" save/exit
noremap <c-x><c-s> :w<cr>
inoremap <c-x><c-s> <esc>:w<cr>
noremap <c-x>s :wa<cr>
inoremap <c-x>s <esc>:wa<cr>
noremap <c-x><c-c> :wqa<cr>
inoremap <c-x><c-c> <esc>:wqa<cr>

" search
noremap <esc><c-s> <esc>/
noremap <c-m-s> <esc>/
inoremap <esc><c-s> <esc>/
nnoremap <esc><c-r> :noh<cr>
nnoremap <c-m-r> :noh<cr>
inoremap <esc><c-r> <esc>:noh<cr>
cnoremap <c-s> <cr>n
nnoremap <c-s> n
inoremap <c-s> <esc>n
cnoremap <c-r> <cr>N
nnoremap <c-r> N
inoremap <c-r> <esc>N

" undo
inoremap <c-_> <esc>u
noremap <c-_> u
noremap <esc>_ <c-r>
inoremap <esc>_ <esc><c-r>
noremap <m-_> <c-r>
inoremap <m-_> <esc><c-r>

" splitting
noremap <c-x>0 <c-w>q
noremap <c-x>1 <c-w>s
noremap <c-x>3 <c-w>v
noremap <c-x>o <c-w>w

" basic navigation
noremap c j
noremap r k

noremap C 0vj$
noremap R $vk
noremap G vk$o
noremap F v$ok

noremap t l
noremap m h
noremap n w
noremap N W

noremap d ^
noremap s $

nnoremap <nowait> g 20j
noremap <nowait> g 20j
noremap f 20k
noremap <PageDown> 20j
noremap <PageUp> 20k

" n-w swap
noremap w n
noremap W N

" change & delete
noremap l c
onoremap l c
noremap e d
onoremap e d

" visual
noremap z <c-v>

" yank
"vnoremap y ygv<esc>

" delete char
noremap k x

" join lines
noremap j J
nnoremap <C-J> a<CR><Esc>k$

" folding
noremap <tab> za
noremap x z
noremap xe zz
noremap xu zt
noremap xf zb
noremap xo zO

" duplicate
"vnoremap <C-d> :t'><CR>gv<esc>j
vnoremap <C-d> y'>p
nnoremap <c-d> yyp
"nnoremap <C-d> :t.<CR>

noremap h /
noremap <space>r gg
noremap <space>c G

" copy range
noremap - :-,-t.<left><left><left><left>
noremap + :-+,+t.<left><left><left><left>

"upper case
"noremap y gUl
"noremap Y gul
inoremap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>

" terminate and escape
inoremap <C-c>; <Esc>$a;<Esc>
nnoremap <C-c>; $a;<Esc>
inoremap <c-e>; <esc>mdA;<esc>`d
nnoremap <c-e>; mdA;<esc>`d

" begin/end line
noremap <C-e> $
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

noremap &d :call AkingReplace()<cr>
cnoremap & <cr>"0P
cnoremap <c-cr> <CR>"0P

" reselect abcd block after indent
vnoremap < <gv
vnoremap > >gv

" some complex stuff
noremap <leader>= :call Preserve("normal ut=um")<CR>
noremap ht :call cursor(0, len(getline('.'))/2)<cr>
nnoremap <expr> <CR> empty(&buftype) ? ':buffers<CR>:b ' : '<CR>'
nmap <BS> :e <tab>
noremap <C-c><C-d> :bp<bar>sp<bar>bn<bar>bd<CR>

" }}}
" netrw {{{

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> u k
endfunction
let g:netrw_banner = 0

" }}}
