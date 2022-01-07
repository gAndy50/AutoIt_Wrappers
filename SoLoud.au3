;;;;;;;;;;;;;;;;;;;;;;;;;;
;SoLoud AutoIt Wrapper   ;
;Written By Andy P.      ;
;Icy Viking Games		 ;
;Copyright (c) 2022		 ;
;AutoIt3				 ;
;Soloud 202002			 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;Flags
Global Const $SOLOUD_AUTO = 0
Global Const $SOLOUD_SDL1 = 1
Global Const	$SOLOUD_SDL2 = 2
Global Const	$SOLOUD_PORTAUDIO = 3
Global Const	$SOLOUD_WINMM = 4
Global Const	$SOLOUD_XAUDIO2 = 5
Global Const	$SOLOUD_WASAPI = 6
Global Const	$SOLOUD_ALSA = 7
Global Const	$SOLOUD_JACK = 8
Global Const	$SOLOUD_OSS = 9
Global Const	$SOLOUD_OPENAL = 10
Global Const	$SOLOUD_COREAUDIO = 11
Global Const	$SOLOUD_OPENSLES = 12
Global Const	$SOLOUD_VITA_HOMEBREW = 13
Global Const	$SOLOUD_MINIAUDIO = 14
Global Const	$SOLOUD_NOSOUND = 15
Global Const	$SOLOUD_NULLDRIVER = 16
Global Const	$SOLOUD_BACKEND_MAX = 17
Global Const	$SOLOUD_CLIP_ROUNDOFF = 1
Global Const	$SOLOUD_ENABLE_VISUALIZATION = 2
Global Const	$SOLOUD_LEFT_HANDED_3D = 4
Global Const	$SOLOUD_NO_FPU_REGISTER_CHANGE = 8
Global Const	$BASSBOOSTFILTER_WET = 0
Global Const	$BASSBOOSTFILTER_BOOST = 1
Global Const	$BIQUADRESONANTFILTER_LOWPASS = 0
Global Const	$BIQUADRESONANTFILTER_HIGHPASS = 1
Global Const	$BIQUADRESONANTFILTER_BANDPASS = 2
Global Const	$BIQUADRESONANTFILTER_WET = 0
Global Const	$BIQUADRESONANTFILTER_TYPE = 1
Global Const	$BIQUADRESONANTFILTER_FREQUENCY = 2
Global Const	$BIQUADRESONANTFILTER_RESONANCE = 3
Global Const	$ECHOFILTER_WET = 0
Global Const	$ECHOFILTER_DELAY = 1
Global Const	$ECHOFILTER_DECAY = 2
Global Const	$ECHOFILTER_FILTER = 3
Global Const	$FLANGERFILTER_WET = 0
Global Const	$FLANGERFILTER_DELAY = 1
Global Const	$FLANGERFILTER_FREQ = 2
Global Const	$FREEVERBFILTER_WET = 0
Global Const	$FREEVERBFILTER_FREEZE = 1
Global Const	$FREEVERBFILTER_ROOMSIZE = 2
Global Const	$FREEVERBFILTER_DAMP = 3
Global Const	$FREEVERBFILTER_WIDTH = 4
Global Const	$LOFIFILTER_WET = 0
Global Const	$LOFIFILTER_SAMPLERATE = 1
Global Const	$LOFIFILTER_BITDEPTH = 2
Global Const	$NOISE_WHITE = 0
Global Const	$NOISE_PINK = 1
Global Const	$NOISE_BROWNISH = 2
Global Const	$NOISE_BLUEISH = 3
Global Const	$ROBOTIZEFILTER_WET = 0
Global Const	$ROBOTIZEFILTER_FREQ = 1
Global Const	$ROBOTIZEFILTER_WAVE = 2
Global Const	$SFXR_COIN = 0
Global Const	$SFXR_LASER = 1
Global Const	$SFXR_EXPLOSION = 2
Global Const	$SFXR_POWERUP = 3
Global Const	$SFXR_HURT = 4
Global Const	$SFXR_JUMP = 5
Global Const	$SFXR_BLIP = 6
Global Const	$SPEECH_KW_SAW = 0
Global Const	$SPEECH_KW_TRIANGLE = 1
Global Const	$SPEECH_KW_SIN = 2
Global Const	$SPEECH_KW_SQUARE = 3
Global Const	$SPEECH_KW_PULSE = 4
Global Const	$SPEECH_KW_NOISE = 5
Global Const	$SPEECH_KW_WARBLE = 6
Global Const	$VIC_PAL = 0
Global Const	$VIC_NTSC = 1
Global Const	$VIC_BASS = 0
Global Const	$VIC_ALTO = 1
Global Const	$VIC_SOPRANO = 2
Global Const	$VIC_NOISE = 3
Global Const	$VIC_MAX_REGS = 4
Global Const	$WAVESHAPERFILTER_WET = 0
Global Const	$WAVESHAPERFILTER_AMOUNT = 1

;Global Var
Global $So = 0

If $So = -1 Then
   MsgBox($MB_SYSTEMMODAL,"Error","Failed to load SoLoud.dll!\n")
EndIf

;Soloud Functions
Func Soloud_destroy($s)
   $xSoloud_destroy = DllCall($So,"none:cdecl","Soloud_destroy","ptr",$s)
EndFunc

Func Soloud_create()
   $xSoloud_create = DllCall($So,"ptr:cdecl","Soloud_create")
   Return $xSoloud_create[0]
EndFunc

Func Soloud_init($s) ;Must call this to open Soloud DLL
   $So = DllOpen("soloud_x86.dll")
   $xSoloud_init = DllCall($So,"int:cdecl","Soloud_init","ptr",$s)
   Return $xSoloud_init[0]
EndFunc

Func Soloud_initEx($s,$flags,$backend,$samplerate,$buffersize,$chans)
   $So = DllOpen("soloud_x86.dll")
   $xSoloud_initEx = DllCall($So,"int:cdecl","Soloud_initEx","uint",$flags,"uint",$backend,"uint",$samplerate,"uint",$buffersize,"uint",$chans)
   Return $xSoloud_initEx[0]
EndFunc

Func Soloud_deinit($s) ;Must call this to close Soloud DLL
   $xSoloud_deinit = DllCall($So,"none:cdecl","Soloud_deinit","ptr",$s)
   DllClose($so)
EndFunc

Func Soloud_getVersion($s)
   $xSoloud_getVersion = DllCall($So,"uint:cdecl","Soloud_getVersion","ptr",$s)
   Return $xSoloud_getVersion[0]
EndFunc

Func Soloud_getErrorString($s,$e)
   $xSoloud_getErrorString = DllCall($So,"string:cdecl","Soloud_getVersion","ptr",$s,"int",$e)
   Return $xSoloud_getErrorString[0]
EndFunc

Func Soloud_getBackendId($s)
   $xSoloud_getBackendId = DllCall($So,"uint:cdecl","Soloud_getBackendId","ptr",$s)
   Return $xSoloud_getBackendId[0]
EndFunc

Func Soloud_getBackendString($s)
   $xSoloud_getBackendString = DllCall($So,"string:cdecl","Soloud_getBackendString","ptr",$s)
   Return $xSoloud_getBackendString[0]
EndFunc

Func Soloud_getBackendChannels($s)
   $xSoloud_getBackendChannels = DllCall($So,"uint:cdecl","Soloud_getBackendChannels","ptr",$s)
   Return $xSoloud_getBackendChannels[0]
EndFunc

Func Soloud_getBackendSamplerate($s)
   $xSoloud_getBackendSamplerate = DllCall($So,"uint:cdecl","Soloud_getBackendSamplerate","ptr",$s)
   Return $xSoloud_getBackendSamplerate[0]
EndFunc

Func Soloud_getBackendBufferSize($s)
   $xSoloud_getBackendBufferSize = DllCall($So,"uint:cdecl","Soloud_getBackendBufferSize","ptr",$s)
   Return $xSoloud_getBackendBufferSize[0]
EndFunc

Func Soloud_setSpeakerPosition($s,$chan,$x,$y,$z)
   $xSoloud_setSpeakerPosition = DllCall($So,"int:cdecl","Soloud_setSpeakerPosition","ptr",$s,"uint",$chan,"float",$x,"float",$y,"float",$z)
   Return $xSoloud_setSpeakerPosition[0]
EndFunc

Func Soloud_play($s,$a)
   $xSoloud_play = DllCall($So,"uint:cdecl","Soloud_play","ptr",$s,"ptr",$a)
   Return $xSoloud_play[0]
EndFunc

Func Soloud_playEx($s,$a,$vol,$pan,$paused,$bus)
   $xSoloud_playEx = DllCall($So,"uint:cdecl","Soloud_playEx","ptr",$s,"ptr",$a,"float",$vol,"float",$pan,"int",$paused,"uint",$bus)
   Return $xSoloud_playEx[0]
EndFunc

Func Soloud_playClocked($s,$st,$a)
   $xSoloud_playClocked = DllCall($So,"uint:cdecl","Soloud_playClocked","ptr",$s,"double",$st,"ptr",$a)
   Return $xSoloud_playClocked[0]
EndFunc

Func Soloud_playClockedEx($s,$st,$a,$vol,$pan,$bus)
   Local $xSoloud_playClockedEx = DllCall($So,"uint:cdecl","Soloud_playClockedEx","ptr",$s,"double",$st,"ptr",$a,"float",$vol,"float",$pan,"uint",$bus)
   Return $xSoloud_playClockedEx[0]
EndFunc

Func Soloud_play3d($s,$a,$x,$y,$z)
   Local $xSoloud_play3d = DllCall($So,"uint:cdecl","Soloud_play3d","ptr",$s,"ptr",$a,"float",$x,"float",$y,"float",$z)
   Return $xSoloud_play3d[0]
EndFunc

Func Soloud_play3dEx($s,$a,$x,$y,$z,$vx,$vy,$vz,$vol,$paused,$bus)
   Local $xSoloud_play3dEx = DllCall($So,"uint:cdecl","Soloud_play3dEx","ptr",$s,"ptr",$a,"float",$x,"float",$y,"float",$z,"float",$vx,"float",$vy,"float",$vz,"float",$vol,"int",$paused,"float",$bus)
   Return $xSoloud_play3dEx[0]
EndFunc

Func Soloud_play3dClocked($s,$st,$a,$x,$y,$z)
   $xSoloud_play3dClocked = DllCall($So,"uint:cdecl","Soloud_play3dClocked","ptr",$s,"double",$st,"ptr",$a,"float",$x,"float",$y,"float",$z)
   Return $xSoloud_play3dClocked[0]
EndFunc

Func Soloud_play3dClockedEx($s,$st,$a,$x,$y,$z,$vx,$vy,$vz,$vol,$bus)
   $xSoloud_play3dClockedEx = DllCall($So,"uint:cdecl","Soloud_play3dClockedEx","ptr",$s,"double",$st,"float",$x,"float",$y,"float",$z,"float",$vx,"float",$vy,"float",$vz,"float",$vol,"uint",$bus)
   Return $xSoloud_play3dClockedEx[0]
EndFunc

Func Soloud_playBackground($s,$a)
   $xSoloud_playBackground = DllCall($So,"uint:cdecl","Soloud_playBackground","ptr",$s,"ptr",$a)
   Return $xSoloud_playBackground[0]
EndFunc

Func Soloud_playBackgroundEx($s,$a,$vol,$paused,$bus)
   Local $xSoloud_playBackgroundEx = DllCall($So,"uint:cdecl","Soloud_playBackgroundEx","ptr",$s,"ptr",$a,"float",$vol,"int",$paused,"uint",$bus)
   Return $xSoloud_playBackgroundEx[0]
EndFunc

Func Soloud_seek($a,$vh,$sec)
   $xSoloud_seek = DllCall($So,"int:cdecl","Soloud_seek","ptr",$s,"uint",$vh,"double",$sec)
   Return $xSoloud_seek[0]
EndFunc

Func Soloud_stop($s,$vh)
   $xSoloud_stop = DllCall($So,"none:cdecl","Soloud_stop","ptr",$s,"uint",$vh)
EndFunc

Func Soloud_stopAll($s)
   $xSoloud_stopAll = DllCall($So,"none:cdecl","Soloud_stopAll","ptr",$s)
EndFunc

Func Soloud_stopAudioSource($s,$a)
   $xSoloud_stopAudioSource = DllCall($So,"none:cdecl","Soloud_stopAudioSource","ptr",$s,"ptr",$a)
EndFunc

Func Soloud_countAudioSource($s,$a)
   $xSoloud_countAudioSource = DllCall($So,"int:cdecl","Soloud_countAudioSource","ptr",$s,"ptr",$a)
   Return $xSoloud_countAudioSource[0]
EndFunc

Func Soloud_setFilterParameter($s,$vh,$id,$aid,$val)
   $xSoloud_setFilterParameter = DllCall($So,"none:cdecl","Soloud_setFilterParameter","ptr",$s,"uint",$vh,"uint",$id,"uint",$aid,"float",$val)
EndFunc

Func Soloud_getFilterParameter($s,$vh,$id,$aid)
   $xSoloud_getFilterParameter = DllCall($So,"float:cdecl","Soloud_getFilterParameter","ptr",$s,"uint",$vh,"uint",$id,"uint",$aid)
   Return $xSoloud_getFilterParameter[0]
EndFunc

Func Soloud_fadeFilterParameter($s,$vh,$id,$aid,$ato,$atime)
   $xSoloud_fadeFilterParameter = DllCall($So,"none:cdecl","Soloud_fadeFilterParameter","ptr",$s,"uint",$vh,"uint",$id,"uint",$aid,"float",$ato,"float",$atime)
EndFunc

Func Soloud_oscillateFilterParameter($s,$vh,$id,$aid,$afrom,$ato,$atime)
   $xSoloud_oscillateFilterParameter = DllCall($So,"none:cdecl","Soloud_oscillateFilterParameter","ptr",$s,"uint",$vh,"uint",$id,"uint",$aid,"float",$afrom,"float",$ato,"double",$atime)
EndFunc

Func Soloud_getStreamTime($s,$vh)
   $xSoloud_getStreamTime = DllCall($So,"double:cdecl","Soloud_getStreamTime","ptr",$s,"uint",$vh)
   Return $xSoloud_getStreamTime[0]
EndFunc

Func Soloud_getStreamPosition($s,$vh)
   $xSoloud_getStreamPosition = DllCall($So,"double:cdecl","Soloud_getStreamPosition","ptr",$s,"uint",$vh)
   Return $xSoloud_getStreamPosition[0]
EndFunc

Func Soloud_getPause($s,$vh)
   $xSoloud_getPause = DllCall($So,"int:cdecl","Soloud_getPause","ptr",$s,"uint",$vh)
   Return $xSoloud_getPause[0]
EndFunc

