; echo off
; echo A C:\info.ini f�ljba fogom �rni az adatokat az adott g�pre.
echo.
echo Add meg a g�p nev�t (pl: VALAMI, vagy h�l�zaton a \\WX1710):
set /p pc_name=
echo.
echo Add meg a f�jl ment�s�nek a hely�t, nev�t �s kiterjeszt�s�t (pl: C:\info.ini):
set /p i_info=
echo.
systeminfo /s %pc_name% /fo list > %i_info%
exit
rem systeminfo | findstr /C:"BIOS*"