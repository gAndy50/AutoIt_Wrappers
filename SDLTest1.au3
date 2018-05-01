#include <SDL2.au3>

;This demo shows basic system info

Local $x = SDL_Init($SDL_INIT_EVERYTHING)

Global $giCpuCount, $giSystemRam, $g_3dnow, $g_sse,$g_sse2,$g_sse3,$g_sse4,$g_sse42

$giCpuCount = SDL_GetCPUCount()
If @error Then
    MsgBox(0, "SDL CPU Count", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
EndIf

$giSystemRam = SDL_GetSystemRAM()
If @error Then
    MsgBox(0, "SDL System RAM", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_3dnow = SDL_Has3DNow()
 If @error Then
    MsgBox(0, "SDL 3D NOW", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_sse = SDL_HasSSE()
  If @error Then
    MsgBox(0, "SDL SSE Enabled", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_sse2 = SDL_HasSSE2()
  If @error Then
    MsgBox(0, "SDL SSE2 Enabled", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_sse3 = SDL_HasSSE3()
  If @error Then
    MsgBox(0, "SDL SSE3 Enabled", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_sse4 = SDL_HasSSE41()
  If @error Then
    MsgBox(0, "SDL SSE41 Enabled", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

 $g_sse42 = SDL_HasSSE42()
  If @error Then
    MsgBox(0, "SDL SSE42 Enabled", StringFormat("Error encountered\r\n@error = %i\r\n@extended = %i", @error, @extended))
    Exit
 EndIf

MsgBox( _
    0, "System Info", _
    StringFormat("CPU Count = %i" , $giCpuCount) & @CRLF & _
    StringFormat("System RAM = %i", $giSystemRam) & @CRLF & _
	StringFormat("Has 3DNow = %i", $g_3dnow) & @CRLF & _
	StringFormat("Has SSE = %i",$g_sse) & @CRLF & _
	StringFormat("Has SSE2 = %i", $g_sse2) & @CRLF & _
	StringFormat("Has SSE3 = %i", $g_sse3) & @CRLF & _
	StringFormat("Has SSE41 = %i", $g_sse4) & @CRLF & _
	StringFormat("Has SSE42 = %i", $g_sse42) _
    )

SDL_Quit()
