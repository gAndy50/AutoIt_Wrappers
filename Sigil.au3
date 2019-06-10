;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;AutoIt Sigil Wrapper                 ;;
;Written by Andy P.					  ;;
;Icy Viking Games					  ;;
;AutoIt Version 3					  ;;
;Sigil Version 0.9.0				  ;;
;Copyright (c) 2019					  ;;
;Contact/Paypal g_andy <at> live.com  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Sigil Flags

#include-once

Global Const $SL_ALIGN_CENTER = 0
Global Const $SL_ALIGN_RIGHT = 1
Global Const $SL_ALIGN_LEFT = 2

Global Const $SL_KEY_ESCAPE = 256
Global Const $SL_KEY_ENTER = 257
Global Const $SL_KEY_TAB = 258
Global Const $SL_KEY_BACKSPACE = 259
Global Const $SL_KEY_INSERT = 260
Global Const $SL_KEY_DELETE = 261
Global Const $SL_KEY_RIGHT = 262
Global Const $SL_KEY_LEFT = 263
Global Const $SL_KEY_DOWN = 264
Global Const $SL_KEY_UP = 265
Global Const $SL_KEY_PAGE_UP = 266
Global Const $SL_KEY_PAGE_DOWN = 267
Global Const $SL_KEY_HOME = 268
Global Const $SL_KEY_END = 269
Global Const $SL_KEY_CAPS_LOCK = 280
Global Const $SL_KEY_SCROLL_LOCK = 281
Global Const $SL_KEY_NUM_LOCK = 282
Global Const $SL_KEY_PRINT_SCREEN = 283
Global Const $SL_KEY_PAUSE = 284
Global Const $SL_KEY_F1 = 290
Global Const $SL_KEY_F2 = 291
Global Const $SL_KEY_F3 = 292
Global Const $SL_KEY_F4 = 293
Global Const $SL_KEY_F5 = 294
Global Const $SL_KEY_F6 = 295
Global Const $SL_KEY_F7 = 296
Global Const $SL_KEY_F8 = 297
Global Const $SL_KEY_F9 = 298
Global Const $SL_KEY_F10 = 299
Global Const $SL_KEY_F11 = 300
Global Const $SL_KEY_F12 = 301
Global Const $SL_KEY_F13 = 302
Global Const $SL_KEY_F14 = 303
Global Const $SL_KEY_F15 = 304
Global Const $SL_KEY_F16 = 305
Global Const $SL_KEY_F17 = 306
Global Const $SL_KEY_F18 = 307
Global Const $SL_KEY_F19 = 308
Global Const $SL_KEY_F20 = 309
Global Const $SL_KEY_F21 = 310
Global Const $SL_KEY_F22 = 311
Global Const $SL_KEY_F23 = 312
Global Const $SL_KEY_F24 = 313
Global Const $SL_KEY_F25 = 314
Global Const $SL_KEY_KEYPAD_0 = 320
Global Const $SL_KEY_KEYPAD_1 = 321
Global Const $SL_KEY_KEYPAD_2 = 322
Global Const $SL_KEY_KEYPAD_3 = 323
Global Const $SL_KEY_KEYPAD_4 = 324
Global Const $SL_KEY_KEYPAD_5 = 325
Global Const $SL_KEY_KEYPAD_6 = 326
Global Const $SL_KEY_KEYPAD_7 = 327
Global Const $SL_KEY_KEYPAD_8 = 328
Global Const $SL_KEY_KEYPAD_9 = 329
Global Const $SL_KEY_KEYPAD_DECIMAL = 330
Global Const $SL_KEY_KEYPAD_DIVIDE = 331
Global Const $SL_KEY_KEYPAD_MULTIPLY = 332
Global Const $SL_KEY_KEYPAD_SUBTRACT = 333
Global Const $SL_KEY_KEYPAD_ADD = 334
Global Const $SL_KEY_KEYPAD_ENTER = 335
Global Const $SL_KEY_KEYPAD_EQUAL = 336
Global Const $SL_KEY_LEFT_SHIFT = 340
Global Const $SL_KEY_LEFT_CONTROL = 341
Global Const $SL_KEY_LEFT_ALT = 342
Global Const $SL_KEY_LEFT_SUPER = 343
Global Const $SL_KEY_RIGHT_SHIFT = 344
Global Const $SL_KEY_RIGHT_CONTROL = 345
Global Const $SL_KEY_RIGHT_ALT = 346
Global Const $SL_KEY_RIGHT_SUPER = 347

