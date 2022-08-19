set nocompatible
syntax on
set title
set number
set ruler
set showmode
set showcmd
set confirm
set hidden
set history=1024
set undolevels=1024
set clipboard=unnamed
set wildmenu
set wildmode=list:longest,full
set ttyfast
set nolist
set visualbell
set t_vb=
set backspace=indent,eol,start
set display=truncate

set tabstop=8
set softtabstop=0
set shiftwidth=8

set cindent
set cinoptions=(4200,u4200,+0.5s,*500,:0,t0,U4200
set indentkeys=0{,0},0),:,0#,!^F,o,O,e

set noshowmatch
set matchpairs+=<:>
let g:loaded_matchparen=1
let g:is_posix=1

set hlsearch
set incsearch
set ignorecase
set shiftround
highlight search cterm=NONE ctermfg=0 ctermbg=7
call matchadd('ColorColumn', '\%81v', 100)

set encoding=utf-8
set ffs=unix,dos,mac
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=ucs-bom,utf-8,latin1
endif

set t_u7=

set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/swp
set runtimepath+=~/.vim/add

filetype off

set cmdheight=2
set laststatus=2
if has("statusline")
	set statusline=%1*\%02n\ %t\ %y%w%h%r[%{&ff}]%q%m%=[%.20F]\ %5B\ %5O\ %3l:%-3L\ %3c:%-3v\ %3p%%\ \ %*
	highlight User1 ctermfg=red ctermbg=black guifg=red guibg=black
endif

if has("gui_running")
	colorscheme koehler
	set background=dark
	let g:rehash256 = 1
	set t_Co=256
	set cursorline
	set guioptions-=r
	set guioptions-=T
	highlight cursor guifg=black guibg=lightgrey
	highlight search guibg=darkgrey guifg=black
endif

if has("win32")
	set ffs=dos,unix,mac
	set guifont=dejavu\ sans\ mono:h12
endif

nnoremap <F1> :w<CR>
inoremap <F1> <ESC>:w<CR>i

nnoremap <F2> :set invpaste paste?<CR>
inoremap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <silent> <F3> :<C-U>call FuncLangRU()<CR>
inoremap <silent> <F3> <ESC>:<C-U>call FuncLangRU()<CR>a

let s:LangVarRU=1
function! FuncLangRU()
	if s:LangVarRU
		set keymap=russian-jcukenwin
	else
		set keymap=
	endif
	let s:LangVarRU = !s:LangVarRU
endfunction

nnoremap <silent> <F4> :<C-U>call FuncLangFA()<CR>
inoremap <silent> <F4> <ESC>:<C-U>call FuncLangFA()<CR>a

let s:LangVarFA=1
function! FuncLangFA()
	if s:LangVarFA
		set keymap=persian
		set rl
	else
		set keymap=
		set norl
	endif
	let s:LangVarFA = !s:LangVarFA
endfunction

nnoremap <silent> <F5> :call FuncReset()<CR>
inoremap <silent> <F5> <ESC>:call FuncReset()<CR>i

function! FuncReset()
	syntax on
	filetype plugin indent on
	set colorcolumn=72
	set textwidth=72
	set shiftwidth=8
	set tabstop=8
	set softtabstop=0
	"set expandtab
	set nolist
	set indentexpr=
	set noautoindent
	set nosmartindent
	set cindent
	set cinoptions=(4200,u4200,+0.5s,*500,:0,t0,U4200
	set indentkeys=0{,0},0),:,0#,!^F,o,O,e
	set backspace=indent,eol,start
	:autocmd! GroupSGML BufNewFile,BufRead *.sgml,*.ent,*.xsl,*.xml
	:autocmd! GroupSGML BufNewFile,BufRead *.[1-9]
endfunction

nnoremap <silent> <F6> :call OpenBSD_Style()<CR>
inoremap <silent> <F6> <ESC>:call OpenBSD_Style()<CR>i

function! IgnoreParenIndent()
	let indent = cindent(v:lnum)
	if indent > 4000
		if cindent(v:lnum - 1) > 4000
			return indent(v:lnum - 1)
		else
			return indent(v:lnum - 1) + 4
		endif
	else
		return (indent)
	endif
endfunction

function! OpenBSD_Style()
	setlocal cindent
	setlocal cinoptions=(4200,u4200,+0.5s,*500,:0,t0,U4200
	setlocal indentexpr=IgnoreParenIndent()
	setlocal indentkeys=0{,0},0),:,0#,!^F,o,O,e
	setlocal noexpandtab
	setlocal shiftwidth=8
	setlocal tabstop=8
	setlocal textwidth=80
	setlocal colorcolumn=80 "-2
	setlocal softtabstop=0
endfunction

if has("autocmd")
	augroup GroupSGML
		autocmd BufNewFile,BufRead *.sgml,*.ent,*.xsl,*.xml call Set_SGML()
		autocmd BufNewFile,BufRead *.[1-9] call ShowSpecial()
	augroup END
endif

function! Set_Highlights()
	highlight default link OverLength ErrorMsg
	match OverLength /\%71v.\+/
	return 0
endfunction

function! ShowSpecial()
	setlocal list listchars=tab:>>,trail:*,eol:$
	highlight default link nontext ErrorMsg
	return 0
endfunction

function! Set_SGML()
	setlocal number
	syntax match sgmlSpecial "&[^;]*;"
	setlocal syntax=sgml
	setlocal filetype=xml
	setlocal shiftwidth=2
	setlocal textwidth=70
	setlocal colorcolumn=70 "-2
	setlocal tabstop=8
	setlocal softtabstop=2
	setlocal formatprg="fmt -p"
	setlocal autoindent
	setlocal smartindent
	nnoremap <F8> gqj
	inoremap <F8> <ESC>gqji
	nnoremap <F7> :s/        /\t/<CR>
	inoremap <F7> <ESC>:s/        /\t/<CR>i
	call ShowSpecial()
	call Set_Highlights()
	return 0
endfunction
