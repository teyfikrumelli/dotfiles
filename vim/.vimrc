" ============================================================================
" Vim Configuration (mirrors nvim config)
" ============================================================================
"
" ============================================================================
" KEYBOARD SHORTCUTS CHEAT SHEET (<leader> = Space)
" ============================================================================
"
" 1. NAVIGATION: GO TO FUNCTION & JUMP BACK / FORWARD
" ----------------------------------------------------------------------------
"   gd          Go to Definition (function, struct, class, variable)
"   Ctrl + o    Jump Back to previous cursor position (works across files)
"   Ctrl + i    Jump Forward to next cursor position
"   gr          Find References (all places where symbol is called)
"   gi          Go to Implementation (interfaces / traits)
"   gy          Go to Type Definition
"   gD          Go to Declaration
"   K           Show Hover Documentation (signature & docs popup)
"   Ctrl + ^    Toggle between current and previous buffer
"
" 2. LSP: REFACTORING, CODE ACTIONS & DIAGNOSTICS
" ----------------------------------------------------------------------------
"   <Space>rn   Rename symbol across project
"   <Space>ca   Code Actions (auto-import, quick fixes)
"   <Space>fp   Format current buffer
"   [d / ]d     Jump to previous / next diagnostic (error/warning)
"   <Space>cd   Copy buffer diagnostics to system clipboard
"
" 3. FILE EXPLORER, FUZZY FINDER (FZF) & HARPOON
" ----------------------------------------------------------------------------
"   <Space>ff   Find files (FZF)
"   <Space>fs   Search text across project (Ripgrep)
"   <Space>fc   Search word under cursor across project
"   <Space>fb   List open buffers
"   <Space>fh   Search Vim help tags
"   <Space>e    Toggle NERDTree sidebar
"   <Space>o    Reveal current file in NERDTree
"   (Inside NERDTree folder tree:
"     t = open in new tab, T = open in new tab silently,
"     Enter / o = open in editor buffer, s = vertical split, i = horizontal split)
"   <Space>a    Harpoon: Mark current file
"   Ctrl + e    Harpoon: Toggle quick menu (Enter/o = open, t = new tab, T = silent tab, dd = delete, q/Esc = close)
"   F1 - F4     Harpoon: Jump directly to file 1-4 (also <Space>1 - <Space>4)
"   (Inside FZF <Space>ff / <Space>fb:
"     Enter = open, Ctrl+t = new tab, Ctrl+v = vsplit, Ctrl+x = split, Ctrl+d = delete buffer in <Space>fb)
"
" 4. WINDOWS, SPLITS, TABS & GENERAL
" ----------------------------------------------------------------------------
"   <Space>sv   Split window vertically
"   <Space>sh   Split window horizontally
"   <Space>se   Equalize split window sizes
"   <Space>sx   Close current split window
"   Ctrl+h/j/k/l Move between splits (and tmux panes)
"   <Space>to   Open new tab
"   <Space>tx   Close current tab
"   <Space>tn   Next tab
"   <Space>tp   Previous tab
"   <Space>c    Close current buffer (:Bdelete)
"   <Space>nh   Clear search highlight
"   <Space>so   Reload ~/.vimrc
"   <Space>u    Toggle Undotree
"   <Space>z    Toggle Zen Mode (Goyo)
"   <Space>y    Yank to register 0
"   <Space>p    Paste from register 0
"   <Space>d    Delete to black hole register (without overwriting clipboard)
"
" 5. GIT & DOCKER (Fugitive, Lazygit & Lazydocker)
" ----------------------------------------------------------------------------
"   <Space>n    Open interactive Git status in full tab (:tab Git, Neogit equivalent)
"               Inside Git status:
"                 s = stage, u = unstage, - = toggle stage, = = toggle inline diff
"                 cc = commit, ca = amend, P = push, F = pull, gq = close
"   <Space>lg   Open Lazygit in a full tab
"   <Space>ld   Open Lazydocker in a full tab
"   <Space>gs   Git status split (:Git)
"   <Space>gd   Git diff split (:Gdiffsplit)
"   <Space>gb   Git blame (:Git blame)
"
" 6. LANGUAGE-SPECIFIC SHORTCUTS
" ----------------------------------------------------------------------------
"   Rust:
"     <Space>rr   Run (:RustRun)
"     <Space>rt   Test (:RustTest)
"     <Space>rb   Cargo build (:Cbuild)
"     <Space>rc   Cargo check (:Ccheck)
"     <Space>rm   Expand macro
"     <Space>rh   Toggle inlay type hints
"     <Space>rd   Open docs.rs documentation
"     <Space>rp   Jump to parent module
"     <Space>rj   Join lines
"
"   Golang:
"     <Space>ee   Insert 'if err != nil { return err }'
"     <Space>gr   Run (:GoRun)
"     <Space>gt   Run package tests (:GoTest)
"     <Space>gf   Run test function under cursor (:GoTestFunc)
"     <Space>gb   Build (:GoBuild)
"     <Space>gc   Toggle test coverage (:GoCoverageToggle)
"     <Space>gi   Organize imports (:GoImports)
"     <Space>ga   Alternate between .go and _test.go (:GoAlternate)
"     <Space>gta  Add struct tags (:GoAddTags)
"     <Space>gtr  Remove struct tags (:GoRemoveTags)
"
"   JavaScript / TypeScript:
"     <Space>jr   Run current file with Node (:!node %)
"     <Space>jt   Run npm tests (:Dispatch npm test)
"     <Space>jo   Organize imports
"     <Space>jf   ESLint autofix current file
"     <Space>jp   Format file with Prettier
"     <Space>jd   Go to source definition (skip .d.ts)
"
"   Python:
"     <Space>pr   Run current file with python3 (:!python3 %)
"     <Space>pt   Run pytest (:Dispatch pytest)
"     <Space>po   Organize imports (Pyright)
"     <Space>pf   Format file
"     <Space>pi   Start Python REPL
"
"   PostgreSQL / Database (Dadbod):
"     <Space>du   Toggle Database UI (:DBUIToggle)
"     <Space>df   Find buffer in DBUI
"     <Space>dr   Rename buffer in DBUI
"     <Space>dl   Show last query info
"     <Space>de   Execute SQL query (normal or visual selection)
"     <Space>ds   Save SQL query
"     <Space>dp   Format SQL file
" ============================================================================

