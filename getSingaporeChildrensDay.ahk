#Requires AutoHotkey v1.1.17+
;==============================================================
; getSingaporeChildrensDay — Gets Singapore Children's Day date for a given year
;
; GitHub: https://github.com/SevenKeyboard/get-singapore-childrens-day
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
class VersionManager_getSingaporeChildrensDay
{
    static _ := VersionManager_getSingaporeChildrensDay._init()
    _init()    {
        global
        GETSINGAPORECHILDRENSDAY_VERSION := "1.0.0"
    }
}
getSingaporeChildrensDay(yyyy:="")    {
    if (yyyy=="")
        yyyy:=A_YYYY
    else
        yyyy:=format("{:04d}",yyyy)
    switch
    {
        default:    return yyyy . "1001" ;  Historically, 1 October was the day which Singapore officially celebrates Children's Day.
        case (2011<=yyyy): ;  From 2011, Children's Day was celebrated on the first Friday of October.
            loop 7    {
                formatTime wDay, % yyyyMMdd:=(yyyy . "10" . format("{:02}",A_Index)), % "WDay"
                if (wDay==6)
                    return yyyyMMdd
            }
    }
}