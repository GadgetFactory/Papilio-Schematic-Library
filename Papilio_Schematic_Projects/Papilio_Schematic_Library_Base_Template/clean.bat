REM Deletes all unnecessary files
@echo off
for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat"') do del "%%F"
for /f %%F in ('dir /b  ^| findstr /vile ".sch .xise .bit .bat"') do rmdir /q /s "%%F"