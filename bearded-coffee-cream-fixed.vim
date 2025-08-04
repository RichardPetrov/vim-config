" Bearded Coffee Cream - A light, coffee-themed colorscheme for Vim
" Based on the Bearded Theme Coffee Cream for VS Code
" Maintainer: Kilo Code

" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Set the name of the colorscheme
let g:colors_name = "bearded-coffee-cream"

" Enable true color support if available
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Define colors from the Bearded Theme Coffee Cream
let s:bg_main = "#FDF6E3"              " Main background (Solarized Light)
let s:bg_alt = "#EEE8D5"               " Alternate background (Solarized Light, slightly darker)
let s:fg_main = "#36221d"              " Main foreground
let s:fg_alt = "#a69692"               " Dimmed foreground
let s:accent = "#D3694C"               " Accent color (coffee/red-brown)
let s:accent_light = "#E8BFB2"         " Lighter version of accent (no opacity)
let s:yellow = "#ad8200"               " Yellow/Gold
let s:green = "#51A200"                " Green
let s:blue = "#009DB5"                 " Blue
let s:purple = "#7056c4"               " Purple
let s:teal = "#009b74"                 " Teal
let s:red = "#FF3A3A"                  " Red
let s:orange = "#ce6700"               " Orange
let s:magenta = "#CE4985"              " Magenta
let s:light_yellow = "#d0b27b"         " Light yellow
let s:comment = "#a69692"              " Comment color (no opacity)

" UI Elements
exe "hi Normal guifg=".s:fg_main." guibg=".s:bg_main
exe "hi NonText guifg=".s:fg_alt
exe "hi LineNr guifg=".s:fg_alt
exe "hi CursorLineNr guifg=".s:accent
exe "hi Visual guibg=".s:accent_light
exe "hi Search guibg=".s:accent_light." guifg=".s:fg_main
exe "hi IncSearch guibg=".s:accent_light." guifg=".s:fg_main
exe "hi StatusLine guifg=".s:fg_main." guibg=".s:bg_alt
exe "hi StatusLineNC guifg=".s:fg_alt." guibg=".s:bg_alt
exe "hi VertSplit guifg=".s:bg_alt." guibg=".s:bg_alt
exe "hi Folded guifg=".s:fg_alt." guibg=".s:bg_alt
exe "hi FoldColumn guifg=".s:fg_alt." guibg=".s:bg_alt
exe "hi Pmenu guifg=".s:fg_main." guibg=".s:bg_alt
exe "hi PmenuSel guifg=".s:bg_main." guibg=".s:accent
exe "hi PmenuSbar guibg=".s:bg_alt
exe "hi PmenuThumb guibg=".s:accent
exe "hi Directory guifg=".s:blue
exe "hi Title guifg=".s:accent
exe "hi ErrorMsg guifg=".s:red." guibg=".s:bg_main
exe "hi WarningMsg guifg=".s:yellow
exe "hi MatchParen guibg=".s:accent_light
exe "hi ColorColumn guibg=".s:bg_alt
exe "hi CursorLine guibg=".s:accent_light
exe "hi TabLine guifg=".s:fg_alt." guibg=".s:bg_alt
exe "hi TabLineFill guibg=".s:bg_alt
exe "hi TabLineSel guifg=".s:fg_main." guibg=".s:bg_main

" Syntax highlighting
exe "hi Comment guifg=".s:comment." gui=italic"
exe "hi Constant guifg=".s:orange
exe "hi String guifg=".s:green
exe "hi Character guifg=".s:green
exe "hi Number guifg=".s:orange
exe "hi Boolean guifg=".s:orange
exe "hi Float guifg=".s:orange
exe "hi Identifier guifg=".s:accent
exe "hi Function guifg=".s:blue
exe "hi Statement guifg=".s:yellow
exe "hi Conditional guifg=".s:yellow
exe "hi Repeat guifg=".s:yellow
exe "hi Label guifg=".s:yellow
exe "hi Operator guifg=".s:yellow
exe "hi Keyword guifg=".s:yellow
exe "hi Exception guifg=".s:yellow
exe "hi PreProc guifg=".s:magenta
exe "hi Include guifg=".s:yellow
exe "hi Define guifg=".s:yellow
exe "hi Macro guifg=".s:magenta
exe "hi PreCondit guifg=".s:yellow
exe "hi Type guifg=".s:purple
exe "hi StorageClass guifg=".s:teal
exe "hi Structure guifg=".s:teal
exe "hi Typedef guifg=".s:teal
exe "hi Special guifg=".s:blue
exe "hi SpecialChar guifg=".s:green
exe "hi Tag guifg=".s:blue
exe "hi Delimiter guifg=".s:fg_main
exe "hi SpecialComment guifg=".s:comment
exe "hi Debug guifg=".s:magenta
exe "hi Underlined gui=underline"
exe "hi Error guifg=".s:red." guibg=NONE"
exe "hi Todo guifg=".s:magenta." guibg=NONE gui=bold"

" Diff
exe "hi DiffAdd guifg=".s:green." guibg=".s:bg_alt
exe "hi DiffChange guifg=".s:blue." guibg=".s:bg_alt
exe "hi DiffDelete guifg=".s:red." guibg=".s:bg_alt
exe "hi DiffText guifg=".s:blue." guibg=".s:bg_alt

" Link some groups for consistency
hi! link SignColumn LineNr
hi! link MoreMsg Title
hi! link Question Title
hi! link ModeMsg Title
hi! link SpecialKey NonText
hi! link WildMenu PmenuSel
hi! link SpellBad Error
hi! link SpellCap WarningMsg
hi! link SpellRare WarningMsg
hi! link SpellLocal WarningMsg

" Terminal colors
if has("nvim")
  let g:terminal_color_0 = s:bg_main
  let g:terminal_color_1 = s:red
  let g:terminal_color_2 = s:green
  let g:terminal_color_3 = s:yellow
  let g:terminal_color_4 = s:blue
  let g:terminal_color_5 = s:magenta
  let g:terminal_color_6 = s:teal
  let g:terminal_color_7 = s:fg_main
  let g:terminal_color_8 = s:fg_alt
  let g:terminal_color_9 = s:red
  let g:terminal_color_10 = s:green
  let g:terminal_color_11 = s:yellow
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:magenta
  let g:terminal_color_14 = s:teal
  let g:terminal_color_15 = s:fg_main
endif