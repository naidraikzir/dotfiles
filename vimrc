execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd Filetype scss setlocal shiftwidth=2 tabstop=2
autocmd Filetype vue setlocal shiftwidth=2 tabstop=2

"Airlines
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