" ----------------------------------------------------------------------------
" Plugin Manager (vim-plug)
" ----------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

  " Colorscheme (tokyonight vim port)
  Plug 'ghifarit53/tokyonight-vim'

  " Navigation
  Plug 'christoomey/vim-tmux-navigator'

  " File explorer (neo-tree alternative)
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'moll/vim-bbye'

  " Status line (lualine alternative)
  Plug 'itchyny/lightline.vim'

  " Fuzzy finder (telescope alternative)
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " LSP & Completion (navigator.lua + nvim-cmp alternative)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Database & PSQL
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'lifepillar/pgsql.vim'

  " Snippets (requires Python - use coc-snippets instead)
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'

  " Productivity
  Plug 'junegunn/goyo.vim'          " zen-mode alternative
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-dispatch'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'

  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'cespare/vim-toml', { 'branch': 'main' }

  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " JavaScript / TypeScript
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  " Python
  Plug 'vim-python/python-syntax'

  " Treesitter-like syntax highlighting
  Plug 'sheerun/vim-polyglot'

call plug#end()

" ----------------------------------------------------------------------------
" General Settings
" ----------------------------------------------------------------------------
" Line numbers
set relativenumber
set number

" Tabs & indentation
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Search settings
set ignorecase
set smartcase

" Cursor line
set cursorline

" Appearance
set termguicolors
set background=dark

" Clipboard
set clipboard=unnamed,unnamedplus

" Split windows
set splitright
set splitbelow

" Allow switching buffers without saving first
set hidden

" Update time
set updatetime=100

" Line wrapping
set wrap

" Mouse support
set mouse=a

" Leader key
let mapleader = " "

" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------
let g:tokyonight_style = 'night'
colorscheme tokyonight

" ----------------------------------------------------------------------------
" Keymaps
" ----------------------------------------------------------------------------
" General keymaps (yank/paste with register 0, delete to black hole register)
nnoremap <leader>y "0y
vnoremap <leader>y "0y
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Clear search highlights & reload ~/.vimrc
nnoremap <leader>nh :nohl<CR>
nnoremap <leader>so :source ~/.vimrc<CR>

" Split windows (vertical, horizontal, equalize, close)
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>sx :close<CR>

" Tabs & buffers (open, close, next, prev, delete buffer)
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>c :Bdelete<CR>

" ----------------------------------------------------------------------------
" Plugin Keymaps
" ----------------------------------------------------------------------------

