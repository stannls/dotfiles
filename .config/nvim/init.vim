" 
" 
" PLUGIN SETUP {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'
  Plug 'alec-gibson/nvim-tetris'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'fidian/hexmode'
  " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'airblade/vim-gitgutter'
  "Plug 'preservim/nerdtree'

  "Autoformat Plugin
  Plug 'rhysd/vim-clang-format'
  Plug 'joshdick/onedark.vim'
  Plug 'dense-analysis/ale'
  Plug 'numirias/semshi'
  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  Plug 'SirVer/ultisnips'
  let g:closetag_close_shortcut = ''
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

  " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'hail2u/vim-css3-syntax'
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " Improved incremental searching for Vim
  Plug 'haya14busa/incsearch.vim'
  " A Vim alignment plugin
  Plug 'junegunn/vim-easy-align'

  " Asynchronously control git repositories in Neovim/Vim 8
  " Plug 'lambdalisue/gina.vim'

  " A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'

  " rhubarb.vim: GitHub extension for fugitive.vim
  Plug 'tpope/vim-rhubarb'

	" Vastly improved Javascript indentation and syntax support in Vim
  Plug 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  Plug 'machakann/vim-sandwich'

  " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  let g:airline#extensions#branch#enabled = 0
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_inactive_collapse=0
  let g:airline_section_a = ''
  " let g:airline_section_b = ''
  let g:airline_section_c = '%f'
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = '%l'
  let g:airline_theme='rigel'
  let g:rigel_airline = 1

  " Asynchronous Lint Engine
  let g:ale_linters = {
        \   'python': ['flake8', 'pylint'],
        \   'javascript': ['eslint'],
        \   'javascript.jsx': ['eslint'],
        \   'rust': ['rls'],
        \}
	let g:ale_fix_on_save = 1
  let g:ale_fixers = {}
  let g:ale_fixers.python = ['yapf']
  let g:ale_fixers.javascript = ['eslint']
  let g:ale_fixers.rust = ['rustfmt']
  let g:ale_rust_rls_toolchain = 'stable'

  " Make the yanked region apparent!
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 500

	" Async Vim plugin for showing your outdated Vim plugins
  Plug 'semanser/vim-outdated-plugins'

  " Vim plugin for selectively illuminating other uses of current word under the cursor
  Plug 'RRethy/vim-illuminate'

  " Complete engine and Language Server support for neovim & vim, featured as VSCode
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'

  " Override vim syntax for yaml files
  Plug 'stephpy/vim-yaml'


  " Vim plugin for improved search highlighting
  Plug 'timakro/vim-searchant'

  
  " Colorscheme for vim, terminal, vscode and slack - based on the star Rigel
  Plug 'Rigellute/rigel'

  " Vim configuration files for Elixir
  Plug 'elixir-editors/vim-elixir'
  Plug 'stevearc/vim-arduino'
call plug#end()


" }}}


" 
" 
" GENERAL {{{
syntax enable                          " Enable syntax highlighting
colorscheme rigel
let mapleader = "\<Space>"             " Setup leader key
let macvim_skip_colorscheme=1
" }}}

" 
" 
" VARS {{{
if has('nvim')
  set inccommand=nosplit      " shows the effects of a command incrementally, as you type.
endif

set autoread                " autoload file changes
set autowriteall            " autosave files
set background=dark         " dark colorscheme
set completeopt-=preview    " Do not show preview window for ins-completion.
set diffopt+=vertical       " split diffopt in vertical mode
set encoding=utf-8          " set the character encoding to UTF-8
set expandtab               " convert tabs to the spaces
set foldlevel=2             " sets the fold level
set foldmethod=indent       " type of indentation
set foldnestmax=10          " sets the maximum nesting of folds
set gcr=a:blinkon0          " disable cursor blinking
set guioptions=             " remove all GUI components and options.
set hidden                  " hide when switching buffers instead of unloading
set history=1000            " store lots of :cmdline history
set hlsearch                " highlights the string matched by the search
set ignorecase              " make searching case insensitive
set incsearch               " incremental search
set nobackup                " disable backups
set nocompatible            " use Vim settings, rather then Vi
set nofoldenable            " when off, all folds are open when open a new file
set noshowmode              " don't show mode as we use a status line plugin
set noswapfile              " disable swapfile
set nowrap                  " wrap lines
set scrolloff=10            " keep cursor at the minimum 10 rows from the screen borders
set shiftwidth=2            " 2 spaces
set showmatch               " show match brackets
set sidescroll=1            " incrementally scroll one character
set signcolumn=yes          " always show signcolumns
set smartcase               " unless the query has capital letters
set splitbelow              " open new split below
set splitright              " open new split right
set tabstop=2               " 2 spaces
set termguicolors           " enable True color
set ttyfast                 " always assume a fast terminal
set undodir=~/.vim/undo-dir " setup undo directory
set undofile                " save undo chages even after computer restart
set updatetime=250          " reduce update time in Vim
set wildmenu                " visual autocomplete for command menu
" " }}}

set number
autocmd VimEnter *  ClangFormatAutoEnable

" 
" }}}

" FUNCTIONS {{{
" correct label for folding block in vimrc
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:find_selection()
  let selection = s:get_visual_selection()
  execute 'Ag '.s:get_visual_selection()
endfunction

function! s:get_visual_selection()
  " why is this not a built-in vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction
" }}}

" HIGHLIGHT {{{
hi illuminatedWord guibg=#4c525e
hi Normal guibg=NONE ctermbg=NONE
hi Visual guifg=#000000 guibg=#FFFFFF gui=none
hi Search guibg=Blue guifg=White
" }}}
"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set clipboard+=unnamedplus
let NERDTreeIgnore = ['\.o$']
set shortmess=a
set cmdheight=2

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
  endif