Func Soloud_getVolume($s,$vh)
   $xSoloud_getVolume = DllCall($So,"float:cdecl","Soloud_getVolume","ptr",$s,"uint",$vh)
   Return $xSoloud_getVolume[0]
EndFunc

Func Soloud_getOverallVolume($s,$vh)
   $xSoloud_getOverallVolume = DllCall($So,"float:cdecl","Soloud_getOverallVolume","ptr",$s,"uint",$vh)
   Return $xSoloud_getOverallVolume[0]
EndFunc

Func Soloud_getPan($s,$vh)
   $xSoloud_getPan = DllCall($So,"float:cdecl","Soloud_getPan","ptr",$s,"uint",$vh)
   Return $xSoloud_getPan[0]
EndFunc

Func Soloud_getSamplerate($s,$vh)
   $xSoloud_getSamplerate = DllCall($So,"float:cdecl","Soloud_getSamplerate","ptr",$s,"uint",$vh)
   Return $xSoloud_getSamplerate[0]
EndFunc

Func Soloud_getProtectVoice($s,$vh)
   $xSoloud_getProtectVoice = DllCall($So,"int:cdecl","Soloud_getProtectVoice","ptr",$s,"uint",$vh)
   Return $xSoloud_getProtectVoice[0]
EndFunc

Func Soloud_getActiveVoiceCount($s)
   $xSoloud_getActiveVoiceCount = DllCall($So,"uint:cdecl","Soloud_getActiveVoiceCount","ptr",$s)
   Return $xSoloud_getActiveVoiceCount[0]
EndFunc

Func Soloud_getVoiceCount($s)
   $xSoloud_getVoiceCount = DllCall($So,"uint:cdecl","Soloud_getVoiceCount","ptr",$s)
   Return $xSoloud_getVoiceCount[0]
EndFunc

Func Soloud_isValidVoiceHandle($s,$vh)
   $xSoloud_isValidVoiceHandle = DllCall($So,"int:cdecl","Soloud_isValidVoiceHandle","ptr",$s,"uint",$vh)
   Return $xSoloud_isValidVoiceHandle[0]
EndFunc

Func Soloud_getRelativePlaySpeed($s,$vh)
   $xSoloud_getRelativePlaySpeed = DllCall($So,"float:cdecl","Soloud_getRelativePlaySpeed","ptr",$s,"uint",$vh)
   Return $xSoloud_getRelativePlaySpeed[0]
EndFunc

Func Soloud_getPostClipScaler($s)
   $xSoloud_getPostClipScaler = DllCall($So,"float:cdecl","Soloud_getPostClipScaler","ptr",$s)
   Return $xSoloud_getPostClipScaler[0]
EndFunc

Func Soloud_getGlobalVolume($s)
   $xSoloud_getGlobalVolume = DllCall($So,"float:cdecl","Soloud_getGlobalVolume","ptr",$s)
   Return $xSoloud_getGlobalVolume[0]
EndFunc

Func Soloud_getMaxActiveVoiceCount($s)
   $xSoloud_getMaxActiveVoiceCount = DllCall($So,"uint:cdecl","Soloud_getMaxActiveVoiceCount","ptr",$s)
   Return $xSoloud_getMaxActiveVoiceCount[0]
EndFunc

Func Soloud_getLooping($s,$vh)
   $xSoloud_getLooping = DllCall($So,"int:cdecl","Soloud_getLooping","ptr",$s,"uint",$vh)
   Return $xSoloud_getLooping[0]
EndFunc

Func Soloud_getLoopPoint($s,$vh)
   $xSoloud_getLoopPoint = DllCall($So,"double:cdecl","Soloud_getLoopPoint","ptr",$s,"uint",$vh)
   Return $xSoloud_getLoopPoint[0]
EndFunc

Func Soloud_setLoopPoint($s,$vh,$lp)
   $xSoloud_setLoopPoint = DllCall($So,"none:cdecl","Soloud_setLoopPoint","ptr",$s,"uint",$vh,"double",$lp)
EndFunc

Func Soloud_setLooping($s,$vh,$lop)
   $xSoloud_setLooping = DllCall($So,"none:cdecl","Soloud_setLooping","ptr",$s,"uint",$vh,"int",$lop)
EndFunc

Func Soloud_setMaxActiveVoiceCount($s,$vh)
   $xSoloud_setMaxActiveVoiceCount = DllCall($So,"int:cdecl","Soloud_setMaxActiveVoiceCount","ptr",$s,"uint",$vh)
   Return $xSoloud_setMaxActiveVoiceCount[0]
EndFunc

Func Soloud_setInaudibleBehavior($s,$vh,$mt,$ak)
   Local $xSoloud_setInaudibleBehavior = DllCall($So,"none:cdecl","Soloud_setInaudibleBehavior","ptr",$s,"uint",$vh,"int",$mt,"int",$ak)
EndFunc

Func Soloud_setGlobalVolume($s,$vol)
   Local $xSoloud_setGlobalVolume = DllCall($So,"none:cdecl","Soloud_setGlobalVolume","ptr",$s,"float",$vol)
EndFunc

Func Soloud_setPostClipScaler($s,$sca)
   Local $xSoloud_setPostClipScaler = DllCall($So,"none:cdecl","Soloud_setPostClipScaler","ptr",$s,"float",$sca)
EndFunc

Func Soloud_setPause($s,$vh,$pau)
   Local $xSoloud_setPause = DllCall($So,"none:cdecl","Soloud_setPause","ptr",$s,"uint",$vh,"int",$pau)
EndFunc

Func Soloud_setPauseAll($s,$p)
   Local $xSoloud_setPauseAll = DllCall($So,"none:cdecl","Soloud_setPauseAll","ptr",$s,"int",$p)
EndFunc

Func Soloud_setRelativePlaySpeed($s,$vh,$spd)
   Local $xSoloud_setRelativePlaySpeed = DllCall($So,"int:cdecl","Soloud_setRelativePlaySpeed","ptr",$s,"uint",$vh,"float",$spd)
   Return $xSoloud_setRelativePlaySpeed[0]
EndFunc

Func Soloud_setProtectVoice($s,$vh,$pro)
   Local $xSoloud_setProtectVoice = DllCall($So,"none:cdecl","Soloud_setProtectVoice","ptr",$s,"uint",$vh,"int",$pro)
EndFunc

Func Soloud_setSamplerate($s,$vh,$rate)
   Local $xSoloud_setSamplerate = DllCall($So,"none:cdecl","Soloud_setSamplerate","ptr",$s,"uint",$vh,"float",$rate)
EndFunc

Func Soloud_setPan($s,$vh,$pan)
   Local $xSoloud_setPan = DllCall($So,"none:cdecl","Soloud_setPan","ptr",$s,"uint",$vh,"float",$pan)
EndFunc

Func Soloud_setPanAbsolute($s,$vh,$L,$R)
   Local $xSoloud_setPanAbsolute = DllCall($So,"none:cdecl","Soloud_setPanAbsolute","ptr",$s,"uint",$vh,"float",$L,"float",$R)
EndFunc

Func Soloud_setPanAbsoluteEx($s,$vh,$L,$R,$LB,$RB,$CV,$SV)
   Local $xSoloud_setPanAbsoluteEx = DllCall($So,"none:cdecl","Soloud_setPanAbsoluteEx","ptr",$s,"uint",$vh,"float",$L,"float",$R,"float",$LB,"float",$RB,"float",$CV,"float",$SV)
EndFunc

Func Soloud_setVolume($s,$vh,$vol)
   Local $xSoloud_setVolume = DllCall($So,"none:cdecl","Soloud_setVolume","ptr",$s,"uint",$vh,"float",$vol)
EndFunc

Func Soloud_setDelaySamples($s,$vh,$samp)
   Local $xSoloud_setDelaySamples = DllCall($So,"none:cdecl","Soloud_setDelaySamples","ptr",$s,"uint",$vh,"uint",$samp)
EndFunc

Func Soloud_fadeVolume($s,$vh,$to,$xtime)
   Local $xSoloud_fadeVolume = DllCall($So,"none:cdecl","Soloud_fadeVolume","ptr",$s,"uint",$vh,"float",$to,"double",$xtime)
EndFunc

Func Soloud_fadePan($s,$vh,$to,$xtime)
   Local $xSoloud_fadePan = DllCall($So,"none:cdecl","Soloud_fadePan","ptr",$s,"uint",$vh,"float",$to,"double",$xtime)
EndFunc

Func Soloud_fadeRelativePlaySpeed($s,$vh,$to,$xtime)
   Local $xSoloud_fadeRelativePlaySpeed = DllCall($So,"none:cdecl","Soloud_fadeRelativePlaySpeed","ptr",$s,"uint",$vh,"float",$to,"double",$xtime)
EndFunc

Func Soloud_fadeGlobalVolume($s,$to,$xtime)
   Local $xSoloud_fadeGlobalVolume = DllCall($So,"none:cdecl","Soloud_fadeGlobalVolume","ptr",$s,"uint",$vh,"float",$to,"double",$xtime)
EndFunc

Func Soloud_schedulePause($s,$vh,$xtime)
   Local $xSoloud_schedulePause = DllCall($So,"none:cdecl","Soloud_schedulePause","ptr",$s,"uint",$vh,"double",$xtime)
EndFunc

Func Soloud_scheduleStop($s,$vh,$xtime)
   Local $xSoloud_scheduleStop = DllCall($So,"none:cdecl","Soloud_scheduleStop","ptr",$s,"uint",$vh,"double",$xtime)
EndFunc

Func Soloud_oscillateVolume($s,$vh,$from,$to,$xtime)
   Local $xSoloud_oscillateVolume = DllCall($So,"none:cdecl","Soloud_oscillateVolume","ptr",$s,"uint",$vh,"float",$from,"float",$to,"double",$xtime)
EndFunc

Func Soloud_oscillatePan($s,$vh,$from,$to,$xtime)
   Local $xSoloud_oscillatePan = DllCall($So,"none:cdecl","Soloud_oscillatePan","ptr",$s,"uint",$vh,"float",$from,"float",$to,"double",$xtime)
EndFunc

Func Soloud_oscillateRelativePlaySpeed($s,$vh,$from,$to,$xtime)
   Local $xSoloud_oscillateRelativePlaySpeed = DllCall($So,"none:cdecl","Soloud_oscillateRelativePlaySpeed","ptr",$s,"uint",$vh,"float",$from,"float",$to,"double",$xtime)
EndFunc

Func Soloud_oscillateGlobalVolume($s,$from,$to,$xtime)
   Local $xSoloud_oscillateGlobalVolume = DllCall($So,"none:cdecl","Soloud_oscillateGlobalVolume","ptr",$s,"float",$from,"float",$to,"double",$xtime)
EndFunc

Func Soloud_setGlobalFilter($s,$id,$filt)
   Local $xSoloud_setGlobalFilter = DllCall($So,"none:cdecl","Soloud_setGlobalFilter","ptr",$s,"uint",$id,"ptr",$filt)
EndFunc

Func Soloud_setVisualizationEnable($s,$en)
   Local $xSoloud_setVisualizationEnable = DllCall($So,"none:cdecl","Soloud_setVisualizationEnable","ptr",$s,"int",$en)
EndFunc

Func Soloud_calcFFT($s)
   Local $xSoloud_calcFFT = DllCall($So,"ptr:cdecl","Soloud_calcFFT","ptr",$s)
   Return $xSoloud_calcFFT[0]
EndFunc

Func Soloud_getWave($s)
   Local $xSoloud_getWave = DllCall($So,"ptr:cdecl","Soloud_getWave","ptr",$s)
   Return $xSoloud_getWave[0]
EndFunc

Func Soloud_getApproximateVolume($s,$chan)
   Local $xSoloud_getApproximateVolume = DllCall($So,"float:cdecl","Soloud_getApproximateVolume","ptr",$s,"uint",$chan)
   Return $xSoloud_getApproximateVolume[0]
EndFunc

Func Soloud_getLoopCount($s,$vh)
   Local $xSoloud_getLoopCount = DllCall($So,"uint:cdecl","Soloud_getLoopCount","ptr",$s,"uint",$vh)
   Return $xSoloud_getLoopCount[0]
EndFunc

Func Soloud_getInfo($s,$vh,$info)
   Local $xSoloud_getInfo = DllCall($So,"float:cdecl","Soloud_getInfo","ptr",$s,"uint",$vh,"uint",$info)
   Return $xSoloud_getInfo[0]
EndFunc

Func Soloud_createVoiceGroup($s)
   Local $xSoloud_createVoiceGroup = DllCall($So,"uint:cdecl","Soloud_createVoiceGroup","ptr",$s)
   Return $xSoloud_createVoiceGroup[0]
EndFunc

Func Soloud_destroyVoiceGroup($s,$vh)
   Local $xSoloud_destroyVoiceGroup = DllCall($So,"int:cdecl","Soloud_destroyVoiceGroup","ptr",$s,"uint",$vh)
   Return $xSoloud_destroyVoiceGroup[0]
EndFunc

Func Soloud_addVoiceToGroup($s,$vh,$vh2)
   Local $xSoloud_addVoiceToGroup = DllCall($So,"int:cdecl","Soloud_addVoiceToGroup","ptr",$s,"uint",$vh2,"uint",$vh)
   Return $xSoloud_addVoiceToGroup[0]
EndFunc

Func Soloud_isVoiceGroup($s,$vh)
   Local $xSoloud_isVoiceGroup = DllCall($So,"int:cdecl","Soloud_isVoiceGroup","ptr",$s,"uint",$vh)
   Return $xSoloud_isVoiceGroup[0]
EndFunc

Func Soloud_isVoiceGroupEmpty($s,$vh)
   Local $xSoloud_isVoiceGroupEmpty = DllCall($So,"int:cdecl","Soloud_isVoiceGroupEmpty","ptr",$s,"uint",$vh)
   Return $xSoloud_isVoiceGroupEmpty[0]
EndFunc

Func Soloud_update3dAudio($s)
   Local $xSoloud_update3dAudio = DllCall($So,"none:cdecl","Soloud_update3dAudio","ptr",$s)
EndFunc

Func Soloud_set3dSoundSpeed($s,$spd)
   Local $xSoloud_set3dSoundSpeed = DllCall($So,"int:cdecl","Soloud_set3dSoundSpeed","ptr",$s,"float",$spd)
   Return $xSoloud_set3dSoundSpeed[0]
EndFunc

Func Soloud_get3dSoundSpeed($s)
   Local $xSoloud_get3dSoundSpeed = DllCall($So,"float:cdecl","Soloud_get3dSoundSpeed","ptr",$s)
   Return $xSoloud_get3dSoundSpeed[0]
EndFunc

Func Soloud_set3dListenerParameters($s,$px,$py,$pz,$ax,$ay,$az,$ux,$uy,$uz)
   Local $xSoloud_set3dListenerParameters = DllCall($So,"none:cdecl","Soloud_set3dListenerParameters","ptr",$s,"float",$px,"float",$py,"float",$pz,"float",$ax,"float",$ay,"float",$az,"float",$ux,"float",$uy,"float",$uz)
