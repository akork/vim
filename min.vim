" {{{ options

filetype plugin indent on
syntax enable

" interface & colors
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

""set colorcolumn=81
call matchadd('ColorColumn', '\%81v', 100)
let &colorcolumn=join(range(81,999),",")

" match highlight
set hlsearch

" line & column
set ruler
set title titlestring= "damian conway"

cabbrev beh belowright help
cabbrev te terminal

set hidden | " hide unsaved
set backspace=indent,eol,start | " no backspace restriction
set whichwrap=h,l,>,< | " move to next line
set timeoutlen=500 ttimeoutlen=20

set iskeyword-=_

", autoreload changed files
set autoread
"au CursorHold * checktime

set mouse=a
set nu
set rnu
set nuw=4
set laststatus=2 | " statusline always
set noshowmode | " do not display current mode
set showcmd
set switchbuf=useopen | " switch to open window
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

" keep a 5 line buffer for the cursor from top/bottom of window
set scrolloff=7
" }}}

let mapleader = "q"

" BASIC {{{

" splitting
noremap <c-x>0 <c-w>q
noremap <c-x>2 <c-w>s
noremap <c-x>3 <c-w>v
noremap <c-x><c-o> <c-w><c-w>

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
noremap d V
noremap z <c-v>

" yank
"vnoremap y ygv<esc>

" delete char
noremap k x

" join lines
noremap j J

" paste
noremap p "0p

" folding
noremap <tab> za
noremap x z

"noremap % :b#<cr>

noremap xe zz
noremap xu zt
noremap xf zb
noremap xo zO

" duplicate
"vnoremap <C-d> :t'><CR>gv<esc>j
vnoremap <C-d> y'>p
nnoremap <c-d> yyp
"nnoremap <C-d> :t.<CR>

noremap h t
noremap <space>r gg
noremap <space>c G

" copy range
noremap - :-,-t.<left><left><left><left>
noremap + :-+,+t.<left><left><left><left>

"upper case
"noremap y gUl
"noremap Y gul

noremap <C-c><C-d> :bp<bar>sp<bar>bn<bar>bd<CR>

" terminate and escape
inoremap <C-c>; <Esc>$a;<Esc>
nnoremap <C-c>; $a;<Esc>

inoremap <c-e>; <esc>mdA;<esc>`d
nnoremap <c-e>; mdA;<esc>`d

noremap <C-e> $

" begin/end line
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

noremap \ :
nnoremap <C-J> a<CR><Esc>k$

noremap &d :call AkingReplace()<cr>
cnoremap & <cr>"0P
cnoremap <c-cr> <CR>"0P

" modifier
noremap <leader>r $
noremap <leader>h ^
noremap <leader>t gg
noremap <leader>m G
noremap <leader>c Ykgp
noremap <leader>u <c-r>
noremap <leader>= :call Preserve("normal ut=um")<CR>

 noremap ht :call cursor(0, len(getline('.'))/2)<cr>
" enter to buffer list
nnoremap <expr> <CR> empty(&buftype) ? ':buffers<CR>:b ' : '<CR>'

" buffer switch
noremap e d
" noremap <tab> :b #<CR>
nmap <BS> :e <tab>
nmap <C-c>p :e <tab>

" upper case
inoremap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>

" double new line
inoremap <C-c><C-o> <CR><Esc>O
nnoremap <Space>o i<CR><Esc>O


" noremap l y
" vnoremap lu ygv<esc>p
" nnoremap lu yyp
" vnoremap l ygv<esc>

" noremap u :noh<cr>

nnoremap <space><cr> o<esc>k

" reselect abcd block after indent
vnoremap < <gv
vnoremap > >gv


" e operator moves to end of word only

" onoremap e :<C-U>silent! normal! vhe<CR>

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


