;;;;;;;;;;;;;;;;;;;;;;;;
; GLFW3 AutoIt3 Wrapper;
; Wrapper by: Andy P.  ;
;Icy Viking Games      ;
;For AutoIt3           ;
;Copyright (c) 2018    ;
;;;;;;;;;;;;;;;;;;;;;;;;

#include-once

;GLFW3 Flags
Global Const  $GLFW_VERSION_MAJOR = 3
Global Const $GLFW_VERSION_MINOR = 2
Global Const $GLFW_VERSION_REVIVISON = 1

Global Const $GLFW_TRUE = 1
Global Const $GLFW_FALSE = 0

Global Const  $GLFW_RELEASE = 0
Global Const  $GLFW_PRESS = 1
Global Const  $GLFW_REPEAT = 2

Global Const  $GLFW_KEY_UNKNOWN = -1

Global Const  $GLFW_KEY_SPACE = 32
Global Const				$GLFW_KEY_APOSTROPHE = 39
Global Const				$GLFW_KEY_COMMA = 44
Global Const				$GLFW_KEY_MINUS = 45
Global Const 				$GLFW_KEY_PERIOD = 46
Global Const 				$GLFW_KEY_SLASH = 47
Global Const 				$GLFW_KEY_0 = 48
Global Const 				$GLFW_KEY_1 = 49
Global Const 				$GLFW_KEY_2 = 50
Global Const 				$GLFW_KEY_3 = 51
Global Const 				$GLFW_KEY_4 = 52
Global Const 				$GLFW_KEY_5 = 53
Global Const 				$GLFW_KEY_6 = 54
Global Const 				$GLFW_KEY_7 = 55
Global Const 				$GLFW_KEY_8 = 56
Global Const 				$GLFW_KEY_9 = 57
Global Const 				$GLFW_KEY_SEMICOLON = 59
Global const 				$GLFW_KEY_EQUAL = 61
Global Const 				$GLFW_KEY_A = 65
Global Const 				$GLFW_KEY_B = 66
Global Const 				$GLFW_KEY_C = 67
Global Const 				$GLFW_KEY_D = 68
Global Const 				$GLFW_KEY_E = 69
Global Const 				$GLFW_KEY_F = 70
Global Const 				$GLFW_KEY_G = 71
Global Const 				$GLFW_KEY_H = 72
Global Const 				$GLFW_KEY_I = 73
Global Const 				$GLFW_KEY_J = 74
Global Const 				$GLFW_KEY_K = 75
Global Const 				$GLFW_KEY_L = 76
Global Const 				$GLFW_KEY_M = 77
Global Const 				$GLFW_KEY_N = 78
Global Const 				$GLFW_KEY_O = 79
Global Const 				$GLFW_KEY_P = 80
Global Const				$GLFW_KEY_Q = 81
Global Const 				$GLFW_KEY_R = 82
Global Const 				$GLFW_KEY_S = 83
Global const 				$GLFW_KEY_T = 84
Global Const 				$GLFW_KEY_U = 85
Global Const 				$GLFW_KEY_V = 86
Global Const 				$GLFW_KEY_W = 87
Global Const 				$GLFW_KEY_X = 88
Global Const 				$GLFW_KEY_Y = 89
Global Const 				$GLFW_KEY_Z = 90
Global Const 				$GLFW_KEY_LEFT_BRACKET = 91
Global Const 				$GLFW_KEY_BACKSLASH = 92
Global const 				$GLFW_KEY_RIGHT_BRACKET = 93
Global Const 				$GLFW_KEY_GRAVE_ACCENT = 96
Global Const 				$GLFW_KEY_WORLD_1 = 161
Global Const 				$GLFW_KEY_WORLD_2 = 162

