" brightscript is case insensitive
syn case ignore
syn iskeyword @,48-57,192-255,$,%,#,!,&

" function calls
syn region functContent matchgroup=brsFunct start="\v\.?<\w+\(" end="\v\)" contains=ALL

" constants {{{
syn keyword brsConstants
    \ invalid
syn keyword brsBool
    \ true
    \ false
" }}}

" control keywords (exit, stop, etc) {{{
syn match brsKeywords "\v\c<end\s*$"
syn keyword brsKeywords as nextgroup=brsType skipwhite
syn keyword brsKeywords
    \ exit
    \ stop
    \ return
" }}}

" conditional statements {{{
syn keyword brsCondit
    \ if
    \ then
syn match brsCondit "\v\c(end|else) ?if"
syn match brsCondit "\v\c<else>"
" }}}

" loops {{{
syn keyword brsLoop
    \ for
    \ while
    \ each
    \ in
    \ to
    \ step
syn match brsLoop "\v\c<end ?(for|while)>"
syn match brsLoop "\v\c^\s*next>"
" }}}

" function declaration {{{
syn keyword brsFunctDef
    \ sub
    \ function
syn match brsFunctDef "\v\c<(sub|function)>.*" contains=brsFunct
syn match brsFunctDef "\v\c<end ?sub>"
syn match brsFunctDef "\v\c<end function>"
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

" conditional compilation
syn match brsCondComp "\v\c^\s*\zs#(else( if)?|(end )?if|error)"

" library import
syn keyword brsLib library
 
" operators & delimiters {{{
syn match brsDelim "\v,|:|;" 
syn match brsOp "\v\="
syn match brsOp "\v\*"
syn match brsOp "\v/"
syn match brsOp "\v\\"
syn match brsOp "\v\*\="
syn match brsOp "\v\c<and>"
syn match brsOp "\v\c<or>"
syn match brsOp "\v\c<not>"
syn match brsOp "\v//="
syn match brsOp "\v\\\="
syn match brsOp "\v\+"
syn match brsOp "\v-"
syn match brsOp "\v\+\+"
syn match brsOp "\v--"
syn match brsOp "\v\+\="
syn match brsOp "\v-\="
syn match brsOp "\v\^"
syn match brsOp "\v\<\>"
syn match brsOp "\v\c<mod>"
syn match brsOp "\v\>\>"
syn match brsOp "\v\<\<"
syn match brsOp "\v\<?\<\="
syn match brsOp "\v\>?\>\="
syn match brsOp "\v\<"
syn match brsOp "\v\>"
syn match brsOp "\v\["
syn match brsOp "\v\]"
syn match brsOp "\v\{"
syn match brsOp "\v\}"
" }}}

" numbers {{{
syn match brsHex "\v\c<&H\x+>"
syn match brsInteger "\v<\d+\.?>"
syn match brsLong "\v<\d+&>"
syn match brsFloat "\v<\d+(\.\d+)?e(\+|-)?\d+(\.\d+)?!?>"
syn match brsFloat "\v<(\d+!|(\d+)?\.\d+!?)>"
syn match brsDouble "\v<(\d|(\..*)@<!\.(.*\.)@!){11,}>"
syn match brsDouble "\v<\d{10,}#?>"
syn match brsDouble "\v<\d+(\.\d+)?d((\+|-)\d+(\.\d+)?)?#?>"
syn match brsDouble "\v<\d+(\.\d+)?#>"
" }}}

" debug output
syn match brsOut "\v^\s*\zs(\?|print\s+)" contains=ALL

" comments {{{
syn match brsComment "\v'.*$" contains=brsTodos
syn match brsComment "\v\c<rem .*$" contains=brsTodos
syn match brsTodos "\v\c'\s*\zs<(TODO|NB|FIXME|NOTE|FYI|BUG)>.*$" contained
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
syn match brsType "\v\c<(int|str)>\(\@1!"
" }}}

