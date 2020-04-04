" Basic settings.
filetype off
syntax enable

" Setup dein and plugins.
" Reference: https://github.com/JunichiIto/dotfiles/blob/c8f5231562c502557729b2e296f0f6b8dd59c5ca/.vimrc

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('Shougo/neomru.vim')
" ファイルをtree表示してくれる
call dein#add('scrooloose/nerdtree')
" Gitを便利に使う
call dein#add('tpope/vim-fugitive')

" Rails向けのコマンドを提供する
call dein#add('tpope/vim-rails')
" Ruby向けにendを自動挿入してくれる
call dein#add('tpope/vim-endwise')

" コメントON/OFFを手軽に実行
call dein#add('tomtom/tcomment_vim')
" シングルクオートとダブルクオートの入れ替え等
call dein#add('tpope/vim-surround')

" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" ログファイルを色づけしてくれる
call dein#add('vim-scripts/AnsiEsc.vim')
" 行末の半角スペースを可視化(うまく動かない？)
call dein#add('bronson/vim-trailing-whitespace')
" less用のsyntaxハイライト
call dein#add('KohPoll/vim-less')

" RubyMineのように自動保存する
call dein#add('907th/vim-auto-save')
let g:auto_save = 1

" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利

call dein#end()

filetype plugin indent on

" Settings of the encoding to use for a save and reading.
set encoding=utf-8

" Auto reload if file is changed.
set autoread

" Turn off swap files.
set nobackup
set noswapfile
set noundofile

" Don't redraw during macro execution.
set lazyredraw

" Optimize for fast terminal connections.
set ttyfast

" Ignore the case of normal letters.
set ignorecase

" If the search pattern contains upper case characters, override ignorecase option.
set smartcase

" Enable incremental search.
set incsearch

" Highlight search result.
set hlsearch

" Show line number.
set number

" Show <TAB> and <CR>.
set list

" Don't wrap long line.
set nowrap

" Always display statusline.
set laststatus=2

" Show command on statusline.
set showcmd

" Show title.
set title

" Show line and column display.
set ruler

" Display double-width symbols properly.
set ambiwidth=double

" Enable wildmode.
set wildmenu
set wildmode=list:longest,full

" Exchange tab to spaces.
set expandtab

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight parenthesis.
set showmatch

" Ignore case on insert completion.
set infercase

" Enable auto indent.
set autoindent

" Enable smart indent.
set smartindent

" Substitute <Tab> with blanks.
set tabstop=2

" Spaces instead <Tab>.
set softtabstop=0

" Auto indent width.
set shiftwidth=2

" Stop syntax highlight of too long lines
set synmaxcol=160

" Addional settings from by jnchito
" https://github.com/JunichiIto/dotfiles/blob/c8f5231562c502557729b2e296f0f6b8dd59c5ca/.vimrc
" Define tagfile
set tags=~/.tags

" コマンドラインに使われる画面上の行数
set cmdheight=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" 暗い背景色に合わせた配色にする
" set background=dark

" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" カラースキーマの指定
" colorscheme desert

" 行番号の色
highlight LineNr ctermfg=darkyellow

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" End setting of jnchito

augroup AutoRemoveTrailingSpaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

augroup AutoReplaceTabBySpaces
  autocmd!
  autocmd BufWritePre * :%s/\t/  /ge
augroup END

augroup AutoCommentOff
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
