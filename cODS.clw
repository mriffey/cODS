                        MEMBER()

         INCLUDE('cODS.INC'),ONCE

         MAP
           MODULE('Win32') 
              cODS_ODS(*CSTRING),PASCAL,RAW,NAME('OutputDebugStringA')
           END 
         END
         
                             
!------------------------------------------------------------------------------
cODS.Debug             PROCEDURE(STRING pMessage)
!------------------------------------------------------------------------------
csMessage          CSTRING(1000)
 CODE 

 csMessage = CLIP(pMessage)
 SELF.Debug(csMessage)
 RETURN 

 
!------------------------------------------------------------------------------
cODS.Debug             PROCEDURE(*CSTRING pMessage)
!------------------------------------------------------------------------------
csLocalMsg   CSTRING(1010) 
 CODE 
 
 IF SELF.DebugOff = TRUE 
    RETURN
 END
 
 csLocalMsg = pMessage & '<13,10,0>'

 cODS_ODS(csLocalMsg)
 RETURN 

!------------------------------------------------------------------------------ 
cODS.SetDebugOff PROCEDURE() 
!------------------------------------------------------------------------------
 CODE
 
 SELF.DebugOff = TRUE 
 
 RETURN

!------------------------------------------------------------------------------
cODS.SetDebugOn PROCEDURE() 
!------------------------------------------------------------------------------

 CODE

 SELF.DebugOff = FALSE 
 
 RETURN 
   
!----------------------------------------------------------------------------------------------------------------
cODS.EnableTraceForTable      PROCEDURE(*FILE pTable)
!----------------------------------------------------------------------------------------------------------------
 CODE
 
 SYSTEM{PROP:DriverTracing} = '1'

 SELF.TablesBeingTraced += 1
 
 pTable{PROP:TraceFile} = 'DEBUG:'
 pTable{PROP:Details}   = 1 
 pTable{PROP:Profile}   = 'DEBUG:' 
 pTable{PROP:LogSQL}    = 1
 
 RETURN 

 
!----------------------------------------------------------------------------------------------------------------
cODS.DisableTraceForTable      PROCEDURE(*FILE pTable)
!----------------------------------------------------------------------------------------------------------------
 CODE
 
 SELF.TablesBeingTraced -= 1
 
 IF SELF.TablesBeingTraced = 0 
    SYSTEM{PROP:DriverTracing} = ''
 END 
 
 pTable{PROP:TraceFile} = ''
 pTable{PROP:Details}   = 0 
 pTable{PROP:Profile}   = '' 
 pTable{PROP:LogSQL}    = 0
 
 RETURN 
  
  
!----------------------------------------------------------------------------------------------------------------
cODS.Init       PROCEDURE()
!----------------------------------------------------------------------------------------------------------------
  CODE
  SELF.InDebug = FALSE
  RETURN

!----------------------------------------------------------------------------------------------------------------
cODS.Kill       PROCEDURE()
!----------------------------------------------------------------------------------------------------------------
  CODE
  RETURN

!----------------------------------------------------------------------------------------------------------------
cODS.Construct  PROCEDURE()
!----------------------------------------------------------------------------------------------------------------
cstrMsg CSTRING(256)
  CODE
    
  SELF.TablesBeingTraced = 0
 
  RETURN


!----------------------------------------------------------------------------------------------------------------
cODS.Destruct   PROCEDURE()
!----------------------------------------------------------------------------------------------------------------
  CODE
   
  RETURN

