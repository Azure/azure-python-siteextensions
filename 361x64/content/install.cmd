taskkill /F /IM python.exe
if exist D:\home\python361x64 rmdir /Q /S D:\home\python361x64
xcopy /I /S /Y python361x64 D:\home\python361x64\
