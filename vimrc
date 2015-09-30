"	File: .vimrc
"	Version: 4
"	Author: Jacob Reinhold

"	use Vim settings
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    syntax on
    
    Bundle 'gmarik/vundle'
    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
    Bundle 'tpope/vim-fugitive'
    Bundle 'scrooloose/nerdtree'
    Bundle 'klen/python-mode'
    Bundle 'rizzatti/dash.vim'
    Bundle 'xuhdev/vim-latex-live-preview'

    filetype plugin indent on

"	indenting settings
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set expandtab
    set autoindent

"   show line number
    set number

"   show cmd in bottom bar
    set showcmd

"   highlight current line
    set cursorline

"	select when using mouse
    set selectmode=mouse

"	backup
    set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set writebackup

"   disk write settings
    set updatetime=1000

"   folding
    set foldenable
    set foldlevelstart=10
    set foldnestmax=10
    nnoremap <space> za
    set foldmethod=indent

"	display current mode
    set showmode

"	allow backspacing in insert
    set backspace=indent,eol,start

"	silent
    set noerrorbells

"	remap ;; to escape
    inoremap ;; <Esc>

"   remap \pp to latex live-preview
    nmap \pp :LLPStartPreview<CR>

"	Searching
    set incsearch
    set hlsearch
"   turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

"	ignore case in search
    set ignorecase

"   word wrap default off
    set nowrap

"   show matching part for [] {} ()
    set showmatch
    
"   enable all Python syntax highlighting features
    let python_highlight_all = 1

"   line width restriction (highlight past col 120)
    augroup vimrc_autocmds
        autocmd!
        autocmd FileType python highlight Excess ctermbg=Blue guibg=Blue
        autocmd FileType python match Excess /\%120v.*/
        autocmd FileType python set nowrap
        augroup END

"Python-mode
"  Activate rope
"  Keys:
"  K             Show python docs
"  <Ctrl-Space>  Rope autocomplete
"  <Ctrl-c>g     Rope goto definition
"  <Ctrl-c>d     Rope show documentation
"  <Ctrl-c>f     Rope find occurrences
"  <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"  [[            Jump on previous class or function (normal, visual, operator modes)
"  ]]            Jump on next class or function (normal, visual, operator modes)
"  [M            Jump on previous class or method (normal, visual, operator modes)
"  ]M            Jump on next class or method (normal, visual, operator modes)
    let g:pymode_rope = 1
    
"   Documentation
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'
    
"   Linting
    let g:pymode_lint = 1
    let g:pymode_lint_checker = "pyflakes,pep8"
"   Auto check on save
    let g:pymode_lint_write = 1
    
"   Support virtualenv
    let g:pymode_virtualenv = 1
  
"   Enable breakpoints plugin
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    
"   syntax highlighting
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all
    
"   Don't autofold code
    let g:pymode_folding = 0

"   nerdtree setup
    nmap <F2> :NERDTreeToggle<CR>

"   powerline setup
    set guifont=Inconsolata\ for\ Powerline\:h15
    set laststatus=2

"   latex live preview
    let g:livepreview_previewer = 'evince'
