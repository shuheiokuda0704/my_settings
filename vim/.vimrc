" Basic settings.
filetype plugin indent on
syntax enable

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
