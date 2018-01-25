taskkill /F /IM python.exe
if exist D:\home\Python35 rmdir /Q /S D:\home\Python35
xcopy /I /S /Y Python35 D:\home\Python35\
