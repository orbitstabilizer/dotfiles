let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim/lua/user/extras
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.config/nvim/kickstart-python.lua
badd +20 ~/.config/nvim/init.lua
badd +1 ~/.config/nvim/lua/user/conform.lua
badd +21 ~/.config/nvim/lua/user/keymaps.lua
badd +50 ~/.config/nvim/lua/user/lspconfig.lua
badd +47 ~/.config/nvim/luasnippets/cpp.lua
badd +4 neoscroll.lua
badd +2 kickstart-python.lua
badd +4 ~/.config/nvim/luasnippets/lua.lua
badd +48 ~/.config/nvim/lua/user/cmp.lua
argglobal
%argdel
$argadd ~/.config/nvim/kickstart-python.lua
edit ~/.config/nvim/kickstart-python.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 152 + 153) / 306)
exe 'vert 2resize ' . ((&columns * 153 + 153) / 306)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
1,7fold
10,45fold
53,67fold
52,68fold
74,108fold
let &fdl = &fdl
52
normal! zo
let s:l = 405 - ((44 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 405
normal! 016|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/kickstart-python.lua", ":p")) | buffer ~/.config/nvim/kickstart-python.lua | else | edit ~/.config/nvim/kickstart-python.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/kickstart-python.lua
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
1,7fold
10,45fold
53,67fold
52,68fold
74,108fold
let &fdl = &fdl
52
normal! zo
let s:l = 405 - ((44 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 405
normal! 016|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 152 + 153) / 306)
exe 'vert 2resize ' . ((&columns * 153 + 153) / 306)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
