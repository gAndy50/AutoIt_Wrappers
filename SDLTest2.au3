#include <SDL2.au3>

Local $w = 640, $h = 480

Local $x = SDL_Init($SDL_INIT_VIDEO)

If $x = -1 Then
  MsgBox(1,"Error","Could not init SDL!")
EndIf

Local $win = SDL_CreateWindow("MyWin - Closes after 3 seconds",$SDL_WINDOWPOS_CENTERED,$SDL_WINDOWPOS_CENTERED,$w,$h,$SDL_WINDOW_SHOWN)

if $win = -1 Then
   MsgBox(1,"Error","Could not make window")
EndIf

SDL_Delay(3000)

SDL_DestroyWindow($win)

SDL_Quit()