Global Const $SL_MOUSE_BUTTON_1 = 0
Global Const $SL_MOUSE_BUTTON_2 = 1
Global Const $SL_MOUSE_BUTTON_3 = 2
Global Const $SL_MOUSE_BUTTON_4 = 3
Global Const $SL_MOUSE_BUTTON_5 = 4
Global Const $SL_MOUSE_BUTTON_6 = 5
Global Const $SL_MOUSE_BUTTON_7 = 6
Global Const $SL_MOUSE_BUTTON_8 = 7
Global Const $SL_MOUSE_BUTTON_LEFT = $SL_MOUSE_BUTTON_1
Global Const $SL_MOUSE_BUTTON_RIGHT = $SL_MOUSE_BUTTON_2
Global Const $SL_MOUSE_BUTTON_MIDDLE = $SL_MOUSE_BUTTON_3

Global $Sigil = 0

;Load Sigil DLL
if $Sigil = -1 Then
   MsgBox($MB_SYSTEMMODAL,"Error","Failed to load Sigil.dll!\n")
EndIf

;Window Functions
Func slWindow($width,$height,$title,$fullscr)
   $xslWindow = DllCall($Sigil,"none:cdecl","slWindow","int",$width,"int",$height,"str",$title,"int",$fullscr)
   Return $xslWindow[0]
EndFunc

Func slShowCursor($show)
   $xslShowCursor = DllCall($Sigil,"none:cdecl","slShowCursor","int",$show)
   Return $xslShowCursor[0]
EndFunc

Func slClose()
   $xslClose = DllCall($Sigil,"none:cdecl","slClose")
   Return $xslClose[0]
   DllClose($Sigil)
EndFunc

Func slShouldClose()
   $xslShouldClose = DllCall($Sigil,"int:cdecl","slShouldClose")
   Return $xslShouldClose[0]
EndFunc

;Key Function
Func slGetKey($key)
   $xslGetKey = DllCall($Sigil,"int:cdecl","slGetKey","int",$key)
   Return $xslGeyKey[0]
EndFunc

;Mouse Functions
Func slGetMouseButton($mouse)
   $xslGetMouseButton = DllCall($Sigil,"int:cdecl","slGetMouseButton","int",$mouse)
   Return $xslGetMouseButton[0]
EndFunc

Func slGetMouseX()
   $xslGetMouseX = DllCall($Sigil,"int:cdecl","slGetMouseX")
   Return $xslGetMouseX[0]
EndFunc

Func slGetMouseY()
   $xslGetMouseY = DllCall($Sigil,"int:cdecl","slGetMouseY")
   Return $xslGetMouseY[0]
EndFunc

;Time Functions
Func slGetDeltaTime()
   $xslGetDeltaTime = DllCall($Sigil,"double:cdecl","slGetDeltaTime")
   Return $xslGetDeltaTime[0]
EndFunc

Func slGetTime()
   $xslGetTime = DllCall($Sigil,"double:cdecl","slGetTime")
   Return $xslGetTime[0]
EndFunc

;Render Functions
Func slRender()
   $xslRender = DllCall($Sigil,"none:cdecl","slRender")
   Return $xslRender[0]
EndFunc

;Color Functions
Func slSetBackColor($r,$g,$b) ;r = red, g = green, b = blue
   $xlSetBackColor = DllCall($Sigil,"none:cdecl","slSetBackColor","double",$r,"double",$g,"double",$b)
   Return $xslSetBackColor[0]
EndFunc

Func slSetForeColor($r,$g,$b) ;r = red, g = green, b = blue
   $xslSetForeColor = DllCall($Sigil,"none:cdecl","setSetForeColor","double",$r,"double",$g,"double",$b)
   Return $xslSetForeColor[0]
