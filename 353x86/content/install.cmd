taskkill /F /IM python.exe
if exist D:\home\python353x86 rmdir /Q /S D:\home\python353x86
xcopy /I /S /Y python353x86 D:\home\python353x86\
