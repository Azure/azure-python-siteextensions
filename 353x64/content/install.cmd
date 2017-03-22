taskkill /F /IM python.exe
if exist D:\home\python353x64 rmdir /Q /S D:\home\python353x64
xcopy /I /S /Y python353x64 D:\home\python353x64\
