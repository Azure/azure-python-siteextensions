@setlocal
@set D=%~dp0

@call "%D%\build.bat" python     3.6.1 361x64 python361x64
@call "%D%\build.bat" python     3.5.3 353x64 python353x64

@call "%D%\build.bat" pythonx86  3.6.1 361x86 python361x86
@call "%D%\build.bat" pythonx86  3.5.3 353x86 python353x86

@call "%D%\build.bat" python2    2.7.13 2713x64 Python27
@call "%D%\build.bat" python2x86 2.7.13 2713x86 Python27
