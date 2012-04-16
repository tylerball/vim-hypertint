"                _                           _   _       _
"               | |                         | | (_)     | |
"               | |__  _   _ _ __   ___ _ __| |_ _ _ __ | |_
"               | '_ \| | | | '_ \ / _ \ '__| __| | '_ \| __|
"               | | | | |_| | |_) |  __/ |  | |_| | | | | |_
"               |_| |_|\__, | .__/ \___|_|   \__|_|_| |_|\__|
"                       __/ | |
"                      |___/|_|
"
" A Colorscheme by Tyler Ball, inspired by many.

" Setup {{{ -------------------------------------------------------------------
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let colors_name = "hypertint"

if !exists("g:hypertint_html_link_underline") " {{{
    let g:hypertint_html_link_underline = 1
endif " }}}
" }}}

" Palette {{{ -----------------------------------------------------------------

let s:hyp = {}

" Default
let s:hyp.default  = ['FFFFFF', 15]
let s:hyp.background = ['121212', 233]

" Greyscales
let s:hyp.mid    = ['6B7679', 243]
let s:hyp.midlow    = ['454B4E', 238]
let s:hyp.dark   = ['303030', 236]
let s:hyp.darker   = ['282828', 235]
let s:hyp.darkest = ['161616', 234]
let s:hyp.black  = ['000000', 0]

" A barely-there red for colorcolumn
let s:hyp.reddark  = ['1A0000', 234]

" off-grey for folded text
let s:hyp.tealdark    = ['354752', 243]

let s:hyp.aquabright    = ['69ABFB', 33]
let s:hyp.aqua    = ['0A9DFF', 26]

" Highlighting Function (thanks sjl) {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:hyp, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:hyp, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:hyp, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    "echom histring

    execute histring
endfunction
" }}}
" }}}

" Colorscheme {{{ -------------------------------------------------------------

" UI {{{
call s:HL('Normal', 'default', 'background')

call s:HL('Folded', 'tealdark', 'bg', 'none')

call s:HL('CursorLine', '', 'black', 'none')
call s:HL('CursorColumn', '', 'black', 'none')
call s:HL('ColorColumn', '', 'reddark', 'none')

call s:HL('VertSplit', 'darker', 'darker')
call s:HL('LineNr', 'darker', 'darkest')

"call s:HL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call s:HL('NonText',    'background', 'bg')

call s:HL('Visual',    '',  'dark')
call s:HL('VisualNOS', '',  'dark')

call s:HL('Search',    'black', 'aqua', 'bold')
call s:HL('IncSearch', 'black', 'aquabright', 'bold')
" }}}}
" Syntax {{{
call s:HL('Comment',        'mid')
" }}}

" }}}