" NERDTree (neo-tree alternative: <Space>e toggle, <Space>o find file)
let g:NERDTreeHijackNetrw = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_view = 1
nnoremap <leader>e :NERDTreeTabsToggle<CR>
nnoremap <leader>o :NERDTreeTabsOpen<CR>:NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['^\.git$', '^node_modules$']
let NERDTreeMinimalUI = 1
" Close vim if NERDTree is the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" FZF (telescope alternative: files, live grep, grep word, buffers, help)
function! s:FzfBuffersDeleteExit(delete_file, code) abort
  if filereadable(a:delete_file)
    for l:line in readfile(a:delete_file)
      let l:b = matchstr(get(split(l:line, "\t", 1), 2, ''), '\[\zs[0-9]*\ze\]')
      if !empty(l:b)
        silent! execute 'Bdelete ' . l:b
      endif
    endfor
    call delete(a:delete_file)
  endif
endfunction

function! s:FzfBuffers() abort
  call s:HarpoonFocusEditWindow()
  let l:delete_file = tempname()
  let l:bind = 'ctrl-d:execute-silent(echo {} >> ' . fzf#shellescape(l:delete_file) . ')+exclude'
  call fzf#vim#buffers('', {
        \ 'exit': function('s:FzfBuffersDeleteExit', [l:delete_file]),
        \ 'options': ['--bind', l:bind, '--header', 'Ctrl-D: Delete Buffer']
        \ })
endfunction

nnoremap <silent> <leader>ff :call <SID>HarpoonFocusEditWindow()<CR>:Files<CR>
nnoremap <silent> <leader>fs :call <SID>HarpoonFocusEditWindow()<CR>:Rg<CR>
nnoremap <silent> <leader>fc :call <SID>HarpoonFocusEditWindow()<CR>:Rg <C-r><C-w><CR>
nnoremap <silent> <leader>fb :call <SID>FzfBuffers()<CR>
nnoremap <leader>fh :Helptags<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

" FZF with hidden files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Git & Docker UI (Fugitive full-tab status, Lazygit & Lazydocker)
nnoremap <leader>n :tab Git<CR>
nnoremap <leader>lg :tab term ++close lazygit<CR>
nnoremap <leader>ld :tab term ++close lazydocker<CR>

" Harpoon (native Vim implementation: <Space>a mark, Ctrl+e menu, F1-F4 / <Space>1-4 jump)
let g:harpoon_cache_dir = expand('~/.cache/vim-harpoon')
if !isdirectory(g:harpoon_cache_dir)
  call mkdir(g:harpoon_cache_dir, 'p')
endif
let s:harpoon_prev_winid = 0

function! s:HarpoonIsSpecialWin(winnr) abort
  let l:bt = getwinvar(a:winnr, '&buftype')
  let l:ft = getwinvar(a:winnr, '&filetype')
  let l:bname = bufname(winbufnr(a:winnr))
  return l:bt !=# '' || l:ft ==# 'nerdtree' || l:bname =~# '^NERD_tree_' || l:bname ==# '__Harpoon__'
endfunction

function! s:HarpoonFocusEditWindow() abort
  if s:harpoon_prev_winid != 0
    let l:prev_nr = win_id2win(s:harpoon_prev_winid)
    if l:prev_nr > 0 && !s:HarpoonIsSpecialWin(l:prev_nr)
      execute l:prev_nr . 'wincmd w'
      return
    endif
  endif
  if !s:HarpoonIsSpecialWin(winnr())
    return
  endif
  for l:w in range(1, winnr('$'))
    if !s:HarpoonIsSpecialWin(l:w)
      execute l:w . 'wincmd w'
      return
    endif
  endfor
  vertical botright new
endfunction

function! s:HarpoonDataFile() abort
  let l:key = substitute(getcwd(), '[^A-Za-z0-9_.-]', '_', 'g')
  return g:harpoon_cache_dir . '/' . l:key . '.txt'
endfunction

function! s:HarpoonGetFiles() abort
  let l:file = s:HarpoonDataFile()
  if !filereadable(l:file)
    return []
  endif
  return filter(readfile(l:file), 'v:val !~# "^\s*$"')
endfunction

function! s:HarpoonSaveFiles(files) abort
  let l:clean = filter(copy(a:files), 'v:val !~# "^\s*$"')
  call writefile(l:clean, s:HarpoonDataFile())
endfunction

