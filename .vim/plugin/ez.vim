if v:version < 700 || (exists('g:loaded_ez') && g:loaded_ez || &cp)
  finish
endif
"let g:loaded_ez = 1

augroup Ez
  au!
  autocmd BufNewFile,BufRead *.tpl call s:ezTplEnvironment()
	autocmd FileWritePost,BufWritePost *.tpl call s:ezAllCacheClear()
augroup END

function! s:ezTplEnvironment()
  if !exists('b:ez_root') 
    let b:ez_root = "/home/seltsam/app/ezpublish-4.0.0/"
  endif
  if (exists('g:loaded_surround') && g:loaded_surround)
    if !exists("b:surround_{char2nr('*')}") " *
      let b:surround_{char2nr('*')} = "{* \r *}"
    endif
    if !exists("b:surround_{char2nr('=')}") " =
      let b:surround_{char2nr('=')} = "{debug-log var=\r msg=''}"
    endif
    "if !exists("b:surround_{char2nr('=')}") " =
    "  let b:surround_{char2nr('=')} = "{\r|attribute(show, 1)}"
    "endif
    if !exists("b:surround_{char2nr('a')}") " a
      let b:surround_{char2nr('a')} = "{\r|ezurl()|webinurl()}"
    endif
    if !exists("b:surround_{char2nr('$')}") " a
      let b:surround_{char2nr('$')} = "{if is_set( \r )|not()}{def }{/if}"
    endif
  endif
endfunction

function! s:ezAllCacheClear()
endfunction


