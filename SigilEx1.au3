#include <Sigil.au3>

Local $w = 640, $h = 480
Local $true = 1, $false = 0

slWindow($w,$h,"Sigil Window",$false)

While Not slShouldClose()

  If slGetKey($SL_KEY_ESCAPE)  Then
	slClose()
  EndIf

   slRender()
WEnd

slClose()
