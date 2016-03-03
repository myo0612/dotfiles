" 新環境を構築する際・Updateする際は、~/dotfilesを作成し、以下を実行すること
" git clone https://github.com/myo0612/dotfiles.git 
" ln -s ~/dotfiles/.vimrc ~/.vimrc
" vimを起動し、 :NeoBundleInstall を実行

augroup MyAutoGroup
	autocmd!
augroup END
 
" 日本語設定
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

" swpファイルの作成場所指定
:set directory=~/.vim/temp

" 行番号設定
:set number
" 行番号表示設定とカーソルラインのセット
hi LineNr ctermbg=0 ctermfg=20
hi CursorLineNr ctermbg=4 ctermfg=255
set cursorline
hi clear CursorLine

set tabstop=4
set shiftwidth=4

" 右記URLから拝借 http://rcmdnk.github.io/blog/2014/07/14/computer-vim/
set wrap           " the longer line is wrapped
set linebreak      " wrap at 'breakat'
set breakat=\      " break point for linebreak (default " ^I!@*-+;:,./?")
set showbreak=+\   " set showbreak
if (v:version == 704 && has("patch338")) || v:version >= 705
    set breakindent    " indent even for wrapped lines
    " breakindent option
    " autocmd is necessary when new file is opened in Vim
    " necessary even for default(min:20,shift:0)
	autocmd MyAutoGroup BufEnter * set breakindentopt=min:20,shift:0
endif
          

" タブ・ウィンドウのマッピング
" 新しいタブ：tt
" タブ移動：tn, tp
" 新しいウィンドウ：ts tv
" ウィンドウ移動：tw
nnoremap ts :sp
nnoremap tv :vs 
nnoremap tt :tabnew 
nnoremap tn gt 
nnoremap tp gT 
nnoremap tw <C-w>w

"C-Up/Downで画面中心スクロール
nnoremap <C-Down> jzz
nnoremap <C-Up> kzz

"C-nで改行を挿入
noremap <C-n> o<ESC>

" サクラよろしく別タブ表示とか、あるいは分割幅を設定したいけど上手い方法ないものか
autocmd QuickFixCmdPost *grep* cwindow


" 初回起動時のみruntimepathにneobundleのパスを指定する
if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))


""""""""""""""""""""""""""""""""""""""""""""""""
" インストールするプラグインをここに記述
""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'

" NERDTreeメインで使っているので現在不使用
" NeoBundle 'Shougo/vimfiler'

" カーソル移動用ツール
NeoBundle 'Lokaltog/vim-easymotion'
" smartcase
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 0

" s {char}{char}{target} 3～4キーで画面内移動ができる
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2) " surround.vimとかぶるので`z`
let g:EasyMotion_startofline=0
" Space + W, B, nなどでカーソル移動ができる デフォルトだと\
let g:EasyMotion_leader_key = '<Space>'
" target keyをホームポジションで押せるように変更
let g:EasyMotion_keys = 'fjdkslaureiwoqpvncm'

" エクスプローラ
NeoBundle 'scrooloose/nerdtree'
nnoremap TT :NERDTree<CR>

" 速いGrep あまりつかってない
NeoBundle 'grep.vim'

" にゃんもどき
NeoBundle 'drillbits/nyan-modoki.vim'
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 6
let g:nayn_modoki_animation_enabled= 1

" 補完
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

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" !!! set [no]compatible 以降に記述すること
"左右のカーソル移動で行間移動可能にする。よくあるエディタの動きに合わせて
set whichwrap=b,s,<,>,[,]