function! HarpoonAddFile() abort
  let l:path = expand('%:.')
  if empty(l:path) || s:HarpoonIsSpecialWin(winnr())
    echo "Harpoon: Cannot mark NERDTree or special buffer."
    return
  endif
  let l:files = s:HarpoonGetFiles()
  let l:idx = index(l:files, l:path)
  if l:idx == -1
    call add(l:files, l:path)
    call s:HarpoonSaveFiles(l:files)
    let l:idx = len(l:files) - 1
    echo 'Harpoon: Added [' . (l:idx + 1) . '] ' . l:path
  else
    echo 'Harpoon: Already marked at [' . (l:idx + 1) . '] ' . l:path
  endif
endfunction

function! HarpoonNavFile(index) abort
  let l:files = s:HarpoonGetFiles()
  if a:index < 1 || a:index > len(l:files)
    echo 'Harpoon: Slot ' . a:index . ' is empty.'
    return
  endif
  let l:target = l:files[a:index - 1]
  if bufwinnr('__Harpoon__') != -1
    execute bufwinnr('__Harpoon__') . 'wincmd c'
  endif
  call s:HarpoonFocusEditWindow()
  execute 'edit ' . fnameescape(l:target)
endfunction

function! s:HarpoonMenuSelect(open_cmd) abort
  let l:target = trim(getline('.'))
  let l:lines = getline(1, '$')
  call s:HarpoonSaveFiles(l:lines)
  if a:open_cmd ==# 'tab_silent'
    if !empty(l:target)
      let l:menu_win = win_getid()
      execute 'tabedit ' . fnameescape(l:target)
      call win_gotoid(l:menu_win)
    endif
    return
  endif
  close
  call s:HarpoonFocusEditWindow()
  if !empty(l:target)
    execute a:open_cmd . ' ' . fnameescape(l:target)
  endif
endfunction

function! s:HarpoonMenuClose() abort
  if bufname('%') ==# '__Harpoon__'
    call s:HarpoonSaveFiles(getline(1, '$'))
    close
    call s:HarpoonFocusEditWindow()
  endif
endfunction

function! HarpoonToggleMenu() abort
  let l:win = bufwinnr('__Harpoon__')
  if l:win != -1
    execute l:win . 'wincmd w'
    call s:HarpoonMenuClose()
    return
  endif
  if !s:HarpoonIsSpecialWin(winnr())
    let s:harpoon_prev_winid = win_getid()
  endif
  call s:HarpoonFocusEditWindow()
  let s:harpoon_prev_winid = win_getid()
  let l:files = s:HarpoonGetFiles()
  belowright 8new __Harpoon__
  setlocal buftype=acwrite bufhidden=wipe noswapfile nobuflisted
  setlocal number norelativenumber cursorline nowrap
  call setline(1, l:files)
  setlocal nomodified
  nnoremap <buffer><silent> <CR> :call <SID>HarpoonMenuSelect('edit')<CR>
  nnoremap <buffer><silent> o :call <SID>HarpoonMenuSelect('edit')<CR>
  nnoremap <buffer><silent> t :call <SID>HarpoonMenuSelect('tabedit')<CR>
  nnoremap <buffer><silent> <C-t> :call <SID>HarpoonMenuSelect('tabedit')<CR>
  nnoremap <buffer><silent> T :call <SID>HarpoonMenuSelect('tab_silent')<CR>
  nnoremap <buffer><silent> s :call <SID>HarpoonMenuSelect('vsplit')<CR>
  nnoremap <buffer><silent> i :call <SID>HarpoonMenuSelect('split')<CR>
  nnoremap <buffer><silent> q :call <SID>HarpoonMenuClose()<CR>
  nnoremap <buffer><silent> <Esc> :call <SID>HarpoonMenuClose()<CR>
  nnoremap <buffer><silent> <C-e> :call <SID>HarpoonMenuClose()<CR>
  autocmd BufWriteCmd <buffer> call s:HarpoonSaveFiles(getline(1, '$')) | setlocal nomodified
  autocmd BufLeave <buffer> call s:HarpoonSaveFiles(getline(1, '$'))
endfunction