EndFunc

Func Soloud_set3dListenerParamtersEx($s,$px,$py,$pz,$ax,$ay,$az,$ux,$uy,$uz,$vx,$vy,$vz)
   Local $xSoloud_set3dListenerParametersEx = DllCall($So,"none:cdecl","Soloud_set3dListenerParametersEx","ptr",$s,"float",$px,"float",$py,"float",$pz,"float",$ax,"float",$ay,"float",$az,"float",$ux,"float",$uy,"float",$uz,"float",$vx,"float",$vy,"float",$vz)
EndFunc

Func Soloud_set3dListenerPosition($s,$x,$y,$z)
   Local $xSoloud_set3dListenerPosition = DllCall($So,"none:cdecl","Soloud_set3dListenerPosition","ptr",$s,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dListenerAt($s,$x,$y,$z)
   Local $xSoloud_set3dListenerAt = DllCall($So,"none:cdecl","Soloud_set3dListenerAt","ptr",$s,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dListenerUp($s,$x,$y,$z)
   Local $xSoloud_set3dListenerUp = DllCall($So,"none:cdecl","Soloud_set3dListenerUp","ptr",$s,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dListenerVelocity($s,$x,$y,$z)
   Local $xSoloud_set3dListenerVelocity = DllCall($So,"none:cdecl","Soloud_set3dListenerVelocity","ptr",$s,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dSourceParameters($s,$vh,$x,$y,$z)
   Local $xSoloud_set3dSourceParameters = DllCall($So,"none:cdecl","Soloud_set3dSourceParameters","ptr",$s,"uint",$vh,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dSourceParametersEx($s,$vh,$x,$y,$z,$vx,$vy,$vz)
   Local $xSoloud_set3dSourceParametersEx = DllCall($So,"none:cdecl","Soloud_set3dSourceParametersEx","ptr",$s,"uint",$vh,"float",$x,"float",$y,"float",$z,"float",$vx,"float",$vy,"float",$vz)
EndFunc

Func Soloud_set3dSourcePosition($s,$vh,$x,$y,$z)
   Local $xSoloud_set3dSourcePosition = DllCall($So,"none:cdecl","Soloud_set3dSourcePosition","ptr",$s,"uint",$vh,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dSourceVelocity($s,$vh,$x,$y,$z)
   Local $xSoloud_set3dSourceVelocity = DllCall($So,"none:cdecl","Soloud_set3dSourceVelocity","ptr",$s,"uint",$vh,"float",$x,"float",$y,"float",$z)
EndFunc

Func Soloud_set3dSourceMinMaxDistance($s,$vh,$min,$max)
   Local $xSoloud_set3dSourceMinMaxDistance = DllCall($So,"none:cdecl","Soloud_set3dSourceMinMaxDistance","ptr",$s,"uint",$vh,"float",$min,"float",$max)
EndFunc

Func Soloud_set3dSourceAttenuation($s,$vh,$att,$roll)
   Local $xSoloud_set3dSourceAttenuation = DllCall($So,"none:cdecl","Soloud_set3dSourceAttenuation","ptr",$s,"uint",$vh,"uint",$att,"float",$roll)
EndFunc

Func Soloud_set3dSourceDopplerFactor($s,$vh,$dop)
   Local $xSoloud_set3dSourceDopplerFactor = DllCall($So,"none:cdecl","Soloud_set3dSourceDopplerFactor","ptr",$s,"uint",$vh,"float",$dop)
EndFunc

Func Soloud_mix($s,$buf,$samp)
   Local $xSoloud_mix = DllCall($So,"none:cdecl","Soloud_mix","ptr",$s,"ptr",$buf,"uint",$samp)
EndFunc

Func Soloud_mixSigned16($s,$buf,$samp)
   Local $xSoloud_mixSigned16 = DllCall($So,"none:cdecl","Soloud_mixSigned16","ptr",$s,"ptr",$buf,"uint",$samp)
EndFunc

;BassboostFilter Functions
Func BassboostFilter_destroy($bas)
   Local $xBassboostFilter = DllCall($So,"none:cdecl","BassboostFilter_destroy","ptr",$bas)
EndFunc

Func BassboostFilter_getParamCount($bas)
   Local $xBassboostFilter_getParamCount = DllCall($So,"int:cdecl","BassboostFilter_getParamCount","ptr",$bas)
   Return $xBassboostFilter_getParamCount[0]
EndFunc

Func BassboostFilter_getParamName($bas,$idx)
   Local $xBassboostFilter_getParamName = DllCall($So,"ptr:cdecl","BassboostFilter_getParamName","ptr",$bas,"uint",$idx)
   Return $xBassboostFilter_getParamName[0]
EndFunc

Func BassboostFilter_getParamType($bas,$idx)
   Local $xBassboostFilter_getParamType = DllCall($So,"uint:cdecl","BassboostFilter_getParamType","ptr",$bas,"uint",$idx)
   Return $xBassboostFilter_getParamType[0]
EndFunc

Func BassboostFilter_getParamMax($bas,$idx)
   Local $xBassboostFilter_getParamMax = DllCall($So,"float:cdecl","BassboostFilter_getParamMax","ptr",$bas,"uint",$idx)
   Return $xBassboostFilter_getParamMax[0]
EndFunc

Func BassboostFilter_getParamMin($bas,$idx)
   Local $xBassboostFilter_getParamMin = DllCall($So,"float:cdecl","BassboostFilter_getParamMin","ptr",$bas,"uint",$idx)
   Return $xBassboostFilter_getParamMin[0]
EndFunc

Func BassboostFilter_setParams($bas,$boo)
   Local $xBassboostFilter_setParams = DllCall($So,"int:cdecl","BassboostFilter_setParams","ptr",$bas,"float",$boo)
   Return $xBassboostFilter_setParams[0]
EndFunc

Func BassboostFilter_create()
   Local $xBassboostFilter_create = DllCall($So,"ptr:cdecl","BassboostFilter_create")
   Return $xBassboostFilter_create[0]
EndFunc

;BiquadResonantFilter Functions
Func BiquadResonantFilter_destroy($b)
   Local $xBiquadResonantFilter_destroy = DllCall($So,"none:cdecl","BiquadResonantFilter_destroy","ptr",$b)
EndFunc

Func BiquadResonantFilter_getParamCount($b)
   Local $xBiquadResonantFilter_getParamCount = DllCall($So,"int:cdecl","BiquadResonantFilter_getParamCount","ptr",$b)
   Return $xBiquadResonantFilter_getParamCount[0]
EndFunc

Func BiquadResonantFilter_getParamName($b,$idx)
   Local $xBiquadResonantFilter_getParamName = DllCall($So,"ptr:cdecl","BiquadResonantFilter_getParamName","ptr",$b,"uint",$idx)
   Return $xBiquadResonantFilter_getParamName[0]
EndFunc

Func BiquadResonantFilter_getParamType($b,$idx)
   Local $xBiquadResonantFilter_getParamType = DllCall($So,"uint:cdecl","BiquadResonantFilter_getParamType","ptr",$b,"uint",$idx)
   Return $xBiquadResonantFilter_getParamType[0]
EndFunc

Func BiquadResonantFilter_getParamMax($b,$idx)
   Local $xBiquadResonantFilter_getParamMax = DllCall($So,"float:cdecl","BiquadResonantFilter_getParamMax","ptr",$b,"uint",$idx)
   Return $xBiquadResonantFilter_getParamMax[0]
EndFunc

Func BiquadResonantFilter_getParamMin($b,$idx)
   Local $xBiquadResonantFilter_getParamMin = DllCall($So,"float:cdecl","BiquadResonantFilter_getParamMin","ptr",$b,"uint",$idx)
   Return $xBiquadResonantFilter_getParamMin[0]
EndFunc

Func BiquadResonantFilter_create()
   Local $xBiquadResonantFilter_create = DllCall($So,"ptr:cdecl","BiquadResonantFilter_create")
   Return $xBiquadResonantFilter_create[0]
EndFunc

Func BiquadResonantFilter_setParams($b,$t,$freq,$res)
   Local $xBiquadResonantFilter_setParams = DllCall($So,"int:cdecl","BiquadResonantFilter_setParams","ptr",$b,"int",$t,"float",$freq,"float",$res)
   Return $xBiquadResonantFilter_setParams[0]
EndFunc

;Bus Functions

Func Bus_destroy($b)
   Local $xBus_destroy = DllCall($So,"none:cdecl","Bus_destroy","ptr",$b)
EndFunc

Func Bus_create()
   Local $xBus_create = DllCall($So,"ptr:cdecl","Bus_create")
   Return $xBus_create[0]
EndFunc

Func Bus_setFilter($b,$id,$filt)
   Local $xBus_setFilter = DllCall($So,"none:cdecl","Bus_setFilter","ptr",$b,"uint",$id,"ptr",$filt)
EndFunc

Func Bus_play($b,$a)
   Local $xBus_play = DllCall($So,"uint:cdecl","Bus_play","ptr",$b,"ptr",$a)
   Return $xBus_play[0]
EndFunc

Func Bus_playEx($b,$a,$vol,$pan,$pause)
   Local $xBus_playEx = DllCall($So,"uint:cdecl","Bus_playEx","ptr",$b,"ptr",$a,"float",$vol,"float",$pan,"int",$pause)
   Return $xBus_playEx[0]
EndFunc

Func Bus_playClocked($b,$st,$a)
   Local $xBus_playClocked = DllCall($So,"uint:cdecl","Bus_playClocked","ptr",$b,"double",$st,"ptr",$a)
   Return $xBus_playClocked[0]
EndFunc

Func Bus_PlayClockedEx($b,$st,$a,$vol,$pan)
   Local $xBus_playClockedEx = DllCall($So,"uint:cdecl","Bus_playClockedEx","ptr",$b,"double",$st,"ptr",$a,"float",$vol,"float",$pan)
   Return $xBus_playClockedEx[0]
EndFunc

Func Bus_play3d($b,$a,$x,$y,$z)
   Local $xBus_play3d = DllCall($So,"uint:cdecl","Bus_play3d","ptr",$b,"ptr",$a,"float",$x,"float",$y,"float",$z)
   Return $xBus_play3d[0]
EndFunc

Func Bus_play3dEx($b,$a,$x,$y,$z,$vx,$vy,$vz,$vol,$pause)
   Local $xBus_play3dEx = DllCall($So,"uint:cdecl","Bus_play3dEx","ptr",$b,"ptr",$a,"float",$x,"float",$y,"float",$z,"float",$vx,"float",$vy,"float",$vz,"float",$vol,"int",$pause)
   Return $xBus_play3dEx[0]
EndFunc

Func Bus_play3dClocked($b,$at,$a,$x,$y,$z)
   Local $xBus_play3dClocked = DllCall($So,"uint:cdecl","Bus_play3dClocked","ptr",$a,"double",$st,"ptr",$a,"float",$x,"float",$y,"float",$z)
   Return $xBus_play3dClocked[0]
EndFunc

Func Bus_play3dClockedEx($b,$at,$a,$px,$py,$pz,$vx,$vy,$vz,$vol)
   Local $xBus_play3dClockedEx = DllCall($So,"uint:cdecl","Bus_play3dClockedEx","ptr",$a,"double",$st,"ptr",$a,"float",$px,"float",$py,"float",$py,"float",$vx,"float",$vy,"float",$vz,"float",$vol)
   Return $xBus_play3dClockedEx[0]
EndFunc

Func Bus_setChannels($b,$chan)
   Local $xBus_setChannels = DllCall($So,"int:cdecl","Bus_setChannels","ptr",$b,"uint",$chan)
   Return $xBus_setChannels[0]
EndFunc

Func Bus_setVisualizationEnable($b,$en)
   Local $xBus_setVisualizationEnable = DllCall($So,"none:cdecl","Bus_setVisualizationEnable","ptr",$b,"int",$en)
EndFunc

Func Bus_annexSound($b,$vh)
   Local $xBus_annexSound = DllCall($So,"none:cdecl","Bus_annexSound","ptr",$b,"uint",$vh)
EndFunc

Func Bus_calcFFT($b)
   Local $xBus_calcFFT = DllCall($So,"ptr:cdecl","Bus_calcFFT","ptr",$b)
   Return $xBus_calcFFT[0]
EndFunc

Func Bus_getWave($b)
   Local $xBus_getWave = DllCall($So,"ptr:cdecl","Bus_getWave","ptr",$b)
   Return $xBus_getWave[0]
EndFunc

Func Bus_getApproximateVolume($b,$chan)
   Local $xBus_getApproximateVolume = DllCall($So,"float:cdecl","Bus_getApproximateVolume","ptr",$b,"uint",$chan)
   Return $xBus_getApproximateVolume[0]
EndFunc

Func Bus_getActiveVoiceCount($b)
   Local $xBus_getActiveVoiceCount = DllCall($So,"uint:cdecl","Bus_getActiveVoiceCount","ptr",$b)
   Return $xBus_getActiveVoiceCount[0]
EndFunc

Func Bus_setVolume($b,$vol)
   Local $xBus_setVolume = DllCall($So,"none:cdecl","Bus_setVolume","ptr",$b,"float",$vol)
EndFunc

Func Bus_setLooping($b,$lop)
   Local $xBus_setLooping = DllCall($So,"none:cdecl","Bus_setLooping","ptr",$b,"int",$lop)
EndFunc

Func Bus_set3dMinMaxDistance($b,$min,$max)
   Local $xBus_set3dMinMaxDistance = DllCall($So,"none:cdecl","Bus_set3dMinMaxDistance","ptr",$b,"float",$min,"float",$max)
EndFunc

Func Bus_set3dAttenuation($b,$att,$roll)
   Local $xBus_set3dAttenuation = DllCall($So,"none:cdecl","Bus_set3dAttenutation","ptr",$b,"uint",$att,"float",$roll)
EndFunc

Func Bus_set3dDopplerFactor($b,$dop)
   Local $xBus_set3dDopplerFactor = DllCall($So,"none:cdecl","Bus_set3dDopplerFactor","ptr",$b,"float",$dop)
EndFunc

Func Bus_set3dListenerRelative($b,$list)
   Local $xBus_Set3dListenerRelative = DllCall($So,"none:cdecl","Bus_set3dListenerRelative","ptr",$b,"int",$list)
EndFunc

Func Bus_set3dDistanceDelay($b,$dist)
   Local $xBus_set3dDistanceDelay = DllCall($So,"none:cdecl","Bus_set3dDistanceDelay","ptr",$b,"int",$dist)
EndFunc

Func Bus_set3dCollider($b,$a)
   Local $xBus_Set3dCollider = DllCall($So,"none:cdecl","Bus_set3dCollider","ptr",$b,"ptr",$a)
EndFunc

Func Bus_set3dColliderEx($b,$a,$dat)
   Local $xBus_set3dColliderEx = DllCall($So,"none:cdecl","Bus_set3dColliderEx","ptr",$b,"ptr",$a,"int",$dat)
EndFunc

Func Bus_set3dAttenuator($b,$a)
   Local $xBus_set3dAttenuator = DllCall($So,"none:cdecl","Bus_set3dAttenuator","ptr",$b,"ptr",$a)
EndFunc

Func Bus_setInaudibleBehavior($b,$tick,$kil)
   Local $xBus_setInaudibleBehavior = DllCall($So,"none:cdecl","Bus_setInaudibleBehavior","ptr",$b,"int",$tick,"int",$kil)
EndFunc

Func Bus_setLoopPoint($b,$lp)
   Local $xBus_setLoopPoint = DllCall($So,"none:cdecl","Bus_setLoopPoint","ptr",$b,"int",$lp)
EndFunc

Func Bus_getLoopPoint($b)
   Local $xBus_getLoopPoint = DllCall($So,"double:cdecl","Bus_getLoopPoint","ptr",$b)
   Return $xBus_getLoopPoint[0]
EndFunc

Func Bus_stop($b)
   Local $xBus_stop = DllCall($So,"none:cdecl","Bus_stop","ptr",$b)
EndFunc

;DCRemovalFilter Functions
Func DCRemovalFilter_destroy($dc)
   Local $xDCRemovalFilter_destroy = DllCall($So,"none:cdecl","DCRemovalFilter_destroy","ptr",$dc)
EndFunc

Func DCRemovalFilter_create()
   Local $xDCRemovalFilter_create = DllCall($So,"ptr:cdecl","DCRemovalFilter_create")
   Return $xDCRemovalFilter_create[0]
EndFunc

Func DCRemovalFilter_setParams($dc)
   Local $xDCRemovalFilter_setParams = DllCall($So,"int:cdecl","DCRemovalFilter_setParams","ptr",$dc)
   Return $xDCRemovalFilter_setParams[0]
EndFunc

Func DCRemovalFilter_setParamsEx($dc,$len)
   Local $xDCRemovalFilter_setParamsEx = DllCall($So,"int:cdecl","DCRemovalFilter_setParamsEx","ptr",$dc,"float",$len)
   Return $xDCRemovalFilter_setParamsEx[0]
EndFunc

Func DCRemovalFilter_getParamCount($dc)
   Local $xDCRemovalFilter_getParamCount = DllCall($So,"int:cdecl","DCRemovalFilter_getParamCount","ptr",$dc)
   Return $xDCRemovalFilter_getParamCount[0]
EndFunc

Func DCRemovalFilter_getParamName($dc,$idx)
   Local $xDCRemovalFilter_getParamName = DllCall($So,"ptr:cdecl","DCRemovalFilter_getParamName","ptr",$dc,"uint",$idx)
   Return $xDCRemovalFilter_getParamName[0]
EndFunc

Func DCRemovalFilter_getParamType($dc,$idx)
   Local $xDCRemovalFilter_getParamType = DllCall($So,"uint:cdecl","DCRemovalFilter_getParamType","ptr",$dc,"uint",$idx)
   Return $xDCRemovalFilter_getParamType[0]
EndFunc

Func DCRemovalFilter_getParamMax($dc,$idx)
   Local $xDCRemovalFilter_getParamMax = DllCall($So,"float:cdecl","DCRemovalFilter_getParamMax","ptr",$dc,"uint",$idx)
   Return $xDCRemovalFilter_getParamMax[0]
EndFunc

Func DCRemovalFilter_getParamMin($dc,$idx)
   Local $xDCRemovalFilter_getParamMin = DllCall($So,"float:cdecl","DCRemovalFilter_getParamMin","ptr",$dc,"uint",$idx)
   Return $xDCRemovalFilter_getParamMin[0]
EndFunc

;EchoFilter Functions

Func EchoFilter_destroy($e)
   Local $xEchoFilter_destroy = DllCall($So,"none:cdecl","EchoFilter_destroy","ptr",$e)
EndFunc

Func EchoFilter_getParamCount($e)
   Local $xEchoFilter_getParamCount = DllCall($So,"int:cdecl","EchoFilter_getParamCount","ptr",$e)
   Return $xEchoFilter_getParamCount[0]
EndFunc

Func EchoFilter_getParamName($e,$idx)
   Local $xEchoFilter_getParamName = DllCall($So,"ptr:cdecl","EchoFilter_getParamName","ptr",$e,"uint",$idx)
   Return $xEchoFilter_getParamName[0]
EndFunc

Func EchoFilter_getParamType($e,$idx)
   Local $xEchoFilter_getParamType = DllCall($So,"uint:cdecl","EchoFilter_getParamType","ptr",$e,"uint",$idx)
   Return $xEchoFilter_getParamType[0]
EndFunc

Func EchoFilter_getParamMax($e,$iex)
   Local $xEchoFilter_getParamMax = DllCall($So,"float:cdecl","EchoFilter_getParamMax","ptr",$e,"uint",$idx)
   Return $xEchoFilter_getParamMax[0]
EndFunc

Func EchoFilter_getParamMin($e,$idx)
   Local $xEchoFilter_getParamMin = DllCall($So,"float:cdecl","EchoFilter_getParamMin","ptr",$e,"uint",$idx)
   Return $xEchoFilter_getParamMin[0]
EndFunc

Func EchoFilter_create()
   Local $xEchoFilter_create = DllCall($So,"ptr:cdecl","EchoFilter_create")
   Return $exEchoFilter_create[0]
EndFunc

Func EchoFilter_setParams($e,$delay)
   Local $xEchoFilter_setParams = DllCall($So,"int:cdecl","EchoFilter_setParams","ptr",$e,"float",$delay)
   Return $exEchoFilter_setParams[0]
EndFunc

Func EchoFilter_setParamsEx($e,$delay,$decay,$filt)
   Local $xEchoFilter_setParamsEx = DllCall($So,"int:cdecl","EchoFilter_setParamsEx","ptr",$e,"float",$delay,"float",$decay,"float",$filt)
   Return $xEchoFilter_setParamsEx[0]
EndFunc

;FFTFilter Functions

func FFTFilter_destroy($f)
   Local $xFFTFilter_destroy = DllCall($So,"none:cdecl","FFTFilter_destroy","ptr",$f)
EndFunc

Func FFTFilter_create()
   Local $xFFTFilter_create = DllCall($So,"ptr:cdecl","FFTFilter_create")
   Return $xFFTFilter_create[0]
EndFunc

Func FFTFilter_getParamCount($f)
   Local $xFFTFilter_getParamCount = DllCall($So,"int:cdecl","FFTFilter_getParamCount","ptr",$f)
   Return $xFFTFilter_getParamCount[0]
EndFunc

Func FFTFilter_getParamName($f,$i)
   Local $xFFTFilter_getParamName = DllCall($So,"ptr:cdecl","FFTFilter_getParamName","ptr",$f,"uint",$i)
   Return $xFFTFilter_getParamName[0]
EndFunc

Func FFTFilter_getParamType($f,$i)
   Local $xFFTFilter_getParamType = DllCall($So,"uint:cdecl","FFTFilter_getParamType","ptr",$f,"uint",$i)
   Return $xFFTFilter_getParamType[0]
EndFunc

Func FFTFilter_getParamMax($f,$i)
   Local $xFFTFilter_getParamMax = DllCall($So,"float:cdecl","FFTFilter_getParamMax","ptr",$f,"uint",$i)
   Return $xFFTFilter_getParamMax[0]
EndFunc

Func FFTFilter_getParamMin($f,$i)
   Local $xFFTFilter_getParamMin = DllCall($So,"float:cdecl","FFTFilter_getParamMin","ptr",$f,"uint",$i)
   Return $xFFTFilter_getParamMin[0]
EndFunc

;FlangerFilter Functions

Func FlangerFilter_destroy($f)
   Local $xFlangerFilter_destroy = DllCall($So,"none:cdecl","FlangerFilter_destroy","ptr",$f)
EndFunc

Func FlangerFilter_getParamCount($f)
   Local $xFlangerFilter_getParamCount = DllCall($So,"int:cdecl","FlangerFilter_getParamCount","ptr",$f)
   Return $xFlangerFilter_getParamCount[0]
EndFunc

Func FlangerFilter_getParamName($f,$i)
   Local $xFlangerFilter_getParamName = DllCall($So,"ptr:cdecl","FlangerFilter_getParamName","ptr",$f,"uint",$i)
   Return $xFlangerFilter_getParamName[0]
EndFunc

Func FlangerFilter_getParamType($f,$i)
   Local $xFlangerFilter_getParamType = DllCall($So,"uint:cdecl","FlangerFilter_getParamType","ptr",$f,"uint",$i)
   Return $xFlangerFilter_getParamType[0]
EndFunc

Func FlangerFilter_getParamMax($f,$i)
   Local $xFlangerFilter_getParamMax = DllCall($So,"float:cdecl","FlangerFilter_getParamMax","ptr",$f,"uint",$i)
   Return $xFlangerFilter_getParamMax[0]
EndFunc

Func FlangerFilter_getParamMin($f,$i)
   Local $xFlangerFilter_getParamMin = DllCall($So,"float:cdecl","FlangerFilter_getParamMin","ptr",$f,"uint",$i)
   Return $xFlangerFilter_getParamMin[0]
EndFunc

Func FlangerFilter_create()
   Local $xFlangerFilter_create = DllCall($So,"ptr:cdecl","FlangerFilter_create")
   Return $xFlangerFilter_create[0]
EndFunc

Func FlangerFilter_setParams($f,$delay,$freq)
    Local $xFlangerFilter_setParams = DllCall($So,"int:cdecl","FlangerFilter_setParams","ptr",$f,"float",$delay,"float",$freq)
	Return $xFlangerFilter_setParams[0]
 EndFunc

 ;FreeverbFilter Functions

 Func FreeverbFilter_destroy($f)
	Local $xFreeverbFilter_destroy = DllCall($So,"none:cdecl","FreeverbFilter_destroy","ptr",$f)
 EndFunc

 Func FreeverbFilter_getParamCount($f)
	Local $xFreeverbFilter_getParamCount = DllCall($So,"int:cdecl","FreeverbFilter_getParamCount","ptr",$f)
	Return $xFreeverbFilter_getParamCount[0]
 EndFunc

 Func FreeverbFilter_getParamName($f,$i)
	Local $xFreeverbFilter_getParamName = DllCall($So,"ptr:cdecl","FreeverbFilter_getParamName","ptr",$f,"uint",$i)
	Return $xFreeverbFilter_getParamName[0]
 EndFunc

 Func FreeverbFilter_getParamType($f,$i)
	Local $xFreeverbFilter_getParamType = DllCall($So,"uint:cdecl","FreeverbFilter_getParamType","ptr",$f,"uint",$i)
	Return $xFreeverbFilter_getParamType[0]
 EndFunc

 Func FreeverbFilter_getParamMax($f,$i)
	Local $xFreeverbFilter_getParamMax = DllCall($So,"float:cdecl","FreeverbFilter_getParamMax","ptr",$f,"uint",$i)
	Return $xFreeverbFilter_getParamMax[0]
 EndFunc

  Func FreeverbFilter_getParamMin($f,$i)
	Local $xFreeverbFilter_getParamMin = DllCall($So,"float:cdecl","FreeverbFilter_getParamMin","ptr",$f,"uint",$i)
	Return $xFreeverbFilter_getParamMin[0]
 EndFunc

 Func FreeverbFilter_create()
	Local $xFreeverbFilter_create = DllCall($So,"ptr:cdecl","Freeverb_create")
    Return $xFreeverbFilter_create[0]
EndFunc

 Func FreeverbFilter_setParams($f,$mode,$size,$damp,$width)
	Local $xFreeverbFilter_setParams = DllCall($So,"int:cdecl","FreeverbFilter_setParams","ptr",$f,"float",$mode,"float",$size,"float",$damp,"float",$width)
	Return $xFreeverbFilter_setParams[0]
 EndFunc

 ;LofiFilter Functions

 Func LofiFilter_destroy($l)
	Local $xLofiFilter_destroy = DllCall($So,"none:cdecl","LofiFilter_destroy","ptr",$l)
 EndFunc

 Func LofiFilter_getParamCount($l)
	Local $xLofiFilter_getParamCount = DllCall($So,"int:cdecl","LofiFilter_getParamCount","ptr",$l)
	Return $xLofiFilter_getParamCount[0]
 EndFunc

 Func LofiFilter_getParamName($l,$i)
	Local $xLofiFilter_getParamName = DllCall($So,"ptr:cdecl","LofiFilter_getParamName","ptr",$l,"uint",$i)
	Return $xLofiFilter_getParamName[0]
 EndFunc

 Func LofiFilter_getParamType($l,$i)
	Local $xLofiFilter_getParamType = DllCall($So,"uint:cdecl","LofiFilter_getParamType","ptr",$l,"uint",$i)
	Return $xLofiFilter_getParamType[0]
 EndFunc

 Func LofiFilter_getParamMax($l,$i)
	Local $xLofiFilter_getParamMax = DllCall($So,"float:cdecl","LofiFilter_getParamMax","ptr",$l,"uint",$i)
	Return $xLofiFilter_getParamMax[0]
 EndFunc

 Func LofiFilter_getParamMin($l,$i)
	Local $xLofiFilter_getParamMin = DllCall($So,"float:cdecl","LofiFilter_getParamMin","ptr",$l,"uint",$i)
	Return $xLofiFilter_getParamMin[0]
 EndFunc

 Func LofiFilter_create()
	Local $xLofiFilter_create = DllCall($So,"ptr:cdecl","LofiFilter_create")
	Return $xLofiFilter_create[0]
 EndFunc

 Func LofiFilter_setParams($l,$sample,$bit)
	Local $xLofiFilter_setParams = DllCall($So,"int:cdecl","LofiFilter_setParams","ptr",$l,"float",$sample,"float",$bit)
	Return $xLofiFilter_setParams[0]
 EndFunc

 ;Monotone Functions

 Func Monotone_destroy($m)
	Local $xMonotone_destroy = DllCall($So,"none:cdecl","Monotone_destroy","ptr",$m)
 EndFunc

 Func Monotone_create()
	Local $xMontone_create = DllCall($So,"ptr:cdecl","Monotone_create")
	Return $xMonotone_create[0]
 EndFunc

 Func Monotone_setParams($m,$chan)
	Local $xMonotone_setParams = DllCall($So,"int:cdecl","Monotone_setParams","ptr",$m,"int",$chan)
	Return $xMonotone_setParams[0]
 EndFunc

 Func Monotone_setParamsEx($m,$chan,$wav)
	Local $xMonotone_setParamsEx = DllCall($So,"int:cdecl","Monotone_setParamsEx","ptr",$m,"int",$chan,"int",$wav)
	Return $xMonotone_setParamsEx[0]
 EndFunc

 Func Monotone_load($m,$file)
	Local $xMonotone_load = DllCall($So,"int:cdecl","Monotone_load","ptr",$m,"ptr",$file)
	Return $xMonotone_load[0]
 EndFunc

 Func Monotone_loadMem($m,$mem,$len)
	Local $xMonotone_loadMem = DllCall($So,"int:cdecl","Monotone_loadMem","ptr",$m,"ptr",$mem,"uint",$len)
	Return $xMonotone_loadMem[0]
 EndFunc

 Func Monotone_loadMemEx($m,$mem,$len,$cop,$take)
	Local $xMonotone_loadMemEx = DllCall($So,"int:cdecl","Monotone_loadMemEx","ptr",$m,"ptr",$mem,"uint",$len,"int",$cop,"int",$take)
	Return $xMonotone_loadMemEx[0]
 EndFunc

 Func Monotone_loadFile($m,$file)
	Local $xMonotone_loadFile = DllCall($So,"int:cdecl","Monotone_loadFile","ptr",$m,"ptr",$file)
	Return $xMonotone_loadFile[0]
 EndFunc

 Func Monotone_setVolume($m,$vol)
	Local $xMonotone_setVolume = DllCall($So,"none:cdecl","Monotone_setVolume","ptr",$m,"float",$vol)
 EndFunc

 Func Monotone_setLooping($m,$lop)
	Local $xMonotone_setLooping = DllCall($So,"none:cdecl","Monotone_setLooping","ptr",$m,"int",$lop)
 EndFunc

 Func Monotone_set3dMinMaxDistance($m,$min,$max)
	Local $xMonotone_set3dMinMaxDistance = DllCall($So,"none:cdecl","Monotone_set3dMinMaxDistance","ptr",$m,"float",$min,"float",$max)
 EndFunc

 Func Monotone_set3dAttenuation($m,$att,$roll)
	Local $xMonotone_set3dAttenuation = DllCall($So,"none:cdecl","Monotone_set3dAttenuation","ptr",$m,"uint",$att,"float",$roll)
 EndFunc

 Func Monotone_set3dDopplerFactor($m,$dop)
	Local $xMonotone_set3dDopplerFactor = DllCall($So,"none:cdecl","Monotone_set3dDopplerFactor","ptr",$m,"float",$dop)
 EndFunc

 Func Monotone_set3dListenerRelative($m,$list)
	Local $xMonotone_set3dListenerRelative = DllCall($So,"none:cdecl","Monotone_set3dListenerRelative","ptr",$m,"int",$list)
 EndFunc

 Func Monotone_set3dDistanceDelay($m,$dist)
	Local $xMonotone_set3dDistanceDelay = DllCall($So,"none:cdecl","Monotone_set3dDistanceDelay","ptr",$m,"int",$dist)
 EndFunc

 Func Monotone_set3dCollider($m,$a)
	Local $xMonotone_set3dCollider = DllCall($So,"none:cdecl","Monotone_set3dCollider","ptr",$m,"ptr",$a)
 EndFunc

 Func Monotone_set3dColliderEx($m,$a,$use)
	Local $xMonotone_set3dColliderEx = DllCall($So,"none:cdecl","Monotone_set3dColliderEx","ptr",$m,"ptr",$a,"int",$use)
 EndFunc

 Func Monotone_set3dAttenuator($m,$a)
	Local $xMonotone_set3dAttenuator = DllCall($So,"none:cdecl","Monotone_set3dAttenuator","ptr",$m,"ptr",$a)
 EndFunc

 Func Monotone_setInaudibleBehavior($m,$tick,$kil)
	Local $xMonotone_setInaudibleBehavior = DllCall($So,"none:cdecl","Monotone_setInaudibleBehavior","ptr",$m,"int",$tick,"int",$kil)
 EndFunc

 Func Monotone_setLoopPoint($m,$lop)
	Local $xMonotone_setLoopPoint = DllCall($So,"none:cdecl","Monotone_setLoopPoint","ptr",$m,"double",$lop)
 EndFunc

 Func Monotone_getLoopPoint($m)
	Local $xMonotone_getLoopPoint = DllCall($So,"double:cdecl","Monotone_getLoopPoint","ptr",$m)
	Return $xMonotone_getLoopPoint[0]
 EndFunc

 Func Monotone_setFilter($m,$id,$filt)
	Local $xMonotone_setFilter = DllCall($So,"none:cdecl","Monotone_setFilter","ptr",$m,"uint",$id,"ptr",$filt)
 EndFunc

 Func Monotone_stop($m)
	Local $xMonotone_stop = DllCall($So,"none:cdecl","Monotone_stop","ptr",$m)
 EndFunc

 ;Noise Functions
 Func Noise_destroy($n)
	Local $xNoise_destroy = DllCall($So,"none:cdecl","Noise_destroy","ptr",$n)
 EndFunc

 Func Noise_create()
	Local $xNoise_create = DllCall($So,"ptr:cdecl","Noise_create")
	Return $xNoise_create[0]
 EndFunc

 Func Noise_setOctaveScale($n,$o0,$o1,$o2,$o3,$o4,$o5,$o6,$o7,$o8,$o9)
	Local $xNoise_setOctaveScale = DllCall($So,"none:cdecl","Noise_setOctaveScale","ptr",$n,"float",$o0,"float",$o1,"float",$o2,"float",$o3,"float",$o4,"float",$o5,"float",$o6,"float",$o7,"float",$o8,"float",$o9)
 EndFunc

 Func Noise_setType($n,$t)
	Local $xNoise_setType = DllCall($So,"none:cdecl","Noise_setType","ptr",$n,"int",$t)
 EndFunc

 Func Noise_setVolume($n,$vol)
	Local $xNoise_setVolume = DllCall($So,"none:cdecl","Noise_setVolume","ptr",$n,"float",$vol)
 EndFunc

 Func Noise_setLooping($n,$l)
	Local $xNoise_setLooping = DllCall($So,"none:cdecl","Noise_setLooping","ptr",$n,"int",$l)
 EndFunc

 Func Noise_set3dMinMaxDistance($n,$min,$max)
	Local $xNoise_set3dMinMaxDistance = DllCall($So,"none:cdecl","Noise_set3dMinMaxDistance","ptr",$n,"float",$min,"float",$max)
 EndFunc

 Func Noise_set3dAttenuation($n,$att,$roll)
	Local $xNoise_set3dAttenuation = DllCall($So,"none:cdecl","Noise_set3dAttenuation","ptr",$n,"int",$att,"float",$oll)
 EndFunc

 Func Noise_set3dDopplerFactor($n,$dop)
	Local $xNoise_set3dDopplerFactor = DllCall($So,"none:cdecl","Noise_set3dDopplerFactor","ptr",$n,"float",$dop)
 EndFunc

 Func Noise_set3dListenerRelative($n,$list)
	Local $xNoise_set3dListenerRelative = DllCall($So,"none:cdecl","Noise_set3dListenerRelative","ptr",$n,"int",$list)
 EndFunc

 Func Noise_set3dDistanceDelay($n,$dist)
	Local $xNoise_set3dDistanceDelay = DllCall($So,"none:cdecl","Noise_set3dDistanceDelay","ptr",$n,"int",$dist)
 EndFunc

 Func Noise_set3dCollider($n,$col)
	Local $xNoise_set3dCollider = DllCall($So,"none:cdecl","Noise_set3dCollider","ptr",$n,"ptr",$col)
 EndFunc

 Func Noise_set3dColliderEx($n,$a,$us)
	Local $xNoise_set3dColliderEx = DllCall($So,"none:cdecl","Noise_set3dColliderEx","ptr",$n,"ptr",$a,"int",$use)
 EndFunc

 Func Noise_setInaudibleBehavior($n,$tick,$kil)
	Local $xNoise_setInaudibleBehavior = DllCall($So,"none:cdecl","Noise_setInaudibleBehavior","ptr",$n,"int",$tick,"int",$kil)
 EndFunc

 Func Noise_setLoopPoint($n,$lop)
	Local $xNoise_setLoopPoint = DllCall($So,"none:cdecl","Noise_setLoopPoint","ptr",$n,"double",$lop)
 EndFunc

 Func Noise_getLoopPoint($n)
	Local $xNoise_getLoopPoint = DllCall($So,"double:cdecl","Noise_getLoopPoint","ptr",$n)
	Return $xNoise_getLoopPoint[0]
 EndFunc

 Func Noise_setFilter($n,$id,$fil)
	Local $xNoise_setFilter = DllCall($So,"none:cdecl","Noise_setFilter","ptr",$n,"uint",$id,"ptr",$fil)
 EndFunc

 Func Noise_stop($n)
	Local $xNoise_stop = DllCall($So,"none:cdecl","Noise_stop","ptr",$n)
 EndFunc

 ;Openmpt Functions

 Func Openmpt_destroy($o)
	Local $xOpenmpt_destroy = DllCall($So,"none:cdecl","Openmpt_destroy","ptr",$o)
 EndFunc

 Func Openmpt_create()
	Local $xOpenmpt_create = DllCall($So,"ptr:cdecl","Openmpt_create")
	Return $xOpenmpt_create[0]
 EndFunc

 Func Openmpt_load($o,$file)
	Local $xOpenmpt_load = DllCall($So,"int:cdecl","Openmpt_load","ptr",$o,"ptr",$file)
	Return $xOpenmpt_load[0]
 EndFunc

 Func Openmpt_loadMem($o,$mem,$len)
	Local $xOpenmpt_loadMem = DllCall($So,"int:cdecl","Openmpt_loadMem","ptr",$o,"ptr",$mem,"uint",$len)
	Return $xOpenmpt_loadMem[0]
 EndFunc

 Func Openmpt_loadMemEx($o,$mem,$len,$cop,$own)
	Local $xOpenmpt_loadMemEx = DllCall($So,"int:cdecl","Openmpt_loadMemEx","ptr",$o,"ptr",$mem,"uint",$len,"int",$cop,"int",$own)
	Return $xOpenmpt_loadMemEx[0]
 EndFunc

 Func Openmpt_loadFile($o,$file)
	Local $xOpenmpt_loadFile = DllCall($So,"int:cdecl","Openmpt_loadFile","ptr",$o,"ptr",$file)
	Return $xOpenmpt_loadFile[0]
 EndFunc

 Func Openmpt_setVolume($o,$vol)
	Local $xOpenmpt_setVolume = DllCall($So,"none:cdecl","Openmpt_setVolume","ptr",$o,"float",$vol)
 EndFunc

 Func Openmpt_setLooping($o,$lop)
	Local $xOpenmpt_setLooping = DllCall($So,"none:cdecl","Openmpt_setLooping","ptr",$o,"int",$lop)
 EndFunc

 Func Openmpt_set3dMinMaxDistance($o,$min,$max)
	Local $xOpenmpt_set3dMinMaxDistance = DllCall($So,"none:cdecl","Openmpt_set3dMinMaxDistance","ptr",$o,"float",$min,"float",$max)
 EndFunc

 Func Openmpt_set3dAttenuation($o,$att,$roll)
	Local $xOpenmpt_set3dAttenuation = DllCall($So,"none:cdecl","Openmpt_set3dAttenuation","ptr",$o,"uint",$att,"float",$roll)
 EndFunc

 Func Openmpt_set3dDopplerFactor($o,$dop)
	Local $xOpenmpt_set3dDopplerFactor = DllCall($So,"none:cdecl","Openmpt_set3dDopplerFactor","ptr",$o,"float",$dop)
 EndFunc

 Func Openmpt_set3dListenerRelative($o,$list)
	Local $xOpenmpt_set3dListenerRelative = DllCall($So,"none:cdecl","Openmpt_set3dListenerRelative","ptr",$o,"int",$list)
 EndFunc

 Func Openmpt_set3dDistanceDelay($o,$dist)
	Local $xOpenmpt_set3dDistanceDelay = DllCall($So,"none:cdecl","Openmpt_set3dDistanceDelay","ptr",$o,"int",$dist)
 EndFunc

 Func Openmpt_set3dCollider($s,$a)
	Local $xOpenmpt_set3dCollider = DllCall($So,"none:cdecl","Openmpt_set3dCollider","ptr",$s,"ptr",$a)
 EndFunc

 Func Openmpt_set3dColliderEx($o,$a,$use)
	Local $xOpenmpt_set3dColliderEx = DllCall($So,"none:cdecl","Openmpt_set3dColliderEx","ptr",$o,"ptr",$a,"int",$use)
 EndFunc

Func Openmpt_set3dAttenuator($o,$a)
	Local $xOpenmpt_set3dAttenuator = DllCall($So,"none:cdecl","Openmpt_set3dAttenuator","ptr",$o,"ptr",$a)
 EndFunc

Func Openmpt_setInaudibleBehavior($s,$must,$kil)
	 Local $xOpenmpt_setInaudibleBehavior = DllCall($So,"none:cdecl","Openmpt_setInaudibleBehavior","ptr",$o,"int",$must,"int",$kil)
EndFunc

Func Openmpt_setLoopPoint($o,$pt)
   Local $xOpenmpt_setLoopPoint = DllCall($So,"none:cdecl","Openmpt_setLoopPoint","ptr",$o,"double",$pt)
EndFunc

Func Openmpt_getLoopPoint($o)
   Local $xOpenmpt_getLoopPoint = DllCall($So,"double:cdecl","Openmpt_getLoopPoint","ptr",$o)
   Return $xOpenmpt_getLoopPoint[0]
EndFunc

Func Openmpt_setFilter($o,$id,$filt)
   Local $xOpenmpt_setFilter = DllCall($So,"none:cdecl","Openmpt_setFilter","ptr",$o,"uint",$id,"ptr",$filt)
EndFunc

Func Openmpt_stop($o)
   Local $xOpenmpt_stop = DllCall($So,"none:cdecl","Openmpt_stop","ptr",$o)
EndFunc

;Queue Functions
Func Queue_destroy($q)
   Local $xQueue_destroy = DllCall($So,"none:cdecl","Queue_destroy","ptr",$q)
EndFunc

Func Queue_create()
   Local $xQueue_create = DllCall($So,"ptr:cdecl","Queue_create")
   Return $xQueue_create[0]
EndFunc

Func Queue_play($q,$s)
   Local $xQueue_play = DllCall($So,"int:cdecl","Queue_play","ptr",$q,"ptr",$s)
   Return $xQueue_play[0]
EndFunc

Func Queue_getQueueCount($q)
   Local $xQueue_getQueueCount = DllCall($So,"uint:cdecl","Queue_getQueueCount","ptr",$q)
   Return $xQueue_getQueueCount[0]
EndFunc

Func Queue_isCurrentlyPlaying($q,$s)
   Local $xQueue_isCurrentlyPlaying = DllCall($So,"int:cdecl","Queue_isCurrentlyPlaying","ptr",$q,"ptr",$s)
   Return $xQueue_isCurrentlyPlaying[0]
EndFunc

Func Queue_setParamsFromAudioSource($q,$s)
   Local $xQueue_setParamsFromAudioSource = DllCall($So,"int:cdecl","Queue_setParamsFromAudioSource","ptr",$q,"ptr",$s)
   Return $xQueue_setParamsFromAudioSource[0]
EndFunc

Func Queue_setParams($q,$samp)
   Local $xQueue_setParams = DllCall($So,"int:cdecl","Queue_setParams","ptr",$q,"float",$samp)
   Return $xQueue_setParams[0]
EndFunc

Func Queue_setParamsEx($q,$samp,$chan)
   Local $xQueue_setParamsEx = DllCall($So,"int:cdecl","Queue_setParamsEx","ptr",$q,"float",$samp,"uint",$chan)
   Return $xQueue_setParamsEx[0]
EndFunc

Func Queue_setVolume($q,$vol)
   Local $xQueue_setVolume = DllCall($So,"none:cdecl","Queue_setVolume","ptr",$q,"float",$vol)
EndFunc

Func Queue_setLooping($q,$lop)
   Local $xQueue_setLooping = DllCall($So,"none:cdecl","Queue_setLooping","ptr",$q,"int",$lop)
EndFunc

Func Queue_set3dMinMaxDistance($q,$min,$max)
   Local $xQueue_set3dMinMaxDistance = DllCall($So,"none:cdecl","Queue_set3dMinMaxDistance","ptr",$q,"float",$min,"float",$max)
EndFunc

Func Queue_set3dAttenuation($q,$att,$roll)
   Local $xQueue_set3dAttenuation = DllCall($So,"none:cdecl","Queue_set3dAttenuation","ptr",$q,"uint",$att,"float",$roll)
EndFunc

Func Queue_set3dDopplerFactor($q,$dop)
   Local $xQueue_set3dDopplerFactor = DllCall($So,"none:cdecl","Queue_set3dDopplerFactor","ptr",$q,"float",$dop)
EndFunc

Func Queue_set3dListenerRelative($q,$list)
   Local $xQueue_set3dListenerRelative = DllCall($So,"none:cdecl","Queue_set3dListenerRelative","ptr",$q,"int",$list)
EndFunc

Func Queue_set3dDistanceDelay($q,$dist)
   Local $xQueue_set3dDistanceDelay = DllCall($So,"none:cdecl","Queue_set3dDistanceDelay","ptr",$q,"int",$dist)
EndFunc

Func Queue_set3dCollider($q,$a)
   Local $xQueue_set3dCollider = DllCall($So,"none:cdecl","Queue_set3dCollider","ptr",$q,"ptr",$a)
EndFunc

Func Queue_set3dColliderEx($q,$a,$use)
   Local $xQueue_set3dColliderEx = DllCall($So,"none:cdecl","Queue_set3dColliderEx","ptr",$q,"ptr",$a,"int",$use)
EndFunc

Func Queue_set3dAttenuator($q,$a)
   Local $xQueue_set3dAttenuaitor = DllCall($So,"none:cdecl","Queue_set3dAttenuator","ptr",$q,"ptr",$a)
EndFunc

Func Queue_setInaudibleBehavior($q,$m,$k)
   Local $xQueue_setInaudibleBehavior = DllCall($So,"none:cdecl","Queue_setInaudibleBehavior","ptR",$q,"int",$m,"int",$k)
EndFunc

Func Queue_setLoopPoint($q,$lop)
   Local $xQueue_setLoopPoint = DllCall($So,"none:cdecl","Queue_setLoopPoint","ptr",$q,"double",$lop)
EndFunc

Func Queue_getLoopPoint($q)
   Local $xQueue_getLoopPoint = DllCall($So,"double:cdecl","Queue_getLoopPoint","ptr",$q)
   Return $xQueue_getLoopPoint[0]
EndFunc

Func Queue_setFilter($q,$id,$filt)
   Local $xQueue_setFilter = DllCall($So,"none:cdecl","Queue_setFilter","ptr",$q,"uint",$id,"ptr",$filt)
EndFunc

Func Queue_stop($q)
   Local $xQueue_stop = DllCall($So,"none:cdecl","Queue_stop","ptr",$q)
EndFunc

;RobotizeFilter Functions
Func RobotizeFilter_destroy($r)
   Local $xRobotizeFilter_destroy = DllCall($So,"none:cdecl","RobotizeFilter_destroy","ptr",$r)
EndFunc

Func RobotizeFilter_getParamCount($r)
   Local $xRobotizeFilter_getParamCount = DllCall($So,"int:cdecl","RobotizeFilter_getParamCount","ptr",$r)
   Return $xRobotizerFilter_getParamCount[0]
EndFunc

Func RobotizeFilter_getParamName($r,$i)
   Local $xRobotizeFilter_getParamName = DllCall($So,"ptr:cdecl","RobotizeFilter_getParamName","ptr",$r,"uint",$i)
   Return $xRobotizeFilter_getParamName[0]
EndFunc

Func RobotizeFilter_getParamType($r,$i)
   Local $xRobotizeFilter_getParamType = DllCall($So,"uint:cdecl","RobotizeFilter_getParamType","ptr",$r,"uint",$i)
   Return $xRobotizeFilter_getParamType[0]
EndFunc

Func RobotizeFilter_getParamMax($r,$i)
   Local $xRobotizeFilter_getParamMax = DllCall($So,"float:cdecl","RobotizeFilter_getParamMax","ptr",$r,"uint",$i)
   Return $xRobotizeFilter_getParamMax[0]
EndFunc

Func RobotizeFilter_getParamMin($r,$i)
   Local $xRobotizeFilter_getParamMin = DllCall($So,"float:cdecl","RobotizeFilter_getParamMin","ptr",$r,"uint",$i)
   Return $xRobotizeFilter_getParamMin[0]
EndFunc

Func RobotizeFilter_setParams($r,$freq,$wav)
   Local $xRobotizeFilter_setParams = DllCall($So,"none:cdecl","RobotizeFilter_setParams","ptr",$r,"float",$freq,"int",$wav)
EndFunc

Func RobotizeFilter_create()
   Local $xRobotizeFilter_create = DllCall($So,"ptr:cdecl","RobotizeFilter_create")
   Return $xRobotizeFilter_create[0]
EndFunc

;Sfxr Functions
Func Sfxr_destroy($s)
   Local $xSfxr_destroy = DllCall($So,"none:cdecl","Sfxr_destroy","ptr",$s)
EndFunc

Func Sfxr_create()
   Local $xSfxr_create = DllCall($So,"ptr:cdecl","Sfxr_create")
   Return $xSfxr_create[0]
EndFunc

Func Sfxr_resetParams($s)
   Local $xSfxr_resetParams = DllCall($So,"none:cdecl","Sfxr_resetParams","ptr",$s)
EndFunc

Func Sfxr_loadParams($s,$file)
   Local $xSfxr_loadParams = DllCall($So,"int:cdecl","Sfxr_loadParams","ptr",$s,"ptr",$file)
   Return $xSfxr_loadParams[0]
EndFunc

Func Sfxr_loadParamsMem($s,$mem,$len)
   Local $xSfxr_loadParamsMem = DllCall($So,"int:cdecl","Sfxr_loadParamsMem","ptr",$s,"ptr",$mem,"uint",$len)
   Return $xSfxr_loadParamsMem[0]
EndFunc

Func Sfxr_loadParamsMemEx($s,$mem,$len,$cop,$own)
   Local $xSfxr_loadParamsMemEx = DllCall($So,"int:cdecl","Sfxr_loadParamsMemEx","ptr",$s,"ptr",$mem,"uint",$len,"int",$cop,"int",$own)
   Return $xSfxr_loadParamsMemEx[0]
EndFunc

Func Sfxr_loadParamsFile($s,$file)
   Local $xSfxr_loadParamsFile = DllCall($So,"int:cdecl","Sfxr_loadParamsFile","ptr",$s,"ptr",$file)
   Return $xSfxr_loadParamsFile[0]
EndFunc

Func Sfxr_loadPreset($s,$no,$rand)
   Local $xSfxr_loadPreset = DllCall($So,"int:cdecl","Sfxr_loadPreset","ptr",$s,"int",$no,"int",$rand)
   Return $xSfxr_loadPreset[0]
EndFunc

Func Sfxr_setVolume($s,$vol)
   Local $xSfxr_setVolume = DllCall($So,"none:cdecl","Sfxr_setVolume","ptr",$s,"float",$vol)
EndFunc

Func Sfxr_setLooping($s,$lop)
   Local $xSfxr_setLooping = DllCall($So,"none:cdecl","Sfxr_setLooping","ptr",$s,"int",$lop)
EndFunc

Func Sfxr_set3dMinMaxDistance($s,$min,$max)
   Local $xSfxr_set3dMinMaxDistance = DllCall($So,"none:cdecl","Sfxr_set3dMinMaxDistance","ptr",$s,"float",$min,"float",$max)
EndFunc

Func Sfxr_set3dAttenuation($s,$att,$roll)
   Local $xSfxr_set3dAttenuation = DllCall($So,"none:cdecl","Sfxr_set3dAttenuation","ptr",$s,"uint",$att,"float",$roll)
EndFunc

Func Sfxr_set3dDopplerFactor($s,$dop)
   Local $xSfxr_set3dDopplerFactor = DllCall($So,"none:cdecl","Sfxr_set3dDopplerFactor","ptr",$s,"float",$dop)
EndFunc

Func Sfxr_set3dListenerRelative($s,$list)
    Local $xSfxr_set3dListenerRelative = DllCall($So,"none:cdecl","Sfxr_set3dListenerRelative","ptr",$s,"int",$list)
 EndFunc

 Func Sfxr_set3dDistanceDelay($s,$dist)
	Local $xSfxr_set3dDistanceDelay = DllCall($So,"none:cdecl","Sfxr_set3dDistanceDelay","ptr",$s,"int",$dist)
 EndFunc

 Func Sfxr_set3dCollider($s,$a)
	Local $xSfxr_set3dCollider = DllCall($So,"none:cdecl","Sfxr_set3dCollider","ptr",$s,"ptr",$a)
 EndFunc

 Func Sfxr_set3dColliderEx($s,$a,$use)
	Local $xSfxr_set3dColliderEx = DllCall($So,"none:cdecl","Sfxr_set3dColliderEx","ptr",$s,"ptr",$a,"int",$use)
 EndFunc

 Func Sfxr_set3dAttenuator($s,$a)
	Local $xSfxr_set3dAttenuator = DllCall($So,"none:cdecl","Sfxr_set3dAttenuator","ptr",$s,"ptr",$a)
 EndFunc

 Func Sfxr_setInaudibleBehavior($s,$t,$k)
	Local $xSfxr_setInaudibleBehavior = DllCall($So,"none:cdecl","Sfxr_setInaudibleBehavior","ptr",$s,"int",$m,"int",$k)
 EndFunc

 Func Sfxr_setLoopPoint($s,$lop)
	Local $xSfxr_setLoopPoint = DllCall($So,"none:cdecl","Sfxr_setLoopPoint","ptr",$s,"double",$lop)
 EndFunc

 Func Sfxr_getLoopPoint($s)
	Local $xSfxr_getLoopPoint = DllCall($So,"double:cdecl","Sfxr_getLoopPoint","ptr",$s)
	Return $xSfxr_getLoopPoint[0]
 EndFunc

 Func Sfxr_setFilter($s,$id,$filt)
	Local $xSfxr_setFilter = DllCall($So,"none:cdecl","Sfxr_setFilter","ptr",$s,"uint",$id,"ptr",$filt)
 EndFunc

 Func Sfxr_stop($s)
	Local $xSfxr_stop = DllCall($So,"none:cdecl","Sfxr_stop","ptr",$s)
 EndFunc

 ;Speech Functions
 Func Speech_destroy($s)
	Local $xSpeech_destroy = DllCall($So,"none:cdecl","Speech_destroy","ptr",$s)
 EndFunc

 Func Speech_create()
	Local $xSpeech_create = DllCall($So,"ptr:cdecl","Speech_create")
	Return $xSpeech_create[0]
 EndFunc

 Func Speech_setText($s,$t)
	Local $xSpeech_setText = DllCall($So,"int:cdecl","Speech_setText","ptr",$s,"ptr",$t)
	Return $xSpeech_setText[0]
 EndFunc

 Func Speech_setParams($s)
	Local $xSpeech_setParams = DllCall($S0,"int:cdecl","Speech_setParams","ptr",$s)
	Return $xSpeech_setParams[0]
 EndFunc

 Func Speech_setParamsEx($s,$bf,$bs,$bd,$bw)
	Local $xSpeech_setParamsEx = DllCall($So,"int:cdecl","Speech_setParamsEx","ptr",$s,"uint",$bf,"float",$bs,"float",$bd,"int",$bw)
	Return $xSpeech_setParamsEx[0]
 EndFunc

 Func Speech_setVolume($s,$vol)
	Local $xSpeech_setVolume = DllCall($So,"none:cdecl","Speech_setVolume","ptr",$s,"float",$vol)
 EndFunc

 Func Speech_setLooping($s,$l)
	Local $xSpeech_setLooping = DllCall($So,"none:cdecl","Speech_setLooping","ptr",$s,"int",$l)
 EndFunc

 Func Speech_set3dMinMaxDistance($s,$min,$max)
	Local $xSpeech_set3dMinMaxDistance = DllCall($So,"none:cdecl","Speech_set3dMinMaxDistance","ptr",$s,"float",$min,"float",$max)
 EndFunc

 Func Speech_set3dAttenuation($s,$att,$roll)
	Local $xSpeech_set3dAttenuation = DllCall($So,"none:cdecl","Speech_set3dAttenuation","ptr",$s,"uint",$att,"float",$roll)
 EndFunc

 Func Speech_set3dDopplerFactor($s,$dop)
	Local $xSpeech_set3dDopplerFactor = DllCall($So,"none:cdecl","Speech_set3dDopplerFactor","ptr",$s,"float",$dop)
 EndFunc

 Func Speech_set3dListenerRelative($s,$l)
	Local $xSpeech_set3dListenerRelative = DllCall($So,"none:cdecl","Speech_set3dListenrer","ptr",$s,"int",$l)
 EndFunc

 Func Speech_set3dDistanceDelay($s,$d)
	 Local $xSpeech_set3dDistanceDelay = DllCall($So,"none:cdecl","Speech_set3dDistanceDelay","ptr",$s,"int",$d)
  EndFunc

  Func Speech_set3dCollider($s,$a)
   Local $xSpeech_set3dCollider = DllCall($So,"none:cdecl","Speech_set3dCollider","ptr",$s,"ptr",$a)
EndFunc

Func Speech_set3dColliderEx($s,$a,$u)
   Local $xSpeech_set3dColliderEx = DllCall($So,"none:cdecl","Speech_set3dColliderEx","ptr",$s,"ptr",$a,"int",$u)
EndFunc

Func Speech_set3dAttenuator($s,$a)
   Local $xSpeech_set3dAttenuator = DllCall($So,"none:cdecl","Speech_set3dAttenuator","ptr",$s,"ptr",$a)
EndFunc

Func Speech_setInaudibleBehavior($s,$m,$k)
   Local $xSpeech_setInaudibleBehavior = DllCall($So,"none:cdecl","Speech_setInaudibleBehavior","ptr",$s,"int",$m,"int",$k)
EndFunc

Func Speech_setLoopPoint($s,$pt)
   Local $xSpeech_setLoopPoint = DllCall($So,"none:cdecl","Speech_setLoopPoint","ptr",$s,"double",$pt)
EndFunc

Func Speech_getLoopPoint($s)
   Local $xSpeech_getLoopPoint = DllCall($So,"double:cdecl","Speech_getLoopPoint","ptr",$s)
   Return $xSpeech_getLoopPoint[0]
EndFunc

Func Speech_setFilter($s,$id,$f)
   Local $xSpeech_setFilter = DllCall($So,"none:cdecl","Speech_setFilter","ptr",$s,"uint",$id,"ptr",$f)
EndFunc

Func Speech_stop($s)
   Local $xSpeech_stop = DllCall($So,"none:cdecl","Speech_stop","ptr",$s)
EndFunc

;TedSid Functions
Func TedSid_destroy($t)
   Local $xTedSid_destroy = DllCall($So,"none:cdecl","TedSid_destroy","ptr",$t)
EndFunc

Func TedSid_create()
   Local $xTedSid_create = DllCall($So,"ptr:cdecl","TedSid_create")
   Return $xTedSid_create[0]
EndFunc

Func TedSid_load($t,$file)
   Local $xTedSid_load = DllCall($So,"int:cdecl","TedSid_load","ptr",$t,"ptr",$file)
   Return $xTedSid_load[0]
EndFunc

Func TedSid_loadToMem($t,$file)
   Local $xTedSid_loadToMem = DllCall($So,"int:cdecl","TedSid_loadToMem","ptr",$t,"ptr",$file)
   Return $xTedSid_loadToMem[0]
EndFunc

Func TedSid_loadMem($t,$mem,$len)
   Local $xTedSid_loadMem = DllCall($So,"int:cdecl","TedSid_loadMem","ptr",$t,"ptr",$mem,"uint",$len)
   Return $xTedSid_loadMem[0]
EndFunc

Func TedSid_loadMemEx($t,$mem,$len,$co,$own)
   Local $xTedSid_loadMemEx = DllCall($So,"int:cdecl","TedSid_loadMemEx","ptr",$t,"ptr",$mem,"uint",$len,"uint",$co,"int",$own)
   Return $xTedSid_loadMemEx[0]
EndFunc

Func TedSid_loadFileToMem($t,$file)
   Local $xTedSid_loadFileToMem = DllCall($So,"int:cdecl","TedSid_loadFileToMem","ptr",$t,"ptr",$file)
   Return $xTedSid_loadFileToMem[0]
EndFunc

Func TedSid_loadFile($t,$file)
   Local $xTedSid_loadFile = DllCall($So,"int:cdecl","TedSid_loadFile","ptr",$t,"ptr",$file)
   Return $xTedSid_loadFile[0]
EndFunc

Func TedSid_setVolume($t,$vol)
   Local $xTedSid_setVolume = DllCall($So,"none:cdecl","TedSid_setVolume","ptr",$t,"float",$vol)
EndFunc

Func TedSid_setLooping($t,$l)
   Local $xTedSid_setLooping = DllCall($So,"none:cdecl","TedSid_setLooping","ptr",$t,"int",$l)
EndFunc

Func TedSid_set3dMinMaxDistance($t,$min,$max)
   Local $xTedSid_set3dMinMaxDistance = DllCall($So,"none:cdecl","TedSid_set3dMinMaxDistance","ptr",$t,"float",$min,"float",$max)
EndFunc

Func TedSid_set3dAttenuation($t,$att,$roll)
   Local $xTedSid_set3dAttenuation = DllCall($So,"none:cdecl","TedSid_set3dAttenuation","ptr",$t,"uint",$att,"float",$roll)
EndFunc

Func TedSid_set3dDopplerFactor($t,$dop)
   Local $xTedSid_set3dDopplerFactor = DllCall($So,"none:cdecl","TedSid_set3dDopplerFactor","ptr",$t,"float",$dop)
EndFunc

Func TedSid_set3dListenerRelative($t,$li)
   Local $xTedSid_set3dListenerRelative = DllCall($So,"none:cdecl","TedSid_set3dListenerRelative","ptr",$t,"int",$li)
EndFunc

Func TedSid_set3dDistanceDelay($t,$di)
   Local $xTedSid_set3dDistanceDelay = DllCall($So,"none:cdecl","TedSid_set3dDistanceDelay","ptr",$t,"int",$di)
EndFunc

Func TedSid_set3dCollider($t,$a)
   Local $xTedSid_set3dCollider = DllCall($So,"none:cdecl","TedSid_set3dCollider","ptr",$t,"ptr",$a)
EndFunc

Func TedSid_set3dColliderEx($t,$a,$us)
   Local $xTedSid_set3dColliderEx = DllCall($So,"none:cdecl","TedSid_set3dColliderEx","ptr",$t,"ptr",$a,"int",$us)
EndFunc

Func TedSid_set3dAttenuator($t,$a)
   Local $xTedSid_set3dAttenuator = DllCall($So,"none:cdecl","TedSid_set3dAttenuator","ptr",$t,"ptr",$a)
EndFunc

Func TedSid_setInaudibleBehavior($t,$m,$k)
   Local $xTedSid_setInaudibleBehavior = DllCall($So,"none:cdecl","TedSid_setInaudibleBehavior","ptr",$t,"int",$m,"int",$k)
EndFunc

Func TedSid_setLoopPoint($t,$pt)
   Local $xTedSid_setLoopPoint = DllCall($So,"none:cdecl","TedSid_setLoopPoint","ptr",$t,"double",$pt)
EndFunc

Func TedSid_getLoopPoint($t)
   Local $xTedSid_getLoopPoint = DllCall($So,"double:cdecl","TedSid_getLoopPoint","ptr",$t)
   Return $xTedSid_getLoopPoint[0]
EndFunc

Func TedSid_setFilter($t,$id,$f)
   Local $xTedSid_setFilter = DllCall($So,"none:cdecl","TedSid_setFilter","ptr",$t,"uint",$id,"ptr",$f)
EndFunc

Func TedSid_stop($t)
   Local $xTedSid_stop = DllCall($So,"none:cdecl","TedSid_stop","ptr",$t)
EndFunc

;Vic Functions
Func Vic_destroy($v)
   Local $xVic_destroy = DllCall($So,"none:cdecl","Vic_destroy","ptr",$v)
EndFunc

Func Vic_create()
   Local $xVic_create = DllCall($So,"ptr:cdecl","Vic_create")
   Return $xVic_create[0]
EndFunc

Func Vic_setModel($v,$mod)
   Local $xVic_setModel = DllCall($So,"none:cdecl","Vic_setModel","ptr",$v,"int",$mod)
EndFunc

Func Vic_getModel($v)
   Local $xVic_getModel = DllCall($So,"int:cdecl","Vic_getModel","ptr",$v)
   Return $xVic_getModel[0]
EndFunc

Func Vic_setRegister($v,$reg,$val)
   Local $xVic_setRegister = DllCall($So,"none:cdecl","Vic_setRegister","ptr",$v,"int",$reg,"uchar",$val)
EndFunc

Func Vic_getRegister($v,$reg)
   Local $xVic_getRegister = DllCall($So,"uchar:cdecl","Vic_getRegister","ptr",$v,"int",$reg)
   Return $xVic_getRegister[0]
EndFunc

Func Vic_setVolume($v,$vol)
   Local $xVic_setVolume = DllCall($So,"none:cdecl","Vic_setVolume","ptr",$v,"float",$vol)
EndFunc

Func Vic_setLooping($v,$l)
   Local $xVic_setLooping = DllCall($So,"none:cdecl","Vic_setLooping","ptr",$v,"int",$l)
EndFunc

Func Vic_set3dMinMaxDistance($v,$min,$max)
   Local $xVic_set3dMinMaxDistance = DllCall($So,"none:cdecl","Vic_set3dMinMaxDistance","ptr",$v,"float",$min,"float",$max)
EndFunc

Func Vic_set3dAttenuation($v,$att,$roll)
   Local $xVic_set3dAttenuation = DllCall($So,"none:cdecl","Vic_set3dAttenuation","ptr",$v,"uint",$att,"float",$roll)
EndFunc

Func Vic_set3dDopplerFactor($v,$dop)
   Local $xVic_set3dDopplerFactor = DllCall($So,"none:cdecl","Vic_set3dDopplerFactor","ptr",$v,"float",$dop)
EndFunc

Func Vic_set3dListenerRelative($v,$li)
   Local $xVic_set3dListenerRelative = DllCall($So,"none:cdecl","Vic_set3dListenerRelative","ptr",$v,"int",$li)
EndFunc

Func Vic_set3dDistanceDelay($v,$di)
   Local $xVic_set3dDistanceDelay = DllCall($So,"none:cdecl","Vic_set3dDistanceDelay","ptr",$v,"int",$di)
EndFunc

Func Vic_set3dCollider($v,$a)
   Local $xVic_set3dCollider = DllCall($So,"none:cdecl","Vic_set3dCollider","ptr",$v,"ptr",$a)
EndFunc

Func Vic_set3dColliderEx($v,$a,$us)
   Local $xVic_set3dColliderEx = DllCall($So,"none:cdecl","Vic_set3dColliderEx","ptr",$v,"ptr",$a,"int",$us)
EndFunc

Func Vic_setInaudibleBehavior($v,$m,$k)
   Local $xVic_setInaudibleBehavior = DllCall($So,"none:cdecl","Vic_setInaudibleBehavior","ptr",$v,"int",$m,"int",$k)
EndFunc

Func Vic_setLoopPoint($v,$pt)
   Local $xVic_setLoopPoint = DllCall($So,"none:cdecl","Vic_setLoopPoint","ptr",$v,"double",$pt)
EndFunc

Func Vic_getLoopPoint($v)
   Local $xVic_getLoopPoint = DllCall($So,"double:cdecl","Vic_getLoopPoint","ptr",$v)
   Return $xVic_getLoopPoint[0]
EndFunc

Func Vic_setFilter($v,$id,$f)
   Local $xVic_setFilter = DllCall($So,"none:cdecl","Vic_setFilter","ptr",$v,"uint",$id,"ptr",$f)
EndFunc

Func Vic_stop($v)
   Local $xVic_stop = DllCall($So,"none:cdecl","Vic_stop","ptr",$v)
EndFunc

;Vizsn Functions
Func Vizsn_destroy($v)
   Local $xVizsn_destroy = DllCall($So,"none:cdecl","Vizsn_destroy","ptr",$v)
EndFunc

Func Vizsn_create()
   Local $xVizsn_create = DllCall($So,"ptr:cdecl","Vizsn_create")
   Return $xVizsn_create[0]
EndFunc

Func Vizsn_setText($v,$t)
   Local $xVizsn_setText = DllCall($So,"none:cdecl","Vizsn_setText","ptr",$v,"ptr",$t)
EndFunc

Func Vizsn_setVolume($v,$vol)
   Local $xVizsn_setVolume = DllCall($So,"none:cdecl","Vizsn_setVolume","ptr",$v,"float",$vol)
EndFunc

Func Vizsn_setLooping($v,$l)
   Local $xVizsn_setLooping = DllCall($So,"none:cdecl","Vizsn_setLooping","ptr",$v,"int",$l)
EndFunc

Func Vizsn_set3dMinMaxDistance($v,$min,$max)
   Local $xVizsn_set3dMinMaxDistance = DllCall($So,"none:cdecl","Vizsn_set3dMinMaxDistance","ptr",$v,"float",$min,"float",$max)
EndFunc

Func Vizsn_set3dAttenuation($v,$att,$roll)
   Local $xVizsn_set3dAttenuation = DllCall($So,"none:cdecl","Vizsn_set3dAttenuation","ptr",$v,"uint",$att,"float",$roll)
EndFunc

Func Vizsn_set3dDopplerFactor($v,$dop)
   Local $xVizsn_set3dDopplerFactor = DllCall($So,"none:cdecl","Vizsn_set3dDopplerFactor","ptr",$v,"float",$dop)
EndFunc

Func Vizsn_set3dListenerRelative($v,$li)
   Local $xVizsn_set3dListenerRelative = DllCall($So,"none:cdecl","Vizsn_set3dListenerRelative","ptr",$v,"int",$li)
EndFunc

Func Vizsn_set3dDistanceDelay($v,$di)
   Local $xVizsn_set3dDistanceDelay = DllCall($So,"none:cdecl","Vizsn_set3dDistanceDelay","ptr",$v,"int",$di)
EndFunc

Func Vizsn_set3dCollider($v,$a)
   Local $xVizsn_set3dCollider = DllCall($So,"none:cdecl","Vizsn_set3dCollider","ptr",$v,"ptr",$a)
EndFunc

Func Vizsn_set3dColliderEx($v,$a,$us)
   Local $zVizsn_set3dColliderEx = DllCall($So,"none:cdecl","Vizsn_set3dColliderEx","ptr",$v,"ptr",$a,"int",$us)
EndFunc

Func Vizsn_set3dAttenuator($v,$a)
   Local $xVizsn_set3dAttenuator = DllCall($So,"none:cdecl","Vizsn_set3dAttenuator","ptr",$v,"ptr",$a)
EndFunc

Func Vizsn_setInaudibleBehavior($v,$m,$k)
   Local $xVizsn_setInaudibleBehavior = DllCall($So,"none:cdecl","Vizsn_setInaudibleBehavior","ptr",$v,"int",$m,"int",$k)
EndFunc

Func Vizsn_setLoopPoint($v,$pt)
   Local $xVizsn_setLoopPoint = DllCall($So,"none:cdecl","Vizsn_setLoopPoint","ptr",$v,"double",$pt)
EndFunc

Func Vizsn_getLoopPoint($v)
   Local $xVizsn_getLoopPoint = DllCall($So,"double:cdecl","Vizsn_getLoopPoint","ptr",$v)
   Return $xVizsn_getLoopPoint[0]
EndFunc

Func Vizsn_setFilter($v,$id,$f)
   Local $xVizsn_setFilter = DllCall($So,"none:cdecl","Vizsn_setFilter","ptr",$v,"uint",$id,"ptr",$f)
EndFunc

Func Vizsn_stop($v)
   Local $xVizsn_stop = DllCall($So,"none:cdecl","Vizsn_stop","ptr",$v)
EndFunc

;Wav Functions
Func Wav_destroy($w)
   Local $xWav_destroy = DllCall($So,"none:cdecl","Wav_destroy","ptr",$w)
EndFunc

Func Wav_create()
   Local $xWav_create = DllCall($So,"ptr:cdecl","Wav_create")
   Return $xWav_create[0]
EndFunc

Func Wav_load($w,$file)
   Local $xWav_load = DllCall($So,"int:cdecl","Wav_load","ptr",$w,"ptr",$file)
   Return $xWav_load[0]
EndFunc

Func Wav_loadMem($w,$mem,$len)
   Local $xWav_loadMem = DllCall($So,"int:cdecl","Wav_loadMem","ptr",$w,"ptr",$mem,"uint",$len)
   Return $xWav_loadMem[0]
EndFunc

Func Wav_loadMemEx($w,$mem,$len,$co,$ow)
   Local $xWav_loadMemEx = DllCall($So,"int:cdecl","Wav_loadMemEx","ptr",$w,"ptr",$mem,"uint",$len,"int",$co,"int",$ow)
   Return $xWav_loadMemEx[0]
EndFunc

Func Wav_loadFile($w,$file)
   Local $xWav_loadFile = DllCall($So,"int:cdecl","Wav_loadFile","ptr",$w,"ptr",$file)
   Return $xWav_loadFile[0]
EndFunc

Func Wav_loadRawWave8($w,$mem,$len)
   Local $xWav_loadRawWave8 = DllCall($So,"int:cdecl","Wav_loadRawWave8","ptr",$w,"ptr",$mem,"uint",$len)
   Return $xWav_loadRawWave8[0]
EndFunc

Func Wav_loadRawWave8Ex($w,$mem,$len,$samp,$chan)
   Local $xWav_loadRawWave8Ex = DllCall($So,"int:cdecl","Wav_loadRawWave8Ex","ptr",$w,"ptr",$mem,"uint",$len,"float",$samp,"uint",$chan)
   Return $xWav_loadRawWave8Ex[0]
EndFunc

Func Wav_loadRawWave16($w,$mem,$len)
   Local $xWav_loadRawWave16 = DllCall($So,"int:cdecl","Wav_loadRawWave16","ptr",$w,"ptr",$mem,"uint",$len)
   Return $xWav_loadRawWave16[0]
EndFunc

Func Wav_loadRawWave16Ex($w,$mem,$len,$samp,$chan)
   Local $xWav_loadRawWave16Ex = DllCall($So,"int:cdecl","Wav_loadRawWave16Ex","ptr",$w,"ptr",$mem,"uint",$len,"float",$samp,"uint",$chan)
   Return $xWav_loadRawWave16Ex[0]
EndFunc

Func Wav_loadRawWave($w,$mem,$len)
   Local $xWav_loadRawWave = DllCall($So,"int:cdecl","Wav_loadRawWave","ptr",$w,"ptr",$mem,"uint",$len)
   Return $xWav_loadRawWave[0]
EndFunc

Func Wav_loadRawWaveEx($w,$mem,$len,$samp,$chan,$co,$ow)
   Local $xWav_loadRawWaveEx = DllCall($So,"int:cdecl","Wav_loadRawWaveEx","ptr",$w,"ptr",$mem,"uint",$len,"float",$samp,"uint",$chan,"int",$co,"int",$ow)
   Return $xWav_loadRawWaveEx[0]
EndFunc

Func Wav_getLength($w)
   Local $xWav_getLength = DllCall($So,"double:cdecl","Wav_getLength","ptr",$w)
   Return $xWav_getLength[0]
EndFunc

Func Wav_setVolume($w,$vol)
   Local $xWav_setVolume = DllCall($So,"none:cdecl","Wav_setVolume","ptr",$w,"float",$vol)
EndFunc

Func Wav_setLooping($w,$l)
   Local $xWav_setLooping = DllCall($So,"none:cdecl","Wav_setLooping","ptr",$w,"int",$l)
EndFunc

Func Wav_set3dMinMaxDistance($w,$min,$max)
   Local $xWav_set3dMinMaxDistance = DllCall($So,"none:cdecl","Wav_set3dMinMaxDistance","ptr",$w,"float",$min,"float",$max)
EndFunc

Func Wav_set3dAttenuation($w,$att,$roll)
   Local $xWav_set3dAttenuation = DllCall($So,"none:cdecl","Wav_set3dAttenuation","ptr",$w,"uint",$att,"float",$roll)
EndFunc

Func Wav_set3dDopplerFactor($w,$dop)
   Local $xWav_set3dDopplerFactor = DllCall($So,"none:cdecl","Wav_set3dDopplerFactor","ptr",$w,"float",$dop)
EndFunc

Func Wav_set3dListenerRelative($w,$li)
   Local $xWav_set3dListenerRelative = DllCall($So,"none:cdecl","Wav_set3dListenerRelative","ptr",$w,"int",$li)
EndFunc

Func Wav_set3dDistanceDelay($w,$di)
   Local $xWav_set3dDistanceDelay = DllCall($So,"none:cdecl","Wav_set3dDistanceDelay","ptr",$w,"int",$di)
EndFunc

Func Wav_set3dCollider($w,$a)
   Local $xWav_set3dCollider = DllCall($So,"none:cdecl","Wav_set3dCollider","ptr",$w,"ptr",$a)
EndFunc

Func Wav_set3dColliderEx($w,$a,$us)
   Local $xWav_set3dColliderEx = DllCall($So,"none:cdecl","Wav_set3dColliderEx","ptr",$w,"ptr",$a,"int",$us)
EndFunc

Func Wav_set3dAttenuator($w,$a)
   Local $xWav_set3dAttenuator = DllCall($So,"none:cdecl","Wav_set3dAttenuator","ptr",$w,"ptr",$a)
EndFunc

Func Wav_setInaudibleBehavior($w,$m,$k)
   Local $xWav_setInaudibleBehavior = DllCall($So,"none:cdecl","Wav_setInaudibleBehavior","ptr",$w,"int",$m,"int",$k)
EndFunc

Func Wav_setLoopPoint($w,$pt)
   Local $xWav_setLoopPoint = DllCall($So,"none:cdecl","Wav_setLoopPoint","ptr",$w,"double",$pt)
EndFunc

Func Wav_getLoopPoint($w)
   Local $xWav_getLoopPoint = DllCall($So,"double:cdecl","Wav_getLoopPoint","ptr",$w)
   Return $xWav_getLoopPoint[0]
EndFunc

Func Wav_setFilter($w,$id,$f)
   Local $xWav_setFilter = DllCall($So,"none:cdecl","Wav_setFilter","ptr",$w,"uint",$id,"ptr",$f)
EndFunc

Func Wav_stop($w)
   Local $xWav_stop = DllCall($So,"none:cdecl","Wav_stop","ptr",$w)
EndFunc

;WaveShaperFilter Functions
Func WaveShaperFilter_destroy($ws)
   Local $xWaveShaperFilter_destroy = DllCall($So,"none:cdecl","WaveShaperFilter_destroy","ptr",$ws)
EndFunc

Func WaveShaperFilter_setParams($ws,$amt)
   Local $xWaveShaperFilter_setParams = DllCall($So,"int:cdecl","WaveShaperFilter_setParams","ptr",$ws,"float",$amt)
   Return $xWaveShaperFilter_setParams[0]
EndFunc

Func WaveShaperFilter_create()
   Local $xWaveShaperFilter_create = DllCall($So,"ptr:cdecl","WaveShaperFilter_create")
   Return $xWaveShaperFilter_create[0]
EndFunc

Func WaveShaperFilter_getParamCount($ws)
   Local $xWaveShaperFilter_getParamCount = DllCall($So,"int:cdecl","WaveShaperFilter_getParamCount")
   Return $xWaveShaperFilter_getParamCount[0]
EndFunc

Func WaveShaperFilter_getParamName($ws,$id)
   Local $xWaveShaperFilter_getParamName = DllCall($So,"ptr:cdecl","WaveShaperFilter_getParamName","ptr",$ws,"uint",$id)
   Return $xWaveShaperFilter_getParamName[0]
EndFunc

Func WaveShaperFilter_getParamType($ws,$id)
   Local $xWaveShaperFilter_getParamType = DllCall($So,"uint:cdecl","WaveShaperFilter_getParamType","ptr",$ws,"uint",$id)
   Return $xWaveShaperFilter_getParamType[0]
EndFunc

Func WaveShaperFilter_getParamMax($ws,$id)
   Local $xWaveShaperFilter_getParamMax = DllCall($So,"float:cdecl","WaveShaperFilter_getParamMax","ptr",$ws,"uint",$id)
   Return $xWaveShaperFilter_getParamMax[0]
EndFunc

Func WaveShaperFilter_getParamMin($ws,$id)
   Local $xWaveShaperFilter_getParamMin = DllCall($So,"float:cdecl","WaveShaperFilter_getParamMin","ptr",$ws,"uint",$id)
   Return $xWaveShaperFilter_getParamMin[0]
EndFunc

;WavStream Functions
Func WavStream_destroy($ws)
   Local $xWavStream_destroy = DllCall($So,"none:cdecl","WavStream_destroy","ptr",$ws)
EndFunc

Func WavStream_create()
   Local $xWavStream_create = DllCall($So,"ptr:cdecl","WavStream_create")
   Return $xWavStream_create[0]
EndFunc

Func WavStream_load($ws,$file)
   Local $xWavStream_load = DllCall($So,"int:cdecl","WavStream_load","ptr",$ws,"ptr",$file)
   Return $xWavStream_load[0]
EndFunc

Func WavStream_loadMem($ws,$dat,$len)
   Local $xWavStream_loadMem = DllCall($So,"int:cdecl","WavStream_loadMem","ptr",$ws,"ptr",$dat,"uint",$len)
   Return $xWavStream_loadMem[0]
EndFunc

Func WavStream_loadMemEx($ws,$dat,$len,$co,$ow)
   Local $xWavStream_loadMemEx = DllCall($So,"int:cdecl","WavStream_loadMemEx","ptr",$ws,"ptr",$dat,"uint",$len,"int",$co,"int",$ow)
   Return $xWavStream_loadMemEx[0]
EndFunc

Func WavStream_loadToMem($ws,$file)
   Local $xWavStream_loadToMem = DllCall($So,"int:cdecl","WavStream_loadToMem","ptr",$ws,"ptr",$file)
   Return $xWavStream_loadToMem[0]
EndFunc

Func WavStream_loadFile($ws,$file)
   Local $xWavStream_loadFile = DllCall($So,"int:cdecl","WavStream_loadFile","ptr",$ws,"ptr",$file)
   Return $xWavStream_loadFile[0]
EndFunc

Func WavStream_loadFileToMem($ws,$file)
   Local $xWavStream_loadFileToMem = DllCall($So,"int:cdecl","WavStream_loadFileToMem","ptr",$ws,"ptr",$file)
   Return $xWavStream_loadFileToMem[0]
EndFunc

Func WavStream_getLength($ws)
   Local $xWavStream_getLength = DllCall($So,"double:cdecl","WavStream_getLength","ptr",$ws)
   Return $xWavStream_getLength[0]
EndFunc

Func WavStream_setVolume($ws,$vol)
   Local $xWavStream_setVolume = DllCall($So,"none:cdecl","WavStream_setVolume","ptr",$ws,"float",$vol)
EndFunc

Func WavStream_setLooping($ws,$l)
   Local $xWavStream_setLooping = DllCall($So,"none:cdecl","WavStream_setLooping","ptr",$ws,"int",$l)
EndFunc

Func WavStream_set3dMinMaxDistance($ws,$min,$max)
   Local $xWavStream_set3dMinMaxDistance = DllCall($So,"none:cdecl","WavStream_set3dMinMaxDistance","ptr",$ws,"float",$min,"float",$max)
EndFunc

Func WavStream_set3dAttenuation($ws,$att,$roll)
   Local $xWavStream_set3dAttenuation = DllCall($So,"none:cdecl","WavStream_set3dAttenuation","ptr",$ws,"uint",$att,"float",$roll)
EndFunc

Func WavStream_set3dDopplerFactor($ws,$dop)
   Local $xWavStream_set3dDopplerFactor = DllCall($So,"none:cdecl","WavStream_set3dDopplerFactor","ptr",$ws,"float",$dop)
EndFunc

Func WavStream_set3dListenerRelative($ws,$li)
   Local $xWavStream_set3dListenerRelative = DllCall($So,"none:cdecl","WavStream_set3dListenerRelative","ptr",$ws,"int",$li)
EndFunc

Func WavStream_set3dDistanceDelay($ws,$di)
   Local $xWavStream_set3dDistanceDelay = DllCall($So,"none:cdecl","WavStream_set3dDistanceDelay","ptr",$ws,"int",$di)
EndFunc

Func WavStream_set3dCollider($ws,$a)
   Local $xWavStream_set3dCollider = DllCall($So,"none:cdecl","WavStream_set3dCollider","ptr",$ws,"ptr",$a)
EndFunc

Func WavStream_set3dColliderEx($ws,$a,$us)
   Local $xWavStream_set3dColliderEx = DllCall($So,"none:cdecl","WavStream_set3dColliderEx","ptr",$ws,"ptr",$a,"int",$us)
EndFunc

Func WavStream_set3dAttenuator($ws,$a)
   Local $xWavStream_set3dAttenuator = DllCall($So,"none:cdecl","WavStream_set3dAttenuator","ptr",$ws,"ptr",$a)
EndFunc

Func WavStream_setInaudibleBehavior($ws,$m,$k)
   Local $xWavStream_setInaudibleBehavior = DllCall($So,"none:cdecl","WavStream_setInaudibleBehavior","ptr",$ws,"int",$m,"int",$k)
EndFunc

Func WavStream_setLoopPoint($ws,$pt)
   Local $xWavStream_setLoopPoint = DllCall($So,"none:cdecl","WavStream_setLoopPoint","ptr",$ws,"double",$pt)
EndFunc

Func WavStream_getLoopPoint($ws)
   Local $xWavStream_getLoopPoint = DllCall($So,"double:cdecl","WavStream_getLoopPoint","ptr",$ws)
   Return $xWavStream_getLoopPoint[0]
EndFunc

Func WavStream_setFilter($ws,$id,$f)
   Local $xWavStream_setFilter = DllCall($So,"none:cdecl","WavStream_setFilter","ptr",$ws,"uint",$id,"ptr",$f)
EndFunc

Func WavStream_stop($ws)
   Local $xWavStream_stop = DllCall($So,"none:cdecl","WavStream_stop","ptr",$ws)
EndFunc
