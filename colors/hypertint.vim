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
" }}}

" Palette {{{ -----------------------------------------------------------------

let s:hyp = {}

let s:hyp.default    = ['FFFFFF', 15]

" Trying to find the right balance. Too dark a background and it seems really
" dark on a dim display, too bright and it increases strain.
let s:hyp.background = ['1C1C1C', 234]

" Greyscales
let s:hyp.lighter       = ['D9E8EB', 195]
let s:hyp.light         = ['9CAEB3', 243]
let s:hyp.mid           = ['6B7679', 241]
let s:hyp.midlow        = ['454B4E', 238]
let s:hyp.dark          = ['303030', 236]
let s:hyp.darker        = ['282828', 235]
let s:hyp.black         = ['000000', 0]

let s:hyp.redlight      = ['FF7B7B', 167]
let s:hyp.red           = ['FB0016', 196]
let s:hyp.redmedium     = ['FF595C', 203]
let s:hyp.redmid        = ['AC000B', 124]
let s:hyp.reddark       = ['791117', 52]
let s:hyp.reddarker     = ['70000D', 88]

let s:hyp.tealdark      = ['354752', 243]
let s:hyp.teal          = ['5F90A9', 31]

let s:hyp.cyanlight     = ['93EBFF', 123]
let s:hyp.cyan          = ['00D2FF', 33]

let s:hyp.aquabright    = ['89FFE5', 50]

let s:hyp.greenlight    = ['C4D4AD', 151]
let s:hyp.green         = ['ACEF5A', 154]
let s:hyp.greendark     = ['6EA631', 70]
let s:hyp.greendarker   = ['244900', 22]

let s:hyp.monolighter   = ['A4C0FB', 153]
let s:hyp.monolight     = ['85ABFB', 75]
let s:hyp.mono          = ['5C8EF7', 69]
let s:hyp.monodark      = ['627EB9', 67]
let s:hyp.monodarker    = ['1E48A1', 57]
let s:hyp.monodarkest   = ['031F48', 17]

let s:hyp.yellowlighter = ['FFEE9D', 229]
let s:hyp.yellowlight   = ['FFE779', 227]
let s:hyp.yellow        = ['FFDF4D', 226]
let s:hyp.yellowdark    = ['BFAE5B', 143]
let s:hyp.yellowdarker  = ['A68D19', 136]

let s:hyp.orangelighter = ['FFB579', 216]
let s:hyp.orangelight   = ['FF893B', 172]
let s:hyp.orange        = ['FF9C4D', 215]
let s:hyp.orangedark    = ['BF875B', 137]
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

call s:HL('LineNr'       , 'mid'      , 'background'     , 'none')
call s:HL('VertSplit'    , 'background'     , 'background'     , 'none')
call s:HL('CursorLineNr' , 'mid'         , 'black'       , 'none')
call s:HL('SignColumn'   , 'dark'        , 'background')
call s:HL('FoldColumn'   , 'dark'        , 'background')

call s:HL('CursorColumn' , 'default'     , 'black'       , 'none')

call s:HL('MatchParen'   , 'black'       , 'light'       , 'bold')

call s:HL('NonText'      , 'background'  , 'bg')
call s:HL('SpecialKey'      , 'midlow'  , 'bg')

call s:HL('Visual'       , ''            , 'reddarker')
hi link Visual VisualNOS

call s:HL('Search'       , 'black'       , 'monolight'   , 'bold')
call s:HL('IncSearch'    , 'black'       , 'aquabright'  , 'bold')

call s:HL('Underlined'   , 'fg'          , ''            , 'underline')

call s:HL('StatusLine'   , 'light'       , 'darker'      , 'bold')
call s:HL('StatusLineNC' , 'mid'         , 'darker'      , 'bold')

call s:HL('Directory'    , 'orangelight' , ''            , 'bold')
call s:HL('Title'        , 'monolight')

call s:HL('ErrorMsg'     , 'red'         , 'background'  , 'bold')
call s:HL('MoreMsg'      , 'light'       , ''            , 'none')
hi link MoreMsg ModeMsg
call s:HL('Question'     , 'default'     , ''            , 'bold')
call s:HL('WarningMsg'   , 'redlight'    , ''            , 'bold')

