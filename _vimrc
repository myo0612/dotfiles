:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

:set number

hi LineNr ctermbg=0 ctermfg=20
hi CursorLineNr ctermbg=4 ctermfg=255
set cursorline
hi clear CursorLine

nnoremap ts :sp 
nnoremap tv :vs 
nnoremap tt :tabnew 
nnoremap tn gt 
nnoremap tp gT 
nnoremap tw <C-w>w


autocmd QuickFixCmdPost *grep* cwindow

if has('vim_starting')
   " $B=i2s5/F0;~$N$_(Bruntimepath$B$K(Bneobundle$B$N%Q%9$r;XDj$9$k(B
      set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundle$B$r=i4|2=(B
call neobundle#begin(expand('~/.vim/bundle/'))


"
" $B%$%s%9%H!<%k$9$k%W%i%0%$%s$r$3$3$K5-=R(B
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler'
NeoBundle 'Lokaltog/vim-easymotion'
" smartcase
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 0

nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2) " surround.vim$B$H$+$V$k$N$G(B`z`
let g:EasyMotion_startofline=0
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_keys = 'fjdkslaureiwoqpvncm'

NeoBundle 'scrooloose/nerdtree'
nnoremap NN :NERDTree<CR>

NeoBundle 'grep.vim'

NeoBundle 'drillbits/nyan-modoki.vim'
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 4
let g:nayn_modoki_animation_enabled= 1

NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

call neobundle#end()

" $B%U%!%$%k%?%$%WJL$N%W%i%0%$%s(B/$B%$%s%G%s%H$rM-8z$K$9$k(B
filetype plugin indent on

" !!! set [no]compatible $B0J9_$K5-=R$9$k$3$H(B
"$B:81&$N%+!<%=%k0\F0$G9T4V0\F02DG=$K$9$k!#(B
set whichwrap=b,s,<,>,[,]
