" the prefix to use for leader commands
let g:mapleader=" "

" Use vim-plug to manage your plugins:
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/vendor')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'vim-pandoc/vim-pandoc'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Raimondi/delimitMate'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'alec-gibson/nvim-tetris'
Plug 'xiyaowong/transparent.nvim'
Plug 'mhinz/vim-startify'
Plug 'Mofiqul/vscode.nvim'
Plug 'stannls/vim-checkstyle'

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

Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 500

Plug 'Rigellute/rigel'
Plug 'pineapplegiant/spaceduck'
call plug#end()

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

nmap <leader>f  <Plug>(coc-fix-current)

" simplify switching workspaces

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-W> <C-W>w

" nerdtree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2

nnoremap <C-t> :NERDTreeToggle<CR>

set termguicolors
syntax enable
hi Normal guibg=NONE ctermbg=NONE
set number

colorscheme tokyonight

" CTRL-Tab is next tab
noremap <C-e> :<C-U>tabnext<CR>
inoremap <C-e> <C-\><C-N>:tabnext<CR>
cnoremap <C-e> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-q> :<C-U>tabprevious<CR>
inoremap <C-q> <C-\><C-N>:tabprevious<CR>
cnoremap <C-q> <C-C>:tabprevious<CR>

" Map CRTL-P to open coc commands"
noremap <C-p> :<C-U>CocCommand<CR>
inoremap <C-p> <C-\><C-N>:CocCommand<CR>
cnoremap <C-p> <C-C>:CocCoammand<CR>

"Mapping for new tab"
noremap <C-n> :<C-U>tabnew<CR>
inoremap <expr> <C-n> !pumvisible() ? '<C-\><C-N>:tabnew<CR>' : ''
cnoremap <C-n> <C-C>:tabnew<CR>

:inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>"

set clipboard +=unnamedplus

" Checkstyle plugin
let g:Checkstyle_Classpath = "/usr/share/java/checkstyle/checkstyle.jar"

if has('win32') || has ('win64')
    let g:Checkstyle_XML = $VIM."/Downloads/checkstyle-sheet4-5.xml"
else
    let g:Checkstyle_XML = $HOME."/Downloads/checkstyle-sheet4-5.xml"
endif

" Folding
autocmd BufWritePost *.java :Checkstyle
autocmd BufRead,BufNewFile *.java :Checkstyle
autocmd BufReadPost,FileReadPost * normal zR

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
EOF