EndFunc

Func slSetAdditiveBlend($blend)
   $xslSetAdditiveBlend = DllCall($Sigil,"none:cdecl","slSetAdditiveBlend","int",$blend)
   Return $xslSetAdditiveBlend[0]
EndFunc

;Transformation Functions
Func slPush()
   $xslPush = DllCall($Sigil,"none:cdecl","slPush")
   Return $xslPush[0]
EndFunc

Func slPop()
   $xslPop = DllCall($Sigil,"none:cdecl","slPop")
   Return $xslPop[0]
EndFunc

Func slTranslate($x,$y)
   $xslTranslate = DllCall($Sigil,"none:cdecl","slTranslate","double",$x,"double",$y)
   Return $xslTranslate[0]
EndFunc

Func slRotate($angle)
   $xslRotate = DllCall($Sigil,"none:cdecl","slRotate","double",$angle)
   Return $xslRotate[0]
EndFunc

Func slScale($x,$y)
   $xslScale = DllCall($Sigil,"none:cdecl","slScale","double",$x,"double",$y)
   Return $xslScale[0]
EndFunc

;Texture Loading Function
Func slLoadTexture($file)
   $xslLoadTexture = DllCall($Sigil,"int:cdecl","slLoadTexture","str",$file)
   Return $xslLoadTexture[0]
EndFunc

;Sound Functions
Func slLoadWAV($file)
   $xslLoadWAV = DllCall($Sigil,"int:cdecl","slLoadWAV","str",$file)
   Return $xslLoadWAV[0]
EndFunc

Func slSoundPlay($snd)
   $xslSoundPlay = DllCall($Sigil,"int:cdecl","slSoundPlay","int",$snd)
   Return $xslSoundPlay[0]
EndFunc

Func slSoundLoop($snd)
   $xslSoundLoop = DllCall($Sigil,"int:cdecl","slSoundLoop","int",$snd)
   Return $xslSoundLoop[0]
EndFunc

Func slSoundPause($snd)
   $xslSoundPause = DllCall($Sigil,"none:cdecl","slSoundPause","int",$snd)
   Return $xslSoundPause[0]
EndFunc

Func slSoundStop($snd)
   $xslSoundStop = DllCall($Sigil,"none:cdecl","slSoundStep","int",$snd)
   Return $xslSoundStop[0]
EndFunc

Func slSoundPauseAll()
   $xslSoundPauseAll = DllCall($Sigil,"none:cdecl","slSoundPauseAll")
   Return $xslSoundPauseAll[0]
EndFunc

Func slSoundResumeAll()
   $xslSoundResumeAll = DllCall($Sigil,"none:cdecl","slSoundResumeAll")
   Return $xslSoundResumeAll[0]
EndFunc

Func slSoundStopAll()
   $xslSoundStopAll = DllCall($Sigil,"none:cdecl","slSoundStopAll")
   Return $xslSoundStopAll[0]
EndFunc

Func slSoundPlaying($snd)
   $xslSoundPlaying = DllCall($Sigil,"int:cdecl","slSoundPlaying","int",$snd)
   Return $xslSoundPlaying[0]
EndFunc

Func slSoundLooping($snd)
   $xslSoundLooping = DllCall($Sigil,"int:cdecl","slSoundLooping","int",$snd)
   Return $xslSoundLooping[0]
EndFunc

;Shape Functions
Func slTriangleFill($x,$y,$width,$height)
   $xslTriangleFill = DllCall($Sigil,"none:cdecl","slTriangleFill","double",$x,"double",$y,"double",$width,"double",$height)
   Return $xslTriangleFill[0]
EndFunc

Func slTriangleOutline($x,$y,$width,$height)
   $xslTriangleOutline = DllCall($Sigil,"none:cdecl","slTriangleOutline","double",$x,"double",$y,"double",$width,"double",$height)
   Return $xslTriangleOutline[0]
EndFunc

