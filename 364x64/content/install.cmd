taskkill /F /IM python.exe
if exist D:\home\python364x64 rmdir /Q /S D:\home\python364x64
xcopy /I /S /Y python364x64 D:\home\python364x64\
