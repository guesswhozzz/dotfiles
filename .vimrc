" Базовые настройки
  set nocompatible
  filetype plugin indent on 
  set encoding=utf-8 " ok
  set nocompatible 
 
  set splitright " ?? Это работает 
  set splitbelow " ??

  set showtabline=2 " ok
  set noshowmode " ?? 
  set number " ok
  set undodir=~./vim/undodir " ??
  set undofile " ??
  set colorcolumn=80 " ok 
  set visualbell t_vb=
  set expandtab
  set shiftwidth=2 " ok todo
  set softtabstop=2
  set tabstop=2   
  set smartindent
  set cursorline " подсветка линии
  set cursorlineopt=number " подствека линии
  set hlsearch " подсветка поиска 
  set wrap linebreak nolist

  if  has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
  endif
" augroup END


au BufRead,BufNewFile *.zsh-theme set filetype=sh
au BufRead,BufNewFile *.js set filetype=js
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.ts set filetype=ts
au BufRead,BufNewFile *.tsx set filetype=tsx

" ПОКАЗЫВАЕТ СИНТАКСИЧЕСКИЕ ГРУППЫ
" <C-S-P> <control + shift + p>

nmap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ПЛАГИНЫ 
call plug#begin('~/.vim/plugged') 
  Plug 'preservim/nerdtree'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'runoshun/tscompletejob'
  Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
  Plug 'guesswhozzz/init.vim'
  Plug 'guesswhozzz/021011-theme.vim'
  Plug 'arcticicestudio/nord-vim'
call plug#end()


" NERDTREE SETTINGS
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrows  = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 28
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-k>     :wincmd k<CR>
nmap <silent> <A-j>     :wincmd j<CR>
nmap <silent> <A-h>     :wincmd h<CR>
nmap <silent> <A-l>     :wincmd l<CR>
map  <C-\>              :NERDTreeToggle<CR>


autocmd VimEnter * NERDTree  " Autostart NERDTree
autocmd VimEnter * wincmd p  " And then focus on file
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenInTab='<ENTER>'

set fillchars+=vert:\│ " Разделитель
set foldcolumn=1 " Отступ слева у колонки


" PRETTIER 
set backspace=indent,eol,start
let g:prettier#config#print_width = '80'
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#tab_width = '2'
let g:prettier#config#single_quote = 'true' 
let g:prettier#config#semi = 'false'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:prettier#config#config_precedence = 'file-override'

let g:prettier#quickfix_enabled = 0


" AUTOCOMPLETE
call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
      \ 'name': 'tscompletejob',
      \ 'allowlist': ['typescript'],
      \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
      \ }))



" ДВИГАЕМ ЛИНИИ
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
let s:py_cmd = 'python3'
let s:pyfile_cmd = 'py3file'
" set exrc " поиск локально vimrc файла
" set secure " заперещает писать всякую дичь в vimrc файл 
" let &path.="src/include,/usr/include/AL," " пути для gf
" set makeprg=make\ -C\ ../build\ -j9 " что-то собирает в С++ 
" path to directory where library can be found
" let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
" let g:clang_library_path='/usr/lib64/libclang.so.3.8'
" autocmd ColorScheme * highlight CursorLineNr 
" KEY MAP
autocmd FileType js nnoremap <S-f> :Prettier<CR>
nnoremap <S-f> gg=G<CR> 

"nmap <S-Left> <Esc>v<Left>
"nmap <S-Right> <Esc>v<Right>
"nmap <S-Down> <Esc>vj
"nmap <S-Up> <Esc>vk
"noremap <S-Down> <Down>
"vnoremap <S-Up> <Up>


"imap <S-Left> <Esc>v
"imap <S-Right> <Esc>v



"nmap <$> <A-Left>
"nnoremap <> <Esc>$

" Spell settings 
 setlocal spelllang=ru_ru,en_us
 set keymap=russian-jcuken
 set iminsert=0
 set imsearch=0
  
" highlight lCursor guifg=NONE guibg=Cyan

" Set theme
syntax on  
colorscheme 021011 


" Чтобы можно было использовать Backspace
" для удаления в режиме INSERT
set backspace=indent,eol,start 

" перемещаться с конца строки на начало следующей
set whichwrap+=<,>,h,l,[,] 

set ignorecase
set smartcase

set showcmd
