@echo off
setlocal enabledelayedexpansion

:---�E�B���h�E�Ń��[�U�[���͒l���󂯎��
set /P DATETIME=�B�e�N��������͂��Ă��������F
set /P STARTNUM=�A�ԏ����l����͂��Ă��������F
set /P FEFORMAT=�Ώۊg���q����͂��Ă��������F

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
  rename "%%F" "%DATETIME%_00!i!%%~xF"
 ) else if !i! LSS 100 (
  rename "%%F" "%DATETIME%_0!i!%%~xF"
 ) else (
  rename "%%F" "%DATETIME%_!i!%%~xF"
 )
 set /a i=i+1
)