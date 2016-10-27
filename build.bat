@setlocal
@if "%~1" EQU "" goto usage

@set D=%~dp0
@rmdir /q /s "%D%\%3\content\%2" 2> nul
%~1 -m pip install -U pip setuptools certifi wfastcgi
%~1 "%D%Tools\copy_py.py" "%D%\%3\content\%2\\"
@if errorlevel 1 exit /B
@if not exist "%D%packages" mkdir "%D%packages"
"%D%Tools\nuget.exe" pack -NoPackageAnalysis "%D%%3\python%3.nuspec" -OutputDirectory "%D%packages"
rmdir /q /s "%D%\%3\content\%2"
@exit /B 0

:usage
@echo Usage: build.bat [source exe] [target name] [package name]
@echo.
@echo Examples:
@echo.
@echo     build.bat "py -3.5" Python35 351x64
@echo     build.bat C:\Python27\python.exe Python27 2711x86
@echo.
