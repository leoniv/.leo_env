set nocompatible

function s:LoadVimrcBefore()
  if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
  endif
endfunction
call s:LoadVimrcBefore()

function s:SetGeneralOptions()
  let g:mapleader=","
  set number                      "Line numbers are good
  set backspace=indent,eol,start  "Allow backspace in insert mode
  set history=1000                "Store lots of :cmdline history
  set showcmd                     "Show incomplete cmds down the bottom
  set showmode                    "Show current mode down the bottom
  set gcr=a:blinkon0              "Disable cursor blink
  set visualbell                  "No sounds
  set autoread                    "Reload files changed outside vim
  " This makes vim act like all other editors, buffers can
  " exist in the background without being in a window.
  " http://items.sjbach.com/319/configuring-vim-right
  set hidden
  syntax on "turn on syntax highlighting
endfunction
call s:SetGeneralOptions()

function s:LoadPlugins()
  if filereadable(expand("~/.vim/plug.vim"))
    source ~/.vim/plug.vim
  endif
endfunction
call s:LoadPlugins()

function s:SetSwapTurnOff()
  set noswapfile
  set nobackup
  set nowb
endfunction
call s:SetSwapTurnOff()

" Keep undo history across sessions, by storing in file.
" Only works all the time.
function s:SetPersistentUndo()
  if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 1>&1
    set undodir=~/.vim/backups
    set undofile
  endif
endfunction
call s:SetPersistentUndo()

function s:SetIndentation()
  set autoindent
  set smartindent
  set smarttab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
endfunction
call s:SetIndentation()

function! MyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction

function s:SetFolding()
  set foldmethod=syntax   "syntax may be very slow!
  set foldnestmax=10      "deepest fold is 10 levels
  set foldlevelstart=1
  set foldenable          "dont fold by default
  " Space to toggle folds.
  nnoremap <space> za
  vnoremap <space> za
  nnoremap <leader>z zMzvzz
  nnoremap zO zCzO
  set foldtext=MyFoldText()
endfunction
call s:SetFolding()

function s:SetCompletion()
  set wildmode=list:longest
  set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
  set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
  set wildignore+=*vim/backups*
  set wildignore+=*sass-cache*
  set wildignore+=*DS_Store*
  set wildignore+=vendor/rails/**
  set wildignore+=vendor/cache/**
  set wildignore+=*.gem
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpg,*.gif
endfunction
call s:SetCompletion()

function s:SetScrolling()
  set scrolloff=8         "Start scrolling when we're 8 lines away from margins
  set sidescrolloff=15
  set sidescroll=1
endfunction
call s:SetScrolling()

function s:SetSearch()
  set incsearch       " Find the next match as we type the search
  set hlsearch        " Highlight searches by default
  set ignorecase      " Ignore case when searching...
  set smartcase       " ...unless we type a capital
  nnoremap / /\v
  vnoremap / /\v
  " Searching Don't jump when using * && # for search
  nnoremap * *<c-o>
  nnoremap # *<c-o>
endfunction
call s:SetSearch()

function s:SetApprearance()
  set wrap
  set linebreak
  set textwidth=80
  if exists('+colorcolumn')
    set colorcolumn=+1
  endif
endfunction
call s:SetApprearance()

function s:SetShowHiddenChars()
  set list listchars=tab:▸\ ,eol:¬,precedes:«,extends:»,trail:␣
  set showbreak=↪
  " Only shown when not in insert mode so I don't go insane.
  augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
  augroup END
endfunction
call s:SetShowHiddenChars()

function s:SetEasyWindowsNavigation()
  noremap <C-h> <C-w>h
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
endfunction
call s:SetEasyWindowsNavigation()

function s:SetEasySplit()
  nnoremap <leader>v <C-w>v<C-w>l
  nnoremap <leader>h <C-w>s<C-w>j
endfunction
call s:SetEasySplit()

function s:SetReselectVisualBlockAfterIndent()
  vnoremap < <gv
  vnoremap > >gv
endfunction
call s:SetReselectVisualBlockAfterIndent()

function s:SetEasyBubbingLines()
  nmap <C-Up> [e
  nmap <C-Down> ]e
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
endfunction
call s:SetEasyBubbingLines()

function s:SetEasyResizeWindow()
  nnoremap <A-Up> <C-w>+
  nnoremap <A-Down> <C-w>-
  nnoremap <A-Left> <C-w><
  nnoremap <A-Right> <C-w>>
endfunction
call s:SetEasyResizeWindow()

function s:SetTabNavigationMapping() abort
  nnoremap <C-t>     :tabnew<CR>
  nnoremap <C-x>     :tabclose<CR>
  inoremap <C-t>     <Esc>:tabnew<CR>
  inoremap <C-x>     :tabclose<CR>
endfunction
call s:SetTabNavigationMapping()

function s:LoadPluginSettings()
  so ~/.vim/settings.vim
endfunction
call s:LoadPluginSettings()

