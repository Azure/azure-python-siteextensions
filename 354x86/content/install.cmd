taskkill /F /IM python.exe
if exist D:\home\python354x86 rmdir /Q /S D:\home\python354x86
xcopy /I /S /Y python354x86 D:\home\python354x86\
