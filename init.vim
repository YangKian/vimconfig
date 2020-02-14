"=====================================
"常用设置
"=====================================
"映射
let mapleader=','

set number
"set mouse=a
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
"设置拼写检查: 使用,sc来开启和关闭，使用[s和]s来跳到上一个或下一个错误
noremap <leader>sc :set spell!<CR>
syntax on
"按F2进入粘贴模式
set pastetoggle=<F2>
"高亮搜索 回车确认，n和N移动
set hlsearch
set incsearch
set ignorecase "忽略大小写
set smartcase "智能大小写
exec "nohlsearch"
noremap <leader>l<CR> :nohlsearch<CR>  

"vim 分屏
noremap <leader>sl :set splitright<CR>:vsplit<CR>
noremap <leader>sh :set nosplitright<CR>:vsplit<CR>
noremap <leader>sk :set nosplitbelow<CR>:split<CR>
noremap <leader>sj :set splitbelow<CR>:split<CR>

"调整屏幕大小
noremap <leader>Sk :res+10<CR> 
noremap <leader>Sj :res-10<CR>
noremap <leader>Sh :vertical resize-10<CR>
noremap <leader>Sl :vertical resize+10<CR>



"创建新窗口
noremap zu :tabe<CR>
noremap zn :+tabnext<CR>
noremap zp :-tabnext<CR>

set wrap
set wildmenu

"语言支持
let g:python3_host_prog = '/usr/bin/python3'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'


