@setlocal
@set D=%~dp0

@call "%D%\build.bat" python     3.6.2 362x64
@call "%D%\build.bat" python     3.6.1 361x64
@call "%D%\build.bat" python     3.6.0 360x64
@call "%D%\build.bat" python     3.5.4 354x64
@call "%D%\build.bat" python     3.5.3 353x64
@call "%D%\build.bat" python     3.5.2 352x64

@call "%D%\build.bat" pythonx86  3.6.2 362x86
@call "%D%\build.bat" pythonx86  3.6.1 361x86
@call "%D%\build.bat" pythonx86  3.6.0 360x86
@call "%D%\build.bat" pythonx86  3.5.4 354x86
@call "%D%\build.bat" pythonx86  3.5.3 353x86
@call "%D%\build.bat" pythonx86  3.5.2 352x86

@call "%D%\build.bat" python2    2.7.13 2713x64
@call "%D%\build.bat" python2    2.7.12 2712x64
@call "%D%\build.bat" python2x86 2.7.13 2713x86
@call "%D%\build.bat" python2x86 2.7.12 2712x86
