#include <SDL2.au3>

Global $giCpuCount, $giSystemRam

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

MsgBox( _
    0, "SDL Test", _
    StringFormat("CPU Count = %i" , $giCpuCount) & @CRLF & _
    StringFormat("System RAM = %i", $giSystemRam)  _
    )