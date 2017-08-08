taskkill /F /IM python.exe
if exist D:\home\python354x64 rmdir /Q /S D:\home\python354x64
xcopy /I /S /Y python354x64 D:\home\python354x64\
