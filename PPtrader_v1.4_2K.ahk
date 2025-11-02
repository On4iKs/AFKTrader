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

; Активация окна игры
WinActivate, %GameWindowTitle%
Sleep, 2000


Loop, %N%
{
    Remaining := N - A_Index
    if (Remaining > 1200)
        pressTime :=3100
    else if (Remaining > 1000)
        pressTime := 2800
    else if (Remaining > 800)
        pressTime := 2400
    else if (Remaining > 700)
        pressTime := 2250
    else if (Remaining > 600)
        pressTime := 2100
    else if (Remaining > 500)
        pressTime := 1900
    else if (Remaining > 400)
        pressTime := 1850
    else if (Remaining > 300)
        pressTime := 1550
    else if (Remaining > 200)
        pressTime := 1350
    else if (Remaining > 100)
        pressTime := 1100
    else if (Remaining > 50)
        pressTime := 950
    else if (Remaining > 20)
        pressTime := 700
    else
        pressTime := 500
    ;; Выбор предмета
    MouseClick, left, 1000, 400, 2
    Sleep, 70
    ;; Ввод кол-ва
    MouseMove, 1300, 500
    Sleep, 10
    SendInput, {w down}
    Sleep, 64
    SendInput, {w up}
    Sleep, 30
    SendInput, {a down}
    Sleep, %pressTime%
    SendInput, {a up}
    Sleep, 30
    ;; +1 ед.
    SendInput, {d down}
    Sleep, 28
    SendInput, {d up}
    Sleep, 50
    ;; Продать
    MouseMove, 1300, 800
    Sleep, 100
    Click , , 2
    Sleep, 1500
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