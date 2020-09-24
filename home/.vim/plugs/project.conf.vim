function s:SetVimSessionParams() abort
  " Bundle "xolox/vim-session"
  :let g:session_autosave = 'no'
  :let g:session_autoload = 'no'
endfunction
call s:SetVimSessionParams()

function s:SetNerdTreeParams()
  let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '~',
      \ "Unknown"   : "?"
      \ }
  map <C-n> :NERDTreeToggle<CR>
  let g:NERDTreeGitStatusShowIgnored= 1
  let g:NERDTreeSortHiddenFirst = 1
  let g:NERDTreeShowHidden = 1
endfunction
call s:SetNerdTreeParams()

function s:SetNerdTreeAutoOpen() abort
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1
    \ && isdirectory(argv()[0])
    \ && !exists("s:std_in")
    \ | exe 'NERDTree' argv()[0]
    \ | wincmd p
    \ | ene
    \ | exe 'cd '.argv()[0]
    \ | endif
endfunction
call s:SetNerdTreeAutoOpen()

function s:SetNerdTreeNotLockExitVim() abort
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction
call s:SetNerdTreeNotLockExitVim()

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('xml', 'Yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('java', 'Magenta', 'none', '#ff00ff', '#151515')


