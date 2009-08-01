" Vim color file
" Name:       inkpot.vim
" Maintainer: Ciaran McCreesh <ciaran.mccreesh@blueyonder.co.uk>
" This should work in the GUI, rxvt-unicode (88 colour mode) and xterm (256
" colour mode). It won't work in 8/16 colour terminals.
"
" To use a black background, :let g:inkpot_black_background = 1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "inkpot256"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
    return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
        endif
    endif
endfun

if ! exists("g:inkpot_black_background")
    let g:inkpot_black_background = 0
endif

if ! has("gui_running")
    if ! g:inkpot_black_background
        hi Normal         cterm=NONE   ctermfg=181	   ctermbg=234	
    else
        hi Normal         cterm=NONE   ctermfg=181	   ctermbg=0	
    endif
    hi IncSearch      cterm=BOLD   ctermfg=236	   ctermbg=173	
    hi Search         cterm=NONE   ctermfg=236	   ctermbg=173	
    hi ErrorMsg       cterm=BOLD   ctermfg=15	   ctermbg=167	
    hi WarningMsg     cterm=BOLD   ctermfg=15	   ctermbg=173	
    hi ModeMsg        cterm=BOLD   ctermfg=103	   ctermbg=234	
    hi MoreMsg        cterm=BOLD   ctermfg=103	   ctermbg=234	
    hi Question       cterm=BOLD   ctermfg=220	   ctermbg=234	

    hi StatusLine     cterm=BOLD   ctermfg=250	   ctermbg=238	
    hi User1          cterm=BOLD   ctermfg=48	   ctermbg=238	
    hi User2          cterm=BOLD   ctermfg=61	   ctermbg=238	
    hi StatusLineNC   cterm=NONE   ctermfg=250	   ctermbg=238	
    hi VertSplit      cterm=NONE   ctermfg=250	   ctermbg=238	

    hi WildMenu       cterm=BOLD   ctermfg=7	   ctermbg=61	

    hi MBENormal                 ctermfg=181	   ctermbg=236	
    hi MBEChanged                ctermfg=7	   ctermbg=236	
    hi MBEVisibleNormal          ctermfg=252	   ctermbg=60	
    hi MBEVisibleChanged         ctermfg=7	   ctermbg=60	

    hi DiffText       cterm=NONE   ctermfg=230	   ctermbg=238	
    hi DiffChange     cterm=NONE   ctermfg=230	   ctermbg=60	
    hi DiffDelete     cterm=NONE   ctermfg=230	   ctermbg=238	
    hi DiffAdd        cterm=NONE   ctermfg=230	   ctermbg=238	

    hi Cursor         cterm=NONE   ctermfg=238	   ctermbg=105	
    hi lCursor        cterm=NONE   ctermfg=238	   ctermbg=120	
    hi CursorIM       cterm=NONE   ctermfg=238	   ctermbg=105	

    hi Folded         cterm=NONE   ctermfg=252	   ctermbg=54	
    hi FoldColumn     cterm=NONE   ctermfg=104	   ctermbg=236	

    hi Directory      cterm=NONE   ctermfg=48	   ctermbg=234	
    hi LineNr         cterm=NONE   ctermfg=104	   ctermbg=236	
    hi NonText        cterm=BOLD   ctermfg=104	   ctermbg=234	
    hi SpecialKey     cterm=BOLD   ctermfg=135	   ctermbg=234	
    hi Title          cterm=BOLD   ctermfg=131	   ctermbg=234	
    hi Visual         cterm=NONE   ctermfg=7	   ctermbg=60	

    hi Comment        cterm=NONE   ctermfg=172	   ctermbg=234	
    hi Constant       cterm=NONE   ctermfg=222	   ctermbg=234	
    hi String         cterm=NONE   ctermfg=222	   ctermbg=238	
    hi Error          cterm=NONE   ctermfg=15	   ctermbg=238	
    hi Identifier     cterm=NONE   ctermfg=213	   ctermbg=234	
    hi Ignore         cterm=NONE
    hi Number         cterm=NONE   ctermfg=215	   ctermbg=234	
    hi PreProc        cterm=NONE   ctermfg=66	   ctermbg=234	
    hi Special        cterm=NONE   ctermfg=140	   ctermbg=234	
    hi SpecialChar    cterm=NONE   ctermfg=140	   ctermbg=238	
    hi Statement      cterm=NONE   ctermfg=105	   ctermbg=234	
    hi Todo           cterm=BOLD   ctermfg=236	   ctermbg=179	
    hi Type           cterm=NONE   ctermfg=213	   ctermbg=234	
    hi Underlined     cterm=BOLD   ctermfg=178	   ctermbg=234	
    hi TaglistTagName cterm=BOLD   ctermfg=105	   ctermbg=234	

    hi perlSpecialMatch   cterm=NONE ctermfg=140	   ctermbg=238	
    hi perlSpecialString  cterm=NONE ctermfg=140	   ctermbg=238	

    hi cSpecialCharacter  cterm=NONE ctermfg=140	   ctermbg=238	
    hi cFormat            cterm=NONE ctermfg=140	   ctermbg=238	

    hi doxygenBrief                 cterm=NONE ctermfg=215	   ctermbg=234	
    hi doxygenParam                 cterm=NONE ctermfg=222	   ctermbg=234	
    hi doxygenPrev                  cterm=NONE ctermfg=222	   ctermbg=234	
    hi doxygenSmallSpecial          cterm=NONE ctermfg=222	   ctermbg=234	
    hi doxygenSpecial               cterm=NONE ctermfg=222	   ctermbg=234	
    hi doxygenComment               cterm=NONE ctermfg=136	   ctermbg=234	
    hi doxygenSpecial               cterm=NONE ctermfg=215	   ctermbg=234	
    hi doxygenSpecialMultilineDesc  cterm=NONE ctermfg=130	   ctermbg=234	
    hi doxygenSpecialOnelineDesc    cterm=NONE ctermfg=130	   ctermbg=234	

    if v:version >= 700
        hi Pmenu          cterm=NONE   ctermfg=7	   ctermbg=60	
        hi PmenuSel       cterm=BOLD   ctermfg=7	   ctermbg=236	
        hi PmenuSbar      cterm=BOLD   ctermfg=7	   ctermbg=61	
        hi PmenuThumb     cterm=BOLD   ctermfg=7	   ctermbg=61	

        hi SpellBad     cterm=undercurl guisp=#cc6666
        hi SpellRare    cterm=undercurl guisp=#cc66cc
        hi SpellLocal   cterm=undercurl guisp=#cccc66
        hi SpellCap     cterm=undercurl guisp=#66cccc

        hi MatchParen   cterm=NONE      ctermfg=238	   ctermbg=120	
    endif