nnoremap <silent> <leader>a :call HarpoonAddFile()<CR>
nnoremap <silent> <C-e> :call HarpoonToggleMenu()<CR>
nnoremap <silent> <F1> :call HarpoonNavFile(1)<CR>
nnoremap <silent> <F2> :call HarpoonNavFile(2)<CR>
nnoremap <silent> <F3> :call HarpoonNavFile(3)<CR>
nnoremap <silent> <F4> :call HarpoonNavFile(4)<CR>
nnoremap <silent> <leader>1 :call HarpoonNavFile(1)<CR>
nnoremap <silent> <leader>2 :call HarpoonNavFile(2)<CR>
nnoremap <silent> <leader>3 :call HarpoonNavFile(3)<CR>
nnoremap <silent> <leader>4 :call HarpoonNavFile(4)<CR>

" Goyo (zen-mode alternative)
nnoremap <leader>z :Goyo<CR>
let g:goyo_width = '95%'
let g:goyo_height = '100%'

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Golang quick error snippet
nnoremap <leader>ee oif err != nil {<CR>}<esc>Oreturn err

" ----------------------------------------------------------------------------
" CoC (LSP & Completion)
" ----------------------------------------------------------------------------
" Auto-install required CoC extensions (Rust, Go, JS/TS, Python, SQL, TOML, JSON)
let g:coc_global_extensions = [
      \ 'coc-rust-analyzer',
      \ 'coc-toml',
      \ 'coc-go',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-sql',
      \ 'coc-snippets',
      \ 'coc-json'
      \ ]

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" LSP navigation keymaps (Use Ctrl+o to jump back, Ctrl+i to jump forward)
" gd: definition | gD: declaration | gy: type definition | gi: implementation | gr: references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation popup on K
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Code actions (<Space>ca) & refactoring rename (<Space>rn)
nmap <leader>ca <Plug>(coc-codeaction-selected)n
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)

" Format buffer (<Space>fp)
nnoremap <leader>fp :call CocActionAsync('format')<CR>

" Diagnostics navigation ([d previous, ]d next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Show diagnostics
nnoremap <silent><leader>cd :call CocActionAsync('diagnosticList')<CR>

" Copy diagnostics to clipboard
nnoremap <silent> <leader>cd :call CopyDiagnostics()<CR>
function! CopyDiagnostics()
  let diagnostics = CocAction('diagnosticList')
  if empty(diagnostics)
    echo "No diagnostics to copy."
    return
  endif
  let text = join(map(diagnostics, 'v:val.message'), "\n")
  let @+ = text
  echo "Diagnostics copied to clipboard."
endfunction

" ----------------------------------------------------------------------------
" Lightline (status line)
" ----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ }
      \ }

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
" Gitgutter
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'

" Fugitive (<Space>gs status, <Space>gd diff split, <Space>gb blame)
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>

" ----------------------------------------------------------------------------
" Database & PSQL (vim-dadbod & pgsql.vim)
" ----------------------------------------------------------------------------
let g:sql_type_default = 'pgsql'
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_save_location = '~/.local/share/db_ui'
let g:db_ui_execute_on_save = 0

" Dadbod UI global keymaps (<Space>du toggle UI, <Space>df find, <Space>dr rename, <Space>dl info)
nnoremap <leader>du :DBUIToggle<CR>
nnoremap <leader>df :DBUIFindBuffer<CR>
nnoremap <leader>dr :DBUIRenameBuffer<CR>
nnoremap <leader>dl :DBUILastQueryInfo<CR>

augroup PsqlKeymaps
  autocmd!
  autocmd BufNewFile,BufRead *.psql,*.pgsql setfiletype sql
  autocmd FileType sql,mysql,plsql,pgsql setlocal omnifunc=vim_dadbod_completion#omni
  " <Space>de: Execute SQL query | <Space>ds: Save query | <Space>dp: Format SQL
  autocmd FileType sql,mysql,plsql,pgsql nnoremap <buffer> <leader>de <Plug>(DBUI_ExecuteQuery)
  autocmd FileType sql,mysql,plsql,pgsql vnoremap <buffer> <leader>de <Plug>(DBUI_ExecuteQuery)
  autocmd FileType sql,mysql,plsql,pgsql nnoremap <buffer> <leader>ds <Plug>(DBUI_SaveQuery)
  autocmd FileType sql,mysql,plsql,pgsql nnoremap <buffer> <leader>dp :CocCommand prettier.formatFile<CR>
augroup END

" ----------------------------------------------------------------------------
" Snippets (coc-snippets)
" ----------------------------------------------------------------------------
" Use <C-j> to expand and jump
imap <C-j> <Plug>(coc-snippets-expand-jump)

