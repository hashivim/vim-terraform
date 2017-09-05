" Forked from Larry Gilbert's syntax file
" github.com/L2G/vim-syntax-terraform

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword terraSection connection output provider variable data terraform
syn keyword terraValueBool true false on off yes no

""" data
syn keyword terraDataTypeBI
""" end data sources

""" resource
syn keyword terraResourceTypeBI
""" end resources

syn keyword terraTodo         contained TODO FIXME XXX BUG
syn cluster terraCommentGroup contains=terraTodo
syn region  terraComment      start="/\*" end="\*/" contains=@terraCommentGroup,@Spell
syn region  terraComment      start="#" end="$" contains=@terraCommentGroup,@Spell
syn region  terraComment      start="//" end="$" contains=@terraCommentGroup,@Spell

syn match  terraResource        /\<resource\>/ nextgroup=terraResourceTypeStr skipwhite
syn region terraResourceTypeStr start=/"/ end=/"/ contains=terraResourceTypeBI
                              \ nextgroup=terraResourceName skipwhite
syn region terraResourceName    start=/"/ end=/"/
                              \ nextgroup=terraResourceBlock skipwhite

syn match  terraData        /\<data\>/ nextgroup=terraDataTypeStr skipwhite
syn region terraDataTypeStr start=/"/ end=/"/ contains=terraDataTypeBI
                              \ nextgroup=terraDataName skipwhite
syn region terraDataName    start=/"/ end=/"/
                              \ nextgroup=terraDataBlock skipwhite

""" provider
syn match  terraProvider      /\<provider\>/ nextgroup=terraProviderName skipwhite
syn region terraProviderName  start=/"/ end=/"/ nextgroup=terraProviderBlock skipwhite

""" provisioner
syn match  terraProvisioner     /\<provisioner\>/ nextgroup=terraProvisionerName skipwhite
syn region terraProvisionerName start=/"/ end=/"/ nextgroup=terraProvisionerBlock skipwhite

""" module
syn match  terraModule     /\<module\>/ nextgroup=terraModuleName skipwhite
syn region terraModuleName start=/"/ end=/"/ nextgroup=terraModuleBlock skipwhite

""" misc.
syn match terraValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match terraValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"
syn match terraBraces        "[{}\[\]]"

""" skip \" in strings.
""" we may also want to pass \\" into a function to escape quotes.
syn region terraValueString   start=/"/ skip=/\\\+"/ end=/"/ contains=terraStringInterp
syn region terraStringInterp  matchgroup=terraBrackets start=/\${/ end=/}/ contains=terraValueFunction,terraValueVarSubscript contained
syn region terraHereDocText   start=/<<\z([A-Z]\+\)/ end=/^\z1/ contains=terraStringInterp
"" TODO match keywords here, not a-z+
syn region terraValueFunction matchgroup=terraBrackets start=/[a-z]\+(/ end=/)/ contains=terraValueString,terraValueFunction,terraValueVarSubscript contained
" User variables or module outputs can be lists or maps, and accessed with
" var.map["foo"]
syn region terraValueVarSubscript start=/\(\<var\|\<module\)\.[a-z0-9_-]\+\[/ end=/\]/ contains=terraValueString,terraValueFunction,terraValueVarSubscript contained

hi def link terraComment           Comment
hi def link terraTodo              Todo
hi def link terraBrackets          Operator
hi def link terraProvider          Structure
hi def link terraBraces            Delimiter
hi def link terraProviderName      String
hi def link terraResource          Structure
hi def link terraResourceName      String
hi def link terraResourceTypeBI    Tag
hi def link terraResourceTypeStr   String
hi def link terraData              Structure
hi def link terraDataName          String
hi def link terraDataTypeBI        Tag
hi def link terraDataTypeStr       String
hi def link terraSection           Structure
hi def link terraStringInterp      Identifier
hi def link terraValueBool         Boolean
hi def link terraValueDec          Number
hi def link terraValueHexaDec      Number
hi def link terraValueString       String
hi def link terraHereDocText       String
hi def link terraProvisioner       Structure
hi def link terraProvisionerName   String
hi def link terraModule            Structure
hi def link terraModuleName        String
hi def link terraValueFunction     Identifier
hi def link terraValueVarSubscript Identifier

let b:current_syntax = "terraform"