Global Const  $GLFW_KEY_ESCAPE = 256
Global Const 				$GLFW_KEY_ENTER = 257
Global Const 				$GLFW_KEY_TAB = 258
Global Const 				$GLFW_KEY_BACKSPACE = 259
Global Const 				$GLFW_KEY_INSERT = 260
Global Const 				$GLFW_KEY_DELETE = 261
Global Const 				$GLFW_KEY_RIGHT = 262
Global Const 				$GLFW_KEY_LEFT = 263
Global Const 				$GLFW_KEY_DOWN = 264
Global Const 				$GLFW_KEY_UP = 265
Global Const 				$GLFW_KEY_PAGE_UP = 266
Global Const 				$GLFW_KEY_PAGE_DOWN = 267
Global Const 				$GLFW_KEY_HOME = 268
Global Const 				$GLFW_KEY_END = 269
Global Const 				$GLFW_KEY_CAPS_LOCK = 280
Global Const 				$GLFW_KEY_SCROLL_LOCK = 281
Global Const 				$GLFW_KEY_NUM_LOCK = 282
Global Const 				$GLFW_KEY_PRINT_SCREEN = 283
Global Const 				$GLFW_KEY_PAUSE = 284
Global Const 				$GLFW_KEY_F1 = 290
Global Const 				$GLFW_KEY_F2 = 291
Global Const 				$GLFW_KEY_F3 = 292
Global Const 				$GLFW_KEY_F4 = 293
Global Const 				$GLFW_KEY_F5 = 294
Global Const 				$GLFW_KEY_F6 = 295
Global Const 				$GLFW_KEY_F7 = 296
Global Const 				$GLFW_KEY_F8 = 297
Global Const 				$GLFW_KEY_F9 = 298
Global Const 				$GLFW_KEY_F10 = 299
Global Const 				$GLFW_KEY_F11 = 300
Global Const 				$GLFW_KEY_F12 = 301
Global Const 				$GLFW_KEY_F13 = 302
Global Const 				$GLFW_KEY_F14 = 303
Global Const 				$GLFW_KEY_F15 = 304
Global Const 				$GLFW_KEY_F16 = 305
Global Const 				$GLFW_KEY_F17 = 306
Global Const 				$GLFW_KEY_F18 = 307
Global Const 				$GLFW_KEY_F19 = 308
Global Const 				$GLFW_KEY_F20 = 309
Global Const 				$GLFW_KEY_F21 = 310
Global Const 				$GLFW_KEY_F22 = 311
Global Const 				$GLFW_KEY_F23 = 312
Global Const 				$GLFW_KEY_F24 = 313
Global Const 				$GLFW_KEY_F25 = 314
Global Const 				$GLFW_KEY_KP_0 = 320
Global Const 				$GLFW_KEY_KP_1 = 321
Global Const 				$GLFW_KEY_KP_2 = 322
Global Const 				$GLFW_KEY_KP_3 = 323
Global Const 				$GLFW_KEY_KP_4 = 324
Global Const 				$GLFW_KEY_KP_5 = 325
Global Const 				$GLFW_KEY_KP_6 = 326
Global Const 				$GLFW_KEY_KP_7 = 327
Global Const 				$GLFW_KEY_KP_8 = 328
Global Const 				$GLFW_KEY_KP_9 = 329
Global Const 				$GLFW_KEY_KP_DECIMAL = 330
Global Const 				$GLFW_KEY_KP_DIVIDE = 331
Global Const				$GLFW_KEY_KP_MULTIPLY = 332
Global Const 				$GLFW_KEY_KP_SUBTRACT = 333
Global Const 				$GLFW_KEY_KP_ADD = 334
Global Const 				$GLFW_KEY_KP_ENTER = 335
Global Const				$GLFW_KEY_KP_EQUAL = 336
Global Const 				$GLFW_KEY_LEFT_SHIFT = 340
Global Const 				$GLFW_KEY_LEFT_CONTROL = 341
Global Const				$GLFW_KEY_LEFT_ALT = 342
Global Const 				$GLFW_KEY_LEFT_SUPER = 343
Global Const 				$GLFW_KEY_RIGHT_SHIFT = 344
Global const 				$GLFW_KEY_RIGHT_CONTROL = 345
Global Const				$GLFW_KEY_RIGHT_ALT = 346
Global Const 				$GLFW_KEY_RIGHT_SUPER = 347
Global Const 				$GLFW_KEY_MENU = 348
Global Const 				$GLFW_KEY_LAST = $GLFW_KEY_MENU

Global Const $GLFW_MOD_SHIFT = 1
Global Const 				$GLFW_MOD_CONTROL = 2
Global Const 				$GLFW_MOD_ALT = 4
Global Const 				$GLFW_MOD_SUPER = 8

