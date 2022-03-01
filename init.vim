set exrc 
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=12
set signcolumn=yes
set cmdheight=2
set colorcolumn=80 "muestra la columna limite
set cursorline "resalta la linea actual
set title "muestra el nombre del archivo en la terminal 
set number "muestra los numeros de las lineas 
set mouse=a "integra mouse con neo vim
" Indentación a 2 espacios
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smartindent
set expandtab  " Insertar espacios en lugar de <Tab>s
set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set termguicolors  " Activa true colors en la terminal"
set termguicolors
set background=dark " or light if you want light mode

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'  " Es buena idea agregar una descripción del plugin
Plug 'scrooloose/nerdtree' " Explorador de archivos
Plug 'lukas-reineke/indent-blankline.nvim' " guias de indentacion
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'ellisonleao/gruvbox.nvim'

call plug#end()

colorscheme gruvbox
inoremap jj <ESC>
nnoremap <SPACE> <Nop>
let mapleader = " "

map <F2> :NERDTreeToggle<CR>

let g:rainbow_active = 1
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Empezar a buscar presionando Ctrl + p
nnoremap <C-p> :Files<CR>

" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1

lua << END
require('lualine').setup {
    options = {
        theme = 'gruvbox' 
    }
}
END
