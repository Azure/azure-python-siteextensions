@setlocal
@set D=%~dp0

@call "%D%\build.bat" "py -3.5" Python35 353x64
@call "%D%\build.bat" "py -3.5-32" Python35 353x86
@call "%D%\build.bat" "py -3.6" Python36 360x64
@call "%D%\build.bat" "py -3.6-32" Python36 360x86
@call "%D%\build.bat" "py -2.7" Python27 2713x64
@call "%D%\build.bat" "py -2.7-32" Python27 2713x86
