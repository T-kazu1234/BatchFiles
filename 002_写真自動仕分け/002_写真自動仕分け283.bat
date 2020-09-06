@echo off
for %%F in ( *.* ) do call :sub "%%F"
exit /b

:sub
if "%1"== "" goto :EOF
if "%~x1"==".jpg" goto :DATESORT
if "%~x1"==".JPG" goto :DATESORT
if "%~x1"==".CR2" goto :DATESORT
if "%~x1"==".MOV" goto :DATESORT
if "%~x1"==".mp4" goto :DATESORT
goto :EOF

:DATESORT
set TARGET=%1
set T=%~t1
set YYYY=%T:~0,4%
set MM=%T:~5,2%
set DD=%T:~8,2%

if not exist %YYYY%%MM%%DD%\nul md "%YYYY%%MM%%DD%"
move "%TARGET%" "%YYYY%%MM%%DD%"