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
glfwSwapInterval(1)

;glfwSetInputMode($win,$GLFW_STICKY_KEYS,1)

While not glfwWindowShouldClose($win)

   ;glfwSwapBuffers($win)

   $key = glfwGetKey($win,$GLFW_KEY_ESCAPE)

   if $key = $GLFW_PRESS Then
	  glfwTerminate()
   EndIf

   glfwPollEvents()

WEnd

glfwTerminate()