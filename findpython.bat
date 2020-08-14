@echo off

set dopause=0

rem turn on pause at the end if we're running this by itself
if x%1 equ x set dopause=1

rem -- find python --------------------
echo Locating python...
echo Attempt 1: "py"
py --version 2>NUL
if %errorlevel% NEQ 0 goto attempt2
set pycmd=py
goto foundpython

:attempt2

echo Attempt 2: "python"
python -c "from sys import version_info as v;_=0/int(v.major/3)">nul 2>&1
if %errorlevel% EQU 0 set pycmd=python&goto foundpython

echo Attempt 3: "python" using "python" environment variable

rem check for environment variable
if %python%X EQU X goto pythonnotfound

rem test "%python%/python"
%python%\python -c "from sys import version_info as v;_=0/int(v.major/3)">nul 2>&1
if %errorlevel% NEQ 0 goto pythonnotfound

set pycmd=%python%\python
goto foundpython

:pythonnotfound

set errormessage=Could not find python
goto error

:foundpython
echo Found.
rem -----------------------------------


goto theend

:error
echo.
echo.ERROR: %errormessage%
echo.
pause
exit

:theend
if %dopause% NEQ 0 pause