call s:HL('Tag'        , 'monolight' , ''        , 'bold')

call s:HL('Cursor'     , 'black'     , 'orange'     , 'bold')
call s:HL('vCursor'    , 'black'     , 'orangedark' , 'bold')
call s:HL('iCursor'    , 'default'   , 'black'   , 'none')

call s:HL('Pmenu'      , 'default'   , 'dark'     , 'none')
call s:HL('PmenuSel'   , 'default'   , 'monodark' , 'none')
call s:HL('PmenuSbar'  , 'background'   , 'background'  , 'none')
call s:HL('PmenuThumb' , 'default'   , 'default'  , 'none')

hi CursorLine guibg=#000000 ctermbg=16 term=none cterm=none
hi ColorColumn guibg=#121212 ctermbg=233
" }}}}

" Syntax {{{

call s:HL('Special'        , 'orangelighter')

call s:HL('Comment'        , 'mid')
call s:HL('Todo'           , 'redmid'         , 'background' , 'bold')
call s:HL('SpecialComment' , 'light'          , 'background' , 'bold')

call s:HL('String'         , 'yellowlight' , '')

call s:HL('Statement'      , 'mono'           , ''           , 'bold')
call s:HL('Keyword'        , 'cyan'           , ''           , 'bold')
hi link Statement Conditional
call s:HL('Operator'       , 'cyanlight'      , ''           , 'none')
call s:HL('Label'          , 'mono'           , ''           , 'none')
hi link Label Repeat

call s:HL('Identifier'     , 'cyan'      , ''           , 'none')
call s:HL('Function'       , 'cyanlight'      , ''           , 'none')

call s:HL('PreProc'        , 'aquabright'     , ''           , 'none')
hi link PreProc Macro
hi link PreProc Define
call s:HL('PreCondit'      , 'aquabright'     , ''           , 'bold')

call s:HL('Constant'       , 'orangelight'    , ''           , 'bold')
hi link Constant Character
hi link Constant Boolean

call s:HL('Number'         , 'orangelighter'  , ''           , 'bold')
call s:HL('Float'          , 'orangelight'    , ''           , 'bold')

call s:HL('SpecialChar'    , 'orange'         , ''           , 'bold')

call s:HL('Type'           , 'redlight'          , ''           , 'none')
call s:HL('StorageClass'   , 'monolight'      , ''           , 'none')
hi link StorageClass Structure
hi link StorageClass Typedef

"" Make try/catch blocks stand out.
"call s:HL('Exception', 'lime', '', 'bold')

"" Misc
call s:HL('Error' , 'red'   , 'reddarker' , 'bold')
call s:HL('Debug'  , 'yellow' , ''      , 'bold')
call s:HL('Ignore' , 'mid'    , ''      , '')

" }}}

" Custom stuff {{{
call s:HL('Instance', '', '', 'underline', 'mid')
" }}}

" Filetype-specific {{{

" CSS {{{

call s:HL('cssColorProp'            , 'lighter'     , '' , 'none')
call s:HL('cssBoxProp'            , 'lighter'     , '' , 'none')
call s:HL('cssTextProp'            , 'lighter'     , '' , 'none')
call s:HL('cssRenderProp'            , 'lighter'     , '' , 'none')
call s:HL('cssPagingProp'            , 'lighter'     , '' , 'none')

call s:HL('cssGeneratedContentProp' , 'fg'          , '' , 'none')
call s:HL('cssCommonAttr'           , 'mono'        , '' , 'none')

call s:HL('cssValueLength'          , 'orange'      , '' , 'none')
call s:HL('cssBraces'               , 'monolighter' , '' , 'none')
call s:HL('cssIdentifier'           , 'cyanlight'   , '' , 'none')
call s:HL('cssClassName'            , 'cyan'        , '' , 'none')
call s:HL('cssTagName'              , 'mono'        , '' , 'none')
call s:HL('cssPseudoClass'          , 'teal'        , '' , 'none')

" }}}
" Diff {{{