Global Const $GLFW_MOUSE_BUTTON_1 = 0
Global Const 				$GLFW_MOUSE_BUTTON_2 = 1
Global Const 				$GLFW_MOUSE_BUTTON_3 = 2
Global Const 				$GLFW_MOUSE_BUTTON_4 = 3
Global Const 				$GLFW_MOUSE_BUTTON_5 = 4
Global const 				$GLFW_MOUSE_BUTTON_6 = 5
Global Const 				$GLFW_MOUSE_BUTTON_7 = 6
Global Const 				$GLFW_MOUSE_BUTTON_8 = 7
Global Const 				$GLFW_MOUSE_BUTTON_LAST = $GLFW_MOUSE_BUTTON_8
Global Const 				$GLFW_MOUSE_BUTTON_LEFT = $GLFW_MOUSE_BUTTON_1
Global Const 				$GLFW_MOUSE_BUTTON_RIGHT = $GLFW_MOUSE_BUTTON_2
Global Const 				$GLFW_MOUSE_BUTTON_MIDDLE = $GLFW_MOUSE_BUTTON_3

Global Const $GLFW_JOYSTICK_1 = 0
Global Const 				$GLFW_JOYSTICK_2 = 1
Global Const 				$GLFW_JOYSTICK_3 = 2
Global Const 				$GLFW_JOYSTICK_4 = 3
Global Const 				$GLFW_JOYSTICK_5 = 4
Global Const 				$GLFW_JOYSTICK_6 = 5
Global Const 				$GLFW_JOYSTICK_7 = 6
Global Const 				$GLFW_JOYSTICK_8 = 7
Global Const 				$GLFW_JOYSTICK_9 = 8
Global Const 				$GLFW_JOYSTICK_10 = 9
Global Const 				$GLFW_JOYSTICK_11 = 10
Global Const 				$GLFW_JOYSTICK_12 = 11
Global Const 				$GLFW_JOYSTICK_13 = 12
Global Const 				$GLFW_JOYSTICK_14 = 13
Global Const 				$GLFW_JOYSTICK_15 = 14
Global Const 				$GLFW_JOYSTICK_16 = 15
Global Const 				$GLFW_JOYSTICK_LAST = $GLFW_JOYSTICK_16

Global Const $GLFW_NOT_INITIALIZED = 65537
Global Const 				$GLFW_NO_CURRENT_CONTEXT = 65538
Global Const 				$GLFW_INVALID_ENUM = 65539
Global Const 				$GLFW_INVALID_VALUE = 65540
Global Const 				$GLFW_OUT_OF_MEMORY = 65541
Global Const 				$GLFW_API_UNAVAILABLE = 65542
Global Const 				$GLFW_VERSION_UNAVAILABLE = 65543
Global Const 				$GLFW_PLATFORM_ERROR = 65544
Global Const 				$GLFW_FORMAT_UNAVAILABLE = 65545

Global Const  $GLFW_FOCUSED = 131073
Global Const 				$GLFW_ICONIFIED = 131074
Global Const 				$GLFW_RESIZABLE = 131075
Global Const 				$GLFW_VISIBLE = 131076
Global Const 				$GLFW_DECORATED = 131077
Global Const 				$GLFW_AUTO_ICONIFY = 131078
Global Const 				$GLFW_FLOATING = 131079

Global Const  $GLFW_RED_BITS = 135169
Global Const 				$GLFW_GREEN_BITS = 135170
Global Const 				$GLFW_BLUE_BITS = 135171
Global Const 				$GLFW_ALPHA_BITS = 135172
Global Const 				$GLFW_DEPTH_BITS = 135173
Global Const 				$GLFW_STENCIL_BITS = 135174
Global Const 				$GLFW_ACCUM_RED_BITS = 135175
Global Const 				$GLFW_ACCUM_GREEN_BITS = 135176
Global Const 				$GLFW_ACCUM_BLUE_BITS = 135177
Global Const 				$GLFW_ACCUM_ALPHA_BITS = 13578
Global Const 				$GLFW_AUX_BUFFERS = 135179
Global Const 				$GLFW_STEREO = 135180
Global Const 				$GLFW_SAMPLES = 135181
Global Const 				$GLFW_SRGB_CAPABLE = 135182
Global Const 				$GLFW_REFRESH_RATE = 135183
Global Const 				$GLFW_DOUBLEBUFFER = 135184

