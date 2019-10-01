# Emacs-like (Mac-like) key-bindings on Windows using [AutoHotKey](https://www.autohotkey.com/)

## Setup 

Downnload and run [the compiled standalone version](https://github.com/usuyama/emacs-key-binding-windows/releases/tag/v0.1)

Or install [AutoHotKey](https://www.autohotkey.com/) and run the script

![AutoHotKey in the system tray](ahk_tray.png)

## Usage

The script uses CapsLock as the \<Control> modifier in Emacs. We can still use Ctrl keys for Windows shortcuts e.g. Ctrl+a.

|Command | Description| Emacs defaults |
|---|---|---|
| CapsLock + a  | Go to start of the line | C-a |
| CapsLock + e  | Go to end of the line | C-e |
| CapsLock + f  | Move forward one character  | C-f |
| CapsLock + b  | Move backward one character  | C-b |
| CapsLock + n  | Move down one line  | C-n |
| CapsLock + p  | Move up one line  | C-p |

## Tested
Tested on Windows 10 + English keyboard
