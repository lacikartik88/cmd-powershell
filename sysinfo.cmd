; echo off
; echo A C:\info.ini fáljba fogom írni az adatokat az adott gépre.
echo.
echo Add meg a gép nevét (pl: VALAMI, vagy hálózaton a \\WX1710):
set /p pc_name=
echo.
echo Add meg a fájl mentésének a helyét, nevét és kiterjesztését (pl: C:\info.ini):
set /p i_info=
echo.
systeminfo /s %pc_name% /fo list > %i_info%
exit
rem systeminfo | findstr /C:"BIOS*"