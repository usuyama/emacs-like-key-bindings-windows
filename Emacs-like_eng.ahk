;;
;; An AutoHotKey script for Emacs-like key-bindings on Windows
;;
#InstallKeybdHook
#UseHook

;https://gist.github.com/Danik/5808330
#Persistent
SetCapsLockState, AlwaysOff

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
is_pre_x = 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc = 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1pr
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

delete_char()
{
  Send {Del}
  global is_pre_spc = 0
  Return
}

delete_backward_char()
{
  Send {BS}
  global is_pre_spc = 0
  Return
}

kill_line()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_pre_spc = 0
  Return
}

open_line()
{
  Send {END}{Enter}{Up}
  global is_pre_spc = 0
  Return
}

quit()
{
  Send {ESC}
  global is_pre_spc = 0
  Return
}

newline()
{
  Send {Enter}
  global is_pre_spc = 0
  Return
}

indent_for_tab_command()
{
  Send {Tab}
  global is_pre_spc = 0
  Return
}

newline_and_indent()
{
  Send {Enter}{Tab}
  global is_pre_spc = 0
  Return
}

isearch_forward()
{
  Send ^f
  global is_pre_spc = 0
  Return
}

isearch_backward()
{
  Send ^f
  global is_pre_spc = 0
  Return
}

kill_region()
{
  Send ^x
  global is_pre_spc = 0
  Return
}

kill_ring_save()
{
  Send ^c
  global is_pre_spc = 0
  Return
}

yank()
{
  Send ^v
  global is_pre_spc = 0
  Return
}

undo()
{
  Send ^z
  global is_pre_spc = 0
  Return
}

find_file()
{
  Send ^o
  global is_pre_x = 0
  Return
}

save_buffer()
{
  Send, ^s
  global is_pre_x = 0
  Return
}

kill_emacs()
{
  Send !{F4}
  global is_pre_x = 0
  Return
}

move_beginning_of_line()
{
  global
  if is_pre_spc
    Send +{HOME}
  Else
    Send {HOME}
  Return
}

move_end_of_line()
{
  global
  if is_pre_spc
    Send +{END}
  Else
    Send {END}
  Return
}

previous_line()
{
  global
  if WinActive("ahk_class Framework::CFrame")
  {
    Send ^{Up}
    Return
  }
  if is_pre_spc
    Send +{Up}
  Else
    Send {Up}
  Return
}

next_line()
{
  global
  if WinActive("ahk_class Framework::CFrame")
  {
    Send ^{Down}
    Return
  }
  if is_pre_spc
    Send +{Down}
  Else
    Send {Down}
  Return
}

forward_char()
{
  global
  if is_pre_spc
    Send +{Right}
  Else
    Send {Right}
  Return
}

backward_char()
{
  global
  if is_pre_spc
    Send +{Left} 
  Else
    Send {Left}
  Return
}

scroll_up()
{
  global
  if is_pre_spc
    Send +{PgUp}
  Else
    Send {PgUp}
  Return
}

scroll_down()
{
  global
  if is_pre_spc
    Send +{PgDn}
  Else
    Send {PgDn}
  Return
} 

CapsLock & f::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
      forward_char()
  }
  Return
  
CapsLock & c:: Send ^c
CapsLock & s:: Send ^s
CapsLock & v:: Send ^v
CapsLock & z:: Send ^z
CapsLock & x:: Send ^x
CapsLock & t:: Send ^t
CapsLock & l:: Send ^l
CapsLock & w:: Send ^w
 
CapsLock & d::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_char()
  Return

CapsLock & k::
  If is_target()
    Send %A_ThisHotkey%
  Else
    kill_line()
  Return

CapsLock & a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_beginning_of_line()
  Return

CapsLock & e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return

CapsLock & p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    previous_line()
  Return

CapsLock & n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    next_line()
  Return

CapsLock & b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return

CapsLock & Space::
  If is_target()
     Send %A_ThisHotkey%
  Else
     Send ^{space} # Also update PowerToys Run shortcut
