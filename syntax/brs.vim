" brightscript is case insensitive
syn case ignore
syn iskeyword @,48-57,192-255,$,%,#,!,&

syn match brsIdentifier /\v\c<[A-Za-z_]+[$%!#]?>/

syn match brsOp /\v[A-Za-z_$%!#]@<=\.[A-Za-z_]@=/

" function calls
syn region functContent matchgroup=brsFunct start=/\v\.?<\w+\(/ end=/\v\)/ contains=ALL

" constants {{{
syn keyword brsConstant
    \ invalid
syn keyword brsBool
    \ true
    \ false
" }}}

" control keywords (exit, stop, etc) {{{
syn match brsKeyword /\v\c<end\ze\s*$/
syn keyword brsKeyword as nextgroup=brsType skipwhite
syn match brsKeyword /\v\c<(exit|stop)>/
" }}}

" conditional statements {{{
syn keyword brsCondit
    \ if
    \ then
syn match brsCondit /\v\c(end|else) ?if/
syn match brsCondit /\v\c<else>/
" }}}

" loops {{{
syn keyword brsLoop
    \ for
    \ while
    \ each
    \ in
    \ to
    \ step
syn match brsLoop /\v\c<end ?(for|while)>/
syn match brsLoop /\v\c^\s*next>/
" }}}

" misc statements {{{
syn match brsStatement /\v\c<exit (for|while)/
syn match brsStatement /\v\c<return>/
" }}}

" function declaration {{{
syn keyword brsFunctDef
    \ sub
    \ function
syn match brsFunctDef /\v\c<(sub|function)>.*/ contains=brsFunct
syn match brsFunctDef /\v\c<end ?sub>/
syn match brsFunctDef /\v\c<end function>/
" }}}

" misc. reserved keywords {{{
syn keyword brsReserved
    \ LINE_NUM
    \ getglobalaa
    \ getlastruncompileerror
    \ getlastrunruntimeerror
    \ objfun
    \ pos
    \ tab
    \ let
    \ goto
    \ run
    \ dim
" }}}

" namespace m {{{
syn keyword brsScope m
" }}}

" conditional compilation
syn match brsCondComp /\v\c^\s*\zs#(else( if)?|(end )?if|error)/
syn match brsCondCompDef /\v\c^\s*\zs#const/
syn match brsError /\v\c^\s*\zs#error/
" library import
syn keyword brsLib library
 
" operators & delimiters {{{
syn match brsDelim /\v,|:|;/
syn match brsOp /\v\=/
syn match brsOp /\v\<\>/
syn match brsOp /\v[/\\*+-]\=?/
syn match brsOp /\v\+{2}/
syn match brsOp /\v-{2}/
syn match brsOp /\v\^/
syn match brsOp /\v\<{1,2}\=?/
syn match brsOp /\v\>{1,2}\=?/
syn match brsOp /\v\c<mod>/
syn match brsOp /\v\c<and>/
syn match brsOp /\v\c<or>/
syn match brsOp /\v\c<not>/
syn match brsOp /\v\[/
syn match brsOp /\v\]/
syn match brsOp /\v\{/
syn match brsOp /\v\}/
" }}}

" numbers {{{
syn match brsHex /\v\c<\&h\x+>/
syn match brsInteger /\v<\d+\.?>/
syn match brsLong /\v<\d+\&>/
syn match brsFloat /\v\c<\d+(\.\d+)?e(\+|-)?\d+(\.\d+)?!?>/
syn match brsFloat /\v<(\d+!|(\d+)?\.\d+!?)>/
syn match brsDouble /\v<(\d|(\..*)@<!\.(.*\.)@!){11,}>/
syn match brsDouble /\v<\d{10,}#?>/
syn match brsDouble /\v<\d+(\.\d+)?d((\+|-)\d+(\.\d+)?)?#?>/
syn match brsDouble /\v<\d+(\.\d+)?#>/
" }}}

" debug output
syn match brsOut /\v^\s*\zs(\?|print\s+)/ contains=ALL

" comments {{{
syn match brsComment /\v'.*$/ contains=brsTodo
syn match brsComment /\v\c<rem .*$/ contains=brsTodo
syn keyword brsTodo 
            \ TODO
            \ NB
            \ FIXME
            \ NOTE
            \ FYI
            \ BUG
            \ XXX
            \ contained
" }}}

" variable types {{{
syn keyword brsType
    \ Boolean
    \ bool
    \ Integer
    \ LongInteger
    \ long
    \ Float
    \ Double
    \ String
    \ Object
    \ Interface
    \ Dynamic
syn match brsType /\v\c<(int|str)>\(\@1!/
" }}}

" strings
syn region brsString start=/"/ end=/"/ contains=brsSubStr oneline 
syn match brsSubStr /\v\c\{[0-9]+\}/ contained

" roku component classes {{{
syn match brsComponent /\v\c("?)roAppInfo\1/ 
syn match brsComponent /\v\c("?)roAppManager\1/ 
syn match brsComponent /\v\c("?)roArray\1/ 
syn match brsComponent /\v\c("?)roAssociativeArray\1/ 
syn match brsComponent /\v\c("?)roAudioMetadata\1/ 
syn match brsComponent /\v\c("?)roAudioPlayer\1/ 
syn match brsComponent /\v\c("?)roAudioPlayerEvent\1/ 
syn match brsComponent /\v\c("?)roAudioResource\1/ 
syn match brsComponent /\v\c("?)roBitmap\1/ 
syn match brsComponent /\v\c("?)roBoolean\1/ 
syn match brsComponent /\v\c("?)roByteArray\1/ 
syn match brsComponent /\v\c("?)roCaptionRenderer\1/ 
syn match brsComponent /\v\c("?)roCaptionRendererEvent\1/ 
syn match brsComponent /\v\c("?)roChannelStore\1/ 
syn match brsComponent /\v\c("?)roChannelStoreEvent\1/ 
syn match brsComponent /\v\c("?)roCodeRegistrationScreen\1/ 
syn match brsComponent /\v\c("?)roCodeRegistrationScreenEvent\1/ 
syn match brsComponent /\v\c("?)roCompositor\1/ 
syn match brsComponent /\v\c("?)roDataGramSocket\1/ 
syn match brsComponent /\v\c("?)roDateTime\1/ 
syn match brsComponent /\v\c("?)roDeviceInfo\1/ 
syn match brsComponent /\v\c("?)roDeviceInfoEvent\1/ 
syn match brsComponent /\v\c("?)roDouble\1/ 
syn match brsComponent /\v\c("?)roEVPCipher\1/ 
syn match brsComponent /\v\c("?)roEVPDigest\1/ 
syn match brsComponent /\v\c("?)roFileSystem\1/ 
syn match brsComponent /\v\c("?)roFileSystemEvent\1/ 
syn match brsComponent /\v\c("?)roFloat\1/ 
syn match brsComponent /\v\c("?)roFont\1/ 
syn match brsComponent /\v\c("?)roFontRegistry\1/ 
syn match brsComponent /\v\c("?)roFunction\1/ 
syn match brsComponent /\v\c("?)roGridScreen\1/ 
syn match brsComponent /\v\c("?)roGridScreenEvent\1/ 
syn match brsComponent /\v\c("?)roHMAC\1/ 
syn match brsComponent /\v\c("?)roHdmiHotPlugEvent\1/ 
syn match brsComponent /\v\c("?)roHdmiStatus\1/ 
syn match brsComponent /\v\c("?)roHdmiStatusEvent\1/ 
syn match brsComponent /\v\c("?)roHttpAgent\1/ 
syn match brsComponent /\v\c("?)roImageCanvas\1/ 
syn match brsComponent /\v\c("?)roImageCanvasEvent\1/ 
syn match brsComponent /\v\c("?)roImageMetadata\1/ 
syn match brsComponent /\v\c("?)roInput\1/ 
syn match brsComponent /\v\c("?)roInputEvent\1/ 
syn match brsComponent /\v\c("?)roInt(eger)?\1/ 
syn match brsComponent /\v\c("?)roInvalid\1/ 
syn match brsComponent /\v\c("?)roKeyboardScreen\1/ 
syn match brsComponent /\v\c("?)roKeyboardScreenEvent\1/ 
syn match brsComponent /\v\c("?)roList\1/ 
syn match brsComponent /\v\c("?)roListScreen\1/ 
syn match brsComponent /\v\c("?)roListScreenEvent\1/ 
syn match brsComponent /\v\c("?)roLocalization\1/ 
syn match brsComponent /\v\c("?)roLongInteger\1/ 
syn match brsComponent /\v\c("?)roMessageDialog\1/ 
syn match brsComponent /\v\c("?)roMessageDialogEvent\1/ 
syn match brsComponent /\v\c("?)roMessagePort\1/ 
syn match brsComponent /\v\c("?)roOneLineDialog\1/ 
syn match brsComponent /\v\c("?)roOneLineDialogEvent\1/ 
syn match brsComponent /\v\c("?)roParagraphScreen\1/ 
syn match brsComponent /\v\c("?)roParagraphScreenEvent\1/ 
syn match brsComponent /\v\c("?)roPath\1/ 
syn match brsComponent /\v\c("?)roPinEntryDialog\1/ 
syn match brsComponent /\v\c("?)roPinEntryDialogEvent\1/ 
syn match brsComponent /\v\c("?)roPosterScreen\1/ 
syn match brsComponent /\v\c("?)roPosterScreenEvent\1/ 
syn match brsComponent /\v\c("?)roProgramGuide\1/ 
syn match brsComponent /\v\c("?)roRSA\1/ 
syn match brsComponent /\v\c("?)roRegex\1/ 
syn match brsComponent /\v\c("?)roRegion\1/ 
syn match brsComponent /\v\c("?)roRegistry\1/ 
syn match brsComponent /\v\c("?)roRegistrySection\1/ 
syn match brsComponent /\v\c("?)roSGNode\1/ 
syn match brsComponent /\v\c("?)roSGNodeEvent\1/ 
syn match brsComponent /\v\c("?)roSGScreen\1/ 
syn match brsComponent /\v\c("?)roSGScreenEvent\1/ 
syn match brsComponent /\v\c("?)roScreen\1/ 
syn match brsComponent /\v\c("?)roSearchHistory\1/ 
syn match brsComponent /\v\c("?)roSearchScreen\1/ 
syn match brsComponent /\v\c("?)roSearchScreenEvent\1/ 
syn match brsComponent /\v\c("?)roSlideShow\1/ 
syn match brsComponent /\v\c("?)roSlideShowEvent\1/ 
syn match brsComponent /\v\c("?)roSocketAddress\1/ 
syn match brsComponent /\v\c("?)roSocketEvent\1/ 
syn match brsComponent /\v\c("?)roSpringboardScreen\1/ 
syn match brsComponent /\v\c("?)roSpringboardScreenEvent\1/ 
syn match brsComponent /\v\c("?)roSprite\1/ 
syn match brsComponent /\v\c("?)roStreamSocket\1/ 
syn match brsComponent /\v\c("?)roString\1/ 
syn match brsComponent /\v\c("?)roSystemLog\1/ 
syn match brsComponent /\v\c("?)roSystemLogEvent\1/ 
syn match brsComponent /\v\c("?)roTextScreen\1/ 
syn match brsComponent /\v\c("?)roTextScreenEvent\1/ 
syn match brsComponent /\v\c("?)roTextToSpeech\1/ 
syn match brsComponent /\v\c("?)roTextToSpeechEvent\1/ 
syn match brsComponent /\v\c("?)roTextureManager\1/ 
syn match brsComponent /\v\c("?)roTextureRequest\1/ 
syn match brsComponent /\v\c("?)roTextureRequestEvent\1/ 
syn match brsComponent /\v\c("?)roTimespan\1/ 
syn match brsComponent /\v\c("?)roTuner\1/ 
syn match brsComponent /\v\c("?)roTunerEvent\1/ 
syn match brsComponent /\v\c("?)roUniversalControlEvent\1/ 
syn match brsComponent /\v\c("?)roUrlEvent\1/ 
syn match brsComponent /\v\c("?)roUrlTransfer\1/ 
syn match brsComponent /\v\c("?)roVideoPlayer\1/ 
syn match brsComponent /\v\c("?)roVideoPlayerEvent\1/ 
syn match brsComponent /\v\c("?)roVideoScreen\1/ 
syn match brsComponent /\v\c("?)roVideoScreenEvent\1/ 
syn match brsComponent /\v\c("?)roXMLElement\1/ 
syn match brsComponent /\v\c("?)roXMLList\1/
" }}}

" roku component interfaces {{{
syn match brsInterface /\v\c("?)ifAppInfo\1/ 
syn match brsInterface /\v\c("?)ifAppManager\1/ 
syn match brsInterface /\v\c("?)ifArray\1/ 
syn match brsInterface /\v\c("?)ifArrayGet\1/ 
syn match brsInterface /\v\c("?)ifArraySet\1/ 
syn match brsInterface /\v\c("?)ifArraySort\1/ 
syn match brsInterface /\v\c("?)ifAssociativeArray\1/ 
syn match brsInterface /\v\c("?)ifAudioMetadata\1/ 
syn match brsInterface /\v\c("?)ifAudioPlayer\1/ 
syn match brsInterface /\v\c("?)ifAudioResource\1/ 
syn match brsInterface /\v\c("?)ifBoolean\1/ 
syn match brsInterface /\v\c("?)ifByteArray\1/ 
syn match brsInterface /\v\c("?)ifCaptionRenderer\1/ 
syn match brsInterface /\v\c("?)ifChannelStore\1/ 
syn match brsInterface /\v\c("?)ifCodeRegistrationScreen\1/ 
syn match brsInterface /\v\c("?)ifCompositor\1/ 
syn match brsInterface /\v\c("?)ifDateTime\1/ 
syn match brsInterface /\v\c("?)ifDeviceInfo\1/ 
syn match brsInterface /\v\c("?)ifDouble\1/ 
syn match brsInterface /\v\c("?)ifDraw2D\1/ 
syn match brsInterface /\v\c("?)ifEVPCipher\1/ 
syn match brsInterface /\v\c("?)ifEVPDigest\1/ 
syn match brsInterface /\v\c("?)ifEnum\1/ 
syn match brsInterface /\v\c("?)ifFileSystem\1/ 
syn match brsInterface /\v\c("?)ifFloat\1/ 
syn match brsInterface /\v\c("?)ifFont\1/ 
syn match brsInterface /\v\c("?)ifFontMetrics\1/ 
syn match brsInterface /\v\c("?)ifFontRegistry\1/ 
syn match brsInterface /\v\c("?)ifFunction\1/ 
syn match brsInterface /\v\c("?)ifGetMessagePort\1/ 
syn match brsInterface /\v\c("?)ifGridScreen\1/ 
syn match brsInterface /\v\c("?)ifHMAC\1/ 
syn match brsInterface /\v\c("?)ifHdmiStatus\1/ 
syn match brsInterface /\v\c("?)ifHttpAgent\1/ 
syn match brsInterface /\v\c("?)ifImageCanvas\1/ 
syn match brsInterface /\v\c("?)ifImageMetadata\1/ 
syn match brsInterface /\v\c("?)ifInput\1/ 
syn match brsInterface /\v\c("?)ifInt\1/ 
syn match brsInterface /\v\c("?)ifIntOps\1/ 
syn match brsInterface /\v\c("?)ifKeyboardScreen\1/ 
syn match brsInterface /\v\c("?)ifList\1/ 
syn match brsInterface /\v\c("?)ifListScreen\1/ 
syn match brsInterface /\v\c("?)ifLocalization\1/ 
syn match brsInterface /\v\c("?)ifLongInt\1/ 
syn match brsInterface /\v\c("?)ifMessageDialog\1/ 
syn match brsInterface /\v\c("?)ifMessagePort\1/ 
syn match brsInterface /\v\c("?)ifOneLineDialog\1/ 
syn match brsInterface /\v\c("?)ifParagraphScreen\1/ 
syn match brsInterface /\v\c("?)ifPath\1/ 
syn match brsInterface /\v\c("?)ifPinEntryDialog\1/ 
syn match brsInterface /\v\c("?)ifPosterScreen\1/ 
syn match brsInterface /\v\c("?)ifProgramGuide\1/ 
syn match brsInterface /\v\c("?)ifRSA\1/ 
syn match brsInterface /\v\c("?)ifRegex\1/ 
syn match brsInterface /\v\c("?)ifRegion\1/ 
syn match brsInterface /\v\c("?)ifRegistry\1/ 
syn match brsInterface /\v\c("?)ifRegistrySection\1/ 
syn match brsInterface /\v\c("?)ifRoSGScreen\1/ 
syn match brsInterface /\v\c("?)ifSGNodeBoundingRect\1/ 
syn match brsInterface /\v\c("?)ifSGNodeChildren\1/ 
syn match brsInterface /\v\c("?)ifSGNodeDict\1/ 
syn match brsInterface /\v\c("?)ifSGNodeField\1/ 
syn match brsInterface /\v\c("?)ifSGNodeFocus\1/ 
syn match brsInterface /\v\c("?)ifSGNodeHttpAgentAccess\1/ 
syn match brsInterface /\v\c("?)ifScreen\1/ 
syn match brsInterface /\v\c("?)ifSearchHistory\1/ 
syn match brsInterface /\v\c("?)ifSearchScreen\1/ 
syn match brsInterface /\v\c("?)ifSetMessagePort\1/ 
syn match brsInterface /\v\c("?)ifSlideShow\1/ 
syn match brsInterface /\v\c("?)ifSocket\1/ 
syn match brsInterface /\v\c("?)ifSocketAddress\1/ 
syn match brsInterface /\v\c("?)ifSocketAsync\1/ 
syn match brsInterface /\v\c("?)ifSocketCastOption\1/ 
syn match brsInterface /\v\c("?)ifSocketConnection\1/ 
syn match brsInterface /\v\c("?)ifSocketConnectionOption\1/ 
syn match brsInterface /\v\c("?)ifSocketConnectionStatus\1/ 
syn match brsInterface /\v\c("?)ifSocketOption\1/ 
syn match brsInterface /\v\c("?)ifSocketStatus\1/ 
syn match brsInterface /\v\c("?)ifSourceIdentity\1/ 
syn match brsInterface /\v\c("?)ifSpringboardScreen\1/ 
syn match brsInterface /\v\c("?)ifSprite\1/ 
syn match brsInterface /\v\c("?)ifString\1/ 
syn match brsInterface /\v\c("?)ifStringOps\1/ 
syn match brsInterface /\v\c("?)ifSystemLog\1/ 
syn match brsInterface /\v\c("?)ifTextScreen\1/ 
syn match brsInterface /\v\c("?)ifTextToSpeech\1/ 
syn match brsInterface /\v\c("?)ifTextureManager\1/ 
syn match brsInterface /\v\c("?)ifTextureRequest\1/ 
syn match brsInterface /\v\c("?)ifTimespan\1/ 
syn match brsInterface /\v\c("?)ifToStr\1/ 
syn match brsInterface /\v\c("?)ifTuner\1/ 
syn match brsInterface /\v\c("?)ifUrlTransfer\1/ 
syn match brsInterface /\v\c("?)ifVideoPlayer\1/ 
syn match brsInterface /\v\c("?)ifVideoScreen\1/ 
syn match brsInterface /\v\c("?)ifXMLElement\1/ 
syn match brsInterface /\v\c("?)<ifXMLList>\1/ 
" }}}

" highlight colors {{{
" keywords
hi default link brsKeyword Keyword
" numbers
hi default link brsInteger Number
hi default link brsHex brsInteger
hi default link brsLong brsInteger
hi default link brsFloat Float
hi default link brsDouble brsFloat
" comments
hi default link brsComment Comment
hi default link brsTodo Todo
" strings
hi default link brsString String
hi default link brsSubStr SpecialChar
" console output
hi default link brsOut Debug
" include
hi default link brsLib Include
" functions
hi default link brsFunct Function
" operators & delimiters
hi default link brsOp Operator
hi default link brsDelim Delimiter
" constants
hi default link brsConstant Constant
hi default link brsBool Boolean
" conditional compilation
hi default link brsCondComp PreCondit
hi default link brsCondCompDef Define
hi default link brsError Exception
" reserved
hi default link brsReserved Special
" roku components & interfaces 
hi default link brsInterface Structure
hi default link brsComponent brsInterface
" types
hi default link brsType Underlined
hi default link brsScope Identifier
" flow control operations
hi default link brsCondit Conditional
hi default link brsLoop Repeat
hi default link brsFunctDef Label
hi default link brsStatement Statement
" }}}

" vim:et:sw=4:ts=4:fdm=marker:
