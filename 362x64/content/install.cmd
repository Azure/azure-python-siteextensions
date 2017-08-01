taskkill /F /IM python.exe
if exist D:\home\python362x64 rmdir /Q /S D:\home\python362x64
xcopy /I /S /Y python362x64 D:\home\python362x64\
