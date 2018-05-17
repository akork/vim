source ~/Dropbox/Settings/vim/min.vim
"source ~/Dropbox/Settings/vim/plugins.vim

" abbreviations {{{

iabbrev st size_t
iabbrev dd .

" }}}

" {{{ leader keys

noremap <space>su :wa<cr>:suspend<cr>

noremap <Space>me :wa<cr>:MatlabCliOpenInMatlabEditor<cr>
noremap <Space>mv :MatlabCliOpenVar<cr>
noremap <Space>mw :MatlabCliViewSelectedVar<cr>
noremap <Space>ml :wa<cr>maGk:MatlabCliRunLine<cr>`a
vnoremap <Space>mw :MatlabCliViewSelectedVar<cr>

noremap <Space>d :Explore<cr>

" filename extraction:
noremap <Space>p :let @+ = expand('%:h')<CR>:echom "Copied:" @+<CR>
noremap <Space>pp :let @+ = expand('%:p')<CR>:echom "Copied:" @+<CR>

" open/reload config:
if has('nvim')
	noremap <space>u :wa <CR>:source /Users/Aleksey/.config/nvim/init.vim<CR>:echom "Reloaded:" strftime('%T')<CR>
else
	noremap <space>u :wa <CR>:source /Users/Aleksey/.vimrc<CR>:echom "Reloaded:" strftime('%T')<CR>
endif
noremap <space>ccc :e /Users/Aleksey/Dropbox/Settings/vim/plugins.vim<CR>
noremap <space>cc :e /Users/Aleksey/Dropbox/Settings/vim/vimrc.vim<CR>
noremap <space>c :e /Users/Aleksey/Dropbox/Settings/vim/min.vim<CR>
noremap <space>cn :e /Users/Aleksey/.config/nvim/init.vim<CR>
noremap <space>ce :e /Users/Aleksey/Dropbox/Settings/spacemacs/keymap.el<CR>
noremap <space>cee :e /Users/Aleksey/Dropbox/Settings/spacemacs/spacemacs.el<CR>
noremap <space>ceee :e /Users/Aleksey/.spacemacs<CR>
" save
"nnoremap <space>s :s/
"vnoremap <space>s :s/
noremap <space>s :w <CR>:echom "Saved:" strftime('%T')<CR>
noremap <space>sa :wa <CR>:echom "All saved:" strftime('%T')<CR>

command! -nargs=* Make make <args> | cwindow 20

function! Make(target)
	wa | silent !clear
	exe 'silent make ' . a:target
	cwindow 20	| cc
	redraw!
endfunction

function! BuildAndRun(target)
	call Make("build")
	if (len(filter(getqflist(), 'v:val.valid')) == 0)
		exe '!make ' . a:target
	endif
endfunction

noremap <space>b :call Make("build")<cr>
noremap <space>l :call Make("clean")<cr>
noremap <space>t :call BuildAndRun("test1")<cr>
noremap <space>to :call BuildAndRun("test2")<cr>
noremap <space>bt :call BuildAndRun("test2")<cr>
noremap <space>m :b Makefile<CR>

nmap <space>r :find %:t:r.c<CR>
nmap <space>h :find %:t:r.h<CR>

noremap <space>e :cn<CR>
noremap <space>o :cp<CR>
noremap <space>a :cc<CR>
noremap <space>q :qa<CR>
noremap <space>sq :wqa<CR>

" }}}

" {{{ au

au BufNewFile,BufRead *.m set filetype=mma
au BufNewFile,BufRead *.scpt set filetype=applescript
au BufNewFile,BufRead, *.xml setlocal foldmethod=syntax
au BufNewFile,BufRead, *.vim setlocal foldmethod=marker
" au BufReadPre, *.vim setlocal foldlevelstart=0
au BufNewFile,BufRead, *.el setlocal foldmethod=marker
au BufNewFile,BufRead, *.lua setlocal foldmethod=marker

" When switching buffers, preserve window view.
if v:version >= 700
	au BufLeave * if !&diff | let b:winview = winsaveview() | endif
	au BufEnter * if exists('b:winview') && !&diff | call   winrestview(b:winview) | endif
endif

" }}}

" {{{ e operator moves to end of word only

"onoremap e :<C-U>silent! normal! vhe<CR>

" }}}

" some usefull staff {{{

" <> simplifying
"nnoremap ca. ca<
"nnoremap ci. ci<
"nnoremap da. da<
"nnoremap di. di<
"nnoremap va. va<
"nnoremap vi. vi<

" }}}

" {{{ move/duplicate selection
" move selection
" nnoremap <C-.> :m+<CR>==
" inoremap <C-.> <Esc>:m+<CR>==gi
" inoremap <C-u> <Esc>:m-2<CR>==gi
" nnoremap <C-u> :m-2<CR>==
" vnoremap <C-.> :m'>+<CR>gv=gv
" vnoremap <C-u> :m-2<CR>gv=gv

" }}}

" cursor movement {{{

"inoremap <ESC>[1;9D <S-Left>
"noremap <ESC>[1;9D <C-Left>
"cnoremap <ESC>[1;9D <C-Left>
"inoremap <ESC>[1;9C <C-Right>
"noremap <ESC>[1;9C <C-Right>
"cnoremap <ESC>[1;9C <C-Right>

" }}}

" compile/run {{{

" nmap <C-R> :w <CR>:!clear && make<CR>
" nmap ] :w <CR>:!clear && g++ % -o %< && ./%< <CR>

" }}}

" Language Specific {{{
" General
inoremap ,foc <esc>Ifor (int i = 0; i < <esc>A; ++i) {<enter>}<esc>O
inoremap ,fr <esc>Ifor (int <esc>eyiWa = 0; <esc>pa <<esc>A; ++<esc>pa) {<cr>}<esc>O
inoremap ,foc <esc>Ifor (<esc>eeyiWa = 0; <esc>pa <<esc>A; ++<esc>pa) {<enter>}<esc>O
inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>


" Java
inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
vnoremap <leader>sys yOSystem.out.println(<esc>pA);

" Java
inoremap <leader>con <esc>Iconsole.log(<esc>A);
vnoremap <leader>con yOconsole.log(<esc>pA);

" C++
inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

" C
inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a
" }}}

" terminal cursor {{{

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" }}}

" functions & complexed mappings {{{
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let l:winview = winsaveview()
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	"call cursor(l, c)
	call winrestview(l:winview)
	"exe 'normal! zvzz'
endfunction

function! PreserveCursor()
	let g:winview = winsaveview()
	let g:_s=@/
	let g:l = line(".")
	let g:c = col(".")
endfunction

function! RestoreCursor(command)
	execute a:command
	let @/=g:_s
	call cursor(g:l, g:c)
	call winrestview(g:winview)
	"exe 'normal! zvzz'
endfunction

function! MyIndent(type)
	call RestoreCursor("normal! `[v`]=")
endfunction

function! MyIndentWhole(type)
	call RestoreCursor("normal! `[v`]=")
endfunction

noremap = :call PreserveCursor()<cr>:set opfunc=MyIndent<CR>g@
nnoremap =h :call Preserve("normal ut=um")<CR>

" }}}

" Return to the same line you left off at
augroup line_return
	au!
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	execute 'normal! g`"zvzz' |
				\ endif
augroup END

