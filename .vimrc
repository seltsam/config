syntax on

filetype plugin on

set nocompatible 
set backspace=indent,eol,start	" more powerful backspacing
set nobackup "ファイルを保存する前にbackupを作成する
set textwidth=0 "テキストを折り返ししない
set history=200
set number
set ruler
set helpfile=$HOME/.vim/doc/help.jax
set helplang=ja,en
"set visualbell

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

set modelines=0

set smartindent
set ignorecase
set smartcase
set wrapscan
set showcmd
set showmatch
"set hlsearch ハイライトしない
set laststatus=2

set wildmenu
set wildmode=list:longest
set autoread
set hidden
"set paste "autoindentを自動的にoffにするためコメントアウト

if &term =~ "xterm-256color"
	"colorscheme desert256
	colorscheme xoria256
  highlight Normal ctermbg=333
else
  colorscheme desert
endif

" mapping 

noremap j gj
noremap k gk

" in command line mode emacs like keybind
map! <C-A> <Home>
map! <C-E> <End>
map! <C-F> <Right>
map! <C-B> <Left>
map! <C-D> <Delete>

" toggle set paste
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" Gnu Screen like key map at MiniBufExpl
" let mapleader = "<C-F>"
nmap <Space> :MBEbn<CR>
nmap <F3> :MBEbp<CR>
nmap <F4> :MBEbn<CR>
" 
" nnoremap <Leader><Space> :MBEbn<CR>
" nnoremap <Leader>n :MBEbn<CR>
" nnoremap <Leader><C-n> :MBEbn<CR>
" nnoremap <Leader>p :MBEbp<CR>
" nnoremap <Leader><C-p> :MBEbp<CR>
" nnoremap <Leader>c :new<CR>
" nnoremap <Leader><C-c> :new<CR>
" nnoremap <Leader>k :bd<CR>
" nnoremap <Leader><C-k> :bd<CR>
" nnoremap <Leader>s :IncBufSwitch<CR>
" nnoremap <Leader><C-s> :IncBufSwitch<CR>
" nnoremap <Leader><TAB> :wincmd w<CR>
" nnoremap <Leader>w :ls<CR>
" nnoremap <Leader><C-w> :ls<CR>
" nnoremap <Leader>a :e #<CR>
" nnoremap <Leader><C-a> :e #<CR>
" nnoremap <Leader>1 :e #1<CR>
" nnoremap <Leader>2 :e #2<CR>
" nnoremap <Leader>3 :e #3<CR>
" nnoremap <Leader>4 :e #4<CR>
" nnoremap <Leader>5 :e #5<CR>
" nnoremap <Leader>6 :e #6<CR>
" nnoremap <Leader>7 :e #7<CR>
" nnoremap <Leader>8 :e #8<CR>
" nnoremap <Leader>9 :e #9<CR>

nnoremap ,<Space> :MBEbn<CR>
nnoremap ,n :MBEbn<CR>
nnoremap ,<C-n> :MBEbn<CR>
nnoremap ,p :MBEbp<CR>
nnoremap ,<C-p> :MBEbp<CR>
nnoremap ,c :new<CR>
nnoremap ,<C-c> :new<CR>
nnoremap ,k :bd<CR>
nnoremap ,<C-k> :bd<CR>
nnoremap ,s :IncBufSwitch<CR>
nnoremap ,<C-s> :IncBufSwitch<CR>
nnoremap ,<TAB> :wincmd w<CR>
nnoremap ,w :ls<CR>
nnoremap ,<C-w> :ls<CR>
nnoremap ,a :e #<CR>
nnoremap ,<C-a> :e #<CR>
nnoremap ,1 :e #1<CR>
nnoremap ,2 :e #2<CR>
nnoremap ,3 :e #3<CR>
nnoremap ,4 :e #4<CR>
nnoremap ,5 :e #5<CR>
nnoremap ,6 :e #6<CR>
nnoremap ,7 :e #7<CR>
nnoremap ,8 :e #8<CR>
nnoremap ,9 :e #9<CR>

