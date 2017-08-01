taskkill /F /IM python.exe
if exist D:\home\python362x86 rmdir /Q /S D:\home\python362x86
xcopy /I /S /Y python362x86 D:\home\python362x86\
