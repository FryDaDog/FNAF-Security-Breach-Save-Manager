@echo off
setlocal enabledelayedexpansion

REM Verificar si la carpeta "Files" existe en el mismo directorio
if not exist "Files" (
    echo Files Folder not found! Please manually insert the direction:
    set /p files_dir=Enter the full path of the Files folder: 
    if not exist "!files_dir!" (
        echo Invalid directory. Exiting...
        pause
        exit /b
    )
) else (
    set files_dir=%~dp0Files
)

REM Advertencia para el usuario
echo WARNING: THIS WILL ERASE ANY PREVIOUS SAVE DATA. DO YOU WISH TO PROCEED? (y/n)
set /p choice=Enter your choice: 
if /i "%choice%" NEQ "y" (
    echo Exiting program...
    pause
    exit /b
)

REM Verificar si la carpeta de FNaF9 SaveGames existe
set savegames_dir=C:\Users\%USERNAME%\AppData\Local\fnaf9\Saved\SaveGames
if not exist "%savegames_dir%" (
    echo Fnaf9 Files Folder not found! Please manually insert the direction:
    set /p savegames_dir=Enter the full path of the Fnaf9 SaveGames folder: 
    if not exist "!savegames_dir!" (
        echo Invalid directory. Exiting...
        pause
        exit /b
    )
)

REM Borrar contenido de la carpeta SaveGames
echo Deleting previous SaveGames data...
del /q "%savegames_dir%\*" >nul 2>&1
if errorlevel 1 (
    echo Error deleting files. Please check permissions.
    pause
    exit /b
)

REM Copiar contenido de la carpeta Files a SaveGames
echo Copying new files...
xcopy /e /i "!files_dir!\" "!savegames_dir!\" >nul 2>&1
if errorlevel 1 (
    echo Error copying files. Please check permissions.
    pause
    exit /b
)

REM Finalizar
echo Done!
pause
exit /b