Global Const  $GLFW_CLIENT_API = 139265
Global Const 				$GLFW_CONTEXT_VERSION_MAJOR = 139266
Global Const 				$GLFW_CONTEXT_VERSION_MINOR = 139267
Global Const 				$GLFW_CONTEXT_REVISION = 139268
Global Const 				$GLFW_CONTEXT_ROBUSTNESS = 139269
Global Const 				$GLFW_OPENGL_FORWARD_COMPAT = 139270
Global Const 				$GLFW_OPENGL_DEBUG_CONTEXT = 193271
Global Const 				$GLFW_OPENGL_PROFILE = 193272
Global Const 				$GLFW_CONTEXT_RELEASE_BEHAVIOR = 193273

Global Const  $GLFW_OPENGL_API = 196609
Global Const 				$GLFW_OPENGL_ES_API = 196610

Global const  $GLFW_NO_ROBUSTNESS = 0
Global const 				$GLFW_NO_RESET_NOTIFICATION = 200705
Global Const 				$GLFW_LOSE_CONTEXT_ON_RESET = 200706

Global const  $GLFW_OPENGL_ANY_PROFILE = 0
Global const 				$GLFW_OPENGL_CORE_PROFILE = 204801
Global Const 				$GLFW_OPENGL_COMPAT_PROFILE = 204802

Global Const  $GLFW_CURSOR = 208897
Global Const 				$GLFW_STICKY_KEYS = 208898
Global Const 				$GLFW_STICKY_MOUSE_BUTTONS = 208899

Global Const  $GLFW_CURSOR_NORMAL = 212993
Global Const 				$GLFW_CURSOR_HIDDEN = 212994
Global Const 				$GLFW_CURSOR_DISABLED = 212995

Global Const  $GLFW_ANY_RELEASE_BEHAVIOR = 0
Global Const 				$GLFW_RELEASE_BEHAVIOR_FLUSH = 217089
Global Const 				$GLFW_RELEASE_BEHAVIOR_NONE = 217090

Global Const  $GLFW_ARROW_CURSOR = 221185
Global Const 				$GLFW_IBEAM_CURSOR = 221186
Global Const 				$GLFW_CROSSHAIR_CURSOR = 221187
Global const 				$GLFW_HAND_CURSOR = 221188
Global Const 				$GLFW_HRESIZE_CURSOR = 221189
Global Const 				$GLFW_VRESIZE_CURSOR = 221190

Global Const $GLFW_CONNECTED = 262145
Global const				$GLFW_DISCONNECTED = 252146

Global Const $GLFW_DONT_CARE = -1

;Main GLFW3 variable
Global $GL = 0

;VideoMode Struct
Func GLFWvidmode($w,$h,$r,$g,$b,$refresh)
   $xglS = DllStructCreate("int","int","int","int","int","int")
   DllStructSetData($GLFWvidmode,1,$w)
   DllStructSetData($GLFWvidmode,2,$h)
   DllStructSetData($GLFWvidmode,3,$r)
   DllStructSetData($GLFWvidmod,4,$g)
   DllStructSetData($GLFWvidmod,5,$b)
   DllStructSetData($GLFWvidmod,6,$refresh)
   Return $xglS
EndFunc

;GammaRamp Struct
Func GLFWgammaramp($r,$g,$b,$s)
   $xglG = DllStructCreate("ptr","ptr","ptr","uint")
   DllStructSetData($GLFWgammaramp,1,$r)
   DllStructSetData($GLFWgammaramp,2,$g)
   DllStructSetData($GLFWgammaramp,3,$b)
   DllStructSetData($GLFWgammaramp,4,$s)
   Return $xglG
EndFunc

;GLFWImage Struct
Func GLFWimage($w,$h,$pix)
   $xglI = DllStructCreate("int","int","ptr")
   DllStructSetData($GLFWimage,1,$w)
   DllStructSetData($GLFWimage,2,$h)
   DllStructSetData($GLFWimage,3,$pix)
   Return $xglI
EndFunc

;Init Functions
Func glfwInit()
   $GL = DllOpen("glfw3.dll")
   Local $xgl = DllCall($GL,"int:cdecl","glfwInit")
   Return $xgl[0]
EndFunc

Func glfwTerminate()
   Local $xgl = DllCall($GL,"none:cdecl","glfwTerminate")
   Return $xgl[0]
   DllClose($GL)
EndFunc

Func glfwGetVersion($maj,$min,$rev)
   Local $xgl = DllCall($GL,"none:cdecl","ptr",$maj,"ptr",$min,"ptr",$rev)
   Return $xgl[0]
EndFunc

Func glfwGetVersionString()
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetVersionString")
   Return $xgl[0]
EndFunc

