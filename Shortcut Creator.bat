@echo off
setlocal enabledelayedexpansion

REM Obtener el directorio actual
set "current_dir=%~dp0"
set "target_bat=%current_dir%manager.bat"
set "shortcut_name=%current_dir%FNAF Security Breach File Manager.lnk"
set "icon_file=%current_dir%icon.ico"

REM Crear el acceso directo usando PowerShell
powershell -Command ^
    $WshShell = New-Object -ComObject WScript.Shell; ^
    $Shortcut = $WshShell.CreateShortcut('%shortcut_name%'); ^
    $Shortcut.TargetPath = '%target_bat%'; ^
    $Shortcut.IconLocation = '%icon_file%'; ^
    $Shortcut.Save()

echo Access shortcut created: %shortcut_name%
pause
