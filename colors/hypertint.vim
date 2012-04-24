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

" TODO remove this later
nnoremap <localleader>h :colorscheme hypertint<cr>

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
" Just a little off-white
let s:hyp.default    = ['FFFFFF', 15]

" Trying to find the right balance. Too dark a background and it seems really
" dark on a dim display, too bright and it increases strain.
let s:hyp.background = ['121212', 233]

" Greyscales
let s:hyp.light         = ['9CAEB3', 243]
let s:hyp.mid           = ['6B7679', 243]
let s:hyp.midlow        = ['454B4E', 238]
let s:hyp.dark          = ['303030', 236]
let s:hyp.darker        = ['282828', 235]
let s:hyp.darkest       = ['161616', 234]
let s:hyp.black         = ['000000', 0]

let s:hyp.redlight      = ['FF7B7B', 167]
let s:hyp.red           = ['FB0016', 196]
let s:hyp.redmedium     = ['FF595C', 196]
let s:hyp.redmid        = ['AC000B', 124]
let s:hyp.reddark       = ['1C1111', 234]

let s:hyp.tealdark      = ['354752', 243]
let s:hyp.tealmid       = ['69A1C9', 31]
let s:hyp.teallight     = ['B9DCF5', 117]

let s:hyp.cyanlight     = ['93EBFF', 123]
let s:hyp.cyan          = ['00D2FF', 45]

let s:hyp.aquabright    = ['89FFE5', 50]

let s:hyp.greenlight    = ['C4D4AD', 151]
let s:hyp.green         = ['ACEF5A', 154]
let s:hyp.greendark     = ['6EA631', 70]

let s:hyp.monolighter   = ['A4C0FB', 153]
let s:hyp.monolight     = ['85ABFB', 75]
let s:hyp.mono          = ['5C8EF7', 69]
let s:hyp.monodark      = ['627EB9', 67]
let s:hyp.monodarker    = ['1E48A1', 57]

let s:hyp.yellowlighter = ['FFEE9D', 229]
let s:hyp.yellowlight   = ['FFE779', 227]
let s:hyp.yellow        = ['FFDF4D', 226]
let s:hyp.yellowdark    = ['BFAE5B', 143]
let s:hyp.yellowdarker  = ['A68D19', 136]

let s:hyp.orangelighter = ['FFB579', 216]
let s:hyp.orangelight   = ['FF893B', 191]
let s:hyp.orange        = ['FF9C4D', 215]
let s:hyp.orangedark    = ['DF3C14', 202]
let s:hyp.orangedarker  = ['A65719', 130]

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
call s:HL('Normal'       , 'default'     , 'background')

call s:HL('Folded'       , 'tealdark'    , 'bg'          , 'none')

call s:HL('LineNr'       , 'darker'      , 'darkest')
call s:HL('VertSplit'    , 'darker'      , 'darker')
call s:HL('SignColumn'   , ''            , 'darkest')
call s:HL('FoldColumn'   , 'midlow'      , 'background')

call s:HL('CursorLine'   , ''            , 'black'       , 'none')
call s:HL('CursorColumn' , ''            , 'black'       , 'none')
call s:HL('ColorColumn'  , ''            , 'reddark'     , 'none')

call s:HL('MatchParen'   , 'black'       , 'default'     , 'bold')

call s:HL('NonText'      , 'background'  , 'bg')

call s:HL('Visual'       , ''            , 'dark')
call s:HL('VisualNOS'    , 'default'     , 'dark')

call s:HL('Search'       , 'black'       , 'monolight'   , 'bold')
call s:HL('IncSearch'    , 'black'       , 'aquabright'  , 'bold')

call s:HL('Underlined'   , 'fg'          , ''            , 'underline')

call s:HL('StatusLine'   , 'light'       , 'darker'      , 'bold')
call s:HL('StatusLineNC' , 'mid'         , 'darker'      , 'bold')

call s:HL('Directory'    , 'orangelight' , ''            , 'bold')
call s:HL('Title'        , 'monolight')

call s:HL('ErrorMsg'     , 'red'         , 'background'  , 'bold')
call s:HL('MoreMsg'      , 'light'       , ''            , 'none')
call s:HL('ModeMsg'      , 'light'       , ''            , 'bold')
call s:HL('Question'     , 'default'     , ''            , 'bold')
call s:HL('WarningMsg'   , 'redlight'    , ''            , 'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag'     , 'monolight' , ''        , 'bold')

call s:HL('Cursor'  , 'black'     , 'red'     , 'bold')
call s:HL('vCursor' , 'black'     , 'reddark' , 'bold')
call s:HL('iCursor' , 'default'   , 'black'   , 'none')

"hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000
" }}}}
" Syntax {{{

call s:HL('Special'        , 'orangelighter')

call s:HL('Comment'        , 'mid')
call s:HL('Todo'           , 'redmid'         , 'background' , 'bold')
call s:HL('SpecialComment' , 'light'          , 'background' , 'bold')

call s:HL('String'         , 'yellowlight')

call s:HL('Statement'      , 'mono'           , ''           , 'bold')
call s:HL('Keyword'        , 'cyan'           , ''           , 'bold')
call s:HL('Conditional'    , 'mono'           , ''           , 'bold')
call s:HL('Operator'       , 'cyanlight'      , ''           , 'none')
call s:HL('Label'          , 'mono'           , ''           , 'none')
call s:HL('Repeat'         , 'mono'           , ''           , 'none')

call s:HL('Identifier'     , 'cyanlight'      , ''           , 'none')
call s:HL('Function'       , 'cyanlight'      , ''           , 'none')

call s:HL('PreProc'        , 'aquabright'     , ''           , 'none')
call s:HL('Macro'          , 'aquabright'     , ''           , 'none')
call s:HL('Define'         , 'aquabright'     , ''           , 'none')
call s:HL('PreCondit'      , 'aquabright'     , ''           , 'bold')

