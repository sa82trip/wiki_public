"       .__                         .__.__/\                        __    __  .__                
" ___  _|__| _____             ____ |__|  )/  ______   ______ _____/  |__/  |_|__| ____    ____  
" \  \/ /  |/     \   ______  / ___\|  |  |  /  ___/  /  ___// __ \   __\   __\  |/    \  / ___\ 
"  \   /|  |  Y Y  \ /_____/ / /_/  >  |  |__\___ \   \___ \\  ___/|  |  |  | |  |   |  \/ /_/  >
"   \_/ |__|__|_|  /         \___  /|__|____/____  > /____  >\___  >__|  |__| |__|___|  /\___  / 
"                \/         /_____/              \/       \/     \/                   \//_____/  

" this is initial version of vim config file
" it will be updated occassionally


" set up the leader key 
let mapleader = "\<Space>"
"set up the command with key binding with leader key
nmap <leader>vr :sp ~/.config/nvim/init.vim<cr>
nmap <leader>so :source ~/.config/nvim/init.vim<cr>
"{{{ vim basic setting
set relativenumber
set number
set history=1000
set scrolloff=4
set autoindent
set cursorline
set shiftwidth=4
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set nowrap
set expandtab
set softtabstop=4
set smarttab

"folding method
set foldmethod=marker

" 'i' means insert mode
inoremap jk <esc>

" inoremap kj <esc>
imap jj <esc>A;

" <C-s> means Ctrl + s save more conveiently
imap <C-s> <esc>:w<cr>
nmap <C-s> :w<cr>

" move just one line even it is very one long line
nmap j gj
nmap k gk
nmap 0 ^

" moving around between buffer easily
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent><TAB> :bnext<CR>

set clipboard=unnamed 
set ts=4 sw=4
set path+=**
set wildmenu
set splitright
set mouse=aniv
"}}}

"{{{ 기계인간
set tabstop=4
set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
highlight NonText guifg=#ff0000
highlight SpecialKey guifg=#ff0000
"}}}
					
" undo가 저장되는 별도의 디렉토리 지정
nmap <leader>ut :UndotreeToggle<CR>
set undodir=~/.config/nvim/undodir
set undofile

nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>e :e <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
"nmap <leader>vi :tabedit ~/.vimrc<cr>
nmap <leader>vi :e ~/.config/nvim/init.vim<cr>
nmap <leader>co ggVGy

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
 
"{{{ plugins list
call plug#begin('~/.vim/plugged')
" editing plugins
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'

" macro helper
Plug 'chamindra/marvim'

"syntax and snips plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'godlygeek/tabular'

" html tag helper
Plug 'mattn/emmet-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" themee, status bar and buffer 
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'OmniSharp/omnisharp-vim'

"  vim yank highlight
Plug 'machakann/vim-highlightedyank'

" 
Plug 'tpope/vim-unimpaired'

"
"shorturl.at/ijpyP 참조
Plug 'wellle/targets.vim'


Plug 'easymotion/vim-easymotion'
" git with vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
" markdown preview & vimwiki
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'shime/vim-livedown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki', { 'branch': 'dev'  }
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/DrawIt'
Plug 'ap/vim-css-color'
Plug 'diepm/vim-rest-console'
Plug 'SirVer/ultisnips'
Plug 'farconics/victionary'
call plug#end()
"}}}

" {{{ ultisnips setting
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" UltiSnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
" }}}

"{{{ coc setting
" coc settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" ====================================================================================

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" ====================================================================================

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"}}} coc setting

" Fuzzy Finder settings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Emmet
let g:user_emmet_leader_key='@'

" vim기본 사용법
" 일단은 coc사용하자
" 그리고 버퍼 이동은 지금은 쉽게 노말에서 tap
" fuzzy finder는 컨트롤 p
" emmet은 무조건 써야 하는데 지금 ','로 설정되어있다.

"fugitive git
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

let g:gitgutter_set_sign_backgrounds = 1

