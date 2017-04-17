execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set updatetime=250

"Filetype tabspaces
autocmd Filetype php setlocal shiftwidth=4 tabstop=4
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd Filetype scss setlocal shiftwidth=2 tabstop=2
autocmd Filetype vue setlocal shiftwidth=2 tabstop=2
autocmd Filetype go setlocal shiftwidth=4 tabstop=4
autocmd Filetype python setlocal shiftwidth=4 tabstop=4

"Vue file syntax highlighting
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"Airlines
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
