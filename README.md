# AutoIt_Wrappers
Repository for AutoIt Wrappers

# Wrappers Wrapped
* Currently wrapped SDL2. Version of SDL2 is 2.0.10
* Wrapped Sigil 0.9.0
* Wrapped GLFW 3

# ABOUT:

These are a collection of wrappers for the AutoIt programming language. Note this uses version 3 of AutoIt. These are mainly a collection of
wrappers for multimedia libraries such as SDL. 

# EXAMPLE: Basic usage of how to use the SDL2 wrapper.  
```AutoIt
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
```

# SIGIL EXAMPLE:
```AutoIt
#include <Sigil.au3>

Local $w = 640, $h = 480
Local $true = 1, $false = 0

slWindow($w,$h,"Sigil Window",$false)

While Not slShouldClose()

   slRender()
WEnd

slClose()
```

# LICENSE:

This software is provided as-is. There is no warranty for this software. You use this software
at your own risk. You may not hold the developers of the wrapper, or the AutoIt
community responsible for anything you do with this library. You may distribute creations developed
with this wrapper as you please, royalty free. This software is provided in the event that it is
helpful.
