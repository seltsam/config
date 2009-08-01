" setlocal makeprg=$VIM/vendor/vimparse.php\ %\ $*
" setlocal errorformat=%f:%l:%m
" setlocal shellpipe=2>&1\ >
" au BufWritePost * silent make

" compiler php
" autocmd BufWritePost * silent make %
