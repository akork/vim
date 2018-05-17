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
set whichwrap= | " move to next line
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

" BASIC {{{
" duplicate
vnoremap uc ykp`<
vnoremap ud ykp`<
vnoremap ul ykp`<

" terminate and escape
inoremap <C-c>; <Esc>$a;<Esc>
nnoremap <C-c>; $a;<Esc>

inoremap <c-e>; <esc>mdA;<esc>`d
nnoremap <c-e>; mdA;<esc>`d

noremap <C-e> $

" begin/end line
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

onoremap o ?

noremap \ :
nnoremap <C-J> a<CR><Esc>k$

function! AkingReplace()
echom "hahaha"
endfunction

noremap &d :call AkingReplace()<cr>
cnoremap & <cr>"0P
cnoremap <c-cr> <CR>"0P
noremap x z
noremap xe zz

" center cursor line
"noremap xe zz
"noremap xu zt
"noremap xf zb
"noremap xo zO

" duplicate
vnoremap <C-p> y'>p
vnoremap <C-d> y'>p

" add blank
noremap ) mdo<esc>`d
noremap ( mdO<esc>`d

" copy range
noremap - :-,-t.<left><left><left><left>
noremap + :-+,+t.<left><left><left><left>

"upper case
"noremap y gUl
"noremap Y gul

noremap <C-c><C-d> :bp<bar>sp<bar>bn<bar>bd<CR>

" visual line
noremap v V
noremap V v

" undo/redo
noremap ` u
noremap ~ <C-r>

"" up/down
"noremap l j
"noremap L <c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e><c-e>jM
"noremap u k
"noremap U <c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y><c-y>kM
"
"" yank
"nnoremap t y
"vnoremap t y
"onoremap t y

" up/down
noremap m j
noremap M 15j
noremap t k
noremap T 15k

vnoremap m j
vnoremap M 15j
vnoremap t k
vnoremap T 15k

" yank
nnoremap l y
vnoremap l y
onoremap l y
vnoremap l ygv<esc>

" right
noremap s l

" delete char
noremap k x

" n-w switch
noremap n w
noremap N W
noremap w nzzzv
noremap W Nzzzv

" enter to buffer list
nnoremap <expr> <CR> empty(&buftype) ? ':buffers<CR>:b ' : '<CR>'

" buffer switch
noremap <tab> :b #<CR>
nmap <BS> :e <tab>
nmap <C-c>p :e <tab>

" upper case
inoremap <F8> _<Esc>mza<C-Right><Esc>bgUiw`zi<Del>

" double new line
inoremap <C-c><C-o> <CR><Esc>O
nnoremap <Space>o i<CR><Esc>O

inoremap hl <esc>
cnoremap hl <esc>
vnoremap hl <esc>
inoremap uh <esc>u
noremap uh u

onoremap o E
noremap z u

noremap r h
noremap hc s

noremap ho O

noremap hs $
noremap hr ^
noremap hn A
noremap hb I

noremap ha A
noremap hi I

noremap ht :call cursor(0, len(getline('.'))/2)<cr>
noremap ht I

noremap l y
vnoremap lu ygv<esc>p
nnoremap lu yyp
vnoremap l ygv<esc>

noremap u :noh<cr>

onoremap s $
onoremap r ^
onoremap n t
onoremap b T

noremap ut gg
noremap um G

noremap u/ ?

noremap uv gv

noremap uo O
noremap ue E
noremap ua A

noremap j J

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
