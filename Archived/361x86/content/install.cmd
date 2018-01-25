taskkill /F /IM python.exe
if exist D:\home\python361x86 rmdir /Q /S D:\home\python361x86
xcopy /I /S /Y python361x86 D:\home\python361x86\
