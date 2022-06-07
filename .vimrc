" 文字コード
set encoding=utf-8
scriptencoding utif-8

" インデント関係
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:>-

" カーソルを中央に
:set scrolloff=999


call plug#begin('~/.local/share/nvim/plugged')
Plug 'bronson/vim-trailing-whitespace'		" 末尾のスペース削除
Plug 'prabirshrestha/vim-lsp'				" LPS本体
Plug 'mattn/vim-lsp-settings'				" LSP設定
Plug 'airblade/vim-gitgutter'				" Git変更表示
Plug 'prabirshrestha/asyncomplete.vim'		" コード補完
Plug 'yami-beta/asyncomplete-omni.vim'		" コード補完（オムニ保管）
Plug 'editorconfig/editorconfig-vim'		" editorconfigの有効化
Plug 'nanotech/jellybeans.vim'				" カラースキーマ
Plug 'itchyny/lightline.vim'				" ステータスライン
Plug 'haya14busa/incsearch.vim'				" 検索中ハイライト
Plug 'mattn/emmet-vim'						" emmet記法対応
Plug 'kamykn/spelunker.vim'					" スペルチェッカー
Plug 'vuttie/comfortable-motion.vim'		" スムーズな移動
call plug#end()

" カラースキーマ
colorscheme jellybeans

" bladeファイルのインデント形式
autocmd BufNewFile,BufRead *.blade.php set syntax=html
autocmd BufNewFile,BufRead *.blade.php set filetype=html

" ------ ステータスバー ------
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" setting prabirshrestha/vim-lsp
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'allowlist': ['*'],
\ 'blocklist': ['c', 'cpp', 'html'],
\ 'completor': function('asyncomplete#sources#omni#completor'),
\ 'config': {
\   'show_source_kind': 1,
\ },
\ }))

" setting haya14busa/incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" setting kamykn/spelunker.vim
set nospell
" spelunker.vim の有効化 (1 / 0) (default 1)
let g:enable_spelunker_vim = 1
" スペルチェックの対象となる単語あたりの最小の文字数 (default 4)
" 例) 4という設定値の場合、lenとかxxxLen、xxx_lenとかのlenは3文字のため対象としません。
let g:spelunker_target_min_char_len = 4
" ZL/Zl コマンドで表示される候補数 (default 15)
let g:spelunker_max_suggest_words = 15
" 1バッファあたり検出する単語数の最大 (default 100)
let g:spelunker_max_hi_words_each_buf = 100
" highlightのグループ設定 (通常のtypo用)
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'
" highlightのグループ設定 (複合語等の場合用)
" Override highlight group name of complex or compound words. (default 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'
" Highlightの設定
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" setting vuttie/comfortable-motion.vim
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