" {{{ solarized setting====Color Scheme==============================
syntax on
set background=dark
" 원래 여기에 atcmd인가 있었는데 그걸 하면 모든 플러그인 불러오는거 끝나고
" 하는거라서 그거땜시 airline theme이 계속 초기화 됐던거
colorscheme gruvbox
let g:airline_theme='molokai'
" let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256
" let g:solarized_visibility = 'high'
" let g:solarized_contrast = 'high'
" colorscheme solarized
highlight! link SignColumn LineNr
"================================================================
" airline settings
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = '  '
" let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
"================================================================


" }}}

"set t_Co=256
" colorscheme solarized
" sign column색상이 이상해지는 문제때문에 추가 했고, 백그라운드랑 컬러스킴 선언하는 곳 밑에 와야 한다
" https://github.com/airblade/vim-gitgutter/issues/696  참조
 " solarized options 
"================================================================

" ===korean input and out put====================================
" set linespace=3
" set encoding=utf-8
 set fileencodings=utf-8,euc-kr
" set guifont=Menlo:h14
" set guifontwide=D2Coding:h14
"================================================================
" this is needed because airline provides information of modes
"
set noshowmode
let g:highlightedyank_highlight_duration = 500

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"{{{ easymotion setting
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
"}}}

"{{{ WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
"}}}

" setting variable for venv python environment
let g:python3_host_prog = '/home/sa82trip/programming_study/python_venv_home/mysite/bin/python3'

"{{{ vim wiki
" vim wiki
let g:vimwiki_list = [{ 'path':'/home/sa82trip/programming_study/vim_wiki/md_files',
            \ 'syntax':'markdown','ext':'md', 'diary_rel_path': './diary' },]
let g:vimwiki_conceallevel = 0
let g:vimwiki_global_ext = 0
set formatprg=prettier
let g:vimwiki_key_mappings = { 'table_mappings': 0  }
silent! iunmap <buffer> <Tab>
" set nocompatible
" filetype plugin on
" syntax on

" vimwiki setting
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
let g:instant_markdown_browser = "chrome --new-window"
" nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

let g:md_modify_disabled = 0

function! LastModified()
    if g:md_modify_disabled
        return
    endif
    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
            \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

autocmd BufRead,BufNewFile *.md call NewTemplate()

function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') == wiki.path
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags    : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

autocmd BufRead,BufNewFile *.md call NewTemplate()

augroup vimwikiauto
autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Vimwiki의 테이블 단축키를 사용하지 않도록 한다 (작동이 안됨)
let g:victionary#map_defaults = 0
"}}}

" {{{ tagbar showing toggle setting
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ],
	\ 'sort' : 0
\ }
augroup vimwiki_tagbar
	autocmd BufRead,BufNewFile *wiki/*.md TagbarOpen
    autocmd VimLeavePre *.md TagbarClose
augroup END

function! RefreshTagbar()
     let l:is_tagbar_open = bufwinnr('__Tagbar__') != -1
     if l:is_tagbar_open
         edit
     endif
endfunction

autocmd FileType vimwiki nnoremap <Space>w :w<CR>:call RefreshTagbar()<CR>

" }}}

"{{{ javaScript_fold
function! JavascriptFolding()
    set foldmethod=syntax "syntax highlighting items specify folds
    set foldcolumn=1 "defines 1 col at window left, to indicate folding
    let javaScript_fold=1 "activate folding by JS syntax
    setlocal foldlevel=99
endfunction

autocmd FileType javascript :call JavascriptFolding()
autocmd FileType typescript :call JavascriptFolding()
"}}}

 let g:vimwiki_folding = 'syntax'
 au FileType vimwiki setlocal foldlevel=2

" vim dictinary
nmap <Leader>d <Plug>(victionary#define_prompt)
nmap <Leader>D <Plug>(victionary#define_under_cursor)

autocmd FileType vimwiki nnoremap <Space>t :pu=strftime('%c')<CR>

function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" close all buffer except current one
nmap <Leader>ca :call CloseAllBuffersButCurrent()<CR>
autocmd FileType mdvimwiki UltiSnipsAddFiletypes vimwiki

"paste mode toggle
nnoremap <Leader>p :set paste!<CR>
let g:markdown_folding = 1

