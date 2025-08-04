" Basic settings
set number
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set autoindent

" Enable filetype plugins
filetype plugin indent on

" Enable mouse support in all modes
set mouse=a
" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File explorer
Plug 'preservim/nerdtree'

" Syntax highlighting for JavaScript, JSX, HTML, and C#
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'c9rgreen/vim-colors-modus'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" VS Code theme support - using a more standard plugin
Plug 'tomasiser/vim-code-dark'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal
Plug 'voldikss/vim-floaterm'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" Auto pairs and surrounds
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Project management
Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-rooter'

" Snippets
Plug 'honza/vim-snippets'

" Comments
Plug 'tpope/vim-commentary'

" Buffer management
Plug 'jeetsukumaran/vim-buffergator'

" Add these to your plugin section
Plug 'nvim-lua/plenary.nvim'  " dependency
Plug 'MunifTanjim/nui.nvim'   " dependency
Plug 'jackMort/ChatGPT.nvim'  " main plugin

call plug#end()

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Floaterm settings
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Buffergator
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

" GitGutter
set updatetime=100
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Rooter
let g:rooter_patterns = ['.git', 'package.json', '*.sln', 'Makefile']

" FZF customization
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

" FZF key mappings
nnoremap <C-p> :Files<CR>
nnoremap <leader>sf :Rg<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sh :History<CR>
nnoremap <leader>st :BTags<CR>
nnoremap <leader>sl :Lines<CR>

" Additional key mappings
" Git
nmap <leader>gs :Git<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>

" Terminal
nnoremap <leader>t :FloatermNew<CR>

" Buffer navigation
nnoremap <leader>b :BuffergatorOpen<CR>

let g:OmniSharp_server_use_mono = 1

nmap <leader>F  <Plug>(coc-format)

" Custom filter for NERDTree to ignore Unity meta files
let NERDTreeIgnore = ['\.meta$', '\. unity$', '\.DS_Store']

" source ~/.vim/plugged/vim-colors-modus/colors/modus.vim

" Enable true color support before loading colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set light background before loading colorscheme
set background=light

" Bearded Coffee Cream theme settings
let g:airline_theme = 'papercolor'  " Light theme that works well with coffee colors

" Direct loading of colorscheme file (avoids file not found issues)
source ~/Documents/Development/Active/vim-config/bearded-coffee-cream-fixed.vim

" CoC Configuration
let g:coc_start_at_startup = 1
let g:coc_node_path = system('which node')[:-2]
let g:coc_config_home = expand('~/.vim')
let g:coc_disable_startup_warning = 1

" CoC status indicators
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

" Add this function definition that was missing
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" CoC completion settings
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" CoC navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC formatting
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f <Plug>(coc-format-selected)
xmap <leader>f <Plug>(coc-format-selected)

" CoC actions
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Format on save
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Initialize notification
autocmd User CocNvimInit echom "CoC initialization complete"

" System clipboard integration
set clipboard=unnamed

" If you're using mouse mode, make sure it's enabled properly
set mouse=a

" Mouse support is already enabled at the top of the file
" True color support is now handled before loading the colorscheme

" Add ChatGPT configuration
let g:chatgpt_api_key_path = expand('~/.config/nvim/chatgpt_api_key')

" ChatGPT keymaps
nnoremap <leader>cc :ChatGPT<CR>
nnoremap <leader>ce :ChatGPTEditWithInstruction<CR>
nnoremap <leader>cg :ChatGPTRun grammar_correction<CR>
nnoremap <leader>ct :ChatGPTRun translate<CR>
nnoremap <leader>ck :ChatGPTRun keywords<CR>
nnoremap <leader>cd :ChatGPTRun docstring<CR>
nnoremap <leader>cx :ChatGPTRun explain_code<CR>

