@setlocal
@set D=%~dp0

@call "%D%\build.bat" python     3.6.4 364x64
@call "%D%\build.bat" python     3.6.2 362x64
@call "%D%\build.bat" python     3.5.4 354x64
@call "%D%\build.bat" python     3.5.3 353x64

@call "%D%\build.bat" pythonx86  3.6.4 364x86
@call "%D%\build.bat" pythonx86  3.6.2 362x86
@call "%D%\build.bat" pythonx86  3.5.4 354x86
@call "%D%\build.bat" pythonx86  3.5.3 353x86

@call "%D%\build.bat" python2    2.7.14 2714x64
@call "%D%\build.bat" python2x86 2.7.14 2714x86
