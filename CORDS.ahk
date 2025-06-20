#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, xpos, ypos
ToolTip, X= %xpos%' Y= %ypos%
return
