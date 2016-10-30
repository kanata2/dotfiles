" colorize `err`
autocmd FileType go :highlight goErr ctermfg=11
autocmd FileType go :match goErr /\<err\>/