" strings
syn region brsString start=/"/ end=/"/ contains=brsSubStr oneline 
syn match brsSubStr '\v\c\{[0-9]+\}' contained

" roku component classes {{{
syn match brsComponents '\v\c("?)roAppInfo\1' 
syn match brsComponents '\v\c("?)roAppManager\1' 
syn match brsComponents '\v\c("?)roArray\1' 
syn match brsComponents '\v\c("?)roAssociativeArray\1' 
syn match brsComponents '\v\c("?)roAudioMetadata\1' 
syn match brsComponents '\v\c("?)roAudioPlayer\1' 
syn match brsComponents '\v\c("?)roAudioPlayerEvent\1' 
syn match brsComponents '\v\c("?)roAudioResource\1' 
syn match brsComponents '\v\c("?)roBitmap\1' 
syn match brsComponents '\v\c("?)roBoolean\1' 
syn match brsComponents '\v\c("?)roByteArray\1' 
syn match brsComponents '\v\c("?)roCaptionRenderer\1' 
syn match brsComponents '\v\c("?)roCaptionRendererEvent\1' 
syn match brsComponents '\v\c("?)roChannelStore\1' 
syn match brsComponents '\v\c("?)roChannelStoreEvent\1' 
syn match brsComponents '\v\c("?)roCodeRegistrationScreen\1' 
syn match brsComponents '\v\c("?)roCodeRegistrationScreenEvent\1' 
syn match brsComponents '\v\c("?)roCompositor\1' 
syn match brsComponents '\v\c("?)roDataGramSocket\1' 
syn match brsComponents '\v\c("?)roDateTime\1' 
syn match brsComponents '\v\c("?)roDeviceInfo\1' 
syn match brsComponents '\v\c("?)roDeviceInfoEvent\1' 
syn match brsComponents '\v\c("?)roDouble\1' 
syn match brsComponents '\v\c("?)roEVPCipher\1' 
syn match brsComponents '\v\c("?)roEVPDigest\1' 
syn match brsComponents '\v\c("?)roFileSystem\1' 
syn match brsComponents '\v\c("?)roFileSystemEvent\1' 
syn match brsComponents '\v\c("?)roFloat\1' 
syn match brsComponents '\v\c("?)roFont\1' 
syn match brsComponents '\v\c("?)roFontRegistry\1' 
syn match brsComponents '\v\c("?)roFunction\1' 
syn match brsComponents '\v\c("?)roGridScreen\1' 
syn match brsComponents '\v\c("?)roGridScreenEvent\1' 
syn match brsComponents '\v\c("?)roHMAC\1' 
syn match brsComponents '\v\c("?)roHdmiHotPlugEvent\1' 
syn match brsComponents '\v\c("?)roHdmiStatus\1' 
syn match brsComponents '\v\c("?)roHdmiStatusEvent\1' 
syn match brsComponents '\v\c("?)roHttpAgent\1' 
syn match brsComponents '\v\c("?)roImageCanvas\1' 
syn match brsComponents '\v\c("?)roImageCanvasEvent\1' 
syn match brsComponents '\v\c("?)roImageMetadata\1' 
syn match brsComponents '\v\c("?)roInput\1' 
syn match brsComponents '\v\c("?)roInputEvent\1' 
syn match brsComponents '\v\c("?)roInt(eger)?\1' 
syn match brsComponents '\v\c("?)roInvalid\1' 
syn match brsComponents '\v\c("?)roKeyboardScreen\1' 
syn match brsComponents '\v\c("?)roKeyboardScreenEvent\1' 
syn match brsComponents '\v\c("?)roList\1' 
syn match brsComponents '\v\c("?)roListScreen\1' 
syn match brsComponents '\v\c("?)roListScreenEvent\1' 
syn match brsComponents '\v\c("?)roLocalization\1' 
syn match brsComponents '\v\c("?)roLongInteger\1' 
syn match brsComponents '\v\c("?)roMessageDialog\1' 
syn match brsComponents '\v\c("?)roMessageDialogEvent\1' 
syn match brsComponents '\v\c("?)roMessagePort\1' 
syn match brsComponents '\v\c("?)roOneLineDialog\1' 
syn match brsComponents '\v\c("?)roOneLineDialogEvent\1' 
syn match brsComponents '\v\c("?)roParagraphScreen\1' 
syn match brsComponents '\v\c("?)roParagraphScreenEvent\1' 
syn match brsComponents '\v\c("?)roPath\1' 
syn match brsComponents '\v\c("?)roPinEntryDialog\1' 
syn match brsComponents '\v\c("?)roPinEntryDialogEvent\1' 
syn match brsComponents '\v\c("?)roPosterScreen\1' 
syn match brsComponents '\v\c("?)roPosterScreenEvent\1' 
syn match brsComponents '\v\c("?)roProgramGuide\1' 
syn match brsComponents '\v\c("?)roRSA\1' 
syn match brsComponents '\v\c("?)roRegex\1' 
syn match brsComponents '\v\c("?)roRegion\1' 
syn match brsComponents '\v\c("?)roRegistry\1' 
syn match brsComponents '\v\c("?)roRegistrySection\1' 
syn match brsComponents '\v\c("?)roSGNode\1' 
syn match brsComponents '\v\c("?)roSGNodeEvent\1' 
syn match brsComponents '\v\c("?)roSGScreen\1' 
syn match brsComponents '\v\c("?)roSGScreenEvent\1' 
syn match brsComponents '\v\c("?)roScreen\1' 
syn match brsComponents '\v\c("?)roSearchHistory\1' 
syn match brsComponents '\v\c("?)roSearchScreen\1' 
syn match brsComponents '\v\c("?)roSearchScreenEvent\1' 
syn match brsComponents '\v\c("?)roSlideShow\1' 
syn match brsComponents '\v\c("?)roSlideShowEvent\1' 
syn match brsComponents '\v\c("?)roSocketAddress\1' 
syn match brsComponents '\v\c("?)roSocketEvent\1' 
syn match brsComponents '\v\c("?)roSpringboardScreen\1' 
syn match brsComponents '\v\c("?)roSpringboardScreenEvent\1' 
syn match brsComponents '\v\c("?)roSprite\1' 
syn match brsComponents '\v\c("?)roStreamSocket\1' 
syn match brsComponents '\v\c("?)roString\1' 
syn match brsComponents '\v\c("?)roSystemLog\1' 
syn match brsComponents '\v\c("?)roSystemLogEvent\1' 
syn match brsComponents '\v\c("?)roTextScreen\1' 
syn match brsComponents '\v\c("?)roTextScreenEvent\1' 
syn match brsComponents '\v\c("?)roTextToSpeech\1' 
syn match brsComponents '\v\c("?)roTextToSpeechEvent\1' 
syn match brsComponents '\v\c("?)roTextureManager\1' 
syn match brsComponents '\v\c("?)roTextureRequest\1' 
syn match brsComponents '\v\c("?)roTextureRequestEvent\1' 
syn match brsComponents '\v\c("?)roTimespan\1' 
syn match brsComponents '\v\c("?)roTuner\1' 
syn match brsComponents '\v\c("?)roTunerEvent\1' 
syn match brsComponents '\v\c("?)roUniversalControlEvent\1' 
syn match brsComponents '\v\c("?)roUrlEvent\1' 
syn match brsComponents '\v\c("?)roUrlTransfer\1' 
syn match brsComponents '\v\c("?)roVideoPlayer\1' 
syn match brsComponents '\v\c("?)roVideoPlayerEvent\1' 
syn match brsComponents '\v\c("?)roVideoScreen\1' 
syn match brsComponents '\v\c("?)roVideoScreenEvent\1' 
syn match brsComponents '\v\c("?)roXMLElement\1' 
syn match brsComponents '\v\c("?)roXMLList\1'
" }}}

