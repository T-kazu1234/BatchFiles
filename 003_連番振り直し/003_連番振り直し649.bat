@echo off
setlocal enabledelayedexpansion

:---�E�B���h�E�Ń��[�U�[���͒l���󂯎��
:---set /P DATETIME==�B�e�N��������͂��Ă��������Fdoku�œ�
:---set /P STARTNUM=�A�ԏ����l����͂��Ă��������F1
:---set /P FEFORMAT=�Ώۊg���q����͂��Ă��������Fpng
rem set DATETIME="doku�œ�"
set /P STARTNUM=�A�ԏ����l����͂��Ă��������F
set FEFORMAT=jpg



:---���[�U�[���͒l��ϐ��ɃZ�b�g
set /a i=%STARTNUM%

:---�t�@�C���������̒l�ɕύX�i���l�[�����[�v�h�~�p�j
for %%F in (*.%FEFORMAT%) do (
 if not %%~xF == .bat (
  rename "%%F" "%%~nF��%%~xF"
 )
)

:---�t�@�C�����ύX�iIF���Ō�����c�����đO�[���⊮�j
for %%F in (*��.%FEFORMAT%) do (
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