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
"   <Space>a    Harpoon: Mark current file
"   Ctrl + e    Harpoon: Toggle quick menu
"   F1 - F4     Harpoon: Jump directly to file 1-4
"   (Inside FZF: Enter = open, Ctrl+v = vsplit, Ctrl+x = split, Ctrl+t = tab)
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
" 5. GIT
" ----------------------------------------------------------------------------
"   <Space>n    Open Neogit
"   <Space>gs   Git status (:Git)
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
  Plug 'NeogitOrg/neogit'
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
  Plug 'ThePrimeagen/harpoon'
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
let g:nerdtree_tabs_open_on_console_startup = 0
nnoremap <leader>e :NERDTreeTabsToggle<CR>
nnoremap <leader>o :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['^\.git$', '^node_modules$']
let NERDTreeMinimalUI = 1
" Close vim if NERDTree is the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" FZF (telescope alternative: files, live grep, grep word, buffers, help)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>fc :Rg <C-r><C-w><CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-d': 'Bdelete'
  \ }

" FZF with hidden files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Neogit
nnoremap <leader>n :Neogit<CR>

" Harpoon (<Space>a mark file, Ctrl+e menu, F1-F4 jump to file 1-4)
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <F1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <F2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <F3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <F4> :lua require("harpoon.ui").nav_file(4)<CR>

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
augroup MyAutoCmds
  autocmd!
  " Auto-resize splits when terminal is resized
  autocmd VimResized * wincmd =

  " 1. Fix the 'vim .' issue: Open tree on left, blank space on right
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

  " 2. Automatically start NERDTree if no files were specified (just typing `vim`)
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
augroup END

" ============================================================================
" End of Configuration
" ============================================================================
