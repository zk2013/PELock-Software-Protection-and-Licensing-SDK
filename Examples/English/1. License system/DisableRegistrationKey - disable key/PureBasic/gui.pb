;///////////////////////////////////////////////////////////////////////////////
;//
;// Example of how to disable registration key at runtime
;//
;// Version        : PELock v2.0
;// Language       : PureBasic
;// Author         : Bartosz W�jcik (support@pelock.com)
;// Web page       : https://www.pelock.com
;//
;///////////////////////////////////////////////////////////////////////////////

IncludePath "..\..\..\..\..\SDK\English\PureBasic\"
XIncludeFile "pelock.pb"

Global regname.s{#PELOCK_MAX_USERNAME}

; start

MessageRequester("PELock", "Program registered to " + Str(SizeOf(regname)))

    DEMO_START

    ; read registered user name
    GetRegistrationName(regname, SizeOf(regname))

    MessageRequester("PELock", "Program registered to " + regname)

    DEMO_END

    ; something went wrong, disable registration key
    DisableRegistrationKey(#False)

    ; reset name
    regname = ""

    ; following code won't be executed after disabling
    ; license key!
    DEMO_START

    ; read registered user name
    GetRegistrationName(regname, SizeOf(regname))

    MessageRequester("PELock", "Program registered to " + regname)

    DEMO_END

    ; check registered user name length (0 - key not present)
    If (Len(regname) = 0)
        MessageRequester("PELock", "Evaluation version")
    EndIf
