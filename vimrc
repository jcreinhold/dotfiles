"	File: .vimrc
"	Version: 4
"	Author: Jacob Reinhold

"	use Vim settings
    set nocompatible
    filetype off

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

"   make latex files
    nmap \pp :silent execute "!latexmk -lualatex -latexoption='--shell-escape' %"  \| :redraw!<CR>
    nmap \oo :silent execute "!latexmk -xelatex -latexoption='--shell-escape' %"  \| :redraw!<CR>

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

"   line width restriction (highlight past col 120)
    augroup vimrc_autocmds
        autocmd!
        autocmd FileType python highlight Excess ctermbg=Blue guibg=Blue
        autocmd FileType python match Excess /\%120v.*/
        autocmd FileType python set nowrap
        augroup END

    let g:tex_flavor = "latex"

" syntax stuff for python
au Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80

" syntax highlighting for odd extensions
au BufNewFile,BufRead *.cls set filetype=tex
au Filetype plaintex,tex,latex setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80

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
