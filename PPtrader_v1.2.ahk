﻿#NoEnv  ;; Рекомендуеться для производительности и совместимости с будущими рлизами платформы AHK.
#Singleinstance force ;; чтобы не открывался несколько раз
#Persistent ;; Держать открытым пока пользователь сам не закроет скрипт из панели или горячей клавишей

SetWorkingDir %A_ScriptDir% ;;На будущее, можно удалить

GameWindowTitle := "Elite - Dangerous"

Gui, Add, Text,, Число предметов для продажи:
Gui, Add, Edit, vItemCount w160 , 1
Gui, Add, Button, gStartSell, Старт
Gui, Show,, Торговец, By OniKs\CMDR AKULBEK
Return

StartSell:
Gui, Submit, NoHide
N := ItemCount + 0
if (N < 1) {
    MsgBox, Введите число больше 0
    Return
}

; Активация окна игры
WinActivate, %GameWindowTitle%
Sleep, 2000

SetDefaultMouseSpeed, 0

Loop, %N%
{
    Remaining := N - A_Index + 1 

    if (Remaining > 600)
        pressTime := 2300
    else if (Remaining > 500)
        pressTime := 2100
    else if (Remaining > 400)
        pressTime := 1950
    else if (Remaining > 300)
        pressTime := 1850
    else if (Remaining > 200)
        pressTime := 1750
    else if (Remaining > 100)
        pressTime := 1650
    else if (Remaining > 50)
        pressTime := 1450
    else if (Remaining > 20)
        pressTime := 1100
    else
        pressTime := 800
    ;; Выбор предмета
    MouseClick Left, 700, 300, 2
    Sleep, 100
    ;; Выбор поля ввода кол-ва 
    MouseMove, 750, 360
    Sleep, 100
    ;; Уменьшение кол-ва 
    Send, {a down}
    Sleep, %pressTime%
    Send, {a up}
    Sleep, 30
    ;; +1 ед.
    Send, {d down}
    Sleep, 64
    Send, {d up}
    Sleep, 100
    ;; Продать
    MouseClick, left, 750, 600, 2
    Sleep, 1400
}

MsgBox, Продано %N% предметов.
Return

; Горячие клавиши
+F4:: ExitApp ;; SHIFT+F4 Закрыть скрип
F4:: Reload ;; F4 перезапустить
F3:: Pause ;; F3 Пауза

GuiClose:
ExitApp

;; By OniKs/CMDR AKULBEK discord on4iks