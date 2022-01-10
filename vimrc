" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Congirgure Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-powerline'
Plugin 'airblade/vim-gitgutter'

" Solidity
Plugin 'tomlion/vim-solidity'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'

" TLA+
Plugin 'hwayne/tla.vim'

" C/C++
Plugin 'bfrg/vim-cpp-modern'
" Plugin 'justmao945/vim-clang'
" Plugin 'Rip-Rip/clang_complete'

" Swift
Plugin 'keith/swift.vim'

" NuSMV
Plugin 'wannesm/wmnusmv.vim'

Plugin 'Townk/vim-autoclose'

" Tamarin
Plugin 'tamarin-prover/editors'

" TOML
Plugin 'cespare/vim-toml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ========================================================

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  set nocp

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Custom!!!! by hst

" Set Background
set background=dark

" Enable syntax highlight
syntax enable

" Show line number
set nu

" Show matching bracets
set showmatch

" Basic editing options
set expandtab
set shiftwidth=4

au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4

set smarttab
set lbr
set tw=0

" Auto indent
set ai

" Smart indet
set si

" C-style indeting
set cindent
set smartindent

" Wrap lines
set wrap

" Set color scheme molokaia
" colorscheme molokai
" let g:molokai_original = 1

" Set color scheme
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 0

" Solarized Colorscheme
" let g:solarized_termcolors=256

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Taglist.vim
map <F8> :TagbarToggle<CR>
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
  endif
endif

" Set Tabstop
set tabstop=4
set softtabstop=4

" Set Underline
set cursorline

" Set Ruler
set ruler
set colorcolumn=80

" Set indent guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" Set YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Don't ask when starting Vim
" let g:ycm_confirm_extra_conf = 0

" clang_complete
" if has("unix")
" let s:uname = system("uname -s")
"   if s:uname == "Darwin\n"
"     let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"   elseif s:uname == "Linux\n"
"     let g:clang_library_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
"   endif
" endif

" vim-clang
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" PRISM syntax highlight
au BufRead,BufNewFile *.prism setfiletype prismmodel
au BufRead,BufNewFile *.[pns]m setfiletype prismmodel
au BufRead,BufNewFile *.smg setfiletype prismmodel
au BufRead,BufNewFile *.props setfiletype prismproperty
au BufRead,BufNewFile *.pctl setfiletype prismproperty