Func glfwSetErrorCallback($cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetErrorCallback","ptr",$cb)
   Return $xgl[0]
EndFunc

;GL Window Functions
Func glfwCreateWindow($w,$h,$title,$mon,$share)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwCreateWindow","int",$w,"int",$h,"str",$title,"ptr",$mon,"ptr",$share)
   Return $xgl[0]
EndFunc

Func glfwDestroyWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwDestroyWindow","ptr",$win)
   Return $gl[0]
EndFunc

Func glfwWindowShouldClose($win)
   Local $xgl = DllCall($GL,"int:cdecl","glfwWindowShouldClose","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwSetWindowShouldClose($win,$val)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowShouldClose","ptr",$win,"int",$val)
   Return $xgl[0]
EndFunc

Func glfwSetWindowTitle($win,$title)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowTitle","ptr",$win,"str",$title)
   Return $xgl[0]
EndFunc

Func glfwSetWindowIcon($win,$cnt,$GLFWimage)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowIcon","ptr",$win,"int",$cnt,"ptr",DllStructGetPtr($GLFWimage))
   Return $xgl[0]
EndFunc

Func glfwGetWindowPos($win,$x,$y)
   Local $xgl = DllCall($GL,"none:cdecl","glfwGetWindowPos","ptr",$win,"ptr",$x,"ptr",$y)
   Return $xgl[0]
EndFunc

Func glfwSetWindowPos($win,$x,$y)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowPos","ptr",$win,"int",$x,"int",$y)
   Return $xgl[0]
EndFunc

Func glfwGetWindowSize($win,$w,$h)
   Local $xgl = DllCall($GL,"none:cdecl","glfwGetWindowSize","ptr",$win,"ptr",$w,"ptr",$h)
   Return $xgl[0]
EndFunc

Func glfwSetWindowSizeLimits($win,$minw,$minh,$maxw,$maxh)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowSizeLimits","ptr",$win,"int",$minw,"int",$minh,"int",$maxw,"int",$maxh)
   Return $xgl[0]
EndFunc

Func glfwSetWindowAspectRatio($win,$num,$den)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowAspectRatio","ptr",$win,"int",$num,"int",$den)
   Return $xgl[0]
EndFunc

Func glfwSetWindowSize($win,$w,$h)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowSize","ptr",$win,"int",$w,"int",$h)
   Return $xgl[0]
EndFunc

Func glfwGetFramebufferSize($win,$w,$h)
   Local $xgl = DllCall($GL,"none:cdecl","glfwGetFramebufferSize","ptr",$win,"ptr",$w,"ptr",$h)
   Return $xgl[0]
EndFunc

Func glfwGetWindowFrameSize($win,$l,$t,$r,$b)
   Local $xgl = DllCall($GL,"none:cdecl","glfwGetWindowFrameSize","ptr",$win,"ptr",$l,"ptr",$t,"ptr",$r,"ptr",$b)
   Return $xgl[0]
EndFunc

Func glfwIconifyWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwIconifyWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwRestoreWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwRestoreWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwMaximizeWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwMaximizeWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwShowWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwShowWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwHideWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwHideWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwFocusWindow($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwFocusWindow","ptr",$win)
   Return $xgl[0]
EndFunc

;Monitor Functions
Func glfwGetWindowMonitor($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWindowMonitor","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwSetWindowMonitor($win,$mon,$x,$y,$w,$h,$refresh)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowMonitor","ptr",$win,"ptr",$mon,"int",$x,"int",$y,"int",$w,"int",$h,"int",$refresh)
   Return $xgl[0]
EndFunc

Func glfwGetWindowAttrib($win,$att)
   Local $xgl =DllCall($GL,"int:cdecl","glfwGetWindowAttrib","ptr",$win,"int",$att)
   Return $xgl[0]
EndFunc

Func glfwSetWindowUserPoint($win,$pt)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetWindowUserPointer",$win,"ptr",$pt)
   Return $xgl[0]
EndFunc

Func glfwGetWindowUserPoint($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWindowUserPointer","ptr",$win)
   Return $xgl[0]
EndFunc

;More Window Funcs
Func glfwSetWindowPosCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowPosCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetWindowSizeCallback($win,$cn)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowSizeCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetWindowCloseCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowCloseCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetWindowRefreshCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowRefreshCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetWindowFocusCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowFocusCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetWindowIconifyCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetWindowIconifyCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetFramebufferSizeCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetFramebufferSizeCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

;Event Functions
Func glfwPollEvents()
   Local $xgl = DllCall($GL,"none:cdecl","glfwPollEvents")
   Return $xgl[0]
EndFunc

Func glfwWaitEvents()
   Local $xgl = DllCall($GL,"none:cdecl","glfwWaitEvents")
   Return $xgl[0]
EndFunc

Func glfwWaitEventsTimeout($xtime)
   Local $xgl = DllCall($GL,"none:cdecl","glfwWaitEventsTimeout","double",$xtime)
   Return $xgl[0]
EndFunc

Func glfwPostEmptyEvent()
   Local $xgl = DllCall($GL,"none:cdecl","glfwPostEmptyEvent")
   Return $xgl[0]
EndFunc

Func glfwGetInputMode($win,$mode)
   Local $xgl = DllCall($GL,"int:cdecl","glfwGetInputMode","ptr",$win,"int",$mode)
   Return $xgl[0]
EndFunc

Func glfwSetInputMode($win,$mode,$val)
   Local $gl = DllCall($GL,"none:cdecl","glfwSetInputMode","ptr",$win,"int",$mode,"int",$val)
   Return $xgl[0]
EndFunc

Func glfwGetKeyName($key,$scan)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetKeyName","int",$key,"int",$scan)
   Return $xgl[0]
EndFunc

Func glfwGetKey($win,$key)
   Local $xgl = DllCall($GL,"int:cdecl","glfwGetKey","ptr",$win,"int",$key)
   Return $xgl[0]
EndFunc

Func glfwGetMouseButton($win,$btn)
   Local $xgl = DllCall($GL,"int:cdecl","glfwGetMouseButton","ptr",$win,"int",$btn)
   Return $xgl[0]
EndFunc

Func glfwGetCursorPos($win,$x,$y)
   Local $xgl = DllCall($GL,"none:cdecl","glfwGetCursorPos","ptr",$win,"ptr",$x,"ptr",$y)
   Return $xgl[0]
EndFunc

Func glfwSetCursorPos($win,$x,$y)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetCursorPos","ptr",$win,"double",$x,"double",$y)
   Return $xgl[0]
EndFunc

Func glfwCreateCursor($win,$x,$y)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwCreateCursor","ptr",$win,"int",$x,"int",$y)
   Return $xgl[0]
EndFunc

Func glfwCreateStandardCursor($shape)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwCreateStandardCursor","int",$shape)
   Return $xgl[0]
EndFunc

Func glfwDestroyCursor($cur)
   Local $xgl = DllCall($GL,"none:cdecl","glfwDestroyCursor","ptr",$cur)
   Return $xgl[0]
EndFunc

Func glfwSetCursor($win,$cur)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetCursor","ptr",$win,"ptr",$cur)
   Return $xgl[0]
EndFunc

Func glfwSetKeyCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetKeyCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetCharCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetCharCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func gflwSetCharModsCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetCharModsCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetMouseButtonCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetMouseButtonCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetCursorPosCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetCursorPosCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetCursorEnterCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetCursorEnterCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetScrollCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetScrollCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

Func glfwSetDropCallback($win,$cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwSetDropCallback","ptr",$win,"ptr",$cb)
   Return $xgl[0]
EndFunc

;Joystick Functions
Func glfwJoystickPresent($joy)
   Local $xgl = DllCall($GL,"int:cdecl","glfwJoystickPresent","int",$joy)
   Return $xgl[0]
EndFunc

Func glfwGetJoystickAxes($joy,$cnt)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetJoystickAxes","int",$joy,"ptr",$cnt)
   Return $xgl[0]
EndFunc

Func glfwGetJoystickButtons($joy,$cnt)
   Local $xgl = DllCall($GL"ptr:cdecl","glfwGetJoystickButtons","int",$joy,"ptr",$cnt)
   Return $xgl[0]
EndFunc

Func glfwGetJoystickName($joy)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetJoystickName","int",$joy)
   Return $xgl[0]
EndFunc

Func glfwSetJoystickCallback($cb)
   Local $xgl = DllCall($GL,"ptr:cdecl","GlfwSetJoystickCallback","ptr",$cb)
   Return $xgl[0]
EndFunc

;Clipboard Functions
Func glfwSetClipboardString($win,$st)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetClipboardString","ptr",$win,"str",$st)
   Return $xgl[0]
EndFunc

Func glfwGetClipboardString($win)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetClipboardString","ptr",$win)
   Return $xgl[0]
EndFunc

;Timer Functions
Func glfwGetTime()
   Local $xgl = DllCall($GL,"double:cdecl","glfwGetTime")
   Return $xgl[0]
EndFunc

Func glfwSetTime($xtime)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSetTime","double",$xtime)
   Return $xgl[0]
EndFunc

Func glfwGetTimerValue()
   Local $xgl = DllCall($GL,"uint:cdecl","glfwGetTimerValue")
   Return $xgl[0]
EndFunc

Func glfwGetTimerFrequency()
   Local $xgl = DllCall($GL,"uint:cdecl","glfwGetTimerFrequency")
   Return $xgl[0]
EndFunc

Func glfwMakeContextCurrent($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwMakeContextCurrent","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetCurrentContext()
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetCurrentContext")
   Return $xgl[0]
EndFunc

Func glfSwapBuffers($win)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSwapBuffers","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwSwapInterval($int)
   Local $xgl = DllCall($GL,"none:cdecl","glfwSwapInterval","int",$int)
   Return $xgl[0]
EndFunc

Func glfwExtensionSupported($ext)
   Local $xgl = DllCall($GL,"int:cdecl","glfwExtensionSupported","str",$ext)
   Return $xgl[0]
EndFunc

Func glfwGetProcAddress($name)
   Local $xgl = DllCall($GL,"glfwGetProcAddress","str",$name)
   Return $xgl[0]
EndFunc

Func glfwVulkanSupported()
   Local $xgl = DllCall($GL,"int:cdecl","glfwVulkanSupported")
   Return $xgl[0]
EndFunc

Func glfwGetRequiredInstanceExtensions($cnt)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetRequiredInstanceExtensions","ptr",$cnt)
   Return $xgl[0]
EndFunc

Func glfwGetInstanceProcAddress($inst,$name)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetInstanceProcAddress","ptr",$inst,"str",$name)
   Return $xgl[0]
EndFunc

Func glfwGetPhysicalDevicePresentationSupport($inst,$dev,$que)
   Local $xgl = DllCall($GL,"int:cdecl","glfwGetPhysicalDevicePresentationSupport","ptr",$inst,"ptr",$dev,"uint",$que)
   Return $xgl[0]
EndFunc

Func glfwCreateWindowSurface($inst,$win,$ac,$surf)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwCreateWindowSurface","ptr",$inst,"ptr",$win,"ptr",$ac,"ptr",$surf)
   Return $xgl[0]
EndFunc

;Native Functions
Func glfwGetWin32Adapter($mon)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetWin32Adapter","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetWin32Monitor($mon)
   Local $xgl = DllCall($GL,"str:cdecl","glfwGetWin32Monitor","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetWin32Window($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWin32Window","ptr",$name)
   Return $xgl[0]
EndFunc

Func glfwGetWGLContext($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWGLContext","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetCocoaMonitor($mon)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetCocoaMonitor","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetCocoaWindow($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetCocoaWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetNSGLContext($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetNSGLContext","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetX11Display()
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetX11Display")
   Return $xgl[0]
EndFunc

Func glfwGetX11Adapter($mon)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetX11Adatper","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetX11Monitor($mon)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetX11Monitor","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetX11Window($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetX11Window","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetGLXContext($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetGLXContext","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetGLXWindow($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetGLXWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetWaylandDisplay()
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWaylandDisplay")
   Return $xgl[0]
EndFunc

Func glfwGetWaylandMonitor($mon)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWaylandMonitor","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetWaylandWindow($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetWaylandWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetMirDisplay()
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetMirDisplay")
   Return $xgl[0]
EndFunc

Func glfwGetMirMonitor($mon)
   Local $xgl = DllCall($GL,"int:cdecl","glfwGetMirMonitor","ptr",$mon)
   Return $xgl[0]
EndFunc

Func glfwGetMirWindow($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetMirWindow","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetEGLDisplay()
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetEGLDisplay")
   Return $xgl[0]
EndFunc

Func glfwGetEGLContext($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetEGLContext","ptr",$win)
   Return $xgl[0]
EndFunc

Func glfwGetEGLSurface($win)
   Local $xgl = DllCall($GL,"ptr:cdecl","glfwGetEGLSurface","ptr",$win)
   Return $xgl[0]
EndFunc