Func slRectangleFill($x,$y,$width,$height)
   $xlRectangleFill = DllCall($Sigil,"none:cdecl","slRectangleFill","double",$x,"double",$y,"double",$width,"double",$height)
   Return $xslRectangleFill[0]
EndFunc

Func slRectangleOutline($x,$y,$width,$height)
   $xslRectangleOutline = DllCall($Sigil,"none:cdecl","slRectangleOutline","double",$x,"double",$y,"double",$width,"double",$height)
   Return $xslRectangleOutline[0]
EndFunc

Func slCircleFill($x,$y,$radius,$numvert)
   $xslCircleFill = DllCall($Sigil,"none:cdecl","slCircleFill","double",$x,"double",$y,"double",$radus,"int",$numvert)
   Return $xslCircleFill[0]
EndFunc

Func slCircleOutline($x,$y,$radius,$numvert)
   $xslCircleOutline = DllCall($Sigil,"none:cdecl","slCircleOutline","double",$x,"double",$y,"double",$radius,"int",$numvert)
   Return $xslCircleOutline[0]
EndFunc

Func slSemiCircleFill($x,$y,$radius,$numvert,$degree)
   $xslSemiCircleFill = DllCall($Sigil,"none:cdecl","slSemiCircleFill","double",$x,"double",$y,"double",$radius,"int",$numvert,"double",$degree)
   Return $xslSemiCircleFill[0]
EndFunc

Func slSemiCircleOutline($x,$y,$radius,$numvert,$degree)
   $xslSemiCircleOutline = DllCall($Sigil,"none:cdecl","slSemiCircleOutline","double",$x,"double",$y,"double",$radius,"int",$numvert,"double",$degree)
   Return $xslSemiCircleOutline[0]
EndFunc

Func slPoint($x,$y)
   $xslPoint = DllCall($Sigil,"none:cdecl","slPoint","double",$x,"double",$y)
   Return $xslPoint[0]
EndFunc

Func slLine($x,$y,$x2,$y2)
   $xslLine = DllCall($Sigil,"none:cdecl","slLine","double",$x,"double",$y,"double",$x2,"double",$y2)
   Return $xslLine[0]
EndFunc

Func slSetSpriteTiling($x,$y)
   $xslSetSpriteTiling = DllCall($Sigil,"none:cdecl","slSetSpriteTiling","double",$x,"double",$y)
   Return $xslSetSpriteTiling[0]
EndFunc

Func slSetSpriteScroll($x,$y)
   $xslSetSpriteScroll = DllCall($Sigil,"none:cdecl","slSetSpriteScroll","double",$x,"double",$y)
   Return $xslSetSpriteScroll[0]
EndFunc

Func slSprite($tex,$x,$y,$width,$height)
   $xslSprite = DllCall($Sigil,"none:cdecl","slSprite","int",$tex,"double",$x,"double",$y,"double",$width,"double",$height)
   Return $xslSprite[0]
EndFunc

;Text Functions
Func slSetTextAlign($align)
   $xslSetTextAlign = DllCall($Sigil,"none:cdecl","slSetTextAlign","int",$align)
   Return $xslSetTextAlign[0]
EndFunc

Func slGetTextWidth($text)
   $xslGetTextWidth = DllCall($Sigil,"double:cdecl","slGetTextWidth","str",$text)
   Return $xslGetTextWidth[0]
EndFunc

Func slGetTextHeight($text)
   $xslGetTextHeight = DllCall($Sigil,"double:cdecl","slGetTextHeight","str",$text)
   Return $xslGetTextHeight[0]
EndFunc

Func slLoadFont($file)
   $xslLoadFont = DllCall($Sigil,"int:cdecl","slLoadFont","str",$file)
   Return $xslLoadFont[0]
EndFunc

Func slSetFont($font,$size)
   $xslSetFont = DllCall($Sigil,"none:cdecl","slSetFont","int",$font,"int",$size)
   Return $xslSetFont[0]
EndFunc

Func slText($x,$y,$text)
   $xslText = DllCall($Sigil,"none:cdecl","slText","double",$x,"double",$y,"str",$text)
   Return $xslText[0]
EndFunc