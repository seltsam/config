if v:version < 700 || (exists('g:loaded_auto_reload') && g:loaded_auto_reload || &cp)
  finish
endif
let g:loaded_auto_reload = 1

augroup AutoReload
  au!
  autocmd FileWritePost,BufWritePost * call s:autoReload()
augroup END

let &statusline=substitute(&statusline,'\C%y','%y%{AutoReloadStatusLine()}','')

function! AutoReloadStatusLine()
  if !exists('g:autoReload_enable') || (exists('g:autoReload_enable') && g:autoReload_enable != 0)
    return ''
  else
    return '[AR]'
  endif
endfunction

if !exists('g:autoReloadPrograms')
  let g:autoReloadPrograms = ['reload_firefox']
endif

function! s:autoReload() 
  "Check enable
  if !exists('g:autoReload_enable') || (exists('g:autoReload_enable') && g:autoReload_enable != 0)
    return
  endif
  for prog in g:autoReloadPrograms
    let cmd = 'ruby ' . $VIM . '/vendor/' . prog . '.rb'
    call system(cmd)
  endfor
endfunction

function! s:toggleAutoReload()
  if !exists('g:autoReload_enable') || g:autoReload_enable == 0
    let g:autoReload_enable = 1
  else
    let g:autoReload_enable = 0
  endif
endfunction

nmap <silent> sr :call <SID>toggleAutoReload()<CR>
