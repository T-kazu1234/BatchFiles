@echo off
setlocal enabledelayedexpansion

:---ウィンドウでユーザー入力値を受け取る
:---set /P DATETIME==撮影年月日を入力してください：doku毒桃
:---set /P STARTNUM=連番初期値を入力してください：1
:---set /P FEFORMAT=対象拡張子を入力してください：png
rem set DATETIME="doku毒桃"
set /P STARTNUM=連番初期値を入力してください：
set FEFORMAT=jpg



:---ユーザー入力値を変数にセット
set /a i=%STARTNUM%

:---ファイル名を仮の値に変更（リネームループ防止用）
for %%F in (*.%FEFORMAT%) do (
 if not %%~xF == .bat (
  rename "%%F" "%%~nF■%%~xF"
 )
)

:---ファイル名変更（IF文で桁数を把握して前ゼロ補完）
for %%F in (*■.%FEFORMAT%) do (
 if %%~xF == .bat (
  set /a i=i-1
 ) else if !i! LSS 10 (
  rename "%%F" "%DATETIME%00!i!%%~xF"
 ) else if !i! LSS 100 (
  rename "%%F" "%DATETIME%0!i!%%~xF"
 ) else (
  rename "%%F" "%DATETIME%!i!%%~xF"
 )
 set /a i=i+1
)