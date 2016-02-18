" 新環境を構築する際・Updateする際は、~/dotfilesを作成し、以下を実行すること
" git clone https://github.com/myo0612/dotfiles.git 
" ln -s ~/dotfiles/.vimrc ~/.vimrc
" vimを起動し、 :NeoBundleInstall を実行

" 日本語設定
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

" 行番号設定
:set number
" 行番号表示設定とカーソルラインのセット
hi LineNr ctermbg=0 ctermfg=20
hi CursorLineNr ctermbg=4 ctermfg=255
set cursorline
hi clear CursorLine

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

" grepで検索結果をウィンドウ分割で表示
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
nnoremap NN :NERDTree<CR>

" 速いGrep あまりつかってない
NeoBundle 'grep.vim'

" にゃんもどき
NeoBundle 'drillbits/nyan-modoki.vim'
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 4
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
