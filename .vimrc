" Neobundleのインストール
" mkdir -p ~/.vim/bundle
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

" 新環境を構築する際・Updateする際は、~/dotfilesを作成し、以下を実行すること
" git clone https://github.com/myo0612/dotfiles.git 
" ln -s ~/dotfiles/.vimrc ~/.vimrc
" vimを起動し、 :NeoBundleInstall を実行
" vimprocをビルド (OSによって手順は異なる。ググること)
" ターミナルにctagsを導入 (Unite outline で使用)
" ターミナルにsilver searcher(ag)を導入 (Unite grepで使用)
" かな入力中にescしたらオフにする設定を別途行う (キーバインドソフトを使うなど)

augroup MyAutoGroup
	autocmd!
augroup END
 
" 日本語設定
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac
" かな入力誤爆防止
nnoremap い i
nnoremap あ a
nnoremap え e
nnoremap お o
nnoremap う u
nnoremap っｄ dd
nnoremap っｙ yy
nnoremap っｃ cc
nnoremap ：ｗｑ :wq
nnoremap ：ｑ！ :q!

"カーソル移動を表示単位で
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
noremap h <Left>
noremap l <Right>

" macだとdeleteキー効かない
set backspace=2

" swpファイルの作成場所指定
:set directory=~/.vim/temp

"クリップボード
set clipboard=unnamed,autoselect

" 行番号設定
:set number
" 行番号表示設定とカーソルラインのセット
hi LineNr ctermbg=0 ctermfg=20
hi CursorLineNr ctermbg=4 ctermfg=255
set cursorline
hi clear CursorLine

set tabstop=4
set shiftwidth=4

" かっこいいインデント
" 右記URLから拝借 http://rcmdnk.github.io/blog/2014/07/14/computer-vim/
set wrap           " the longer line is wrapped
set linebreak      " wrap at 'breakat'
set breakat=\      " break point for linebreak (default " ^I!@*-+;:,./?")
"set showbreak=+\   " set showbreak
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

"C-Up/Down(j/k)で画面中心スクロール
"macだとC-Down/Up使えない
nnoremap <C-Down> jzz
nnoremap <C-Up> kzz
nnoremap <C-j> jzz
nnoremap <C-k> kzz

"C-nで改行を挿入
noremap <C-n> o<ESC>

" サクラよろしく別タブ表示とか、あるいは分割幅を設定したいけど上手い方法ないものか -> Uniteで上手いことできた
"autocmd QuickFixCmdPost *grep* cwindow


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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
let g:unite_enable_start_insert = 1
"let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 30
let g:unite_winheight = 10
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_grep_max_candidates = 1000

"左と下に表示したいんだが？
let g:unite_split_rule = 'botright'

" grep検索
nnoremap <silent> fg  :<C-u>Unite vimgrep -buffer-name=search-buffer -default-action=tabopen<CR><CR>
nnoremap <silent> fh  :<C-u>Unite vimgrep -buffer-name=search-buffer -default-action=tabopen -tab<CR><CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> fc :<C-u>Unite vimgrep -buffer-name=search-buffer -default-action=tabopen -no-quit<CR><CR><C-R><C-W>
nnoremap <silent> fj :<C-u>Unite vimgrep -buffer-name=search-buffer -default-action=tabopen -no-quit -tab<CR><CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> fr  :<C-u>UniteResume search-buffer -no-quit<CR>

nnoremap <silent> ff :Unite file -vertical -default-action=tabopen<CR>
nnoremap <silent> fb :Unite buffer -vertical -default-action=tabopen<CR>
nnoremap <silent> fo :Unite outline -vertical -no-quit -winwidth=50<CR>

"unite grep に ag(The Silver Searcher) を使う
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
	let g:unite_source_grep_recursive_opt = ''
endif

NeoBundle 'Shougo/vimfiler'

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

" エクスプローラ Unite頑張って使うことにするので封印
"NeoBundle 'scrooloose/nerdtree'
"nnoremap TT :NERDTree<CR>

" 速いGrep あまりつかってない
"NeoBundle 'grep.vim'

" にゃんもどき
NeoBundle 'drillbits/nyan-modoki.vim'
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 6
let g:nayn_modoki_animation_enabled= 1

" 全角スペースを表示
NeoBundle 'thinca/vim-zenspace'
let g:zenspace#default_mode = 'on'

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

" vimproc コンパイルが必要
NeoBundle 'Shougo/vimproc'

"color scheme
NeoBundle 'sjl/badwolf'

"------------------------------------
" colorscheme
"------------------------------------
syntax on
"colorscheme badwolf
highlight Normal ctermbg=none

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" !!! set [no]compatible 以降に記述すること
"左右のカーソル移動で行間移動可能にする。よくあるエディタの動きに合わせて
set whichwrap=b,s,<,>,[,]

