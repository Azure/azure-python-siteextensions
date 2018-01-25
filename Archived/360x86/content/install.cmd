taskkill /F /IM python.exe
if exist D:\home\python360x86 rmdir /Q /S D:\home\python360x86
xcopy /I /S /Y python360x86 D:\home\python360x86\
