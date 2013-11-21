REM Saves bit files first
copy build_PapilioOne_500K\*.bit .\saved_PapilioOne_500K.bit
copy build_PapilioPro_LX9\*.bit .\saved_PapilioPro_LX9.bit

REM Deletes all unnecessary files
@echo off
REM for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat"') do del "%%F"
REM for /f %%F in ('dir /b  ^| findstr /vile ".sch .xise .bit .bat"') do rmdir /q /s "%%F"
for /f %%F in ('dir build_PapilioOne_500K /b /a-d ^| findstr /vile ".bit"') do del "%%F"