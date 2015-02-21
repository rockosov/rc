"---------------------------------------COMMON SETTINGS----------------------------------------------------------------
set number                          " Show line numbers
set numberwidth=4                   " Число цифр, выделенных для номеров строк
set backspace=indent,eol,start      " Для работы Backspace'а
:fixdel                             " Для работы клавиши Delete
set hlsearch                        " Подсветка поиска
set incsearch                       " Incremental search
set smartindent                     " Включение автоматических отступов
set autoindent                      " Включение автоматических отступов
set shiftwidth=4                    " Автоматический отступ при переходе на новую строку
set softtabstop=4                   " Количество пробелов в <Tab> или при использовании <BS>
set tabstop=4                       " Количество пробелов в <Tab>, используется для retab
set expandtab                       " Используем пробелы вместо <Tab>
set autochdir                       " Текущий каталоге всегда совпадает с содержимым активного окна
set mousehide                       " Прятать мышку во время ввода текста
set foldmethod=indent               " Делаем свертку по отступам
"set foldcolumn=1                    " Ширина колонки для отображения симоволов скрытия блоков кода
set cursorline                      " Подсветка строки, на которой находится курсор
"----------------------------------------------------------------------------------------------------------------------
if filereadable("/etc/vimrc")
       source /etc/vimrc
endif

"---------------------------------------------VUNDLE-------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Solarized Colorscheme for Vim
Plugin 'altercation/vim-colors-solarized'

" Plugin YouCompleteMe: a code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" Vim-airline
Plugin 'bling/vim-airline'

" Plugin 'Yggdroot/indentLine'
Plugin 'Yggdroot/indentLine'

" Plugin DirDiff
Plugin 'vim-scripts/DirDiff.vim'

" Plugin NERD Tree -- allows you to explore your filesystem and to open files
" and directories. It presents the filesystem to you in the form of a tree
" which you manipulate with the keyboard and/or mouse. It also allows you to
" perform simple filesystem operations.
Plugin 'scrooloose/nerdtree'

" Plugin Tabular -- aims to make the easy things easy and the hard things
" possible, without providing an unnecessarily obtuse interface
Plugin 'godlygeek/tabular'

" Plugin Neocomplete - is the abbreviation of "neo-completion with cache". It
" provides keyword completion system by maintaining a cache of keywords in the
" current buffer. neocomplete can be customized easily and has many more
" features than Vim's built-in completion.
Plugin 'Shougo/neocomplete'

" Plugin jedi-vim is a VIM binding to the autocompletion library Jedi.
Plugin 'davidhalter/jedi-vim'

" Plugin Vim Signify is a quite unobtrusive plugin. It uses signs to indicate
" added, modified and removed lines based on data of an underlying version
" control system.
Plugin 'mhinz/vim-signify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"----------------------------------------------------------------------------------------------------------------------

"---------------------------------------SOLARIZED COLORSCHEME----------------------------------------------------------
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"----------------------------------------------------------------------------------------------------------------------

"---------------------------------------SYNTAX HIGHLIGHTING------------------------------------------------------------
"If vim is in diff mode, than turn off syntax highlighting, otherwise turn on
syntax off
if !&diff
    syntax on
    syntax enable
endif
"Colorscheme is solarized dark
set background=dark
colorscheme solarized
"----------------------------------------------------------------------------------------------------------------------

"-------------------------------------------INDENT LINE----------------------------------------------------------------
let g:indentLine_setColors=1    "enable set colors
let g:indentLine_color_term=239 "for solarized dark base01 (comments)
"----------------------------------------------------------------------------------------------------------------------

set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1

au! Bufread,BufNewFile *.dml    set filetype=dml
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"---------------------------------------YOU COMPLETE ME----------------------------------------------------------------
" Now turn off plugin
let g:loaded_youcompleteme = 1
"----------------------------------------------------------------------------------------------------------------------

"---------------------------------------NEOCOMPLETE--------------------------------------------------------------------
" Use neocomplete
let g:neocomplete#enable_at_startup = 1

" Use smartcase
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ }

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings
" inoremap <expr><C-g> neocomplete#undo_completion()
" inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings
" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode
"inoremap <expr><Left>   neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right>  neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>     neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>   neocomplete#close_popup() . "\<Down>"
" Or set things
let g:neocomplete#enable_cursor_hold_i = 1
" Or set this
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" Search from neocomplete, omni candidates, vim keywords.
let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
"----------------------------------------------------------------------------------------------------------------------

"-----------------------------------------JEDI VIM---------------------------------------------------------------------
" Use Jedi-Vim for python completion
autocmd FileType python setlocal omnifunc=jedi#completions

" Turn off docstring window auto popup
autocmd FileType python setlocal completeopt-=preview

" I don't want Jedi autoinitialization
let g:jedi#auto_initialization = 0
"----------------------------------------------------------------------------------------------------------------------

"-----------------------------------------SIGNIFY----------------------------------------------------------------------
" Update signs when entering a buffer that was modified.
let g:signify_update_on_bufenter = 0

" VCS list
let g:signify_vcs_list = ['svn']

" Additionally trigger sign updates in normal or insert mode after 'updatetime'
" miliseconds without any keypresses. This fires only once between keypresses,
" thus not every 'updatetime' miliseconds.
let g:signify_cursorhold_insert = 1
let g:signify_cursorhold_normal = 1

" Update signs when Vim gains focus.
let g:signify_update_on_focusgained = 1

" Enable line highlighting in addition to using signs by default.
let g:signify_line_highlight = 0

" hunk jumping
nmap <leader>]c <plug>(signify-next-hunk)
nmap <leader>[c <plug>(signify-prev-hunk)
"----------------------------------------------------------------------------------------------------------------------