call s:HL('Constant'       , 'orangelight'    , ''           , 'bold')
call s:HL('Character'      , 'orangelight'    , ''           , 'bold')
call s:HL('Boolean'        , 'orangelight'    , ''           , 'bold')

call s:HL('Number'         , 'orangelight'    , ''           , 'bold')
call s:HL('Float'          , 'orangelight'    , ''           , 'bold')

call s:HL('SpecialChar'    , 'orange'         , ''           , 'bold')

call s:HL('Type'           , 'green'          , ''           , 'none')
call s:HL('StorageClass'   , 'monolight'      , ''           , 'none')
call s:HL('Structure'      , 'monolight'      , ''           , 'none')
call s:HL('Typedef'        , 'monolight'      , ''           , 'bold')

"" Make try/catch blocks stand out.
call s:HL('Exception', 'orangedark', '', 'bold')

"" Misc
"call s:HL('Error' , 'snow'   , 'taffy' , 'bold')
call s:HL('Debug'  , 'yellow' , ''      , 'bold')
call s:HL('Ignore' , 'mid'    , ''      , '')

" }}}

" }}}

" Custom stuff
call s:HL('Instance', '', '', 'underline', 'mid')

" Filetype-specific {{{

" CSS {{{

"call s:HL('cssColorProp', 'fg', '', 'none')
"call s:HL('cssBoxProp', 'fg', '', 'none')
"call s:HL('cssTextProp', 'fg', '', 'none')
"call s:HL('cssRenderProp', 'fg', '', 'none')
"call s:HL('cssGeneratedContentProp', 'fg', '', 'none')

"call s:HL('cssValueLength', 'toffee', '', 'bold')
"call s:HL('cssColor', 'toffee', '', 'bold')
"call s:HL('cssBraces', 'lightgravel', '', 'none')
"call s:HL('cssIdentifier', 'orange', '', 'bold')
"call s:HL('cssClassName', 'orange', '', 'none')

" }}}
" Diff {{{

"call s:HL('gitDiff', 'lightgravel', '',)

"call s:HL('diffRemoved', 'dress', '',)
"call s:HL('diffAdded', 'lime', '',)
"call s:HL('diffFile', 'coal', 'taffy', 'bold')
"call s:HL('diffNewFile', 'coal', 'taffy', 'bold')

"call s:HL('diffLine', 'coal', 'orange', 'bold')
"call s:HL('diffSubname', 'orange', '', 'none')

" }}}
" Django Templates {{{

"call s:HL('djangoArgument', 'dirtyblonde', '',)
call s:HL('djangoTagBlock', 'orangelighter', '')
call s:HL('djangoVarBlock', 'orangelight', '')
call s:HL('djangoStatement', 'monolighter', '')
 "hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

"" Punctuation
call s:HL('htmlTag',    'monodark', 'bg', 'none')
call s:HL('htmlEndTag', 'monodark', 'bg', 'none')

"" Tag names
call s:HL('htmlTagName',        'monolight', '', 'bold')
call s:HL('htmlSpecialTagName', 'monolight', '', 'bold')

"" Attributes
call s:HL('htmlArg', 'monolighter', '', 'none')

call s:HL('htmlLink', 'orangelight', '', 'none')

" }}}
" Javascript {{{

call s:HL('javaScriptBraces', 'orangelight', '', 'none')
call s:HL('javaScriptParens', 'orangelight', '', 'bold')
call s:HL('javaScriptGlobal', 'green', '', 'bold')
call s:HL('javaScriptMember', 'cyan', '', 'bold')

" }}}
" LessCSS {{{

"call s:HL('lessVariable', 'lime', '', 'none')

" }}}
" Markdown {{{

"call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
"call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
"call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
"call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
"call s:HL('markdownItalic', 'snow', '', 'bold')
"call s:HL('markdownBold', 'snow', '', 'bold')
"call s:HL('markdownH1', 'orange', '', 'bold')
"call s:HL('markdownH2', 'lime', '', 'bold')
"call s:HL('markdownH3', 'lime', '', 'none')
"call s:HL('markdownH4', 'lime', '', 'none')
"call s:HL('markdownH5', 'lime', '', 'none')
"call s:HL('markdownH6', 'lime', '', 'none')
"call s:HL('markdownLinkText', 'toffee', '', 'underline')
"call s:HL('markdownIdDeclaration', 'toffee')
"call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
"call s:HL('markdownUrl', 'toffee', '', 'bold')
"call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
"call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
"call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
"call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
"call s:HL('markdownCode', 'dirtyblonde', '', 'none')
"call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

"hi def link pythonOperator Operator
call s:HL('pythonBuiltin'     , 'green')
call s:HL('pythonBuiltinObj'  , 'orange')
call s:HL('pythonBuiltinFunc' , 'orange')
call s:HL('pythonEscape'      , 'green')
call s:HL('pythonException'   , 'orangedark' , '' , 'bold')
call s:HL('pythonExceptions'  , 'orangelight' , '' , 'none')
call s:HL('pythonExClass'     , 'greendark'   , '' , 'underline')
call s:HL('pythonPrecondit'   , 'green'       , '' , 'none')
call s:HL('pythonDecorator'   , 'mono'        , '' , 'none')

" }}}
" Vim {{{

"call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')

"call s:HL('VimMapMod',    'dress', '', 'none')
"call s:HL('VimMapModKey', 'dress', '', 'none')
"call s:HL('VimNotation', 'dress', '', 'none')
"call s:HL('VimBracket', 'dress', '', 'none')
call s:HL('VimCommand', 'mono', '', 'none')

" }}}

" }}}