" roku component interfaces {{{
syn match brsInterfaces '\v\c("?)ifAppInfo\1' 
syn match brsInterfaces '\v\c("?)ifAppManager\1' 
syn match brsInterfaces '\v\c("?)ifArray\1' 
syn match brsInterfaces '\v\c("?)ifArrayGet\1' 
syn match brsInterfaces '\v\c("?)ifArraySet\1' 
syn match brsInterfaces '\v\c("?)ifArraySort\1' 
syn match brsInterfaces '\v\c("?)ifAssociativeArray\1' 
syn match brsInterfaces '\v\c("?)ifAudioMetadata\1' 
syn match brsInterfaces '\v\c("?)ifAudioPlayer\1' 
syn match brsInterfaces '\v\c("?)ifAudioResource\1' 
syn match brsInterfaces '\v\c("?)ifBoolean\1' 
syn match brsInterfaces '\v\c("?)ifByteArray\1' 
syn match brsInterfaces '\v\c("?)ifCaptionRenderer\1' 
syn match brsInterfaces '\v\c("?)ifChannelStore\1' 
syn match brsInterfaces '\v\c("?)ifCodeRegistrationScreen\1' 
syn match brsInterfaces '\v\c("?)ifCompositor\1' 
syn match brsInterfaces '\v\c("?)ifDateTime\1' 
syn match brsInterfaces '\v\c("?)ifDeviceInfo\1' 
syn match brsInterfaces '\v\c("?)ifDouble\1' 
syn match brsInterfaces '\v\c("?)ifDraw2D\1' 
syn match brsInterfaces '\v\c("?)ifEVPCipher\1' 
syn match brsInterfaces '\v\c("?)ifEVPDigest\1' 
syn match brsInterfaces '\v\c("?)ifEnum\1' 
syn match brsInterfaces '\v\c("?)ifFileSystem\1' 
syn match brsInterfaces '\v\c("?)ifFloat\1' 
syn match brsInterfaces '\v\c("?)ifFont\1' 
syn match brsInterfaces '\v\c("?)ifFontMetrics\1' 
syn match brsInterfaces '\v\c("?)ifFontRegistry\1' 
syn match brsInterfaces '\v\c("?)ifFunction\1' 
syn match brsInterfaces '\v\c("?)ifGetMessagePort\1' 
syn match brsInterfaces '\v\c("?)ifGridScreen\1' 
syn match brsInterfaces '\v\c("?)ifHMAC\1' 
syn match brsInterfaces '\v\c("?)ifHdmiStatus\1' 
syn match brsInterfaces '\v\c("?)ifHttpAgent\1' 
syn match brsInterfaces '\v\c("?)ifImageCanvas\1' 
syn match brsInterfaces '\v\c("?)ifImageMetadata\1' 
syn match brsInterfaces '\v\c("?)ifInput\1' 
syn match brsInterfaces '\v\c("?)ifInt\1' 
syn match brsInterfaces '\v\c("?)ifIntOps\1' 
syn match brsInterfaces '\v\c("?)ifKeyboardScreen\1' 
syn match brsInterfaces '\v\c("?)ifList\1' 
syn match brsInterfaces '\v\c("?)ifListScreen\1' 
syn match brsInterfaces '\v\c("?)ifLocalization\1' 
syn match brsInterfaces '\v\c("?)ifLongInt\1' 
syn match brsInterfaces '\v\c("?)ifMessageDialog\1' 
syn match brsInterfaces '\v\c("?)ifMessagePort\1' 
syn match brsInterfaces '\v\c("?)ifOneLineDialog\1' 
syn match brsInterfaces '\v\c("?)ifParagraphScreen\1' 
syn match brsInterfaces '\v\c("?)ifPath\1' 
syn match brsInterfaces '\v\c("?)ifPinEntryDialog\1' 
syn match brsInterfaces '\v\c("?)ifPosterScreen\1' 
syn match brsInterfaces '\v\c("?)ifProgramGuide\1' 
syn match brsInterfaces '\v\c("?)ifRSA\1' 
syn match brsInterfaces '\v\c("?)ifRegex\1' 
syn match brsInterfaces '\v\c("?)ifRegion\1' 
syn match brsInterfaces '\v\c("?)ifRegistry\1' 
syn match brsInterfaces '\v\c("?)ifRegistrySection\1' 
syn match brsInterfaces '\v\c("?)ifRoSGScreen\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeBoundingRect\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeChildren\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeDict\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeField\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeFocus\1' 
syn match brsInterfaces '\v\c("?)ifSGNodeHttpAgentAccess\1' 
syn match brsInterfaces '\v\c("?)ifScreen\1' 
syn match brsInterfaces '\v\c("?)ifSearchHistory\1' 
syn match brsInterfaces '\v\c("?)ifSearchScreen\1' 
syn match brsInterfaces '\v\c("?)ifSetMessagePort\1' 
syn match brsInterfaces '\v\c("?)ifSlideShow\1' 
syn match brsInterfaces '\v\c("?)ifSocket\1' 
syn match brsInterfaces '\v\c("?)ifSocketAddress\1' 
syn match brsInterfaces '\v\c("?)ifSocketAsync\1' 
syn match brsInterfaces '\v\c("?)ifSocketCastOption\1' 
syn match brsInterfaces '\v\c("?)ifSocketConnection\1' 
syn match brsInterfaces '\v\c("?)ifSocketConnectionOption\1' 
syn match brsInterfaces '\v\c("?)ifSocketConnectionStatus\1' 
syn match brsInterfaces '\v\c("?)ifSocketOption\1' 
syn match brsInterfaces '\v\c("?)ifSocketStatus\1' 
syn match brsInterfaces '\v\c("?)ifSourceIdentity\1' 
syn match brsInterfaces '\v\c("?)ifSpringboardScreen\1' 
syn match brsInterfaces '\v\c("?)ifSprite\1' 
syn match brsInterfaces '\v\c("?)ifString\1' 
syn match brsInterfaces '\v\c("?)ifStringOps\1' 
syn match brsInterfaces '\v\c("?)ifSystemLog\1' 
syn match brsInterfaces '\v\c("?)ifTextScreen\1' 
syn match brsInterfaces '\v\c("?)ifTextToSpeech\1' 
syn match brsInterfaces '\v\c("?)ifTextureManager\1' 
syn match brsInterfaces '\v\c("?)ifTextureRequest\1' 
syn match brsInterfaces '\v\c("?)ifTimespan\1' 
syn match brsInterfaces '\v\c("?)ifToStr\1' 
syn match brsInterfaces '\v\c("?)ifTuner\1' 
syn match brsInterfaces '\v\c("?)ifUrlTransfer\1' 
syn match brsInterfaces '\v\c("?)ifVideoPlayer\1' 
syn match brsInterfaces '\v\c("?)ifVideoScreen\1' 
syn match brsInterfaces '\v\c("?)ifXMLElement\1' 
syn match brsInterfaces '\v\c("?)<ifXMLList>\1' 
" }}}

" highlight colors {{{
" keywords
hi default link brsKeywords Keyword
" numbers
hi default link brsInteger Number
hi default link brsHex brsInteger
hi default link brsLong brsInteger
hi default link brsFloat Float
hi default link brsDouble brsFloat
" comments
hi default link brsComment Comment
hi default link brsTodos Todo
" strings
hi default link brsString String
hi default link brsSubStr Special
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
hi default link brsConstants Constant
hi default link brsBool Boolean
" conditional compilation
hi default link brsCondComp PreCondit
" reserved
hi default link brsReserved Special
" roku components & interfaces 
hi default link brsInterfaces Identifier
hi default link brsComponents brsInterfaces
" types
hi default link brsType Underlined
" flow control operations
hi default link brsCondit Conditional
hi default link brsLoop Repeat
hi default link brsFunctDef Structure
" }}}

" vim:et:sw=4:ts=4:fdm=marker:
