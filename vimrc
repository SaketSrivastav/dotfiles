" .vimrc
"--------------------------------------------------------------------------
" This is an example .vimrc with several configurables. simply remove
" the quotation mark at the beginning of a line to enable the feature.
"
" VERSION
"  0.1   2005.07.19 / Creation.

"Installing extra plugins
call pathogen#infect()
call pathogen#helptags()

" Set Mapleader
let mapleader=","

" Faster moving to Escape
inoremap jj <Esc>

" Performace settings
set lazyredraw
set ttyfast

"--------------------------------------------------------------------------
"behave mswin
"--------------------------------------------------------------------------
"  VI and mouse support
"--------------------------------------------------------------------------
" Configure vi to be aware of the mouse in an xterm.
" this will act similar to gvim for mouse support, but without all the gui.
if &term =~ "screen" || &term =~ "xterm"
  if has("terminfo")
     set mouse=a
     set t_Co=256
     set t_Sf=[3%p1%dm
     set t_Sb=[4%p1%dm
     set ttymouse=xterm2
  else
    set mouse=a
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
    set ttymouse=xterm2
  endif
endif

"--------------------------------------------------------------------------
" Clipboard to system clipboard.
"--------------------------------------------------------------------------
" behave mswin
if has('gui_running')
    set clipboard+=unnamed
else
    " set clipboard=unnamed,unnamedplus
    set clipboard=unnamed
endif

"--------------------------------------------------------------------------
" Syntax highlighting, specify 'off' to disable.
"--------------------------------------------------------------------------
" Turn Syntax highlighting on
syntax on

"---------------------------------------------------------------------------
" plugin file type enabling on startup (see omnicppcomplete)
"---------------------------------------------------------------------------
filetype plugin on

"--------------------------------------------------------------------------
" Syntax highlighting color scheme (for c/c++):
"--------------------------------------------------------------------------
if has('gui_running')
    set background=light
else
    set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Colorschemes "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""" Molokai """""""""""""
"let g:molokai_original = 1
":colorscheme molokai 

""""""""" Solarized """"""""""""
if has('gui_running')
     " do something
      let t_Co=256
      let g:solarized_termcolors=256
else
    let t_Co=256
    let g:solarized_termcolors=256
    " let t_Co=16
    " let g:solarized_termcolors=16
endif
":colorscheme solarized

":colorscheme wombat256
:colorscheme predawn

"--------------------------------------------------------------------------
" Syntax specifics
"--------------------------------------------------------------------------
" autoindent - auto indent, when indented stay indented.
" set autoindent
set autoindent

" cindent    - indent according to c standards
" set cindent
set cindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"--------------------------------------------------------------------------
" Title specifics
"--------------------------------------------------------------------------
" title      - change the title of the window
if has("gui_running")
  set title
  " guioptions -- what options are shown in the gui.
  "             - a -- copy all highlighted text to 'windows' copy buffer
  "             - c -- use console options, instead of dialog boxes
  set guioptions+=ac
else
  set notitle
endif

" titlestring - what to display in the title 
"               not specifying a titlestring, will default to file + diry.
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

"--------------------------------------------------------------------------
"  Turn on line-numbering
"--------------------------------------------------------------------------
" number     - display line numbers
" set nonumber
set number

"--------------------------------------------------------------------------
" Coding standards
"--------------------------------------------------------------------------
" shiftwidth - number of spaces to use for each step of indent.
set shiftwidth=4
" tabstop    - number of spaces the tab key will use
set tabstop=4
" expandtab  - convert the tab character to spaces
set expandtab

"--------------------------------------------------------------------------
" Searching features
"--------------------------------------------------------------------------
" ignorecase - ignores case when searching (ie. e=E)
" set noignorecase
set ignorecase   

" incsearch  - incremental search, as you type it finds partial matches
" set noincsearch
set incsearch

" hlsearch   - highlight search, highlight all matching text
" set nohlsearch
set hlsearch

"--------------------------------------------------------------------------
" backup files
"--------------------------------------------------------------------------
" backup     - turn on backups, files are backed when modified
" set backup
" set nobackup
set backupdir=~/tmp
"--------------------------------------------------------------------------
" Editing preferences
"--------------------------------------------------------------------------
" backspace  - make backspace overwrite contents in edit mode.
" set backspace=0
" set backspace=1
set backspace=2

" columns    - number of columns on the screen
" -- NOTE: This line has a BUG with konsole sessions. The window screws up!
"set columns=88

" cmdheight  - number of lines in the command-line 
" set cmdheight=2
set cmdheight=1

" errorbells - ring the bell (beep or flash screen) for error messages
" set noerrorbells
set errorbells

" hidden     - keep files (not shown in a buffer) loaded.
" set nohidden
set hidden

" icon       - display name of file or 'iconstring' when window is
"              iconified.
" set noicon
" set iconstring
set icon

" insertmode - set to configure vim to be modeless (simply start typing!)
" set insertmode
set noinsertmode

" laststatus - does the last window have a status line?
"            - 0 = never, 1 = only >1 windows, 2 always
set laststatus=2

" path - a list of directories to search when looking for files using
"        find, or gf
set path+=./**;

" ruler      - show line and column number
" set noruler
set ruler

" shell      - what shell to use
if has("win32")
    set shell=c:\bin\bash
else
    "set shell=/bin/bash
    set shell=/bin/zsh
endif

" showcmd    - show command
"            - shows number of characters highlighted
"            - shows number of lines, or
"            - shows block (lines x columns)
" set noshowcmd
set showcmd 

" showmatch  - show matching brackets
" set noshowmatch
set showmatch

" showmode   - shows mode VI is in, INSERT, VISUAL, etc. 
" set noshowmode
set showmode

" sidescroll - minimum number of columns to scroll horizontally.
" set sidescroll=0
set sidescroll=1

" visualbell - flash screen instead of beeping on errors.
set   visualbell

" whichwrap  - left/right arrows will move across lines
set whichwrap=31

" wrap       - wrap long lines within window
"set wrap
"set nowrap

" wrapscan   - when searching, continue at top of file
" set nowrapscan
set   wrapscan

" autoread   - if file has been modified by an outside influence,
"              re-read the file
set   autoread

" cpoptions  - compatibility options
"            - default is aABceFs
"            - W is used to block overwriting of read-only files
"                 (ie.  w! is blocked)
set cpoptions+=W

" mousefocus - focus follows mouse in windows
"            - becareful with this one when using menu'd gvim.
" set mousefocus    " focus follows mouse in windows

" format options
" textwidth -- autowrap at this many characters.
set textwidth=80
set fo=cqwan
" set fo=qwan

" Vim 7.0 Features --START--
" cursorline - highlight the current line containing the cursor.
" set nocursorline
set cursorline

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" PANOS specific settings
let diry=getcwd()
let g:PANOS_BASE = matchstr(diry, ".*panos")
if (g:PANOS_BASE == "")
    let g:PANOS_BASE = "$HOME/ws/panos"
endif
let &tags=g:PANOS_BASE . "/mibs.tag," . g:PANOS_BASE . "/tags"

" Dispatch settings
if (exists('g:loaded_dispatch'))
    " Fix a bug with tmux-2.3 and vim-dispatch (note the trailing space)
    "
    " https://github.com/tpope/vim-dispatch/issues/192
    set shellpipe=2>&1\|\ tee\ 
    nnoremap <F7> :Dispatch mk cpm i386<CR>
    setl errorformat+=%+G%.%#
    " let g:compiler_gcc_ignore_unmatched_lines = 1
    " if exists('g:compiler_gcc_ignore_unmatched_lines')
    "     setl errorformat+=%-G%.%#
    " endif
endif
nnoremap <leader>ro :windo wincmd H<CR>

" CSCOPE
" -----------------------------------------------
"  Must set the environment variable PANOS_BASE because cs add
"  doesn't know how to read in vim variables?
let $PANOS_BASE = g:PANOS_BASE
if filereadable(g:PANOS_BASE . "/cscope.out")
    let g:CSCOPE=1
"    :cs add $PANOS_BASE
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:set csto=1
:set cscopetag

" Assume bash shell for parsing purposes
let g:is_bash = 1

"--------------------------------------------------------------------------
" Maps 
"--------------------------------------------------------------------------
" mym -- perform a vertical split between <file> and my.<file>
"map mym   :vert diffsplit my.%<CR>

" dup -- copy current buffer <file> to my.<file>
"map dup   :!cp % my.%<CR>

" F8 -- map F8 key to run taglist plugin.
" nnoremap <silent> <F8> :Tlist<CR>

vnoremap ( s()<Esc>P<Right>
vnoremap [ s[]<Esc>P<Right>
vnoremap { s{}<Esc>P<Right>
vnoremap " s""<Esc>P<Right>
vnoremap ' s''<Esc>P<Right>
nmap yw yiw
vmap w  iw

" Sort the include list:
nnoremap #sort :silent !/usr/local/timostools/reorderincludes.pl %<CR>
"noremap newmac \ :/--End/-1<CR>o<Esc>"*p<Esc><bar>
"         \ :.;/--End/-1s@\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\)@\=printf("    {0x%s, 0x%s, 0x%s, 0x%s, 0x%s, 0x%s}, // Kanata %s",toupper(submatch(6)), toupper(submatch(5)), toupper(submatch(4)), toupper(submatch(3)),toupper(submatch(2)), toupper(submatch(1)), strftime("%B %d, %Y"))@<CR><bar>
"         \ :/--Begin/+1;/--End/-1sort u<CR> <bar>
"         \ :nohl<CR> <bar>

" gvim -c 'let @m=""' -c 'for line in readfile("tmp.txt", "") | let @m .= 
" line."\n" | endfor'         

" PDF files in VIM
:autocmd BufReadPre  *.pdf set ro
:autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk '%' - |fmt -csw78
" END PDF
"
" Turn on Spell-Checker
":set spell spelllang=en_us
:autocmd BufNewFile,BufReadPost * 
  \  if &buftype != ''
        \ | setlocal nospell 
        \ | silent! iunmap [
        \ | silent! iunmap {
        \ | silent! iunmap (
        \ | silent! iunmap '
        \ | silent! iunmap "
  \ | endif

let g:S=0  "result in global variable S
function! Sum(number)
  let g:S=g:S+a:number
  return a:number
endfunction
function! InitSum()
  let g:S=0
endfunction

" Ctags function helper
let g:ctags_path="/usr/bin/ctags"
let g:ctags_statusline=1
let g:generate_tags=1

" ChangesPlugin
"let g:changes_autocmd=1  " Automatically update diff status
let g:changes_verbose=0  " Don't show the meaning of +/-/*



" omniCppComplete helpers
" completion using control-tab
" MAKE SURE TO READ: :h omnicppcomplete
" We need the following 'options' for CTAGS for this to work properly:
" --c++-kinds=+p
" --fields=+iaS
" --extra=+q
"  -B                  # Search backwards?
" Do we want the -I option too for MACROS?
" Put this in ~/.ctags
imap <C-Tab> <C-X><C-O>

" MIB Syntax Highlighting:
"
"autocmd BufNewFile,BufRead *.mib
"  \   set spelllang=en,$HOME/tmp/mib.spl 
"  \ | set spell

let $mibtag=g:PANOS_BASE . "/make/mibtags.pl"
"nnoremap <F9> :!$mibtag      -d -o $HOME/tmp/mib.dic<CR><bar>:silent mkspell! 
"$HOME/tmp/mib.spl $HOME/tmp/mib.dic<CR>
"nnoremap <silent> <F9>   :!$mibtag -m %:p -d -o 
"$HOME/tmp/mib.dic<CR><bar>:silent mkspell! $HOME/tmp/mib.spl 
"$HOME/tmp/mib.dic<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          My Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"VIMRC AutoReload
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Default VIM to split right instead of left
set splitright

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.mib setlocal textwidth=80

"Force quickfix to take full horzintal space
au FileType qf wincmd J

if has("cscope")
        "uncomment for linux
        set csprg=/usr/bin/cscope
        "uncomment for cygwin
        "set csprg=/usr/local/timostools/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("./cscope.out")
            execute "cs add ./cscope.out"
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb

        """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-@ *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif

"syntax on
filetype plugin indent on

"Taglist plugin Options
let Tlist_Use_Right_Window   = 0
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0

" " CCTree Plugin
" let CCTreeEnhancedSymbolProcessing = 1
" let g:CCTreeCscopeDb = g:PANOS_BASE . "/cscope.out"
" let g:CCTreeOrientation = "leftabove"
" let g:CCTreeUsePerl = 1
"let g:CCTreeLoadXRefDBFromDisk = g:PANOS_BASE . "/ccglue.out"
" let g:CCTreeDisplayMode = 1
" let g:CCTreeMinVisibleDepth = 1
" let g:CCTreeRecursiveDepth = 2
" let g:CCTreeHilightCallTree = 1
" let g:CCTreeWindowVertical = 1
"
"folding settings:
" za - toggles
" zc - closes
" zo - opens
" zR - open all
" zM - close all
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default`
set foldlevel=1         "this is just what i use
set noswapfile          "Personal setting to disallow creation of swap files.
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
augroup vimrc_autocmds
  autocmd BufEnter *.mib highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter *.mib match OverLength /\%81v.*/
augroup END

"  PyDiction allows tab auto-complete for python codes
let g:pydiction_location = '/home/saketkus/.vim/bundle/pydiction/complete-dict'

" Pretty XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" nmap <silent> <leader>x :PrettyXML<CR>
nnoremap <silent> <leader>X :%!xmllint --format %<CR>

" CTRL-P Plugin settings
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*/gen/*,*/deps/*,*/panos/bin/*,*/panos/objs/*,*.so,*.swp,*.zip,*.rej

" airline-vim
" let g:airline#extensions#tabline#enabled = 1
"let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1 
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

" Jedi VIM 
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = "1"

" Cscope_Quickfix
let g:Cscope_PopupMenu = 1

"Custom Font
" set guifont=Monospace\ 16
set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 14

" TMUX
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")

" tbone plugin
map <leader>txy :Tyank<cr>
map <leader>txp :Tput<cr>

" Mapping compilation command
"nnoremap <F12> :ConqueTermVSplit mk cpm i386<CR>

" Using Ag silver searcher
if executable('ag')
    " From Vimbits
    " set grepprg=ag\ -l\ -i\ --ignore-dir=^bin\ --ignore-dir="^obj"\ --ignore-dir="^deps"\ -G "*\.(h|c|mib)"\ --nogroup\ --nocolor\ -U\ -C\ 2 
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --ignore-dir=^bin\ --ignore-dir="^obj"\ --ignore-dir="^deps" 

    set grepformat=%f:%l:%c:%m,%f:%l:%m
    " Use grep for the word under the cursor
    " nnoremap <leader>f :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
    nnoremap <leader>f :execute "Ag " . expand("<cword>") <CR>

    " ctrl-p use ag for Searching
    let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Keep only current split
nnoremap <leader>o :only<CR>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf :vertical botright wincmd f<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Leader commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Replace word with previously yanked text
nnoremap <leader>R diw"0P

" auto format JSON File
nnoremap <leader>j :%!python -m json.tool<CR>

" Resize window vertical
nnoremap <leader>+ :10winc ><CR>
nnoremap <leader>- :10winc <<CR>

" Remove highlighting of previous search
nnoremap <leader><space> :nohl<CR>

" Move quickly to-from header source files
nnoremap <leader>a :A<CR>

" One less key to type
nnoremap ; :

" Save on losing focus
au FocusLost * :wa

" Copy Paste System Clipboard
vnoremap <leader>y "*y
nnoremap <leader>pp :set paste<CR>o<esc>"+[p<CR> :set nopaste<CR> " paste from clipboard
vnoremap <leader>P "+P
nnoremap <leader>P "+P
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Fast saving
nnoremap <leader>wq :wqall!<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>w :w!<cr>

" Vimrc fast loading and reloading
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
nnoremap <leader>cc :botright cwindow<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
autocmd QuickFixCmdPost *grep* cwindow

" Tab shortcuts
nnoremap <leader>to :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tp :tabnext<cr>
nnoremap <leader>tn :tabprev<cr>

" Avoids to hit Enter command in messages window
set shortmess=at

" Keep text selected after manual indentation
vnoremap < <gv
vnoremap > >gv

" pastetoggle
set pastetoggle=<F2>

" hint to keep lines short
" if exists('+colorcolumn')
"       set colorcolumn=80
" endif

" NERDTree Shortcuts
map <leader>nr :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>

" Rainbow
let g:rainbow_active = 1

" Gundo Mappings
nnoremap <F5> :GundoToggle<CR>

" Insert blank lines without going to insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" Git commands
nnoremap <leader>gs :Gstatus<cr><c-w>k<c-w>K<c-w>p
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gff :Git fetch official<CR>
nnoremap <leader>gfo :Git fetch origin<CR>

" Diff buffers
nnoremap <leader>db :windo diffthis<CR>
nnoremap <leader>dbo :windo diffoff<CR>

" shortcuts to vimdiff
" reference: https://github.com/guns/xterm-color-table.vim
highlight diffAdded ctermbg=22 ctermfg=46 cterm=bold
highlight diffRemoved ctermbg=52 ctermfg=9 cterm=bold
if &diff
    nmap <leader>2 :diffget //2<CR>
    nmap <leader>1 :diffget BASE<CR>
    nmap <leader>3 :diffget //3<CR>
    nmap <leader>uu :diffupdate<CR>
    nnoremap <leader>l ]c
    nnoremap <leader>k [c
endif

" Vim diff buffers

" Merginal
nnoremap <leader>m :Merginal<CR>
nnoremap <leader>ml :MerginalToggle<CR>


" Scratch
nnoremap <leader>s :Scratch<CR>
nnoremap <leader>sp :ScratchPreview<CR>
let g:scratch_persistence_file = '.scratch.vim'

nmap <F8> :TagbarToggle<CR>

" Vim-Go

let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1

" Could affect Vim performance if made 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 0
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_generate_tags = 1

" Shows markers to errors after every save of file, 0 = off
let g:go_fmt_fail_silently = 0

" Metalinter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

augroup go
    autocmd!
    " Shows only fucntion signature
    autocmd FileType go nmap <leader>i  <Plug>(go-info)
    " Build
    autocmd FileType go nmap <leader>b  <Plug>(go-build)
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    " :GoDef but opens in a vertical split
    autocmd FileType go nmap <leader>v <Plug>(go-def-vertical)
    " :GoDef but opens in a horizontal split
    autocmd FileType go nmap <leader>s <Plug>(go-def-split)
    " GoDescribe
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    " GoImplements
    autocmd FileType go nmap <leader>I <Plug>(go-implements)
    " :GoAlternate  commands :A, :AV, :AS and :AT
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    autocmd FileType go nnoremap <leader>a :A<CR>
    autocmd FileType go nnoremap <leader>av :AV<CR>
augroup END

" Vim-go config ends


" Vim Gitv
noremap <leader>gv :Gitv --all<cr>
noremap <leader>gV :Gitv! --all<cr>
vnoremap <leader>gV :Gitv! --all<cr>

" g:Gitv_OpenHorizontal {0, 1, auto}
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_OpenPreviewOnLaunch = 1

" My Vim Functions
fun! g:upd_br()
   let work_dir = fugitive#buffer().repo().tree() 
   echom work_dir
   let cmd_args = '--decorate --graph --oneline'
   let git_cmd = fugitive#buffer().repo().git_command('fetch official')
   echom git_cmd
   let result = system(git_cmd)
endf
