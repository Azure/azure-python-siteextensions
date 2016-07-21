taskkill /F /IM python.exe
if exist D:\home\Python27 rmdir /Q /S D:\home\Python27
xcopy /s Python27 D:\home\Python27\
