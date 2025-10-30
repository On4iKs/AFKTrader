#NoEnv  ;; Рекомендуеться для производительности и совместимости с будущими рлизами платформы AHK.
#Singleinstance force ;; чтобы не открывался несколько раз
#Persistent ;; Держать открытым пока пользователь сам не закроет скрипт из панели или горячей клавишей

SetWorkingDir %A_ScriptDir% ;;На будущее, можно удалить
GameWindowTitle := "Elite - Dangerous"

Gui, Add, Text,, Число предметов для продажи:
Gui, Add, Edit, vItemCount w160 , 1
Gui, Add, Button, gStartSell, Старт
Gui, Show,, Торговец
Return

StartSell:
Gui, Submit, NoHide
N := ItemCount
if (N < 1) {
    MsgBox, Введите число больше 0
    Return
}
SetDefaultMouseSpeed, 0
SendMode, Input

; Активация окна игры
WinActivate, %GameWindowTitle%
Sleep, 2000


Loop, %N%
{
    Remaining := N - A_Index
    if (Remaining > 1200)
        pressTime :=3200
    else if (Remaining > 1000)
        pressTime := 2800
    else if (Remaining > 800)
        pressTime := 2300
    else if (Remaining > 700)
        pressTime := 2150
    else if (Remaining > 600)
        pressTime := 2000
    else if (Remaining > 500)
        pressTime := 1900
    else if (Remaining > 400)
        pressTime := 1850
    else if (Remaining > 300)
        pressTime := 1550
    else if (Remaining > 200)
        pressTime := 1450
    else if (Remaining > 100)
        pressTime := 1200
    else if (Remaining > 50)
        pressTime := 950
    else if (Remaining > 20)
        pressTime := 700
    else
        pressTime := 700
    ;; Выбор предмета
    MouseMove, 700, 300
    Sleep, 60
    Send, {Space down}
    Sleep 64
    Send, {Space up}
    Sleep, 200
    ;; Ввод кол-ва
    Send, {w down}
    Sleep, 64
    Send, {w up}
    Sleep, 60
    Send, {a down}
    Sleep, %pressTime%
    Send, {a up}
    Sleep, 30
    ;; +1 ед.
    Send, {d down}
    Sleep, 28
    Send, {d up}
    Sleep, 200
    ;; Продать
    Send, {s down}
    Sleep, 50
    Send, {s up}
    Sleep, 60
    Send, {Space down}
    Sleep 100
    Send, {Space up}
    Sleep, 1800
}

MsgBox, Завершенно.
Return

; Горячие клавиши
+F4:: ExitApp ;; SHIFT+F4 Закрыть скрип
F4:: Reload ;; F4 перезапустить
F3:: Pause ;; F3 Пауза

GuiClose:
ExitApp

;; By OniKs/CMDR AKULBEK discord on4iks