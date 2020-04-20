#include <GLFW3.au3>

Local $gl = glfwInit()

if $gl = -1 Then
   MsgBox(1,"Error","Failed to init GLFW!")
EndIf

Local $w = 640, $h = 480

Local $win = glfwCreateWindow($w,$h,"MyWin",Null,Null)

If $win = -1 Then
   MsgBox(1,"Error","Failed to create GLFW Window!")
   glfwTerminate()
EndIf

glfwMakeContextCurrent($win)

While not glfwWindowShouldClose($win)

   ;glfwSwapBuffers($win)
   glfwPollEvents()

WEnd

glfwTerminate()