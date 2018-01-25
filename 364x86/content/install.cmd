taskkill /F /IM python.exe
if exist D:\home\python364x86 rmdir /Q /S D:\home\python364x86
xcopy /I /S /Y python364x86 D:\home\python364x86\
