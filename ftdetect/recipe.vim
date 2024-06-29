au BufRead,BufNewFile recipes/*.md set filetype=recipe
au BufRead,BufNewFile *.md if expand('%:p:h:t') == 'recipes' | set filetype=recipe | endif
