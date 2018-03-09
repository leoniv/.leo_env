" ================ Localization ================

if has('win32') || has('win64') || has('win32unix')
  set keymap=russian-jcukenwin
else
  set keymap=russian-jcuken
endif
set iminsert=0
set imsearch=0

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" ================ Spelling ================

"setlocal spell spelllang=ru_yo,en_us
set wildmenu
set wcm=<Tab>

menu SetSpell.on  :setlocal spl=ru_yo,en_us spell<CR>
menu SetSpell.off :setlocal nospell<CR>
map <F7> :emenu SetSpell.<Tab>
" выбор альтернатив:
map <F8> z=<CR>
map <F5> ]s
map <S-F5> [s
map <F9> zG
map <S-F9> zuG
