set SRC=python362x64

if not exist %SRC% (
    if not exist D:\home\%SRC% (
        echo Cannot reinstall previously installed site extension.
        echo Please remove %~dp0 and reinstall.
        exit /B 1
    )
    exit /B 0
)
taskkill /F /IM python.exe
if exist D:\home\%SRC% rmdir /Q /S D:\home\%SRC%
move %SRC% D:\home\%SRC%
