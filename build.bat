@setlocal
@if "%~1" EQU "" goto usage

@set D=%~dp0
@set NUGET="%D%Tools\nuget.exe"

%NUGET% install %1 -Version %2 -OutputDirectory "%D%source_packages"
@set PY="%D%source_packages\%~1.%~2\tools\python.exe"

@rmdir /q /s "%D%\%~3\content\python%~3" 2> nul
%PY% -m pip install -U pip setuptools certifi wfastcgi
%PY% "%D%Tools\copy_py.py" %3 "%D%\%~3\content\python%~3\\"
@if errorlevel 1 exit /B
@if not exist "%D%packages" mkdir "%D%packages"
%NUGET% pack -NoPackageAnalysis "%D%%3\python%~3.nuspec" -OutputDirectory "%D%packages"
rmdir /q /s "%D%\%~3\content\python%~3"
@exit /B 0

:usage
@echo Usage: build.bat [package name] [package version] [version tag]
@echo.
@echo The package will be installed from Nuget and used to generate the site extension
@echo from itself.
@echo.
@echo Examples:
@echo.
@echo     build.bat python 3.6.1 361x64
@echo     build.bat python2x86 2.7.12 2712x86
@echo.
