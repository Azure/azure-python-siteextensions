@setlocal
@set D=%~dp0

@call "%D%\build.bat" "py -3.5" Python35 351x64
@call "%D%\build.bat" "py -2.7" Python27 2711x64