"使用jj进入normal模式
inoremap jj <Esc>`^
"使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
"使用 leader+g 载入nvim配置
noremap <leader>g :source ~/.config/nvim/init.vim<cr>
inoremap <leader>g <Esc>:source ~/.config/nvim/init.vim<cr>
"使用 leader+j 批量注释选中的代码
noremap <leader>j :normal I "<cr>
"使用[b [n 来向前向后切换buffer
noremap <silent> [b :bprevious<CR>
noremap <silent> [n :bnext<CR>

"使用ctrl+h/j/k/l 来切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

""json格式化
"com! FormatJSON %!python3 -m json.tool

"===================================================================
"插件配置
"===================================================================
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"vim-startify 界面初始化
Plug 'mhinz/vim-startify'

"vim-airline 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"indentline 缩进线
Plug 'Yggdroot/indentLine'

"vim-hybrid 配色
Plug 'w0ng/vim-hybrid'

"目录树
Plug 'scrooloose/nerdtree'
"------配置------------
nnoremap tv :NERDTreeFind<cr>
nnoremap tt :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = []

"模糊搜索文件
Plug 'ctrlpvim/ctrlp.vim'
"---------配置----------
let g:ctrlp_map = '<c-p>'

"快速移动
Plug 'easymotion/vim-easymotion'
"---------------------------------
nmap ss <Plug>(easymotion-s2)

"修改成对内容
Plug 'tpope/vim-surround'

"引号括号补全
Plug 'jiangmiao/auto-pairs'

"批量查询替换
Plug 'brooth/far.vim'

"coc 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"-------------------------------------------------------
let g:UltiSnipsExpandTrigger="<leader><cr>"
let g:UltiSnipsJumpForwardTrigger="<leader><cr>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']

"
"vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


"python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"----------------------------------
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120

"go debug
Plug 'go-delve/delve'

"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

"注释添加
Plug 'tpope/vim-commentary'
" Initialize plugin system
call plug#end()


"配色: 注意这一行一定要写在 call plug#end 之后
colorscheme hybrid
let g:lightline={'colorscheme':'hybrid'}

"===============================================================
"coc 配置
"===============================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
noremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>n











 "" if hidden is not set, TextEdit might fail.
 "set hidden
 "
 "" Some servers have issues with backup files, see #649
 "set nobackup
 "set nowritebackup
 "
 "" Better display for messages
 "set cmdheight=2
 "
 "" You will have bad experience for diagnostic messages when it's default 4000.
 "set updatetime=300
 "
 "" don't give |ins-completion-menu| messages.
 "set shortmess+=c
 "
 "" always show signcolumns
 "set signcolumn=yes
 "
 "" Use tab for trigger completion with characters ahead and navigate.
 "" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
 "inoremap <silent><expr> <TAB>
       "\ pumvisible() ? "\<C-n>" :
       "\ <SID>check_back_space() ? "\<TAB>" :
       "\ coc#refresh()
 "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 "
 "function! s:check_back_space() abort
   "let col = col('.') - 1
   "return !col || getline('.')[col - 1]  =~# '\s'
 "endfunction
 "
 "" Use <c-space> to trigger completion.
 "inoremap <silent><expr> <c-space> coc#refresh()
 "
 "" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
 "" Coc only does snippet and additional edit on confirm.
 "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
 "" Or use `complete_info` if your vim support it, like:
 "" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 "
 "" Use `[g` and `]g` to navigate diagnostics
 "nmap <silent> [g <Plug>(coc-diagnostic-prev)
 "nmap <silent> ]g <Plug>(coc-diagnostic-next)
 "
 "" Remap keys for gotos
 "nmap <silent> gd <Plug>(coc-definition)
 "nmap <silent> gy <Plug>(coc-type-definition)
 "nmap <silent> gi <Plug>(coc-implementation)
 "nmap <silent> gr <Plug>(coc-references)
 "
 "" Use K to show documentation in preview window
 "nnoremap <silent> K :call <SID>show_documentation()<CR>
 "
 "function! s:show_documentation()
   "if (index(['vim','help'], &filetype) >= 0)
     "execute 'h '.expand('<cword>')
   "else
     "call CocAction('doHover')
   "endif
 "endfunction
 "
 "" Highlight symbol under cursor on CursorHold
 "autocmd CursorHold * silent call CocActionAsync('highlight')
 "
 "" Remap for rename current word
 "nmap <leader>rn <Plug>(coc-rename)
 "
 "" Remap for format selected region
 "xmap <leader>f  <Plug>(coc-format-selected)
 "nmap <leader>f  <Plug>(coc-format-selected)
 "
 "augroup mygroup
   "autocmd!
   "" Setup formatexpr specified filetype(s).
   "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   "" Update signature help on jump placeholder
   "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
 "augroup end
 "
 "" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
 "xmap <leader>a  <Plug>(coc-codeaction-selected)
 "nmap <leader>a  <Plug>(coc-codeaction-selected)
 "
 "" Remap for do codeAction of current line
 "nmap <leader>ac  <Plug>(coc-codeaction)
 "" Fix autofix problem of current line
 "nmap <leader>qf  <Plug>(coc-fix-current)
 "
 "" Create mappings for function text object, requires document symbols feature of languageserver.
 "xmap if <Plug>(coc-funcobj-i)
 "xmap af <Plug>(coc-funcobj-a)
 "omap if <Plug>(coc-funcobj-i)
 "omap af <Plug>(coc-funcobj-a)
 "
 "" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
 "nmap <silent> <TAB> <Plug>(coc-range-select)
 "xmap <silent> <TAB> <Plug>(coc-range-select)
 "
 "" Use `:Format` to format current buffer
 "command! -nargs=0 Format :call CocAction('format')
 "
 "" Use `:Fold` to fold current buffer
 "command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 "
 "" use `:OR` for organize import of current buffer
 "command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 "
 "" Add status line support, for integration with other plugin, checkout `:h coc-status`
 "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 "
 "" Using CocList
 "" Show all diagnostics
 "nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
 "" Manage extensions
 "nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
 "" Show commands
 "nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
 "" Find symbol of current document
 "nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
 "" Search workspace symbols
 "noremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
 "" Do default action for next item.
 "nnoremap <silent> <space>j  :<C-u>CocNext<CR>
 "" Do default action for previous item.
 "nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
 "" Resume latest coc list
 "nnoremap <silent> <space>p  :<C-u>CocListResume<CR>n
 