else
    if ! g:inkpot_black_background
        exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(80)
    else
        exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(16)
    endif

    exec "hi IncSearch      cterm=BOLD   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
    exec "hi Search         cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
    exec "hi ErrorMsg       cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(48)
    exec "hi WarningMsg     cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(68)
    exec "hi ModeMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
    exec "hi MoreMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
    exec "hi Question       cterm=BOLD   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"

    exec "hi StatusLine     cterm=BOLD   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
    exec "hi User1          cterm=BOLD   ctermfg=" . <SID>X(28) . " ctermbg=" . <SID>X(81)
    exec "hi User2          cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(81)
    exec "hi StatusLineNC   cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)
    exec "hi VertSplit      cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)

    exec "hi WildMenu       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)

    exec "hi MBENormal                   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
    exec "hi MBEChanged                  ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(81)
    exec "hi MBEVisibleNormal            ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(82)
    exec "hi MBEVisibleChanged           ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)

    exec "hi DiffText       cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(34)
    exec "hi DiffChange     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(17)
    exec "hi DiffDelete     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi DiffAdd        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(20)

    exec "hi Folded         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(35)
    exec "hi FoldColumn     cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)

    exec "hi Directory      cterm=NONE   ctermfg=" . <SID>X(28) . " ctermbg=" . "NONE"
    exec "hi LineNr         cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)
    exec "hi NonText        cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"
    exec "hi SpecialKey     cterm=BOLD   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
    exec "hi Title          cterm=BOLD   ctermfg=" . <SID>X(48) . " ctermbg=" . "NONE"
    exec "hi Visual         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(38)

    exec "hi Comment        cterm=NONE   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"
    exec "hi Constant       cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . "NONE"
    exec "hi String         cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
    exec "hi Error          cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi Identifier     cterm=NONE   ctermfg=" . <SID>X(53) . " ctermbg=" . "NONE"
    exec "hi Ignore         cterm=NONE"
    exec "hi Number         cterm=NONE   ctermfg=" . <SID>X(69) . " ctermbg=" . "NONE"
    exec "hi PreProc        cterm=NONE   ctermfg=" . <SID>X(25) . " ctermbg=" . "NONE"
    exec "hi Special        cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
    exec "hi SpecialChar    cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . <SID>X(81)
    exec "hi Statement      cterm=NONE   ctermfg=" . <SID>X(27) . " ctermbg=" . "NONE"
    exec "hi Todo           cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(57)
    exec "hi Type           cterm=NONE   ctermfg=" . <SID>X(71) . " ctermbg=" . "NONE"
    exec "hi Underlined     cterm=BOLD   ctermfg=" . <SID>X(77) . " ctermbg=" . "NONE"
    exec "hi TaglistTagName cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"

    if v:version >= 700
        exec "hi Pmenu          cterm=NONE   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)
        exec "hi PmenuSel       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)
        exec "hi PmenuSbar      cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)
        exec "hi PmenuThumb     cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)

        exec "hi SpellBad       cterm=NONE ctermbg=" . <SID>X(32)
        exec "hi SpellRare      cterm=NONE ctermbg=" . <SID>X(33)
        exec "hi SpellLocal     cterm=NONE ctermbg=" . <SID>X(36)
        exec "hi SpellCap       cterm=NONE ctermbg=" . <SID>X(21)
        exec "hi MatchParen     cterm=NONE ctermbg=" . <SID>X(14) . "ctermfg=" . <SID>X(25)
    endif
endif

" vim: set et :
