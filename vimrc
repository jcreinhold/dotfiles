"	File: .vimrc
"	Version: 4
"	Author: Jacob Reinhold

"	use Vim settings
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()

    Bundle 'gmarik/vundle'
    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
    Bundle 'tpope/vim-fugitive'
    Bundle 'scrooloose/nerdtree'
    Bundle 'klen/python-mode'
    Bundle 'rizzatti/dash.vim'
    "Bundle 'xuhdev/vim-latex-live-preview'
    "Bundle 'Raimondi/delimitMate'
    Bundle 'jiangmiao/auto-pairs'
    Bundle 'kien/rainbow_parentheses.vim'
    Bundle 'Shougo/neocomplete.vim'
    Bundle 'Shougo/neoyank.vim'
    Bundle 'Shougo/unite.vim'
    Bundle 'rstacruz/vim-fastunite'
    Bundle 'ervandew/supertab'
    Bundle 'Konfekt/FastFold'
    Bundle 'Sirver/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'reedes/vim-pencil'
    Bundle 'davidhalter/jedi-vim'

    " Better vim navigation.
    Bundle 'kshenoy/vim-signature'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-commentary'
    call vundle#end()
    filetype plugin indent on

    syntax on

"	indenting settings
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set expandtab
    "set autoindent

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

    set t_Co=256

"   disk write settings
"    set updatetime=2000

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
"    inoremap ;; <Esc>

"   remap \pp to latex live-preview
"    nmap \pp :LLPStartPreview<CR>
"    keep old command because use to it
    "nmap \pp :silent execute "!latexmk -lualatex -quiet % && latexmk -c -quiet"  \| :redraw!<CR>
    nmap \pp :silent execute "!latexmk -lualatex %"  \| :redraw!<CR>

"	Searching
    set incsearch
    set hlsearch

"   This unsets the "last search pattern" register by hitting return
    nnoremap <CR> :noh<CR><CR>

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

    let g:tex_flavor = "latex"
"   latex live preview
"    let g:livepreview_previewer = 'open -a Preview'
"    let g:Tex_DefaultTargetFormat='pdf'
"    let g:Tex_MultipleCompileFormats='pdf'


    let g:UltiSnipsUsePythonVersion = 3 
    "let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<CR>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NeoComplete bindings.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define Dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default':    '',
  \ }

" Tab completion.
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
      endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() :"\<CR>"

" Omnicompletion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" }}}    

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
augroup END

au Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80

" syntax highlighting for odd extensions
au BufNewFile,BufRead *.cls set filetype=tex
au Filetype plaintex,tex,latex setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80

" rainbowparens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Unite bindings.
nnoremap <C-p> :Unite file_rec/async -start-insert -no-split<CR>
nnoremap <space>/ :Unite grep:. -no-split<CR>
nnoremap <C-y> :Unite history/yank<CR> " masks scroll up motion.
nnoremap <C-e> :Unite -quick-match buffer -no-split<CR>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" supertab direction fixes
let g:SuperTabDefaultCompletionType = "<c-n>"

" emphasize current splits.
set colorcolumn=81 cul " on startup, since below is on WinEnter.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=81 cul
    autocmd WinLeave * set colorcolumn=0  nocul
augroup END

" still need 256 colors, assumes black background
highlight ColorColumn ctermbg=DarkGray" Grey7
"highlight CursorLine ctermbg=DarkGray" Grey7

" Setting mark column color.
highlight SignColumn ctermbg=0