call s:HL('diffDelete' , 'black'   , 'reddark'     , '')
call s:HL('diffAdd'    , 'default' , 'greendarker' , '')
call s:HL('diffChange' , 'light'   , 'monodarkest' , 'none')
call s:HL('diffText'   , 'default' , 'tealdark'    , 'bold')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'redmedium', '',)
call s:HL('djangoTagBlock', 'orangedark', '')
call s:HL('djangoVarBlock', 'orangelight', '')
call s:HL('djangoStatement', 'orangelight', '', 'bold')

" }}}
" HTML {{{

"" Punctuation
call s:HL('htmlTag',    'monodarker', 'bg', 'none')
call s:HL('htmlEndTag', 'monodarker', 'bg', 'none')

"" Tag names
call s:HL('htmlTagName',        'monolight', '', 'bold')
call s:HL('htmlSpecialTagName', 'monolight', '', 'bold')

"" Attributes
call s:HL('htmlArg', 'monolighter', '', 'none')
call s:HL('htmlLink', 'orangelight', '', 'none')

" }}}
" Javascript {{{

call s:HL('javaScriptBraces', 'orangelight', '', 'none')
call s:HL('javaScriptParens', 'cyan', '', 'bold')
call s:HL('javaScriptMember', 'orange', '', 'bold')
call s:HL('javaScriptMember', 'cyan', '', 'bold')

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'green', '', 'none')
call s:HL('lessMixinChar', 'cyan', '', 'none')
call s:HL('lessClass', 'cyan', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'orangedarker', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'orangedarker', '', 'bold')
call s:HL('markdownOrderedListMarker', 'monolight', '', 'bold')
call s:HL('markdownListMarker', 'monolight', '', 'bold')
call s:HL('markdownItalic', 'monolighter', '', 'italic')
call s:HL('markdownBold', 'monolighter', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'orangelighter', '', 'bold')
call s:HL('markdownH3', 'orangelighter', '', 'none')
call s:HL('markdownH4', 'orangelighter', '', 'none')
call s:HL('markdownH5', 'orangelighter', '', 'none')
call s:HL('markdownH6', 'orangelighter', '', 'none')
call s:HL('markdownLinkText', 'lighter', '', 'underline')
call s:HL('markdownIdDeclaration', 'lighter')
call s:HL('markdownId', 'monolighter')
"call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
call s:HL('markdownUrl', 'monolighter', '', 'none')
call s:HL('markdownUrldelimiter', 'orange', '', 'bold')
call s:HL('markdownLinkDelimiter', 'orangelighter', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'orange', '', 'bold')
call s:HL('markdownCodeDelimiter', 'orange', '', 'bold')
call s:HL('markdownCode', 'monolight', '', 'none')
call s:HL('markdownCodeBlock', 'monolighter', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',    'orange')
call s:HL('pythonBuiltinObj', 'orange')
call s:HL('pythonBuiltinFunc', 'monolight')
call s:HL('pythonEscape',     'green')
call s:HL('pythonException',  'orangelight', '', 'bold')
call s:HL('pythonExceptions', 'orangelight', '', 'none')
call s:HL('pythonExClass', 'greendark', '', 'underline')
call s:HL('pythonPrecondit', 'green', '', 'none')
call s:HL('pythonDecorator',  'redlight', '', 'none')
call s:HL('pythonDottedName',  'redlight', '', 'none')

" }}}
" Vim {{{
call s:HL('VimCommand', 'mono', '', 'none')
call s:HL('VimAutoEvent', 'aquabright', '', 'none')

" }}}

" git {{{
call s:HL('gitcommitSummary', 'lighter', '', 'none')
" }}}

" }}
" }}}

" Plugins {{{

" CtrlP {{{

call s:HL('CtrlPNoEntries', 'redmedium', 'black', 'bold')
call s:HL('CtrlPMatch', 'mono', 'background', 'none')
call s:HL('CtrlPLinePre', 'monodark', 'background', 'none')
call s:HL('CtrlPPrtBase', 'default', 'background', 'none')
call s:HL('CtrlPPrtCursor', 'black', 'monodark', 'bold')

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'red',     'background', 'none')
call s:HL('EasyMotionShade',  'midlow', 'black')

" }}}

" }}}
