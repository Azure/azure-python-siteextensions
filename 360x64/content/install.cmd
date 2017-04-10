taskkill /F /IM python.exe
if exist D:\home\python360x64 rmdir /Q /S D:\home\python360x64
xcopy /I /S /Y python360x64 D:\home\python360x64\
