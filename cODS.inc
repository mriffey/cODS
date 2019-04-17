        OMIT('_EndOfInclude_',_IFDef_cODS_)
_IFDef_cODS_            EQUATE(1)
!
!--------------------------------------------------------------------------------
cODS    CLASS,TYPE,THREAD,MODULE('cODS.CLW'),LINK('cODS.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
!
!--------------------------------------------------------------------------------
!Properties
!----------
InDebug                 BYTE

DebugOff                LONG 

TablesBeingTraced       LONG
DriverTracing           BOOL

!--------------------------------------------------------------------------------
!Methods
!-------
Init                             PROCEDURE()
Kill                             PROCEDURE()
Construct                        PROCEDURE()
Destruct                         PROCEDURE()

SetDebugOff                      PROCEDURE()  
SetDebugOn                       PROCEDURE()

Debug                            PROCEDURE(STRING pMessage)
Debug                            PROCEDURE(*CSTRING pMessage)

DisableTraceForTable             PROCEDURE(*FILE pTable)
EnableTraceForTable              PROCEDURE(*FILE pTable)
                        END 
        _EndOfInclude_
