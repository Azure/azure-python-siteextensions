taskkill /F /IM python.exe
if exist D:\home\Python36 rmdir /Q /S D:\home\Python36
xcopy /s Python36 D:\home\Python36\