" ----------------------------------------------------------------------------
" Rust
" ----------------------------------------------------------------------------
let g:rustfmt_autosave = 1
let g:rust_cargo_check_tests = 1
let g:rust_cargo_check_benches = 1

augroup RustKeymaps
  autocmd!
  autocmd FileType rust nnoremap <buffer> <leader>rr :RustRun<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rt :RustTest<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rb :Cbuild<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rc :Ccheck<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rm :CocCommand rust-analyzer.expandMacro<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rh :CocCommand document.toggleInlayHint<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rd :CocCommand rust-analyzer.openDocs<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rp :CocCommand rust-analyzer.parentModule<CR>
  autocmd FileType rust nnoremap <buffer> <leader>rj :CocCommand rust-analyzer.joinLines<CR>
augroup END

" ----------------------------------------------------------------------------
" Golang
" ----------------------------------------------------------------------------
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

augroup GoKeymaps
  autocmd!
  autocmd FileType go nnoremap <buffer> <leader>gr :GoRun<CR>
  autocmd FileType go nnoremap <buffer> <leader>gt :GoTest<CR>
  autocmd FileType go nnoremap <buffer> <leader>gf :GoTestFunc<CR>
  autocmd FileType go nnoremap <buffer> <leader>gb :GoBuild<CR>
  autocmd FileType go nnoremap <buffer> <leader>gc :GoCoverageToggle<CR>
  autocmd FileType go nnoremap <buffer> <leader>gi :GoImports<CR>
  autocmd FileType go nnoremap <buffer> <leader>ga :GoAlternate<CR>
  autocmd FileType go nnoremap <buffer> <leader>gta :GoAddTags<CR>
  autocmd FileType go nnoremap <buffer> <leader>gtr :GoRemoveTags<CR>
augroup END

" ----------------------------------------------------------------------------
" JavaScript / TypeScript
" ----------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup JavaScriptKeymaps
  autocmd!
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jr :!node %<CR>
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jt :Dispatch npm test<CR>
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jo :CocCommand tsserver.organizeImports<CR>
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jf :CocCommand eslint.executeAutofix<CR>
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jp :CocCommand prettier.formatFile<CR>
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <buffer> <leader>jd :CocCommand tsserver.goToSourceDefinition<CR>
augroup END

" ----------------------------------------------------------------------------
" Python
" ----------------------------------------------------------------------------
let g:python_highlight_all = 1

augroup PythonKeymaps
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType python nnoremap <buffer> <leader>pr :!python3 %<CR>
  autocmd FileType python nnoremap <buffer> <leader>pt :Dispatch pytest<CR>
  autocmd FileType python nnoremap <buffer> <leader>po :CocCommand pyright.organizeimports<CR>
  autocmd FileType python nnoremap <buffer> <leader>pf :call CocActionAsync('format')<CR>
  autocmd FileType python nnoremap <buffer> <leader>pi :CocCommand python.startREPL<CR>
augroup END

" ----------------------------------------------------------------------------
" Autocommands
" ----------------------------------------------------------------------------
function! s:StartupNERDTree() abort
  " Prevent vim-nerdtree-tabs VimEnterHandler from resetting s:nerdtree_globally_active to 0
  silent! autocmd! NERDTreeTabs VimEnter
  if exists('s:std_in')
    return
  endif
  if argc() == 1 && isdirectory(argv()[0])
    execute 'cd ' . fnameescape(argv()[0])
    enew
    NERDTreeTabsOpen
    wincmd p
  elseif argc() == 0
    NERDTreeTabsOpen
    wincmd p
  endif
endfunction

augroup MyAutoCmds
  autocmd!
  " Auto-resize splits when terminal is resized
  autocmd VimResized * wincmd =

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * call <SID>StartupNERDTree()
augroup END

" If NERDTree is already open when reloading ~/.vimrc, ensure NERDTreeTabs mirroring is active
if v:vim_did_enter
  for s:w in range(1, winnr('$'))
    if getwinvar(s:w, '&filetype') ==# 'nerdtree'
      let s:cur_win = win_getid()
      if !exists('t:NERDTreeBufName')
        silent! execute s:w . 'wincmd c'
      endif
      silent! NERDTreeTabsOpen
      call win_gotoid(s:cur_win)
      unlet s:cur_win
      break
    endif
  endfor
  unlet! s:w
endif

" ============================================================================
" End of Configuration
" ============================================================================
