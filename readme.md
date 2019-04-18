**INSTALL: Put the inc and clw in \clarionroot\accessory\libsrc\win**


**IMPLEMENT IN YOUR APP:**

**1) In the embed "After Global INCLUDEs" (in global embeds), add this:**

  INCLUDE('cODS.inc')  ! no ONCE needed


**2) In the embed "After Global Data", (or, if you prefer, in the proc you want to debug), add this:**

oODS cODS  ! defines the oODS object based on the cODS class. 


**3) In your code when you want a message to come out in debugview++, code something like these samples:**

 oODS.debug('some danged comment, var=' & CLIP(somestringvar) & ' longvar=' & longvar) 

 oODS.debug(stringvariable)

 oODS.debug(cstringvariable)
 
 oODS.debug('got here') 

 That's it. 