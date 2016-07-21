@setlocal
@set D=%~dp0

@call "%D%\build.bat" "py -3.5" Python35 352x64
@call "%D%\build.bat" "py -3.5-32" Python35 352x86
@call "%D%\build.bat" "py -2.7" Python27 2712x64
@call "%D%\build.bat" "py -2.7-32" Python27 2712x86