" 文字コード関連
" from ずんWiki hasfttp://www.kawaz.jp/pukiwiki/?vim#content_1_7
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

set tags=./tags,tags,../tags,$HOME/src/ezcomponents-svn/trunk/tags
" ezcomponents 
" set tags+=$HOME/src/ezcomponents-svn/trunk/tags
map <C-z> <C-t>

" statusline関連
" from はてな勉強会 at 2006-05-15 http://hatena.g.hatena.ne.jp/hatenatech/20060515/1147682761
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplSplitToEdge = 0
"let g:miniBufExplVSplit = 20   " column width in chars

autocmd Filetype javascript :set dictionary+=$HOME/.vim/dict/javascript.dict
autocmd Filetype css :set dictionary+=$HOME/.vim/dict/css.dict
autocmd Filetype html :set dictionary+=$HOME/.vim/dict/html.dict
autocmd Filetype php :set dictionary+=$HOME/.vim/dict/php_functions.dict
autocmd Filetype java :set dictionary+=$HOME/.vim/dict/j2se14.dict

set complete=.,w,b,u,t,k

"autocmd Filetype javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k$HOME/.vim/dict/javascript.dict'
"autocmd Filetype css let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k$HOME/.vim/dict/css.dict'
"autocmd Filetype html let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k$HOME/.vim/dict/html.dict'
"autocmd Filetype php let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k$HOME/.vim/dict/php_functions.dict'
autocmd Filetype java :let java_highlight_all=1
autocmd Filetype java :let java_highlight_debug=1
autocmd Filetype java :let java_space_errors=1
autocmd Filetype java :let java_highlight_functions=1
autocmd Filetype java compiler javac
autocmd FileType java nmap <F5> :call CompileJava()<CR>

function! CompileJava()
  cexpr '' " quickfixを空に
  silent exec ':make %'
  silent cwin
endfunction

function! Bgrep(word) 
  cexpr '' " quickfixを空に
  silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
  silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

" .vim/plugin/autocomplpop.vim
hi Pmenu ctermbg=6 guibg=#4c745a
hi PmenuSel ctermbg=3 guibg=#d4b979
hi PmenuSbar ctermbg=0 guibg=#333333

"<TAB>で補完
" Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" Remap the ret key to return next line
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"
" }}} Autocompletion using the TAB key

" matchit.vim
source $VIMRUNTIME/macros/matchit.vim

" .vim/plugin/align.vim
":let g:Align_xstrlen = 3

" .vim/plugin/surround.vim
autocmd Filetype php let b:surround_45 = "<?php \r ?>"

" .vim/plugin/yanktmp.vim
" let g:yanktmp_file = '/home/seltsam/tmp/vimyanktmp'
" map <silent> sy :call YanktmpYank()<CR>
" map <silent> sp :call YanktmpPaste_p()<CR>
" map <silent> sP :call YanktmpPaste_P()<CR>

" .vim/plugin/fuzzyfinder.vim
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{},
  \                      'MruFile':{}, 'MruCmd':{}, 'Bookmark':{},
  \                      'Tag':{}, 'TaggedFile':{},
  \                      'GivenFile':{}, 'GivenDir':{},
  \                      'CallbackFile':{}, 'CallbackItem':{}, }
let g:FuzzyFinderOptions.Base.ignore_case = 1
let g:FuzzyFinderOptions.Base.abbrev_map  = {
  \ }
nmap bg :FuzzyFinderBuffer<CR>
nmap bG :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nmap gb :FuzzyFinderFile<CR>
nmap br :FuzzyFinderMruFile<CR>

" .vim/ftplugin/svn.vim
"  autocmd Filetype svn :filetype plugin on


" .vim/plugin/errormaker.vim
:let loaded_errormarker = 1

" .vim/plugin/yankring.vim
nmap ,y :YRShow<CR>
